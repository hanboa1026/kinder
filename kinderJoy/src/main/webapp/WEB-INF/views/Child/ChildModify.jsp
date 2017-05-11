<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery�� ����ϱ����� CDN�ּ� -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<title>Child Modify Form</title>

<!-- CSS Link -->
<c:import url="../module/importCSS.jsp"></c:import>
<!-- JS Link -->
<c:import url="../module/importJS.jsp"></c:import>
	
 <style>
	 #body{
	 	margin-top: 5%;
	 }
 </style>
</head>
<body id="body">
<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>
<div class="container">
    <form id="modifyForm" action="${pageContext.request.contextPath}/ChildModify" method="post">
        <div class="form-group">kid_no :
            <input class="form-control" name="kid_no" value="${child.kidNo}" type="text" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="license_kindergarten">��ġ�� :</label>
            <input class="form-control" value="${child.licenseKindergarten}" name="license_kindergarten" id="license_kindergarten" type="text"/>
        </div>
         <div class="form-group">
            <label for="kid_name">�̸� :</label>
            <input class="form-control" value="${child.kidName}" name="kid_name" id="kid_name" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_birth">������� :</label>
            <input class="form-control" value="${child.kidBirth}" name="kid_birth" id="kid_birth" type="text"/>
        </div>    
        <div class="form-group">
            <label for="kid_address">�ּ� :</label>
            <input class="form-control" value="${child.kidAddress}" name="kid_address" id="kid_address" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_protector_phone">��ȣ�� ��ȣ :</label>
            <input class="form-control" value="${child.kidProtectorPhone}" name="kid_protector_phone" id="kid_protector_phone" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_protector_phone_reserve">��ȣ�� �����ȣ :</label>
            <input class="form-control" value="${child.kidProtectorPhoneReserve}" name="kid_protector_phone_reserve" id="kid_protector_phone_reserve" type="text"/>
        </div>
        <div class="form-group">���ǻ��� :
            <textarea class="form-control" id="kid_precautions" name="kid_precautions" rows="5" cols="50">${child.kidPrecautions}</textarea>
        </div>
        <div class="form-group">
            <label for="kid_gender">���� :</label>
            <input class="form-control" value="${child.kidGender}" name="kid_gender" id="kid_gender" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_commuting">���й�� :</label>
            <input class="form-control" value="${child.kidCommuting}" name="kid_commuting" id="kid_commuting" type="text"/>
        </div>
         <div class="form-group">
            <label for="kid_commuting">������ :</label>
            <input class="form-control" value="${child.kidEntranceDay}" name="kid_entrance_day" id="kid_entrance_day" type="text" readonly="readonly"/>
        </div>
        <div>
        
            <input class="btn btn-default" id="modifyButton" type="submit" value="�ۼ���"/>
            <input class="btn btn-default" type="reset" value="�ʱ�ȭ"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/ChildList">�۸��</a>
        </div>
    </form>
</div>
<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>
</body>
</html>