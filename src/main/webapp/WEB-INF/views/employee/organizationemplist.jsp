<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="DIV${depId}" class="row m-1 collapse text-primary mt-3 ">
	<div id="dep-${depId}" class=" flex-column">
		<c:forEach var="orgEmp" items="${orgEmpList}">
			<button class="row my-1 ml-3 btn-color text-primary" onclick="popup('${orgEmp.empId}')">
				<i class="h3 my-auto  mdi mdi-account"></i>
				<span id="empName" class="ml-4">${orgEmp.empName}&nbsp;${orgEmp.posName}</span>
			</button>
		</c:forEach>
	</div>
</div>