<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Title</title>
	<link rel="stylesheet" media="screen" href="js/KSS/handsontable.css">
	<link rel="stylesheet" media="screen" href="js/KSS/pikaday/pikaday.css">
	<script src="js/KSS/pikaday/pikaday.js"></script>
	<script src="js/KSS/moment/moment.js"></script>
	<script src="js/KSS/zeroclipboard/ZeroClipboard.js"></script>
	<script src="js/KSS/numbro/numbro.js"></script>
	<script src="js/KSS/numbro/languages.js"></script>
	<script src="js/KSS/EducationProject/handsontable.js"></script>
	<script src="js/jquery.js"></script>
	<c:import url="./EquipmentNav/SideNav.jsp"></c:import>
	<c:import url="../module/importCSS.jsp"></c:import>
	<c:import url="../module/navbar.jsp"></c:import>
	
<%-- 	<script src="js/KSS/handsontable.js" type="text/javascript"></script>
	<link rel="stylesheet" media="screen" href="js/KSS/samples.css?20140331">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<!-- CSS Link -->
<c:import url="./EquipmentNav/SideNav.jsp"></c:import>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import> --%>


</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

 <div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">	
			
<!-- 	<div class="btn-group">
	  <button type="button" class="btn btn-primary">:: 비품카테고리 ::</button>
	  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
	    <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu" role="menu">
	    <li><a href="#">교재,교구</a></li>
	    <li><a href="#">사무용품</a></li>
	    <li><a href="#">체육용품</a></li>
	    <li><a href="#">도서목록</a></li>
	    <li><a href="#">기타</a></li>
	  </ul>
	</div> -->
	<div class="input-group-btn search-panel">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="width:100px;">
			<span id="category">카테고리 </span><span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<c:forEach var="a" items="${getCategory}">
				<li><a href="${a.categoryNo}">${a.categoryName}</a></li>
			</c:forEach>
		</ul>
	</div>
	<input type="hidden" name="boardCategoryNo" value="0" id="boardCategoryNo" readonly>  <!-- 카테고리 들고갈 input -->
	<button id="btTest">save</button>
	<button id="reroad">road</button>
	<div>
		제목 :
		<input type="text" id="sheetName"/>
	</div>
	<div class="wrapper" style="margin-top: 20px;">
		<div id="example1"></div>
	</div>
	
	
	<!-- Trigger the modal with a button123 -->
	<div style="display : none;">
	<button type="button" id="roadmodal" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
	</div>
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
  		<div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">저장 목록</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  	</div>
	</div>
	
	
</div></div></div></div>
<script>
$(document).ready(function(e){
    $('.search-panel .dropdown-menu').find('a').click(function(e) {
		e.preventDefault();
		var param = $(this).attr("href").replace("#",""); //해당 버튼의 href속성에서 #을 제거한 값
		console.log(param + 'param값 확인');
		var category = $(this).text(); //해당 버튼의 내용
		$('.search-panel span#category').text(category); //선택 버튼의 내용을 클릭한 버튼의 내용으로 변경
		$('#boardCategoryNo').val(param);
	});
});
</script>
<script data-jsfiddle="example1">


	var container = document.getElementById('example1'),hot;
	var dataArray;
	var dataValue = ${sheet.valueVal};
	var dataMerge = ${sheet.valueMerge};
	var dataBorders = ${sheet.valueBorders};
	//
	var countRow = ${sheet.valueRow};
	var countCol = ${sheet.valueCols};
	var addDate = ${resultData.addDate}
	var educationProjectNo = ${resultData.educationProjectNo} 
//	var testData = [null,null,null,null,{"row":4,"col":7,"val":"1234"},{"row":5,"col":4,"val":"4321"},{"row":6,"col":10,"val":"2134"},null,null,null,{"row":10,"col":7,"val":"4321"},null,null,{"row":13,"col":6,"val":"1234"},{"mergedCellInfoCollection":[]}]; //데이터
//	var testMerge = [{"row":5,"col":2,"rowspan":5,"colspan":3},{"row":10,"col":4,"rowspan":5,"colspan":5}];
	
	  
		hot = new Handsontable(container, {
// 			data: testData,    //데이터 가져오기
			colWidths: [47],

			startRows: 30,
			startCols: 20,

			rowHeaders : true,
			colHeaders : true,
			
// 			manualRowResize : true,
// 			manualColumnResize : true,

			mergeCells : true,
			customBorders: true,
			
			contextMenu : true,
//			mergeCells : testMerge,
/* 			contextMenuCopyPaste: {
			    swfPath: 'swf/ZeroClipboard.swf'
			}, */
			
			afterChange : function(data, type){ //data{열, 행, 이전값, 현재값} type="이벤트 종류"
				console.log(data, type)
				
				if(dataArray === undefined){
					console.log('sheet확인')
					dataArray = [];
				}
				
				if(data != undefined && data != null){
					console.log('data 확인' + data[0][0]);
					var row = data[0][0];
					var col = data[0][1];
					var val = data[0][3];

					var meats = hot.getCellMeta(row,col);
					
					console.log('확인' + hot.mergeCells)
					console.log(hot.mergeCells.mergedCellInfoCollection.getInfo(row, col));
					console.log('테두리 확인');
					console.log(meats.borders)

					if(val !== null){
 						//console.log(row, col, val)

 						if(dataArray[row] === undefined){
							dataArray[row] = {};							
						}
 						console.log(row + "row확인");
						dataArray[row][col] = val;
					}
				}			
		}
	   
	});
 	$('#reroad').click(function(){
 		console.log('더워 미치겠네');
 		$('#roadmodal').trigger('click');

 		$.ajax({
 			url : "${pageContext.request.contextPath}/reroad",
 			type : 'POST',
 			dataType: "json",
 			async: false,
 			data:Sheet,
 			success : function(data){

 			var jsondata = JSON.stringify(data);

 			alert(jsondata);
 		                        
 		},error: function(XMLHttpRequest, textStatus, errorThrown) { 
 		     console.log("Status: " + textStatus);
 		},timeout: 3000
 		});    
 	});
	  	
	  	
	$('#btTest').click(function(){
/* 		dataArray[dataArray.length] = hot.mergeCells;	 */
		var param = $('#boardCategoryNo').val();
		console.log(param);
		var borderArray=[];
		var jparse=JSON.stringify(dataArray);
		var mergeparse = JSON.stringify(hot.mergeCells.mergedCellInfoCollection);
		for(var i = 0 ; i<hot.countRows(); i++){
			for(var j = 0; j<hot.countCols(); j++){
				if(hot.getCellMeta(i,j).borders !== null && hot.getCellMeta(i,j).borders !==undefined ){
					console.log('값이 있는 머지 확인!'+ JSON.stringify(hot.getCellMeta(i,j).borders));
					var borders = hot.getCellMeta(i,j).borders;
					borderArray.push(borders);
				}
			}
		}
		var borderparse=JSON.stringify(borderArray);
		console.log(borderparse+"<<<borderparse");
		
		var countRow =hot.countRows(); 
		var countCol =hot.countCols(); 
		var sheetName = $('#sheetName').val();		
	    $.ajax({
	        url:"${pageContext.request.contextPath}/save",
	        type:'POST',
	        async: false,
	        data: {"dataArray": jparse, "mergeArray": mergeparse, "borderArray" : borderparse,"countRow" : countRow, "countCol":countCol, "sheetName":sheetName, "sheetCategory" : param },
	        success:function(data){
	            alert("저장!");
/* 	            window.opener.location.reload();
	            window.close();
	            self.close(); */
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("저장실패~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
		});    
	    
	    
	setTimeout(function(){
//		console.log(hot.mergeCells)
// 		console.log(hot.getCellsMeta())
// 		console.log(dataArray);sdf
	},5000)
	})



</script>
</body>
<%-- <c:import url="../module/importJS.jsp"></c:import> --%>
</html>
