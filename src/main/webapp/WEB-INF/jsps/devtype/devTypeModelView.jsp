<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Title</title>
        <script type="text/javascript" src="js/three.js"></script>
    <script type="text/javascript" src="js/ColladaLoader.js"></script>
    <script src="js/OrbitControls.js"></script>
    <script src="js/stats.min.js"></script>
    <script src="js/dat.gui.min.js"></script>
    <style type="text/css">
        html, body {
            margin: 0;
            height: 100%;
        }
div.picture {
	width: 60%;
	height: 100%;
	border-right: 2px solid #eeeeee;
	z-index: 100;
}

div.info {
	height: 100%;
	top: 0;
	right: 0;
	overflow: hidden;
}

div.video {
	
}

div.infoList {
	width: 100%;
}

div.editBtn {
	width: 100%;
	height: 10%;
	position: absolute;
	top: 90%;
	left: 40%;
}

div.infoList div {
	width: 100%;
	margin: 10px 100px;
	height: 50px;
	/* border:1px solid black;*/
}

input[type="text"] {
	border-bottom: 1px solid #cccccc;
	border-top-width: 0;
	border-left-width: 0;
	border-right-width: 0;
	background:none;
	font-size: 17px;
	outline: none;
}

button {
	width: 70px;
	height: 40px;
	background: #3385ff;
	border: 0;
	color: #fff;
	font-weight: bold;
	letter-spacing: 2px;
	cursor: pointer;
}

button:hover {
	background: #317ef3;
}

button:active {
	background: #3075dc;
}
 

        canvas {

            display: block;

        }

 

    </style>

</head>

<body onload="draw();">
<div></div>
<div style="top:40px;left:50%;height:100%;width:600px;float:right;position:absolute">
	<div class="info">
<div class="infoList">
			<form flag="equipManager">
				<div>
					<label for="number">设备编号：</label><input id="number" type="text"
						name="number" value="${equip.number }">
				</div>
				<div>
					设备类型：<input type="text" name="name" value="${equip.name }">
				</div>
				<div>
					设备管理员：<input type="text" name="operator" value="${equip.operator }">
				</div>
				<div>
					设备管理员编号：<input type="text" name="operatorId"
						value="${equip.operatorId }">
				</div>
				<div>
					设备保修期：<input type="text" name="warrantyDate"
						value="${equip.warrantyDate}">
				</div>
				<div>
					设备供应商：<input type="text" name="vendor" value="${equip.vendor }">
				</div>
				<div>
					供应商联系人：<input type="text" name="vendorContactMan"
						value="${equip.vendorContactMan }">
				</div>
				<div>
					供应商联系方式：<input type="text" name="vendorContactTele"
						value="${equip.vendorContactTele }">
				</div>
				<div>
					设备说明：<p><textarea type="text" name="vendorContactTele2" style="height:100px;width:400px;background:none;">${equip.vendorContactTele2 }</textarea>
				</div>
			</form>
		</div>

</div>
</div>
 

</body>

   <script>

    var renderer;

    function initRender() {

        renderer = new THREE.WebGLRenderer({antialias:true});

        renderer.setSize(window.innerWidth, window.innerHeight);

        //告诉渲染器需要阴影效果

        renderer.setClearColor(0xffffff);

        document.body.appendChild(renderer.domElement);

    }

 

    var camera;

    function initCamera() {

        camera = new THREE.PerspectiveCamera(45, window.innerWidth/window.innerHeight, 0.1, 1000);

        camera.position.set(0, 40, 50);

        camera.lookAt(new THREE.Vector3(0,0,0));

    }

 

    var scene;

    function initScene() {

        scene = new THREE.Scene();

    }

 

    //初始化dat.GUI简化试验流程

    var gui;

    function initGui() {

        //声明一个保存需求修改的相关数据的对象

        gui = {

        };

        var datGui = new dat.GUI();

        //将设置属性添加到gui当中，gui.add(对象，属性，最小值，最大值）

    }

 

    var light;

    function initLight() {

        scene.add(new THREE.AmbientLight(0x444444));

 

        light = new THREE.PointLight(0xffffff);

        light.position.set(0,50,0);

 

        //告诉平行光需要开启阴影投射

        light.castShadow = true;

 

        scene.add(light);

    }

 

    function initModel() {

 

        //辅助工具

        var helper = new THREE.AxesHelper(50);

        scene.add(helper);

 

        var loader = new THREE.ColladaLoader();

 

        var mesh;

        loader.load("models/设备模型.dae", function (result) {

            mesh = result.scene.children[0].clone();
            mesh.scale.set(0.5, 0.5, 0.5);
           	scene.add(mesh);

        });

    }

 

    //初始化性能插件

    var stats;

    function initStats() {
        stats = new Stats();
        document.body.appendChild(stats.dom);
    }

 

    //用户交互插件 鼠标左键按住旋转，右键按住平移，滚轮缩放

    var controls;

    function initControls() {

 

        controls = new THREE.OrbitControls( camera, renderer.domElement );

 

        // 如果使用animate方法时，将此函数删除

        //controls.addEventListener( 'change', render );

        // 使动画循环使用时阻尼或自转 意思是否有惯性

        controls.enableDamping = true;

        //动态阻尼系数 就是鼠标拖拽旋转灵敏度

        controls.dampingFactor = 0.25;

        //是否可以缩放

        controls.enableZoom = true;

        //是否自动旋转

        controls.autoRotate = true;

        controls.autoRotateSpeed = 0.1;

        //设置相机距离原点的最远距离

        controls.minDistance  = 1;

        //设置相机距离原点的最远距离

        controls.maxDistance  = 200;

        //是否开启右键拖拽

        controls.enablePan = true;

    }

 

    function render() {

 

        renderer.render( scene, camera );

    }

 

    //窗口变动触发的函数

    function onWindowResize() {
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        render();
        renderer.setSize( window.innerWidth, window.innerHeight );
    }
    function animate() {

        //更新控制器
        render();
        //更新性能插件
        stats.update();

 

        controls.update();

 

        requestAnimationFrame(animate);

    }

 

    function draw() {

        initGui();

        initRender();

        initScene();

        initCamera();

        initLight();

        initModel();

        initControls();

        initStats();

        animate();

        window.onresize = onWindowResize;

    }
</script>
</html>
