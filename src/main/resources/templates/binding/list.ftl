<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>tsbm - web</title>
   <link rel="stylesheet" href="/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="/dist/css/skins/skin-blue.min.css">
</head>
<body class="layui-layout-body skin-blue">
<#include  "/common/left.ftl"/>
  <div class="layui-body content-wrapper">
    <!-- 内容主体区域 -->
   <!--  <div>
	    
    </div> -->
    <!-- <div style="padding: 15px;padding-bottom: 1px;" id="body">
    </div> -->
	<section></section>
	<section class="content content-wrapper">
		<div class="row">
		<div class="col-xs-12" >
			  <div class="box" id="body">
			  	   <div class="box-header">
			           <h3 class="box-title">绑定参数</h3>
			       </div>
				   <div class="box-body table-responsive no-padding">
				   		<table class="table table-hover" >
				   			  <thead>
							    <tr>
							      <th>数据库名称</th>
							      <th>对应类名</th>
							      <th>操作</th>
							    </tr> 
							  </thead>
							   <tbody id="tbody">
							   	<#if bindingList?exists>
							   		<#list bindingList as data>
							   			<tr><td>${data.dbName}</td><td>${data.dbClass}</td><td></td>
							   			 </tr>
							   		</#list>
							   </#if>
							  </tbody>
				   		</table>
				   </div>
			    </div>
		</div>
		</div>
		<div class="row">
		<div class="col-xs-12" >
			  <div class="box" id="body">
			  	   <div class="box-header">
			           <h3 class="box-title">数据库参数</h3>
			       </div>
				   <div class="box-body table-responsive no-padding">
				   		<table class="table table-hover" >
				   			  <thead>
							    <tr>
							      <tr>
							      <th>配置名称</th>
							      <th>数据库名称</th>
							      <th>ip</th>
							      <th>port</th>
							      <th>username</th>
							      <th>passwd</th>
							      <th>操作</th>
							    </tr> 
							    </tr> 
							  </thead>
							   <tbody id="tbody">
							   	<#if dbList?exists>
							   		<#list dbList as data>
							   			<tr>
							   			<td>${data.name}</td>
							   			<td>${data.bindingId}</td>
							   			<td>${data.dbIp}</td>
							   			<td>${data.dbPort}</td>
							   			<td>${data.dbUser}</td>
							   			<td>${data.dbPasswd}</td>
							   			<td></td>
							   			 </tr>
							   		</#list>
							   </#if>
							  </tbody>
				   		</table>
				   </div>
			    </div>
		</div>
		</div>
		<div class="row">
		<div class="col-xs-12" >
			  <div class="box" id="body">
			  	   <div class="box-header">
			           <h3 class="box-title">模板参数</h3>
			       </div>
				   <div class="box-body table-responsive no-padding">
				   		<table class="table table-hover" >
				   			  <thead>
							    <tr>
							      <th>模板名称</th>
							      <th>测试模式</th>
							      <th>负载均衡</th>
							      <th>是否动态及参数</th>
							      <th>设备数</th>
							      <th>传感器数</th>
							      <th>操作</th>
							    </tr> 
							  </thead>
							   <tbody id="tbody">
							   	<#if tmpList?exists>
							   		<#list tmpList as data>
							   			<tr>
							   				<td>${data.name}</td>
							   				<td>${data.testMode}</td>
							   				<td>${data.backgroundStatus}</td>
							   				<td>${data.dynStatus}</td>
							   				<td>${data.deviceNum}</td>
							   				<td>${data.sensorNum}</td>
							   				<td></td>
							   			 </tr>
							   		</#list>
							   </#if>
							  </tbody>
				   		</table>
				   </div>
			    </div>
		</div>
		</div>
	</section>
  </div>
<script src="/js/jquery.js"></script>
<script src="/layer/layer.js"></script>
<script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<script>
<script>
//JavaScript代码区域
$(function(){
	getList();
	$('.add').on('click',function(){
		var layer = layui.layer;
		  layer.open({
			  type:2,
			  title:'新增',
			  area:['500px','300px'],
			  content:'/pages/binding/add.html',
			  yes: function(index, layero){
				    //do something
				    layer.closeAll();
			}
		  })
	})
	$('.layui-layout-body').on('click','.remove',function(){
		var dataId=$(this).attr('data-id')
		$.ajax({
			url:'/base/remove/binding',
			data:{id:dataId},
			type:'post',
			async:false,
			success:function(res){
				getList();
			}
		})
		return false
	});
});
function getList(){
	$('#tbody').html('');
	$.ajax({
		url:'/base/list/binding',
		dataType:'json',
		success:function(res){
			var data = res.data
			$(data).each(function(){
				var dbId=this.id
				var dbName=this.dbName
				var dbClass=this.dbClass
				var tr='<tr><td data-id="'+dbId+'">'+dbName+'</td><td>'+dbClass+'</td><td><button class="layui-btn layui-btn-sm remove"  data-id="'+dbId+'">删除</button></td></tr>'
				$('#tbody').append(tr)
			})
		}
	});
}
</script>
</body>
</html>