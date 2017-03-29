// JavaScript Document
window.onload=function(){
	var care=document.getElementById('care');
	care.onclick=function(){
		
		var title=care.getAttribute('title');
			if(title=='关注'){
				this.setAttribute('src','../img/care1.png');
				this.setAttribute('title','取消关注');
			}
			else{
					
					this.setAttribute('src','../img/care2.png');
					this.setAttribute('title','关注');
				}

		}
	
}