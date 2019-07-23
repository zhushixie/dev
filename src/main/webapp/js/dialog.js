
g('callout').ondblclick = function(){
    g('dialog').style.display = 'block';
     g('mask').style.display= 'block';
     autoCenter(g('dialog'));
};
//窗口大小改变时，对话框始终居中
window.onresize = function(){
    autoCenter(g('dialog'));
};
//点击关闭对话框
g('submit').onclick = function(){
    g('dialog').style.display = 'none';
     g('mask').style.display = 'none';
};
g('btnCancel').onclick = function(){
    g('dialog').style.display = 'none';
     g('mask').style.display = 'none';
};
//鼠标按下
g('move_part').addEventListener('mousedown',function(e){
    var e = e || window.event;
    mx = e.pageX;      //点击时鼠标X坐标
      my = e.pageY;      //点击时鼠标Y坐标
      dx = g('dialog').offsetLeft;
    dy = g('dialog').offsetTop;
    isDraging = true;      //标记对话框可拖动
});
//鼠标离开
g('move_part').addEventListener('mouseup',function(){
    isDraging = false;
});
//禁止选中对话框内容
if(document.attachEvent) {//ie的事件监听，拖拽div时禁止选中内容，firefox与chrome已在css中设置过-moz-user-select: none; -webkit-user-select: none;
    g('dialog').attachEvent('onselectstart', function() {
      return false;
    });
}
document.onmousemove = function(e){
    var e = e || window.event;
    var x = e.pageX;      //移动时鼠标X坐标
      var y = e.pageY;      //移动时鼠标Y坐标
      if(isDraging){        //判断对话框能否拖动
        var moveX = dx + x - mx;      //移动后对话框新的left值
        var moveY = dy + y - my;      //移动后对话框新的top值
        g('dialog').style.left = moveX +'px';       //重新设置对话框的left
      g('dialog').style.top =  moveY +'px';     //重新设置对话框的top

    };
};