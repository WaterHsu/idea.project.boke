/* *
  * 基于固定宽度的浮动定位的瀑布流
  * 实现简单，其实就是一个滚动加载数据而已
  * 缺点布局不随宽度的变化而改变，如果有图片特别长的时候，最高的列与最低的列有可能差距大，空白大
  * by VVG http://www.cnblogs.com/NNUF/
  */
var WaterFull = {
    $:function(id){return document.getElementById(id);},
    // 每次滚动需要加载的数据，可以用ajax替代读取，每次分批加载
    data:[{name:'xx',kind:'xx',writer:'xx',image:'xx',abstract_2:'xx',date:'xx',number:'xx'},
          {name:'xx',kind:'xx',writer:'xx',image:'xx',abstract_2:'xx',date:'xx',number:'xx'},
          {name:'xx',kind:'xx',writer:'xx',image:'xx',abstract_2:'xx',date:'xx',number:'xx'}
          ],
     data2:[{id:'1'}],
    createChild:function(name,kind,writer,image,abst, date, number){
     //   var str = '<a href="' + link + '"><img src="/test_pubu/' + imagesUrl + '"height="300" width="700"></a>' + '<p class="title">' + title + '</p>';
      //  var str ='<div style="width:700;height:240;font-size:12pt;"><a href="">' +name+ '</a><br><img src="' +image+ '" height="160" width="240" />' +abst+ 'xxxxxx</div>';
    	var str = '<div class="water_2" style="width:700;height:250;font-size:12pt;"><div style="height:60;text-align:center;border-bottom:1px solid #ccc;margin-bottom:5px;"><a id="'
    		+number+'" href="javascript:void(0)" onclick="getContext(this.id)" style="font-size:15pt;">' 
    		+name+ '</a><br><span>作者：'
    		+writer+'</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>发表时间:'
    		+date+'</span></div><div style="height:200;"><div style="width:250;float:left;"><img src="' 
    		+image+ '" height="180" width="240" /></div><div style="width:450;float:right;">'
    		+abst+'</div></div></div>';
    	var div = document.createElement('div');
        div.className = 'water';
        div.innerHTML = str; 
        return div;
    },
    
    loadXMLDoc:function(data2, data)
    {
    //	alert("okkk");
    	var str = "1";
    	var xmlhttp;
    	if(window.XMLHttpRequest)
    		{
    			xmlhttp=new XMLHttpRequest();
    		}
    	else
    		{
    			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    		}
    	
    	xmlhttp.onreadystatechange=function()
    	{
    		//alert("okk");
    		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    			{
    				xmlDoc=xmlhttp.responseXML;
    			//	alert("ttt");
    				var k = 0;
    			//	alert(xmlDoc.getElementsByTagName("name").length);
    				for(k=0; k < 3 && k < xmlDoc.getElementsByTagName("name").length;k++)
    					{
    						data[k].number =xmlDoc.getElementsByTagName("number")[k].childNodes[0].nodeValue;
    						data[k].name =xmlDoc.getElementsByTagName("name")[k].childNodes[0].nodeValue;
    						data[k].kind =xmlDoc.getElementsByTagName("kind")[k].childNodes[0].nodeValue;
    						data[k].writer =xmlDoc.getElementsByTagName("writer")[k].childNodes[0].nodeValue;
    						data[k].image = xmlDoc.getElementsByTagName("image")[k].childNodes[0].nodeValue;
    						data[k].abstract_2 =xmlDoc.getElementsByTagName("abstract")[k].childNodes[0].nodeValue;
    						data[k].date =xmlDoc.getElementsByTagName("date")[k].childNodes[0].nodeValue;
    						data2.id = xmlDoc.getElementsByTagName("id")[k].childNodes[0].nodeValue;
    						//data[k].title = xmlDoc.getElementsByTagName("name")[k].childNodes[0].nodeValue;
    					/*	strr = strr.replace(/&lt;/g, "<");
    						strr = strr.replace(/&gt;/g, ">");
    						strr = strr.replace(/&amp;/g, "&");*/
    						
    					//	data[k].abstrace_2 = strr;
    					//	alert(data2.id + " _" + k);
    						//alert(k + data[k].imgUrl);
    						//alert(WaterFull.mark + 1);
    						
    					}
    				//WaterFull.mark[0].ajaxmark = '1';
    				var j = 0;
    				var m, div;
    				var rows = WaterFull.getRowByHeight();
    				//alert(data[0].imgUrl);
    				
    			/*	for(var m2 = 0; m2 < k; m2++)
    				{
    					div = WaterFull.createChild(data[m2].name, data[m2].kind, data[m2].writer, data[m2].image, data[m2].abstract_2, data[m2].date);
						rows[0].appendChild(div);
    				}*/
    				
    			for(;data[j] && j < xmlDoc.getElementsByTagName("name").length ;j++)
    					{
    						//alert(data[j].imgUrl);
    					 	div = WaterFull.createChild(data[j].name, data[j].kind, data[j].writer, data[j].image, data[j].abstract_2, data[j].date, data[j].number);
    			            // 因为是4列，所以数据以4列一个轮回加载
    			          //  m = ((j+1)>4)?j%4:j;          //i+1 > 4   就取 i %4  如果 不是  就取i    
    						// 在列上添加数据
    						rows[0].appendChild(div);
    					}
    			}
    	}
    	//alert(data2.id);
    	if(data2.id == undefined)
    		{
    			data2.id = 0;
    		}
    	//alert(data2.id);
    	var url ="ajax/ajax.jsp?id=" + data2.id;
    	xmlhttp.open("GET",url,true);
		xmlhttp.send();
		
		//alert("555");
    },
    
    //绑定事件
    on:function(element, type, func) {
        if (element.addEventListener) {
            element.addEventListener(type, func, false); //false 表示冒泡
        } else if (element.attachEvent) {
            element.attachEvent('on' + type, func);
        } else {
            element['on' + type] = func;
        }
    },
    //获取列高度，返回数组，从小到大排序
    getRowByHeight:function(){
        var row = [this.$('row1')];
        var height = [];
        for(var i = 0;row[i];i++){
            row[i].height = row[i].offsetHeight;
            height.push(row[i]);
        }
        // 对高度进行排序，低--》高,保证最矮的优先加载
     /*   height.sort(function(a,b){
            return a.height - b.height;
        });*/
        return height;
    },
    //获取页面总高度（总高度 = 卷去高度 + 可视区域高度）
    getPageHeight:function(){
        return document.documentElement.scrollHeight || document.body.scrollHeight ;
    },
    // 获取页面卷去的高度
    getScrollTop:function(){
        return document.documentElement.scrollTop || document.body.scrollTop;
    },
    // 获取页面可视区域宽度
    getClientHeigth:function(){
        return document.documentElement.clientHeight || document.body.clientHeight;
    },
    append:function(){
        var i = 0,rows = this.getRowByHeight(),div,k;
        
      
        this.loadXMLDoc(this.data2, this.data);
        
        
     /*   for(;this.data[i];i++){
            div = this.createChild(this.data[i].link, this.data[i].imgUrl,this.data[i].title);
            // 因为是4列，所以数据以4列一个轮回加载
            k = ((i+1)>4)?i%4:i;          //i+1 > 4   就取 i %4  如果 不是  就取i    
			// 在列上添加数据
			rows[k].appendChild(div);
        }*/
    },
	onScroll:function(){
        // 获取高度等数据
        var height = WaterFull.getPageHeight();
        var scrollTop = WaterFull.getScrollTop();
        var clientHeight = WaterFull.getClientHeigth();
        // 如果滚动到最底部，就加载
        if(scrollTop + clientHeight > height - 50){
            WaterFull.append();
        }
    },
    timer:null
};
WaterFull.on(window, 'scroll',function(){
    clearTimeout( WaterFull.timer ); //清除上一次，性能优化
    WaterFull.timer = setTimeout(WaterFull.onScroll,500);
});


function firstload()
{
	
	WaterFull.append();
	
}


function getContext(number)
{
	loadXMLDoc2(number);
	
//	document.getElementById('context').style.display = 'block';
	//document.getElementById('warpbg').style.display = 'block';
}

function loadXMLDoc2(number)
{
	var xmlhttp;
	var x,i,str;
	
	
	if(window.XMLHttpRequest)
		{
			xmlhttp=new XMLHttpRequest();
		}
	else
		{
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
	
	
	xmlhttp.onreadystatechange=function()
	{
	//	alert(number);
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				xmlDoc=xmlhttp.responseXML;
				x = xmlDoc.getElementsByTagName("context");
				
			//	alert( x[0].childNodes[0].nodeValue);
	
						str = x[0].childNodes[0].nodeValue;
						
						str = str.replace(/&lt;/g, "<");
						str = str.replace(/&gt;/g, ">");
						str = str.replace(/&amp;/g, "&");
						
				var title = xmlDoc.getElementsByTagName("title")[0].childNodes[0].nodeValue;
				var author = xmlDoc.getElementsByTagName("author")[0].childNodes[0].nodeValue;
				var date = xmlDoc.getElementsByTagName("date")[0].childNodes[0].nodeValue;
				
				var str2 = '<h2>'+title+'</h2><span>作者：'+author+'</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>时间:'+date+'</span>';
				
				document.getElementById('context-body-up').innerHTML = str2;		
				document.getElementById('context-body-down').innerHTML = str;
			
				
				
				opendiv('context', 'warpbg', 'xxx');
			}
	}
	
	var url ="ajax/ajax_context.jsp?id=" + number;
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	
	
	
}


function opendiv(div1, div2, div3)
{
	document.getElementById(div1).style.display = 'block';
	document.getElementById(div2).style.display = 'block';
	document.getElementById(div3).style.overflow = 'hidden';
}




function closediv(div1, div2, div3)
{
	document.getElementById(div1).style.display = 'none';
	document.getElementById(div2).style.display = 'none';
	document.getElementById(div3).style.overflow = 'auto';
}
