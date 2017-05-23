<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	<!-- navbar -->
	<c:import url="/WEB-INF/views/module/navbar.jsp"></c:import>
	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>

	<link href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css' rel='stylesheet'/>
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	
		<!-- draggable -->
		<script type="text/javascript" src="https://johnny.github.io/jquery-sortable/js/jquery-sortable.js"></script>
		<link rel="stylesheet" type="text/css" href="https://johnny.github.io/jquery-sortable/css/application.css">
		<!-- draggable -->
	
<style>
       #container {
           margin-top: 20px;
       }

       #container .ui-droppable { }

       ul { margin: 0; }
       hr { margin: 5px 0; }
       .btn-block { padding-left: 5px; padding-right: 5px; }

       #selectable .ui-selecting { background: #FECA40; }
       #selectable .ui-selected { background: #F39814; color: white; }

       .badge.badge-drag { position: absolute; top: -7px; right: -7px; }

       i.move {cursor: move;}

   </style>
		
			<script>
			$(document).ready(function(){
				$('#takeForm').attr('class','active');
				$('#sidetakeForm').attr('style','background-color:green');	
			});
			</script>
			
			<script>
			$(document).ready(function(){
			var oldContainer;
				$("ol.jkc").sortable({
				  group: 'nested',
				  afterMove: function (placeholder, container) {
				    if(oldContainer != container){
				      if(oldContainer)
				        oldContainer.el.removeClass("active");
				      	container.el.addClass("active");
						oldContainer = container;
						}
				  	},
					onDrop: function ($item, container, _super) {
					container.el.removeClass("active");
					_super($item, container);
				  }
				});
				
					$("ol.simple_with_no_drop").sortable({
					  group: 'no-drop',
					  drop: false
					});
				
					$("ol.simple_with_no_drag").sortable({
					  group: 'no-drop',
					  drag: false
					});	
			});
			</script>
			
			
			
			<script>
			
			$(document).ready(function(){
				var a = $("#li_id_name").html();
				if (a != null) {
					console.log(a);
				}else{
					console.log("값이 없음");
				}
				
				$("#send").click(function(){
					$.ajax({
						url : "${pageContext.request.contextPath}/save2",
						type : "POST",
						data : a,
							
							success: function(result){
								alert(a);
							
						}
					});
				});
			});
			</script>
			
</head>
<body>
<div class="wrapper" id="container">
	<!-- 사이드메뉴바 BEGIN -->
	<c:import url="./side.jsp"></c:import>
		<!-- 사이드메뉴바 END -->
		<div class="main-panel">
			<div class="content">
				<div class="card">
	        	   <div class="container-fluid">
	             	  <div class="row" >
	                  		<div class="col-md-10"  data-background-color="green">
	            			<div class="card-header">
		                        <h4 class="title">편성표</h4>
		                        <p class="category">편성표를 작성해주세요.</p>
            				</div>
                                <div class="card-content table-responsive">
									<div class="col-md-5" >
							            <c:forEach begin="3" end="5" var="age">
								            <ol id="selectable" class="simple_with_no_drag vertical">
								              	<li id="li-id">
								              	${age}살
									            	<c:forEach var="C" items="${takeClass}">
											            <c:if test="${C.classAge == age}">
												            <ol class="jkc vertical">
												           	    <li class="" style="">
													              	<ol class="">
													              		${C.classNo}반
													              	</ol>
												           		</li>
											        	 	</ol>
										        	 	</c:if>
								        	 		</c:forEach>
								        	 	</li>
							        	 	</ol>
						        	 	</c:forEach>
									</div>
									 	<div class="col-md-5">
								        	<ol class="jkc vertical">교원목록
								             	<c:forEach var="T" items="${takeTeacher}">
										        	<li id="li_id_name"><i class="icon-move"></i>${T.teacherName}</li>
										        </c:forEach>
								       		</ol>
										</div>
	                            	</div>
                            	<input type="button" value="저장하기" id="send" />
	                        </div>
	                    </div>
	                </div>
				</div>
			</div>
		<c:import url="./footer.jsp"></c:import>
	</div>
</div>
</body>
</html>