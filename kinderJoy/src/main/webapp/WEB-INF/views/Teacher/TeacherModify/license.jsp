<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>라이선스</title>

  	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	<!-- navbar -->
	<c:import url="/WEB-INF/views/module/navbar.jsp"></c:import>
	<!-- 사이드메뉴바 BEGIN -->
	<c:import url="./side.jsp"></c:import>

	<script>
	$(document).ready(function(){
		$('#license').attr('class','active');
		$('#sideLicense').attr('style','background-color:#3DB7CC');
	});
	</script>
	
</head>
<body>




<div class="wrapper">

	    <div class="main-panel">

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">라이선스</h4>
	                                <p class="category">라이선스를 발급받으세요!</p>
	                            </div>                            
	                            <div class="card-content table-responsive">
	                                <table class="table">
	                                    
	                                    <form action="${pageContext.request.contextPath}/license" method="post">
		
		
		
		
		
		
		<div class="form-group">
		<input type="text" class="teacherName form-control" name="teacherName" id="teacherName" placeholder="유치원명을 입력하세요.">
		</div>
	
	
		<div class="form-group">
		<input type="text" class="form-control" id="teacher_ajax_id" name="teacherId" placeholder="주소를 입력하세요.">
		</div>	
		
		<div class="form-group">
		<input type="text" class="form-control" id="teacherPhone" name="teacherPhone" placeholder="연락처를 입력하세요">
		</div>

										<div class="form-group">
										<label class="control-label col-sm-2">라이센스 발급받기</label>
									      <div class="col-sm-10">              
									        <input type="submit" id="licensecheckbutton" value="라이선스"/>
									      </div>
									      
									      <c:if test="${null != licenseKey}">
									      <c:out value="발급된 라이선스 : ${licenseKey}"></c:out>
									      </c:if>      		
									
									    </div>
										</form>
	                                    
	                                </table>

	                            </div>
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