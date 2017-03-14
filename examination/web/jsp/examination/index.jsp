<%--
  Created by IntelliJ IDEA.
  User: zouy
  Date: 2016/12/23
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>驾考模拟系统</title>
    <!-- 引入 Bootstrap -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        body{
            padding:0px;
        }
        th,td,ul{
            text-align:center;
        }
    </style>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/angular.js/1.4.6/angular.min.js"></script>
    <script src="jsp/common/js/md5.js"></script>
</head>
<body style="background-color: #f7f7f7;" ng-app="mainapp">
<div><%--start--%>
    <script>
        var m = angular.module("mainapp",[]);
        var constant = m.constant('constRef',[["登录","注册","个人信息","管理用户","搜索","注销","修改密码"],//topOperation
            ["顺序练习","章节练习","随机练习","强化练习","模拟考试","考试记录","我的错题","我的收藏","用户管理","题库录入"],//left nav bar
            ["查看详情","删除","新增角色","搜索","编辑","取消","提交","用户管理"],// role table
            ["系统消息","编辑","注销"],//
            ["搜索","新增文件","查看详情","下载","删除"]]);
        var topCtrl = m.controller("topcontroller", function($rootScope,$scope,constRef){
            $scope.constRef = constRef;
            $rootScope.justForModalInfomation = "";

            $scope.GetQueryString = function(name){
                var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if(r!=null){return  decodeURI(r[2]);} return null;
            };
            $scope.htmlInit = function(){
                $rootScope.usernameOfLoger = $scope.GetQueryString("userName");
                $rootScope.idOfLoger = $scope.GetQueryString("userId");
                if(parseInt($rootScope.idOfLoger) < 1 || $rootScope.idOfLoger == null){
                    //window.location.href = "/login.html";
                }
                console.log($rootScope.usernameOfLoger);
                console.log($rootScope.idOfLoger);
            };
            $scope.htmlInit();//init the userId(from loger)

            $rootScope.checkIfLogin = function () {
                if(parseInt($scope.idOfLoger) < 1 || $scope.idOfLoger == null){
                    $scope.justForModalInfomation = "请先登录!";
                    $("#modalid-toastInfo").modal("toggle");
                    return false;
                }else {
                    return true;
                }
            };

            $scope.topOperation = function(obj){
                if(obj == "登录"){
                    window.location.href = "/login.html";
                }else if(obj == "注册"){
                    window.location.href = "/signup.html";
                }else if(obj == "个人信息"){
                    $scope.getLoger();
                    $("#modalid-viewUserInfo").modal("toggle");
                }else if(obj == "管理用户"){
                    $scope.getUserPageList();
                    $("#modalid-manageUser").modal("toggle");
                }else if(obj == "注销"){
                    $("#modalid-offconf").modal("toggle");
                }else if(obj == "修改密码"){
                    $scope.getLoger();
                    $scope.editPassWord = "";
                    $scope.editPassWordNew = "";
                    $("#modalid-modifyPWD").modal("toggle");
                }
            };

            $scope.getLoger = function(){
                $.ajax({
                    type:"POST",
                    url:"/login/getLoger",
                    data:{"id":$scope.idOfLoger},
                    contentType:"application/x-www-form-urlencoded",
                    dataType:"json",
                    success:function(data){
                        console.log(data);
                        $scope.$apply(function(){
                            $scope.editLogerArray = new Array();
                            var obj = {};
                            obj['id'] = data.value[0].id;
                            obj['username'] = data.value[0].username;
                            obj['email'] = data.value[0].email;
                            obj['tel'] = data.value[0].tel;
                            var datestr = new Date(parseInt(data.value[0].createTime));
                            var temstr = datestr.getFullYear() + "年" + (parseInt(datestr.getMonth())+1) + "月" + datestr.getDate() + "日"
                            //+ datestr.getHours() + ":" + datestr.getMinutes() + ":" + datestr.getSeconds()
                                    ;
                            obj['createTime'] = temstr;	//创建时间
                            $scope.editLogerArray.push(obj);
                        });
                    }
                });
            };

            $scope.editLoger = function(){
                $.ajax({
                    type:"POST",
                    url:"/login/editLoger",
                    data:{"id":$scope.idOfLoger,"username":$scope.editLogerArray[0].username,
                        "tel":$scope.editLogerArray[0].tel,"email":$scope.editLogerArray[0].email},
                    contentType:"application/x-www-form-urlencoded",
                    dataType:"json",
                    success:function(data){
                        console.log(data);
                        $scope.$apply(function(){
                            $scope.justForModalInfomation = "编辑个人信息成功!";
                            $("#modalid-toastInfo").modal("toggle");
                        });
                    }
                });
            };

            $scope.modifyPWD = function(){
                $.ajax({
                    type:"POST",
                    url:"/login/modifyPWD",
                    data:{"id":$scope.idOfLoger,"passWord":hex_md5($scope.editPassWord),
                        "newPassWord":hex_md5($scope.editPassWordNew)},
                    contentType:"application/x-www-form-urlencoded",
                    dataType:"json",
                    success:function(data){
                        console.log(data);
                        $scope.$apply(function(){
                            if(data.message == "旧密码不正确"){
                                $scope.justForModalInfomation = "旧密码不正确!";
                                $("#modalid-toastInfo").modal("toggle");
                            }else {
                                $scope.justForModalInfomation = "修改密码成功!请重新登录!";
                                $("#modalid-mpswoffconf").modal("toggle");
                            }
                        });
                    }
                });
            };

            $scope.offFunction = function () {
                window.location.href = "/login.html";
            };

            /**
             * logo click
             */
            $scope.logoClick = function () {
                $rootScope.nav = -1;
            }
        });
        //"顺序练习","章节练习","随机练习","强化练习","模拟考试","考试记录","我的错题","我的收藏","用户管理"
        var leftCtrl = m.controller("leftcontroller", function($rootScope,$scope,constRef){
            $scope.constRef = constRef;
            $rootScope.nav = -1;
            $scope.rightDiv = function(obj){
                console.log(obj);
                if(obj == "顺序练习"){
                    if($rootScope.checkIfLogin()){
                        $rootScope.nav = 0;
                        $scope.activeStatus = 0;

                        $rootScope.ft_init();
                    }
                }else if(obj == "章节练习"){
                    if($rootScope.checkIfLogin()){
                        $rootScope.nav = 1;
                        $scope.activeStatus = 1;

                        $rootScope.ct_init();
                    }
                }else if(obj == "随机练习"){
                    if($rootScope.checkIfLogin()){
                        $rootScope.nav = 2;
                        $scope.activeStatus = 2;

                        $rootScope.rt_init();
                    }
                }else if(obj == "强化练习"){
                    if($rootScope.checkIfLogin()){
                        $rootScope.nav = 3;
                        $scope.activeStatus = 3;

                        $rootScope.st_init();
                    }
                }else if(obj == "模拟考试"){
                    if($rootScope.checkIfLogin()){
                        $rootScope.nav = 4;
                        $scope.activeStatus = 4;

                        //$rootScope.myse_init();
                    }
                }else if(obj == "考试记录"){
                    if($rootScope.checkIfLogin()){
                        $rootScope.nav = 5;
                        $scope.activeStatus = 5;

                        //$rootScope.as_init();
                    }
                }else if(obj == "我的错题"){
                    if($rootScope.checkIfLogin()){
                        $rootScope.nav = 6;
                        $scope.activeStatus = 6;

                        //$rootScope.um_init();
                    }
                }else if(obj == "我的收藏"){
                    if($rootScope.checkIfLogin()){
                        $rootScope.nav = 7;
                        $scope.activeStatus = 7;

                        $rootScope.mc_init();
                    }
                }else if(obj == "用户管理"){
                    if($rootScope.checkIfLogin()){
                        $rootScope.nav = 8;
                        $scope.activeStatus = 8;

                        //$rootScope.um_init();
                    }
                }else if(obj == "题库录入"){
                    if($rootScope.checkIfLogin()){
                        $rootScope.nav = 9;
                        $scope.activeStatus = 9;

                        //$rootScope.um_init();
                    }
                }
            };
        });
    </script>
    <!--top operation-->
    <div class="container" style="background-color: #f7f7f7;padding: 0px;" ng-controller="topcontroller">
        <%@ include file="modal/indexModal.jspf" %>
        <nav class="navbar navbar-default" role="navigation" style="background-color: #f0ad4e;">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand"
                    style="margin-top:-15px;"><img style="cursor: pointer;" ng-click="logoClick()" src="jsp/common/imgs/logo.png" alt="logo"></a>
                </div>
                <div>
                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <div class="btn-group">
                                <button ng-show="idOfLoger > 0" type="button" class="btn btn-danger" ng-click="topOperation(constRef[0][5])">
                                    <span class="glyphicon glyphicon-off"></span>&nbsp;
                                    <span ng-bind="constRef[0][5]"></span>
                                </button>
                                <button ng-show="idOfLoger == null" type="button" class="btn btn-default" ng-click="topOperation(constRef[0][0])">
                                    <span class="glyphicon glyphicon-user"></span>&nbsp;
                                    <span ng-bind="constRef[0][0]"></span>
                                </button>
                                <button type="button" class="btn btn-success" ng-click="topOperation(constRef[0][1])">
                                    <span class="glyphicon glyphicon-tasks"></span>&nbsp;
                                    <span ng-bind="constRef[0][1]"></span>
                                </button>
                                </button>
                                <button ng-show="idOfLoger > 0" type="button" class="btn btn-info" ng-click="topOperation(constRef[0][2])">
                                    <span class="glyphicon glyphicon-home"></span>&nbsp;
                                    <span ng-bind="constRef[0][2]"></span>
                                </button>
                                <button ng-show="idOfLoger > 0" type="button" class="btn btn-danger" ng-click="topOperation(constRef[0][6])">
                                    <span class="glyphicon glyphicon-lock"></span>&nbsp;
                                    <span ng-bind="constRef[0][6]"></span>
                                </button>
                                <%--<button ng-show="idOfLoger == 8" type="button" class="btn btn-primary" ng-click="topOperation(constRef[0][3])">
                                    <span class="glyphicon glyphicon-th"></span>&nbsp;
                                    <span ng-bind="constRef[0][3]"></span>
                                </button>--%>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </nav>
    </div>

    <!--center(left -> right)-->
    <div class="container" style="background-color: #f7f7f7;margin-top: 2px;">
        <div class="row" >
            <div class="col-xs-2" style="border: 1px solid #d9edf7;padding: 2px;" ng-controller="leftcontroller">
                <ul class="nav nav-pills nav-stacked">
                    <!--这里a标签不能加href属性，否则会相对首页进行#跳转，但在静态页面无影响-->
                    <li ng-class="{active:activeStatus == 0}" id="liid-goodslist"><a style="cursor: pointer;" ng-click="rightDiv(constRef[1][0])" ng-bind="constRef[1][0]"></a></li>
                    <li ng-class="{active:activeStatus == 1}"><a style="cursor: pointer;" ng-click="rightDiv(constRef[1][1])" ng-bind="constRef[1][1]"></a></li>
                    <li ng-class="{active:activeStatus == 2}"><a style="cursor: pointer;" ng-click="rightDiv(constRef[1][2])" ng-bind="constRef[1][2]"></a></li>
                    <li ng-class="{active:activeStatus == 3}"><a style="cursor: pointer;" ng-click="rightDiv(constRef[1][3])" ng-bind="constRef[1][3]"></a></li>
                    <li ng-class="{active:activeStatus == 4}"><a style="cursor: pointer;" ng-click="rightDiv(constRef[1][4])" ng-bind="constRef[1][4]"></a></li>
                    <li ng-class="{active:activeStatus == 5}"><a style="cursor: pointer;" ng-click="rightDiv(constRef[1][5])" ng-bind="constRef[1][5]"></a></li>
                    <li ng-class="{active:activeStatus == 6}"><a style="cursor: pointer;" ng-click="rightDiv(constRef[1][6])" ng-bind="constRef[1][6]"></a></li>
                    <li ng-class="{active:activeStatus == 7}"><a style="cursor: pointer;" ng-click="rightDiv(constRef[1][7])" ng-bind="constRef[1][7]"></a></li>
                    <li ng-class="{active:activeStatus == 8}"><a style="cursor: pointer;" ng-click="rightDiv(constRef[1][8])" ng-bind="constRef[1][8]"></a></li>
                    <li ng-class="{active:activeStatus == 9}"><a style="cursor: pointer;" ng-click="rightDiv(constRef[1][9])" ng-bind="constRef[1][9]"></a></li>
                </ul>
            </div>

            <div class="ng-hide" ng-show="nav == -1" style="width: 410px;margin:0 auto;">
                <img src="jsp/common/imgs/home.jpg" alt=""/>
            </div>
            <%--这里放置待显示页面 start--%>
            <div class="ng-hide" ng-show="nav == 0">
                <%@ include file="jspf/fluidTrain.jspf" %>
            </div>
            <div class="ng-hide" ng-show="nav == 1">
                <%@ include file="jspf/chapterTrain.jspf" %>
            </div>
            <div class="ng-hide" ng-show="nav == 2">
                <%@ include file="jspf/randomTrain.jspf" %>
            </div>
            <div class="ng-hide" ng-show="nav == 3">
                <%@ include file="jspf/strengthenTrain.jspf" %>
            </div>
            <div class="ng-hide" ng-show="nav == 4">
            </div>
            <div class="ng-hide" ng-show="nav == 5">
            </div>
            <div class="ng-hide" ng-show="nav == 6">

            </div>
            <div class="ng-hide" ng-show="nav == 7">
                <%@ include file="jspf/myCollection.jspf" %>
            </div>
            <div class="ng-hide" ng-show="nav == 8">
                <%@ include file="jspf/userManage.jspf" %>
            </div>
            <div class="ng-hide" ng-show="nav == 9">
                <%@ include file="jspf/writeQuestion.jspf" %>
            </div>
            <%--这里放置待显示页面 end--%>

        </div>
    </div>

</div><%--end--%>

</body>
</html>
