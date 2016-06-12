package org.project.model.service;

import org.project.model.entity.CheckBoxList;
import org.project.model.repository.CheckBoxListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CheckBoxListService {

    @Autowired
    CheckBoxListRepository checkBoxListRepository;

    public List<CheckBoxList> getCheckBoxLists() {
        return checkBoxListRepository.findAll();
    }

    public void addCheckBoxList(CheckBoxList checkBoxList) {
        checkBoxListRepository.save(checkBoxList);
    }
}


