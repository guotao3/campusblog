// JavaScript Document
window.onload=function(){
	var care=document.getElementById('care');
	care.onclick=function(){
		
		var title=care.getAttribute('title');
			if(title=='关注'){
				this.setAttribute('src','/static/front/img/care1.png');
				this.setAttribute('title','取消关注');
			}
			else{

					this.setAttribute('src','/static/front/img/care2.png');
					this.setAttribute('title','关注');
				}

		}
		//计算阅读数
		var content=document.getElementById('content');
		var read=document.getElementById('read');
		content.innerHTML=content.innerHTML.replace(/\n/g,"<br />");
		read.onclick = function () {
               var title=read.getAttribute('title');
			   if(title=='展开')
			   {

				   var yd=document.getElementById('yd');
					var oldnumber=parseInt(yd.getAttribute('total'));
					var newnumber;
					newnumber=oldnumber+1;
					yd.innerHTML='阅读('+newnumber+')';
					yd.setAttribute('total', newnumber);
				   }
            }
		//赞
		var praise=document.getElementById('praise');
		praise.onclick=function(){
			var title=praise.getAttribute('title');
			if(title=='赞')
			{
				this.setAttribute('title','取消赞');
				this.innerHTML='<img src="/static/front/img/536647.png" />'+'取消赞';

			}
			else
			{
				this.setAttribute('title','赞');
				this.innerHTML='<img src="/static/front/img/点赞.png" />'+'点赞';
				}
			}
	}