<%@ tag import="org.springframework.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="pagedListHolder" required="true" type="org.springframework.beans.support.PagedListHolder" %>
<%@ attribute name="pagedLink" required="true" type="java.lang.String" %>


<c:if test="${pagedListHolder.pageCount > 1}">
    <c:if test="${!pagedListHolder.firstPage}">
        <a href="<%= StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage()-1)) %>"><span class="pagingItem">&lt;</span></a>
    </c:if>
    <c:if test="${pagedListHolder.firstLinkedPage > 0}">
        <a href="<%= StringUtils.replace(pagedLink, "~", "0") %>"><span class="pagingItem">1</span></a>
    </c:if>
    <c:if test="${pagedListHolder.firstLinkedPage > 1}">
        <span class="pagingDots">...</span>
    </c:if>
    <c:forEach begin="${pagedListHolder.firstLinkedPage}" end="${pagedListHolder.lastLinkedPage}" var="i">
        <c:choose>
            <c:when test="${pagedListHolder.page == i}">
                <span class="pagingItemCurrent">${i+1}</span>
            </c:when>
            <c:otherwise>
                <a href="<%= StringUtils.replace(pagedLink, "~", String.valueOf(jspContext.getAttribute("i"))) %>"><span class="pagingItem">${i+1}</span></a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 2}">
        <span class="pagingDots">...</span>
    </c:if>
    <c:if test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 1}">
        <a href="<%= StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPageCount()-1)) %>"><span class="pagingItem">${pagedListHolder.pageCount}</span></a>
    </c:if>
    <c:if test="${!pagedListHolder.lastPage}">
       <a href="<%= StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage()+1)) %>"> <span class="pagingItem">&gt;</span></a>
    </c:if>
</c:if>