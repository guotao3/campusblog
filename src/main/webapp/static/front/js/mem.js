// JavaScript Document
window.onload= function () {
	var inner = document.getElementsByClassName('inner')[0];
	function add(el){
		var text_box=document.getElementsByClassName('text-box')[0];;
		text_box.style.display='block';
		}
	// 定义删除节点函数removeNode
            function removeNode(node) {
				
                node.parentNode.removeChild(node);
            }
	//发表评论
			function replayBox(box){
				var textarea=box.getElementsByTagName('textarea')[0];
				var list=box.getElementsByClassName('comment-list')[0];	
				var li=document.createElement('li');
				li.className='comment-box clearfix';
				li.setAttribute('user','self');
				var html=' <div class="comment-content">'+
                    '<p class="comment-text">'+ textarea.value+'</p>'+
                    ' <p class="comment-time">'+
                         getTime()+
                      '<a href="javascript:;" >'+'<img src="../img/567973.png" class="comment-operate"/>'+'</a>'+
                      ' </p>'+
                    '</div>';
				li.innerHTML=html;
				list.appendChild(li);
				textarea.value='';
				textarea.onblur();
				var text_box=document.getElementsByClassName('text-box')[0];;
				text_box.style.display='none';
			}
			//日期
			function getTime(){
				var t=new Date();
				var y=t.getFullYear();
				var m=t.getMonth()+1;
				var d=t.getDate();
				var h=t.getHours();
				var mi=t.getMinutes();
				m=m<10? '0'+m:m;
				d=d<10? '0'+d:d;
				h=h<10? '0'+h:h;
				mi=mi<10? '0'+mi:mi;
				return y+'-'+m+'-'+d+' '+h+':'+mi;
				}
					//操作回复
			function operateReply(el){
				var commentBox=el.parentNode.parentNode.parentNode;//评论容器
				
						removeNode(commentBox);

				}
	 inner.onclick = function (e) {
					
                    e = e || window.event;
                    var el = e.srcElement;
					console.log(el.className);
                    switch (el.className) {
                        case 'close':
							removeNode(el.parentNode);
                         break;
						case 'btn':
						replayBox(el.parentNode.parentNode);
						break;
						case 'comment-operate':
						operateReply(el.parentNode);
						break;
						case 'add':
							add(el);
						break;
					}
	 }
	
	 //绑定输入框事件
                var textarea=document.getElementsByTagName('textarea')[0];
                textarea.onfocus=function(){
						this.parentNode.className='text-box text-box-on';
						this.value=this.value == '笔记…' ? '' : this.value;
						this.onkeyup();
					}
				textarea.onblur=function(){
					var me=this;
					var p=this.parentNode;
					var btn=p.children[1];
					if(this.value=='')
					{
						timer=setTimeout(function(){
							me.parentNode.className='text-box';
						me.value = '笔记…';
						btn.className='btn';
							},400)
						
						}
					}	
       			textarea.onkeyup=function(){
						var len=this.value.length;
						var p=this.parentNode;
						var btn=p.children[1];
						var word=p.children[2];
						if(len==0 || len>140){
								btn.className='btn btn-off';	
							}
						else{
								btn.className='btn';
							}
							word.innerHTML=len + '/140';
					}
	}