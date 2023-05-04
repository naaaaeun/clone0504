<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let item_search={
        init:function (){
            $('#search_btn').click(function (){
                $('#search_form').attr({
                    method:'get',
                    action:'/item/search'
                });
                $('#search_form').submit();
            });
        }
    }
    $(function (){
        item_search.init();
    })
</script>
<style>
    .small_img{
        width: 50px;
    }
</style>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Item All</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Item All</h6>
            <form id="search_form" class="form-inline well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="name 입력" id="name" name="name" >
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="search_btn" type="button" class="btn btn-info">Register</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>IMG</th>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>PRICE</th>
                        <th>REGDATE</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${ilist}">
                        <!-- Modal -->
                        <div id="target${obj.id}" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Detail image</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>${obj.name}</p>
                                        <img  src="/uimg/${obj.imgname}">
                                    </div>
                                    <div class="modal-footer">
                                        <a href="/item/detail?id=${obj.id}" class="btn btn-info" role="button">Link Button</a>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- Modal end -->
                        <tr>
                            <td><a href="#"  data-toggle="modal" data-target="#target${obj.id}"><img class="small_img" src="/uimg/${obj.imgname}"></a></td>
                            <td><a href="/item/detail?id=${obj.id}">${obj.id}</a></td>
                            <td>${obj.name}</td>
                            <td><fmt:formatNumber value="${obj.price}" type="currency" currencyCode="KRW" pattern="###,###원"/></td>
                            <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

