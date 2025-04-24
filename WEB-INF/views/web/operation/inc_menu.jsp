<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<div class="tab-nav col-7">
    <ul>
        <li ${param.pageGubun eq 'location' ? 'class="active"' : ''}><a href="/web/u/operation/location">위치정보</a></li>
        <li ${param.pageGubun eq 'edit' ? 'class="active"' : ''}><a href="/web/u/member/user/edit">회원정보 수정</a></li>
    </ul>
</div>