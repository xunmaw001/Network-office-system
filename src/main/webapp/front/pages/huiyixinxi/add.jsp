<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>注册</title>
		<!-- bootstrap样式，地图插件使用 -->
		<link rel="stylesheet" href="../../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<style>
		html::after {
			position: fixed;
			top: 0;
			right: 0;
			left: 0;
			bottom: 0;
			content: '';
			display: block;
			background-attachment: fixed;
			background-size: cover;
			background-position: center;
			z-index: -1;
		}
		#swiper {
			overflow: hidden;
			margin: 0 auto;
		}
		#swiper .layui-carousel-ind li {
			width: 16px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 50px;
			background-color: rgba(16, 41, 60, 1);
			box-shadow: 0 0 0px rgba(110,22,64,1);
		}
		#swiper .layui-carousel-ind li.layui-this {
			width: 24px;
			height: 10px;
			border-width: 0;
			border-style: solid;
			border-color: rgba(0,0,0,.3);
			border-radius: 50px;
			background-color: rgba(255, 255, 255, 1);
			box-shadow: 0 0 0px rgba(110,22,64,.8);
		}
		
		button, button:focus {
			outline: none;
		}
		
		.data-add-container .add .layui-select-title .layui-unselect {
			padding: 0 12px;
			height: 40px;
			font-size: 14px;
			color: #333;
			border-radius: 4px;
			border-width: 1px;
			border-style: solid;
			border-color: rgba(156, 187, 252, 1);
			background-color: #fff;
			box-shadow: 0 0 6px rgba(110,22,64,0);
			text-align: left;
		}
		.data-add-container .add .layui-form-item {
			display: flex;
			align-items: center;
			justify-content: center;
		}
		.data-add-container .layui-form-pane .layui-form-item[pane] .layui-form-label {
			margin: 0;
			position: inherit;
			background: transparent;
			border: 0;
		}
		.data-add-container .add .layui-input-block {
			margin: 0;
			flex: 1;
		}
		.data-add-container .layui-form-pane .layui-form-item[pane] .layui-input-inline {
			margin: 0;
			flex: 1;
			display: flex;
		}
	</style>
	<body>


		<div id="app">
		
			<!-- 轮播图 -->
			<!-- <div class="layui-carousel" id="swiper">
				<div carousel-item id="swiper-item">
					<div v-for="(item,index) in swiperList" v-bind:key="index">
						<img class="swiper-item" :src="item.img">
					</div>
				</div>
			</div> -->
			<div class="layui-carousel" id="swiper" :style='{"boxShadow":"0 0 0px  rgba(110,22,64,.8)","margin":"0 auto","borderColor":"rgba(0,0,0,.3)","borderRadius":"0px","borderWidth":"0","width":"100%","borderStyle":"solid"}'>
			  <div carousel-item id="swiper-item">
				<div v-for="(item,index) in swiperList" :key="index">
					<img style="width: 100%;height: 100%;object-fit:cover;" :src="item.img" />
				</div>
			  </div>
			</div>
			<!-- 轮播图 -->
		
			<div class="data-add-container" :style='{"padding":"20px","boxShadow":"1px 1px 6px rgba(110,22,64,0)","margin":"30px auto","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"#fff","borderRadius":"10px","borderWidth":"1px","borderStyle":"solid"}'>
		
				<form class="layui-form layui-form-pane add" lay-filter="myForm">
					
		            <div :style='{"padding":"10px","boxShadow":"0 0 6px rgba(110,22,64,0)","margin":"0 0 10px 0","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 3px 0","borderStyle":"dotted"}' class="layui-form-item" pane>
						<label :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"14px","color":"#333","textAlign":"right"}' class="layui-form-label">会议名称：</label>
						<div class="layui-input-block">
							<input :style='{"padding":"0 12px","boxShadow":"0 0 6px rgba(110,22,64,0)","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","textAlign":"left","borderWidth":"1px","fontSize":"14px","borderStyle":"solid","height":"40px"}' v-model="detail.huiyimingcheng" type="text" :readonly="ro.huiyimingcheng" name="huiyimingcheng" id="huiyimingcheng" autocomplete="off" class="layui-input">
						</div>
					</div>
		            <div :style='{"padding":"10px","boxShadow":"0 0 6px rgba(110,22,64,0)","margin":"0 0 10px 0","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 3px 0","borderStyle":"dotted"}' class="layui-form-item" pane>
						<label :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"14px","color":"#333","textAlign":"right"}' class="layui-form-label">会议图片：</label>
						<div v-if="detail.huiyitupian" class="layui-input-block">
							<img id="huiyitupianImg" style="width: 100px;height: 100px;border-radius: 50%;border: 2px solid #EEEEEE;" :src="baseurl+detail.huiyitupian">
							<input :style='{"padding":"0 12px","boxShadow":"0 0 6px rgba(110,22,64,0)","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","textAlign":"left","borderWidth":"1px","fontSize":"14px","borderStyle":"solid","height":"40px"}' type="hidden" :value="detail.huiyitupian" id="huiyitupian" name="huiyitupian" />
						</div>
						<div class="layui-input-block">
							<button v-if="!ro.huiyitupian" :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(110,22,64,0)","margin":"0 10px 0 0","borderColor":"#ccc","backgroundColor":"rgba(156, 187, 252, 1)","color":"#fff","borderRadius":"8px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"44px"}' type="button" class="layui-btn btn-theme" id="huiyitupianUpload">
								<i v-if="true" :style='{"color":"#fff","show":true,"fontSize":"14px"}' class="layui-icon">&#xe67c;</i>上传会议图片
							</button>
						</div>
					</div>
		            <div :style='{"padding":"10px","boxShadow":"0 0 6px rgba(110,22,64,0)","margin":"0 0 10px 0","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 3px 0","borderStyle":"dotted"}' class="layui-form-item" pane>
						<label :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"14px","color":"#333","textAlign":"right"}' class="layui-form-label">会议时间：</label>
						<div class="layui-input-block">
							<input :style='{"padding":"0 12px","boxShadow":"0 0 6px rgba(110,22,64,0)","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","textAlign":"left","borderWidth":"1px","fontSize":"14px","borderStyle":"solid","height":"40px"}' type="text" name="huiyishijian" id="huiyishijian" autocomplete="off" class="layui-input" >
						</div>
					</div>
		            <div :style='{"padding":"10px","boxShadow":"0 0 6px rgba(110,22,64,0)","margin":"0 0 10px 0","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 3px 0","borderStyle":"dotted"}' class="layui-form-item" pane>
						<label :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"14px","color":"#333","textAlign":"right"}' class="layui-form-label">会议文件：</label>
						<div class="layui-input-inline" style="line-height: 50px;">
							<input :style='{"padding":"0 12px","boxShadow":"0 0 6px rgba(110,22,64,0)","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"#fff","color":"#333","borderRadius":"4px","textAlign":"left","borderWidth":"1px","fontSize":"14px","borderStyle":"solid","height":"40px"}' type="hidden" :value="detail.huiyiwenjian" id="huiyiwenjian" name="huiyiwenjian" />
		                    <button :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(110,22,64,0)","margin":"0 10px 0 0","borderColor":"#ccc","backgroundColor":"rgba(156, 187, 252, 1)","color":"#fff","borderRadius":"8px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"44px"}' type="button" class="layui-btn btn-theme" id="huiyiwenjianUpload">
								<i v-if="true"  :style='{"color":"#fff","show":true,"fontSize":"14px"}' class="layui-icon">&#xe67c;</i>上传会议文件
							</button>
							<a :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(110,22,64,0)","margin":"0 10px 0 0","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"rgba(156, 187, 252, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"8px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"44px"}' style="display:block;text-decoration: none;line-height: 44px;" download="会议文件" :href="detail.huiyiwenjian">下载</a>
						</div>
					</div>
		            <div :style='{"padding":"10px","boxShadow":"0 0 6px rgba(110,22,64,0)","margin":"0 0 10px 0","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 3px 0","borderStyle":"dotted"}' class="layui-form-item" pane>
		                <label :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"14px","color":"#333","textAlign":"right"}' class="layui-form-label">会议部门</label>
		                <div class="layui-input-block">
		                    <select name="huiyibumen" id="huiyibumen" lay-filter="huiyibumen"  >
		                        <option value="">请选择</option>
		                        <option v-for="(item,index) in huiyibumen" v-bind:key="index" :value="item">{{item}}</option>
		                    </select>
		                </div>
		            </div>
		            
		            <div :style='{"padding":"10px","boxShadow":"0 0 6px rgba(110,22,64,0)","margin":"0 0 10px 0","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 3px 0","borderStyle":"dotted"}' class="layui-form-item" pane>
						<label :style='{"width":"94px","padding":"0 12px 0 0","fontSize":"14px","color":"#333","textAlign":"right"}' class="layui-form-label">会议内容：</label>
						<div class="layui-input-block">
							<textarea name="huiyineirong" id="huiyineirong">请输入会议内容</textarea>
						</div>
					</div>
		
					<div :style='{"padding":"10px","boxShadow":"0 0 6px rgba(110,22,64,0)","margin":"0 0 10px 0","borderColor":"rgba(156, 187, 252, 1)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 3px 0","borderStyle":"dotted"}' class="layui-form-item">
						<div class="layui-input-block" style="text-align: right;margin-right: 30px;">
							<button :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(110,22,64,0)","margin":"0 10px","borderColor":"#ccc","backgroundColor":"rgba(156, 187, 252, 1)","color":"#fff","borderRadius":"8px","borderWidth":"0","width":"25%","fontSize":"14px","borderStyle":"solid","height":"44px"}'  class="layui-btn btn-submit" lay-submit lay-filter="*">提交</button>
							<button :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(110,22,64,0)","margin":"0 10px","borderColor":"#ccc","backgroundColor":"rgba(156, 187, 252, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"8px","borderWidth":"0","width":"25%","fontSize":"14px","borderStyle":"solid","height":"44px"}' type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<script src="../../layui/layui.js"></script>
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>
		<!-- 校验格式工具类 -->
		<script src="../../js/validate.js"></script>
		<!-- 地图 -->
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=ca04cee7ac952691aa67a131e6f0cee0"></script>
		<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../../js/bootstrap.AMapPositionPicker.js"></script>

		<script>
			var jquery = $;
			
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					baseurl: '',
					dataList: [],
					ro:{
                                        huiyimingcheng : false,
                                        huiyitupian : false,
                                        huiyishijian : false,
                                        huiyineirong : false,
                                        huiyiwenjian : false,
                                        huiyibumen : false,
					},
                    detail: {
                        huiyimingcheng: '',
                        huiyitupian: '',
                        huiyishijian: '',
                        huiyineirong: '',
                        huiyiwenjian: '',
                        huiyibumen: '',
                    },
					huiyibumen: [],
					centerMenu: centerMenu
				},
				updated: function() {
					layui.form.render('select', 'myForm');
				},
                computed: {



                },
				methods: {
					jump(url) {
						jump(url)
					}
				}
			})


			layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'upload', 'laydate','tinymce'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;
				var form = layui.form;
				var upload = layui.upload;
				var laydate = layui.laydate;
				var tinymce = layui.tinymce;
				vue.baseurl = http.baseurl;

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 5
				}, function(res) {
					if (res.data.list.length > 0) {
						var swiperItemHtml = '';
						for (let item of res.data.list) {
							if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item.value != null) {
								swiperItemHtml +=
									'<div>' +
									'<img style="width: 100%;height: 100%;object-fit:cover;" class="swiper-item" src="' + http.baseurl+item.value + '">' +
									'</div>';
							}
						}
						jquery('#swiper-item').html(swiperItemHtml);
						// 轮播图
						vue.$nextTick(() => {
						  carousel.render({
						  	elem: '#swiper',
							width: '100%',
						  	height: '450px',
						  	arrow: 'hover',
						  	anim: 'default',
						  	autoplay: 'true',
						  	interval: '3000',
						  	indicator: 'inside'
						  });
						
						})
					}
				});

				// 上传图片
				var huiyitupianUpload = upload.render({
					//绑定元素
					elem: '#huiyitupianUpload',
					//上传接口
					url: http.baseurl + 'file/upload',
					// 请求头
					headers: {
						Token: localStorage.getItem('Token')
					},
					// 允许上传时校验的文件类型
					accept: 'images',
					before: function() {
						//loading层
						var index = layer.load(1, {
							shade: [0.1, '#fff'] //0.1透明度的白色背景
						});
					},
					// 上传成功
					done: function(res) {
						console.log(res);
						layer.closeAll();
						if (res.code == 0) {
							layer.msg("上传成功", {
								time: 2000,
								icon: 6
							})
							var url = 'upload/' + res.file;
							jquery('#huiyitupian').val(url);
							jquery('#huiyitupianImg').attr('src', http.baseurl +url)
							vue.detail.huiyitupian = url;
						} else {
							layer.msg(res.msg, {
								time: 2000,
								icon: 5
							})
						}
					},
					//请求异常回调
					error: function() {
						layer.closeAll();
						layer.msg("请求接口异常", {
							time: 2000,
							icon: 5
						})
					}
				});
				laydate.render({
					elem: '#huiyishijian',
					type: 'datetime'
				});
                var edit = tinymce.render({
                    elem: "#huiyineirong",
                    height: 600,
                    images_upload_handler: function(blobInfo, succFun, failFun) {
                        var xhr, formData;
                        var file = blobInfo.blob(); //转化为易于理解的file对象
                        xhr = new XMLHttpRequest();
                        xhr.withCredentials = false;
                        xhr.open('POST', http.baseurl + 'file/upload');
                        xhr.setRequestHeader("Token", localStorage.getItem('Token')); //设置请求头
                        xhr.onload = function() {
                            var json;
                            if (xhr.status != 200) {
                                failFun('HTTP Error: ' + xhr.status);
                                return;
                            }
                            json = JSON.parse(xhr.responseText);
                            if (!json || typeof json.file != 'string') {
                                failFun('Invalid JSON: ' + xhr.responseText);
                                return;
                            }
                            succFun(http.baseurl + '/upload/' + json.file);
                        };
                        formData = new FormData();
                        formData.append('file', file, file.name); //此处与源文档不一样
                        xhr.send(formData);
                    }
                }, (opt) => {

                });
                var huiyiwenjianUpload = upload.render({
					//绑定元素
					elem: '#huiyiwenjianUpload',
					//上传接口
					url: http.baseurl + 'file/upload',
					// 请求头
					headers: {
						Token: localStorage.getItem('Token')
					},
					// 允许上传时校验的文件类型
					accept: 'file',
					before: function() {
						//loading层
						var index = layer.load(1, {
							shade: [0.1, '#fff'] //0.1透明度的白色背景
						});
					},
					// 上传成功
					done: function(res) {
						console.log(res);
						layer.closeAll();
						if (res.code == 0) {
							layer.msg("上传成功", {
								time: 2000,
								icon: 6
							})
							var url = 'upload/' + res.file;
							jquery('#huiyiwenjian').val(url);
                            vue.detail.huiyiwenjian = url;
						} else {
							layer.msg(res.msg, {
								time: 2000,
								icon: 5
							})
						}
					},
					//请求异常回调
					error: function() {
						layer.closeAll();
						layer.msg("请求接口异常", {
							time: 2000,
							icon: 5
						})
					}
				});
				http.request(`option/bumen/bumen`,'get',{},(res)=>{
					vue.huiyibumen = res.data
				});
				
                // session独取
				let table = localStorage.getItem("userTable");
				http.request(`${table}/session`, 'get', {}, function(data) {
					// 表单赋值
					//form.val("myForm", data.data);
					data = data.data
					for(var key in data){
					}
				});

                // 跨表计算
                if(http.getParam('corss')){
					var obj = JSON.parse(localStorage.getItem('crossObj'));
					//form.val("myForm", obj);
					for(var o in obj){
                                        if(o=='huiyimingcheng'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.huiyimingcheng = true;
                                                continue;
                                        }
                                        if(o=='huiyitupian'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.huiyitupian = true;
                                                continue;
                                        }
                                        if(o=='huiyishijian'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.huiyishijian = true;
                                                jquery('#huiyishijian').val(obj[o]);
                                                continue;
                                        }
                                        if(o=='huiyineirong'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.huiyineirong = true;
                                                continue;
                                        }
                                        if(o=='huiyiwenjian'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.huiyiwenjian = true;
                                                continue;
                                        }
                                        if(o=='huiyibumen'){
                                                vue.detail[o] = obj[o];
                                                vue.ro.huiyibumen = true;
                                                continue;
                                        }
					}
				}
				

				// 提交
				form.on('submit(*)', function(data) {
					data = data.field;
					
                    // 数据校验
                    if(!data.huiyimingcheng){
                        layer.msg('会议名称不能为空', {
							time: 2000,
							icon: 5
						});
                        return false
                    }
                    if(!data.huiyishijian){
                        layer.msg('会议时间不能为空', {
							time: 2000,
							icon: 5
						});
                        return false
                    }
					var huiyineirong = tinymce.get('#huiyineirong').getContent()
					data.huiyineirong = huiyineirong;

					// 跨表计算判断
					
                    // 比较大小

                //更新跨表属性
               var crossuserid;
               var crossrefid;
               var crossoptnum;
                if(http.getParam('corss')){
                        var statusColumnName = localStorage.getItem('statusColumnName');
                        var statusColumnValue = localStorage.getItem('statusColumnValue');
                        if(statusColumnName!='') {
                                var obj = JSON.parse(localStorage.getItem('crossObj'));
				if(!statusColumnName.startsWith("[")) {
					for (var o in obj){
						if(o==statusColumnName){
							obj[o] = statusColumnValue;
						}
					}
					var table = localStorage.getItem('crossTable');
					http.requestJson(`${table}/update`,'post',obj,(res)=>{});
				} else {
                                       crossuserid=Number(localStorage.getItem('userid'));
                                       crossrefid=obj['id'];
                                       crossoptnum=localStorage.getItem('statusColumnName');
                                       crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
				}
                        }
                }
                        if(crossrefid && crossuserid) {
                                data.crossuserid=crossuserid;
                                data.crossrefid=crossrefid;
                                http.request('huiyixinxi/list', 'get', {
                                        page: 1,
                                        limit: 10,
                                        crossuserid:crossuserid,
                                        crossrefid:crossrefid,
                                }, function(res) {
                                        if(res.data.total>=crossoptnum) {
                                                layer.msg(localStorage.getItem('tips'), {
                                                        time: 2000,
                                                        icon: 6
                                                })
                                             return false;
                                        } else {
                                            // 跨表计算



                                            // 提交数据
                                            http.requestJson('huiyixinxi' + '/add', 'post', data, function(res) {
                                                    layer.msg('提交成功', {
                                                            time: 2000,
                                                            icon: 6
                                                    }, function() {
                                                            back();
                                                    });
                                             });
                                        }
                                });
                        } else {
                                // 跨表计算

                                // 提交数据
                                http.requestJson('huiyixinxi' + '/add', 'post', data, function(res) {
                                        layer.msg('提交成功', {
                                                time: 2000,
                                                icon: 6
                                        }, function() {
                                                back();
                                        });
                                 });
                        }
			return false
			});
		});
		</script>
	</body>
</html>
