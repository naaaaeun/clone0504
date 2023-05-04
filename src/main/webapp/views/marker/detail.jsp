<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

    let marker_form = {
        init : function(){
            $('#update_btn').click(function(){
                marker_form.send();
            });
            $('#delete_btn').click(function(){
                let c=confirm("삭제 하시겠습니까?");
                if(c==true){
                    location.href="/marker/deleteimpl?id=${marker.id}";
                }
            });
        },
        send : function(){
            $('#marker_form').attr({
                'action':'/marker/updateimpl',//MainController로 요청을 보낸다.
                'method':'post',
                enctype:'multipart/form-data'
            });
            $('#marker_form').submit();
        }
    };
    $(function(){
        marker_form.init()
    });

</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker Add</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Marker Add</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="marker_form" class="form-horizontal well">

                    <input type="hidden" value="${marker.id}" name="id"/>
                    <input type="hidden" value="${marker.img}" name="img"/>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="title">title:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" value="${marker.title}" id="title" name="title">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="target">target:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="target" value="${marker.target}" name="target">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lat">경도:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="lat"  value="${marker.lat}" name="lat">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lng">위도:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="lng"  value="${marker.lng}" name="lng">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="imgfile">이미지:</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="imgfile" placeholder="input img" name="imgfile">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="loc">지역:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="loc"  value="${marker.loc}" name="loc">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="update_btn" type="button" class="btn btn-info"> update</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="delete_btn" type="button" class="btn btn-info">delete</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>