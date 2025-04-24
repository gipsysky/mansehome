<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix = "tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<tiles:importAttribute name="menuCodeList"/>
<tiles:importAttribute name="isLogged"/>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="/admin/index">Manager</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <c:forEach items="${menuCodeList }" var="parentMenu">
                <c:if test="${fn:length(parentMenu.subList) > 0 }">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <c:out value="${parentMenu.name }"/>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <c:forEach items="${parentMenu.subList }" var="subList">
                                <a href="<c:url value='/admin/'/>${subList.url }" class="dropdown-item"><c:out value="${subList.menu_name }"/></a>
                            </c:forEach>
                        </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>

    <c:if test="${isLogged eq true }">
        <button class="btn btn-outline-light my-2 my-sm-0" type="button"
                onClick="javascript:document.location.href='<c:url value='/admin/'/>member/logout';">LOGOUT</button>
    </c:if>
    <c:if test="${isLogged ne true }">
        <button class="btn btn-outline-success my-2 my-sm-0" type="button"
                onClick="javascript:document.location.href='/admin/member/login';">LOGIN</button>
    </c:if>
</nav>


<script>
    function Link(v){
        document.location.href=v;
    }
    function ELink(v){
        window.open(v,"_blank");
    }
</script>