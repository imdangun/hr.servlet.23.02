<%@ page language='java' contentType='application/json; charset=utf-8' pageEncoding='utf-8' %>
<%@ page import='com.my.hr.service.LaborerService' %>
<%@ page import='com.my.hr.service.LaborerServiceImpl' %>
<%@ page import='com.my.hr.domain.Laborer' %>
<%@ page import='java.util.List' %>

<%!
	LaborerService laborerService = new LaborerServiceImpl();
%>
<%
	List<Laborer> laborers = laborerService.getLaborers();	
	String json = "[";
	for(Laborer laborer: laborers) {
		json += "{\"laborerId\":" + laborer.getLaborerId() + ",";
		json += "\"laborerName\":\"" + laborer.getLaborerName() + "\",";
		json += "\"hireDate\":\"" + laborer.getHireDate() + "\"},";
	}
	json += "]";
	json = json.replaceAll("},]", "}]");
%>
<%= json %>
<%--
[
	{
		"laborerId": 1,
		"laborerName": "최한석",
		"hireDate": "2025-02-05"
	},
	{
		"laborerId": 2,
		"laborerName": "한아름",
		"hireDate": "2025-02-04"		
	},
	{
		"laborerId": 3,
		"laborerName": "양승일",
		"hireDate": "2025-02-03"
	}
]
--%>