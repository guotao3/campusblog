// JavaScript Document
window.onload=function(){
	var list=document.getElementById('list');
	var lis=list.children;
	function careBox(box,el){
		var care=box.getElementsByClassName('care');
		var title=el.getAttribute('title');
		if(title=='关注'){
			el.setAttribute('src','../img/care1.png');
			el.setAttribute('title','取消关注');
			}
			else{
					
					el.setAttribute('src','../img/care2.png');
					el.setAttribute('title','关注');
				}
		}
	for (var i = 0; i < lis.length; i++) {

                // 在li上绑定事件代理
                lis[i].onclick = function (e) {
                    e = e || window.event;
                    var el = e.srcElement;
                    switch (el.className) {
                        case 'care':
						careBox(el.parentNode.parentNode.parentNode.parentNode.parentNode,el);
                        break;
					}
				}
	}
		 
	
}