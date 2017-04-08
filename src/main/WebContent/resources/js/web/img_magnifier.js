function getEventObject(W3CEvent) {//�¼���׼������
	return W3CEvent || window.event;
}
function getPointerPosition(e) {//��������������x,y��ú���
	e = e || getEventObject(e);
	var x = e.pageX || (e.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));
	var y = e.pageY || (e.clientY + (document.documentElement.scrollTop || document.body.scrollTop));
	return { 'x':x,'y':y };
}
function setOpacity(elem,level) {//�������������͸��ֵ
	if(elem.filters) {
		elem.style.filter = 'alpha(opacity=' + level * 100 + ')';
	} else {
		elem.style.opacity = level;
	}
}
function css(elem,prop) {	//css���ú���,���Է�������cssֵ,���Ҽ�������͸��ֵ
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
			cont : null,	//װ��ԭʼͼ���div
			imgSrc : null,	//ԭͼ
			Browser : null,	//�����
			img : null,	//�Ŵ��ͼ��
			mag : null,	//�Ŵ��
			scale : 15	//����ֵ,���õ�ֵԽ��Ŵ�Խ��,���������и���������������������ʱ,�����Щ��С�İױ�,Ŀǰ��֪����ν��
		}
		//�Ŵ�ͼ��ʽ
		css(m.img,{	
			'position' : 'absolute',
			'width' : (m.cont.clientWidth * m.scale) + 'px',				//ԭʼͼ��Ŀ�*����ֵ	
			'height' : (m.cont.clientHeight * m.scale) + 'px'				//ԭʼͼ��ĸ�*����ֵ
		})
		//�Ŵ����ʽ
		css(m.mag,{
			'display' : 'none',
			'width' : m.cont.clientWidth + 'px',	//m.contΪԭʼͼ��,��ԭʼͼ��ȿ�
			'height' : m.cont.clientHeight + 'px',
			'position' : 'absolute',
			'left' : m.cont.offsetLeft + m.cont.offsetWidth + 10 + 'px',	//�Ŵ���λ��Ϊԭʼͼ����ҷ�Զ10px
			'top' : m.cont.offsetTop + 'px'
		})
		//�ٿ�ѡ������ʽ
		var borderWid = m.Browser.offsetWidth - m.Browser.clientWidth;		//��ȡborder�Ŀ�
		//�������ʽ
		css(m.Browser,{
			'display' : 'none',								//��ʼ����Ϊ���ɼ�
			'width' : m.cont.clientWidth / m.scale - borderWid + 'px',			//ԭʼͼƬ�Ŀ�/����ֵ - border�Ŀ��
			'height' : m.cont.clientHeight / m.scale - borderWid + 'px',//ԭʼͼƬ�ĸ�/����ֵ - border�Ŀ��
			'opacity' : 0.5//����͸����
		})
		m.img.src = m.imgSrc.src;//��ԭʼͼ���srcֵ����Ŵ�ͼ��
		m.cont.onmouseover = magnifier.start;
	},
	start:function(e){
		if(document.all){//ֻ��IE��ִ��,��Ҫ����IE6��select�޷�����
			magnifier.createIframe(magnifier.m.img);
		}
		this.onmousemove = magnifier.move;//thisָ��m.cont
		this.onmouseout = magnifier.end;
	},
	move:function(e){
		var pos = getPointerPosition(e);		//�¼���׼��
		magnifier.m.Browser.style.display = '';
		//�Ŵ󾵲ٿ�����λ
		css(magnifier.m.Browser,{
			'top' : Math.min( Math.max((pos.y - magnifier.m.Browser.offsetHeight/2),magnifier.m.cont.offsetTop),(magnifier.m.cont.offsetTop + magnifier.m.cont.offsetHeight - magnifier.m.Browser.offsetHeight) ) +'px',	
			//���:���ӵ�offsetTop + ���ӵĸ� - �����ĸ�
			//��С:���ӵ�offsetTop
			//��̬:���Yλ�� - 1/2��������
			'left' : Math.min( Math.max((pos.x - magnifier.m.Browser.offsetWidth/2),magnifier.m.cont.offsetLeft),(magnifier.m.cont.offsetLeft + magnifier.m.cont.offsetWidth - magnifier.m.Browser.offsetWidth) ) +'px'
			//���:���ӵ�offsetLeft + ���ӵĿ� - �����Ŀ�
			//��С:���ӵ�offsetLeft
			//��̬:���Xλ�� - 1/2��������
		})
		magnifier.m.mag.style.display = '';
		//�Ŵ�Ч��ͼƬ��λ
		css(magnifier.m.img,{
			'top' : - ((parseInt(magnifier.m.Browser.style.top) - magnifier.m.cont.offsetTop) * magnifier.m.scale) + 'px',
			'left' : - ((parseInt(magnifier.m.Browser.style.left) - magnifier.m.cont.offsetLeft) * magnifier.m.scale) + 'px'
		})
	},
	end:function(e){
		magnifier.m.Browser.style.display = 'none';
		magnifier.removeIframe(magnifier.m.img);		//����iframe
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