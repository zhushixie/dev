<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>模型展示</title>
    <script>
    var scene, camera,renderer, rouletteScene;
    function startGame(){
        console.log('Game started...');
        scene = new THREE.Scene();
        aspect = window.innerWidth/window.innerHeight;
        D = 8;
        camera = new THREE.OrthographicCamera(-D*aspect, D*aspect, D, -D, 1, 1000);
        //camera = new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight,0.1,200)
        renderer = new THREE.WebGLRenderer();
        renderer.setSize(window.innerWidth, window.innerHeight);
        document.body.appendChild(renderer.domElement);
        var spotLight = new THREE.SpotLight( 0xffffff );
        spotLight.position.set( 100, 1000, 100 );

        spotLight.castShadow = true;

        spotLight.shadow.mapSize.width = 1024;
        spotLight.shadow.mapSize.height = 1024;

        spotLight.shadow.camera.near = 500;
        spotLight.shadow.camera.far = 4000;
        spotLight.shadow.camera.fov = 30;

        scene.add( spotLight );
        var light = new THREE.DirectionalLight( 0x5f5f5f, 2 );
        light.position.set( 100, 20, 15 );
        scene.add( light );

        camera.position.set(100,100,100);
        camera.lookAt(new THREE.Vector3(0,0,0));
        camera.rotation.z = 5/6*Math.PI;

        var loader = new THREE.ColladaLoader();
        loader.load("res/aaa.dae", function( collada ){
            rouletteScene = collada.scene;
            rouletteScene.scale.set(2,2,2);
           rouletteScene.position.set(0,0,5);
            scene.add(rouletteScene);
        },
        function( xhr) {
            console.log((xhr.loaded/xhr.total * 100)+"% loaded");
        });

        render();
        initControls();
        initStats();
        //animate();
       // initGui();
       // window.onresize = onWindowResize;
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
    //初始化dat.GUI简化试验流程
    var gui;
    function initGui() {
        //声明一个保存需求修改的相关数据的对象
        gui = {
        };
        var datGui = new dat.GUI();
        //将设置属性添加到gui当中，gui.add(对象，属性，最小值，最大值）
    }
    var stats;
    function initStats() {
        stats = new Stats();
        document.body.appendChild(stats.dom);
    }

    var controls;
    function initControls() {

        controls = new THREE.OrbitControls( camera, renderer.domElement );

        // 如果使用animate方法时，将此函数删除
        //controls.addEventListener( 'change', render );
        // 使动画循环使用时阻尼或自转 意思是否有惯性
        controls.enableDamping = true;
        //动态阻尼系数 就是鼠标拖拽旋转灵敏度
        //controls.dampingFactor = 0.25;
        //是否可以缩放
        controls.enableZoom = true;
        //是否自动旋转
        controls.autoRotate = true;
        controls.autoRotateSpeed = 0.5;
        //设置相机距离原点的最远距离
        controls.minDistance  = 1;
        //设置相机距离原点的最远距离
        controls.maxDistance  = 200;
        //是否开启右键拖拽
        controls.enablePan = true;
    }

    function render(){
        requestAnimationFrame(render);
        renderer.render(scene, camera);
        if( rouletteScene ){
           rouletteScene.rotation.z=rouletteScene.rotation.z+0.001;
        }
    }
    </script>
    <style type="text/css">
        body {
            margin: 0;
        }
        canvas { width: 100%; height: 100% }
    </style>
    <script type="text/javascript" src="js/three.js"></script>
    <script type="text/javascript" src="js/ColladaLoader.js"></script>
    <script src="js/OrbitControls.js"></script>
    <script src="js/stats.min.js"></script>
    <script src="js/dat.gui.min.js"></script>
    
</head>
<body onload="startGame();">
</body>
</html>
