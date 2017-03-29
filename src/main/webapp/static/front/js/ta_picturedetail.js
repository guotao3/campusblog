// JavaScript Document
window.onload= function () {
	var pl_r = document.getElementsByClassName('pl_r')[0];
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
                    '<p class="comment-text"><span class="user">我：</span>'+ textarea.value+'</p>'+
                    ' <p class="comment-time">'+
                         getTime()+
                      '<a href="javascript:;" class="comment-operate">删除</a>'+
                      ' </p>'+
                    '</div>';
				li.innerHTML=html;
				list.appendChild(li);
				textarea.value='';
				textarea.onblur();
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
				var textarea=pl_r.getElementsByTagName('textarea')[0];
				var user=commentBox.getElementsByClassName('user')[0];
				var txt=el.innerHTML;
				if(txt=='回复'){
						textarea.onfocus();
						textarea.value='回复'+user.innerHTML;
						textarea.onkeyup();
					}
				else{
						removeNode(commentBox);
					}
				}
			//赞
			function praise(el){
				var title=el.getAttribute('title');
					if(title=='赞'){
						var oldtotal=parseInt(el.getAttribute('total'));
						var newtotal;
						newtotal=oldtotal+1;
						el.innerHTML='<img src="../img/536647.png" />'+newtotal+'人觉得很赞';
						el.setAttribute('title','取消赞');
						el.setAttribute('total',newtotal);
					}
					else
					{
						var oldtotal=parseInt(el.getAttribute('total'));
						var newtotal;
						newtotal=oldtotal-1;
						el.innerHTML='<img src="../img/点赞.png" />'+newtotal+'人觉得很赞';
						el.setAttribute('title','赞');
						el.setAttribute('total',newtotal);
						}
				}
                // 在li上绑定事件代理
                pl_r.onclick = function (e) {
					
                    e = e || window.event;
                    var el = e.srcElement;
                    switch (el.className) {
                        case 'close':
                        	removeNode(el.parentNode);
                        break;
						case 'btn':
							replayBox(el.parentNode.parentNode);
						break;
						case 'comment-operate':
							operateReply(el);
						break;
						case 'praise':
							praise(el);
						break;
					}
				}
	
	
	//绑定输入框事件
                var textarea=document.getElementsByTagName('textarea')[0];
                textarea.onfocus=function(){
						this.parentNode.className='text-box text-box-on';
						this.value=this.value == '评论…' ? '' : this.value;
						this.onkeyup();
					}
				textarea.onblur=function(){
					var p=this.parentNode;
					var btn=p.children[2];
					var me=this;
					if(this.value=='')
					{
						timer=setTimeout(function(){
							me.parentNode.className='text-box';
							btn.className='btn';
						me.value = '评论…';
							},400)
						
						}
					}	
       			textarea.onkeyup=function(){
						var len=this.value.length;
						var p=this.parentNode;
						var btn=p.children[2];
						var word=p.children[3];
						if(len==0 || len>140){
								btn.className='btn btn-off';	
							}
						else{
								btn.className='btn';
							}
							word.innerHTML=len + '/140';
					}
	
	}