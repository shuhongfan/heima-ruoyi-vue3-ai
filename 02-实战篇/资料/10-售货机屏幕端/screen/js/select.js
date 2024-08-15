(function($,window,document,undefined){ //用一个自调用匿名函数把插架代码包裹起来，防止代码污染
    $.fn.mySelect = function (options) {
        var defaults = {          //defaults 使我们设置的默认参数。
            Event : "click",      //触发响应事件
            msg : "Holle word!"   //显示内容
        };
        var options = $.extend(defaults, options);    //将传入参数和默认参数合并
        console.log(options) 
        var $this = $(this);      //当然响应事件对象
        // $this.live(options.Event, function (e) {   //功能代码部分，绑定事件
        //     alert(options.msg);
        // });
       //生成option-item并追加展示
        var html = '';
 		html += '<div class="select-picker-search">';
 		html += '<div class="select-picker-search-checked">本月</div>';
 		html += '</div>';
 		html += '<div class="select-picker-options-wrp">';
 		html += '<div class="select-picker-options-serch">';
 		html += '<input type="text" placeholder="">';
 		html += '</div>';
 		html += '<div class="select-picker-options-list">';
 		$this.find("option").each(function(){ 
 			let _this = $(this);
 			html += '<div class="select-picker-options-list-item">';
 			html += '<b class="duihao duihao-nocheck"></b>';
 			html += '<span>'+_this.text()+'</span>';
 			html += '</div>';
 		})
 		html += '</div>';
 		html += '</div>'; 
	 	$this.append(html);
	 	// 下拉显示隐藏
	 	$this.on('click',".select-picker-search", function (e) {   //功能代码部分，绑定事件
		
		
	
		
		

        }); 
  
    }
    // 点击document任意地方 下拉消失
})(jQuery,window,document); 

  
 
 		