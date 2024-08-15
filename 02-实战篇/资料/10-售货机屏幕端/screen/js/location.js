
//获取参数
function getUrlParam(param){
	let urlObj = {};
	if(!window.location.search){return false;}
	let urlParams = window.location.search.substring(1);
	let urlArr = urlParams.split('&');
	for(let i = 0; i < urlArr.length; i++){
		let urlArrItem = urlArr[i].split('=');
		urlObj[urlArrItem[0]] = urlArrItem[1]
	}
　　// 判断是否有参数
	if(arguments.length>=1){
		return urlObj[param]
	}
	return urlObj;
}
