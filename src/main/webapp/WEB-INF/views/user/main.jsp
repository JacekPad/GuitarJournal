<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../constants/header.jsp"/>
<body class="dashboard dashboard_1">
<div class="full_container">
    <div class="inner_container">
        <!-- Sidebar  -->
        <jsp:include page="/WEB-INF/views/constants/sidebar.jsp"/>
        <!-- end sidebar -->
        <!-- right content -->
        <div style="background-size: 100%; background-image: url(/resources/images/3845477.jpg)" id="content">
            <!-- topbar -->
            <jsp:include page="/WEB-INF/views/constants/topbar.jsp"/>
            <!-- end topbar -->
            <!-- dashboard inner -->
            <div class="midde_cont">
                <div style="opacity: 95%" class="container-fluid">

                    <div class="row column_title">
                        <div class="col-md-12">
                            <div style="opacity: 1%" class="page_title">
                            </div>
                        </div>
                    </div>
                    <div class="row column1">
                        <div class="w-100 h-100">
                            <div class="white_shd full margin_bottom_30">
                                <div class="full graph_head">
                                    <div class="heading1 margin_0">
                                        <h2>
                                            <spring:message code="user.userList"/>                                        </h2>
                                    </div>
                                </div>

                                <div class="table_section padding_infor_info">
                                    <div class="table-responsive-sm">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th><spring:message code="user.userName"/></th>
                                                <th class="col-sm-4"><spring:message code="user.email"/></th>
                                                <th class="col-sm-2"><spring:message code="app.created"/></th>
                                                <th class="col-sm-1"><spring:message code="user.roles"/></th>
                                                <th class="col-sm-1"><spring:message code="user.enabled"/></th>
                                                <th class="col-sm-3"><spring:message code="app.actions"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <input id="token" type="hidden" name="${_csrf.parameterName}"
                                                   value="${_csrf.token}"/>
                                            <c:forEach items="${users}" var="user">
                                                <tr>
                                                    <td>${user.username}</td>
                                                    <td>${user.email}</td>
                                                    <td>${user.created}</td>
                                                    <td id="userRole">
                                                        <c:forEach items="${user.roles}" var="role">
                                                            ${fn:substring(role.name,5,20)}
                                                        </c:forEach>
                                                    </td>
                                                    <td id="userEnabled${user.id}">
                                                        <c:if test="${user.enabled == 1}">
                                                            <spring:message code="app.yes"/>
                                                        </c:if>
                                                        <c:if test="${user.enabled == 0}">
                                                            <spring:message code="app.no"/>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex flex-row justify-content-md-between w-100">
                                                            <div>
<%--                                                                <c:if test="${user.enabled == 1}">--%>
                                                                <span>
                                                                    <a data-id="${user.id}" class="blockUser"
                                                                       href="#">
                                                                        <i class="fa fa-lock"></i> <spring:message code="user.disableUser"/>
                                                                    </a>
                                                                    </span>
<%--                                                                </c:if>--%>
<%--                                                                <c:if test="${user.enabled == 0}">--%>
                                                                    <span>
                                                                    <a data-id="${user.id}" class="unblockUser"
                                                                       href="#">
                                                                        <i class="fa fa-unlock"></i> <spring:message code="user.enabledUser"/>
                                                                    </a>
                                                                    </span>
<%--                                                                </c:if>--%>
                                                            </div>
                                                            <div>
                                                                <a data-id="${user.id}" class="adminUser" href="#">
                                                                    <i class="fa fa-diamond"></i> <spring:message code="user.giveAdmin"/>
                                                                </a>
                                                            </div>
                                                            <div>
                                                                <a href="${pageContext.request.contextPath}/admin/user/delete/${user.id}">
                                                                    <i class="fa fa-trash"></i> <spring:message code="user.delete"/>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="<c:url value="/resources/js/custom/userRoleEdit.js"/>"></script>
<jsp:include page="../constants/footer.jsp"/>