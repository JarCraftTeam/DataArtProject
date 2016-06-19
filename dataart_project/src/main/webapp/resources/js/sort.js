var dir = 1;
var grid = document.getElementById('results-table');
$('th').click(sort);
 function sort (event){
	 var e_class = $(event.target).attr('class');
	 var num = $(event.target).index();
	 dir = dir * (- 1);
	 console.log(e_class);
	console.log(num);
	 var tbody = $(grid).find('tbody').first();
	 var rows = [];
	 rows = $(tbody).children();
	 console.log(rows.length);
	 var col =[];
	 for (var i = 0; i < rows.length; i++) {
		 var el =[];
		 el[0] = $(rows[i]).children().eq(num);
		 el[1] = el[0].html();
		 col.push(el);
		console.log(col[0][0]);
	     }
	 function sName(a,b) {
			if(a[1]<b[1]) {
				return dir;
			} else if(a[1]>b[1]) {
				return -1 * dir;
			} else {
				return 0;
			}
		}
	 col.sort(sName);
	 console.log($(col[0][0]).html());
	 console.log($(col[1][0]).html());
	 console.log($(col[2][0]).html());
	 console.log($(col[3][0]).html());
	 for (var j = 0; j < rows.length; j++) {
		 var some = $(col[j][0]).parent('tr');
		console.log(some);
		 $(some).appendTo(grid);
	 }
}