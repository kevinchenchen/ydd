function getEventObject(W3CEvent) {//事件标准化函数
	return W3CEvent || window.event;
}
function getPointerPosition(e) {//兼容浏览器的鼠标x,y获得函数
	e = e || getEventObject(e);
	var x = e.pageX || (e.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));
	var y = e.pageY || (e.clientY + (document.documentElement.scrollTop || document.body.scrollTop));
	return { 'x':x,'y':y };
}
function setOpacity(elem,level) {//兼容浏览器设置透明值
	if(elem.filters) {
		elem.style.filter = 'alpha(opacity=' + level * 100 + ')';
	} else {
		elem.style.opacity = level;
	}
}
function css(elem,prop) {	//css设置函数,可以方便设置css值,并且兼容设置透明值
	for(var i in prop) {
		if(i == 'opacity') {
			setOpacity(elem,prop[i]);
		} else {
			elem.style[i] = prop[i];
		}
	}
	return elem;
}
var magnifier = {
	m : null,
	init:function(magni){
		var m = this.m = magni || {
			cont : null,	//装载原始图像的div
			imgSrc : null,	//原图
			Browser : null,	//浏览框
			img : null,	//放大的图像
			mag : null,	//放大框
			scale : 15	//比例值,设置的值越大放大越大,但是这里有个问题就是如果不可以整除时,会产生些很小的白边,目前不知道如何解决
		}
		//放大图样式
		css(m.img,{	
			'position' : 'absolute',
			'width' : (m.cont.clientWidth * m.scale) + 'px',				//原始图像的宽*比例值	
			'height' : (m.cont.clientHeight * m.scale) + 'px'				//原始图像的高*比例值
		})
		//放大框样式
		css(m.mag,{
			'display' : 'none',
			'width' : m.cont.clientWidth + 'px',	//m.cont为原始图像,与原始图像等宽
			'height' : m.cont.clientHeight + 'px',
			'position' : 'absolute',
			'left' : m.cont.offsetLeft + m.cont.offsetWidth + 10 + 'px',	//放大框的位置为原始图像的右方远10px
			'top' : m.cont.offsetTop + 'px'
		})
		//操控选择区样式
		var borderWid = m.Browser.offsetWidth - m.Browser.clientWidth;		//获取border的宽
		//浏览框样式
		css(m.Browser,{
			'display' : 'none',								//开始设置为不可见
			'width' : m.cont.clientWidth / m.scale - borderWid + 'px',			//原始图片的宽/比例值 - border的宽度
			'height' : m.cont.clientHeight / m.scale - borderWid + 'px',//原始图片的高/比例值 - border的宽度
			'opacity' : 0.5//设置透明度
		})
		m.img.src = m.imgSrc.src;//让原始图像的src值给予放大图像
		m.cont.onmouseover = magnifier.start;
	},
	start:function(e){
		if(document.all){//只在IE下执行,主要避免IE6的select无法覆盖
			magnifier.createIframe(magnifier.m.img);
		}
		this.onmousemove = magnifier.move;//this指向m.cont
		this.onmouseout = magnifier.end;
	},
	move:function(e){
		var pos = getPointerPosition(e);		//事件标准化
		magnifier.m.Browser.style.display = '';
		//放大镜操控区域定位
		css(magnifier.m.Browser,{
			'top' : Math.min( Math.max((pos.y - magnifier.m.Browser.offsetHeight/2),magnifier.m.cont.offsetTop),(magnifier.m.cont.offsetTop + magnifier.m.cont.offsetHeight - magnifier.m.Browser.offsetHeight) ) +'px',	
			//最大:盒子的offsetTop + 盒子的高 - 浏览框的高
			//最小:盒子的offsetTop
			//常态:鼠标Y位置 - 1/2的浏览框高
			'left' : Math.min( Math.max((pos.x - magnifier.m.Browser.offsetWidth/2),magnifier.m.cont.offsetLeft),(magnifier.m.cont.offsetLeft + magnifier.m.cont.offsetWidth - magnifier.m.Browser.offsetWidth) ) +'px'
			//最大:盒子的offsetLeft + 盒子的宽 - 浏览框的宽
			//最小:盒子的offsetLeft
			//常态:鼠标X位置 - 1/2的浏览框宽
		})
		magnifier.m.mag.style.display = '';
		//放大效果图片定位
		css(magnifier.m.img,{
			'top' : - ((parseInt(magnifier.m.Browser.style.top) - magnifier.m.cont.offsetTop) * magnifier.m.scale) + 'px',
			'left' : - ((parseInt(magnifier.m.Browser.style.left) - magnifier.m.cont.offsetLeft) * magnifier.m.scale) + 'px'
		})
	},
	end:function(e){
		magnifier.m.Browser.style.display = 'none';
		magnifier.removeIframe(magnifier.m.img);		//销毁iframe
		magnifier.m.mag.style.display = 'none';
	},
	createIframe:function(elem){
		var layer = document.createElement('iframe');
		layer.tabIndex = '-1';
		layer.src = 'javascript:false;';
		elem.parentNode.appendChild(layer);
		layer.style.width = elem.offsetWidth + 'px';
		layer.style.height = elem.offsetHeight + 'px';
	},
	removeIframe:function(elem){
		var layers = elem.parentNode.getElementsByTagName('iframe');
		while(layers.length >0){
			layers[0].parentNode.removeChild(layers[0]);
		}
	}
}
window.onload = function(){
	magnifier.init({
		cont : document.getElementById('magnifier'),
		imgSrc : document.getElementById('imgSrc'),
		Browser : document.getElementById('Browser'),
		img : document.getElementById('magnifierImg'),
		mag : document.getElementById('mag'),
		scale : 3
	});
}
$(document).ready(function(){
	$("#img-list a.imgCtrl").each(function(){
		$(this).hover(function(){
			$(this).addClass("on");
			$(this).siblings().removeClass("on");
			$("#imgSrc").attr("src",$(this).find("img").attr("src"));
			magnifier.init({
				cont : document.getElementById('magnifier'),
				imgSrc : document.getElementById('imgSrc'),
				Browser : document.getElementById('Browser'),
				img : document.getElementById('magnifierImg'),
				mag : document.getElementById('mag'),
				scale : 3
			});
		});
	});
});