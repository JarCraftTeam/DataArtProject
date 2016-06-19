package org.project.model;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.project.model.entity.Test;
import org.project.model.entity.UserAnswer;
import org.project.model.entity.UserTest;
import org.springframework.web.servlet.view.document.AbstractExcelView;
 
/**
 * This class builds an Excel spreadsheet document using Apache POI library.
 * @author www.codejava.net
 *
 */
public class ExcelBuilder extends AbstractExcelView {
 
    @Override
    protected void buildExcelDocument(Map<String, Object> model,
            HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // get data model which is passed by the Spring container
        Test test =  (Test) model.get("test");
         
        // create a new Excel sheet
        HSSFSheet sheet = workbook.createSheet("Test Results");
        sheet.setDefaultColumnWidth(30);
         
        // create style for header cells
        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setFontName("Arial");
        style.setFillForegroundColor(HSSFColor.BLUE.index);
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setColor(HSSFColor.WHITE.index);
        style.setFont(font);
         
        // create header row
        HSSFRow header = sheet.createRow(0);
         
        header.createCell(0).setCellValue("¹");
        header.getCell(0).setCellStyle(style);
         
        header.createCell(1).setCellValue("First Name");
        header.getCell(1).setCellStyle(style);
         
        header.createCell(2).setCellValue("Second Name");
        header.getCell(2).setCellStyle(style);
         
        header.createCell(3).setCellValue("Phone");
        header.getCell(3).setCellStyle(style);
         
        header.createCell(4).setCellValue("E-Mail");
        header.getCell(4).setCellStyle(style);
        
        header.createCell(5).setCellValue("Summary Mark");
        header.getCell(5).setCellStyle(style);
        
        int cell=6;
        
        for(int i=0;i<test.getQuestions().size();i++){
        	header.createCell(cell+i).setCellValue("Que. "+(i+1));
            header.getCell(cell+i).setCellStyle(style);
        }
        // create data rows
        int rowCount = 1;
         
        for (UserTest ut : test.getUserTests()) {
            HSSFRow aRow = sheet.createRow(rowCount++);
            aRow.createCell(0).setCellValue(rowCount-1);
            aRow.createCell(1).setCellValue(ut.getUser().getFirst_name());
            aRow.createCell(2).setCellValue(ut.getUser().getSecond_name());
            aRow.createCell(3).setCellValue(ut.getUser().getTelephone());
            aRow.createCell(4).setCellValue(ut.getUser().getEmail());
            aRow.createCell(5).setCellValue(ut.getMark());
            int i=6;
            for(UserAnswer ua: ut.getUserAnswers()){
            	aRow.createCell(i).setCellValue(ua.getMark());
            	i++;
            }
        }
    }
 
}