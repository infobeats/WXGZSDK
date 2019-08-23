/*
  author：log
  version:1.9
  time: 2019-2-25
  tips:优化了性能问题
*/
(function(root) {
  var infoBeatCj = function() { //构造函数  函数对象
    return new infoBeatCj.prototype.init();
  }
  var infoBeatMTSSBuriedArr = [];
  infoBeatCj.fn = infoBeatCj.prototype = { //原型对象
    length: 0,
    infoBeatInputsArr: [],
    buriedArr:[],
    init: function() {
      return this;
    },
    events: function() {
      root.first = true;
      var inputs = Array.prototype.slice.call(document.getElementsByTagName("input"));
      var doms =  Array.prototype.slice.call(document.getElementsByTagName("*"));
      
      inputs.forEach(function(item,index){
      	if(item.addEventListener){
      		item.addEventListener("input", function() {
	          infoBeatCj().infoBeatInputsArr.push(this.value);
	        })
	        item.addEventListener("blur", function() {
	          infoBeatCj().datacj(this)
	        })
      	}else if(item.attachEvent){
      		item.attachEvent("input", function() {
	          infoBeatCj().infoBeatInputsArr.push(this.value);
	        })
	        item.attachEvent("blur", function() {
	          infoBeatCj().datacj(this);
	        })
      	}
      })
      doms.forEach(function(itn,index){
      	if(itn.addEventListener){
      		itn.addEventListener("click", function() {
	          infoBeatCj().datacj(this)
	        })
      	}else if(itn.attachEvent){
      		itn.attachEvent("click", function() {
	          infoBeatCj().datacj(this)
	        })
      	}
      })     
    },
    datacj: function(dom) {
      var dom0 = dom;
      var path = getPath(dom0);
      var width = dom0.offsetWidth;
      var height = dom0.offsetHeight;
      var left = getElementViewLeft(dom0);
      var scroll = document.documentElement.scrollTop == 0 ? document.body.scrollTop : document.documentElement.scrollTop;
      var widths = window.screen.width;
      var heights = window.screen.height
      var top = getElementViewTop(dom0);
      var texts = dom0.innerText.replace(/[\r\n]/g, "");
      var obj = {};
      obj.wUnique = path.replace("#infobeathtml2canvas", "");
      obj.wName = dom0.nodeName ? dom0.nodeName.toLowerCase() : "";
      obj.wFrame = left + "," + top + "," + width + "," + height + "," + scroll + "," + widths + "," + heights;
      obj.clickType = '-1';
      obj.wUrl = dom0.getAttribute("href");
      obj.wPageUrl = location.href;
      obj.wId = obj.wUnique + location.href;
      var nodeName = dom0.nodeName ? dom0.nodeName.toLowerCase() : "";
      switch(nodeName) {
        case "button":
          obj.wEvenType = 1;
          break;
        case "input":
          obj.wEvenType = 3;
          break;
        case "a":
          obj.wEvenType = 4;
          break;
        case "img":
          obj.wEvenType = 5;
          break;
        case "audio":
          obj.wEvenType = 6;
          break;
        case "video":
          obj.wEvenType = 7;
          break;
        default:
          obj.wEvenType = 8;
      }
      // obj.wText = (obj.wEvenType == 3 && dom0.type == "text") ? JSON.stringify(infoBeatInputsArr) : texts.replace(/[\r\n]/g, "");
      obj.wText = obj.wEvenType == 3 ? JSON.stringify(infoBeatCj().infoBeatInputsArr) : texts;
      
      if(obj.wName != "html"){
      	infoBeatMTSSBuriedArr.push(obj);
      }else{
      	infoBeatMTSSBuriedArr.push(obj);
      	var str = JSON.stringify(infoBeatMTSSBuriedArr);
	      console.log(str)
	      if(navigator.userAgent.toLowerCase().indexOf("android") != -1) {
	        root.java.getWebInfo(str)
	      } else if(navigator.userAgent.toLowerCase().indexOf("iphone") != -1) {
	        root.WebViewJavascriptMTSSBridge.callHandler('WXGZGetWID', str)
	      }
        console.log(infoBeatMTSSBuriedArr.length);
	      infoBeatMTSSBuriedArr = [];
	      console.log(infoBeatMTSSBuriedArr.length);
      }

      function getElementViewLeft(element) {　　　　
        var actualLeft = element.offsetLeft;　　　　
        var current = element.offsetParent;
        while(current !== null) {　　　　　　
          actualLeft += current.offsetLeft;　　　　　　
          current = current.offsetParent;　　　　
        }　
        if(document.compatMode == "BackCompat") {　　　　　　
          var elementScrollLeft = document.body.scrollLeft;　　　　
        } else {　　　　　　
          var elementScrollLeft = document.documentElement.scrollLeft;　　　　
        }　
        return actualLeft
      }　　
      function getElementViewTop(element) {　　　　
        var actualTop = element.offsetTop;　　　　
        var current = element.offsetParent;
        while(current !== null) {　　　　　　
          actualTop += current.offsetTop;　　　　　　
          current = current.offsetParent;　　　　
        }　　
        if(document.compatMode == "BackCompat") {　　　　　　
          var elementScrollTop = document.body.scrollTop;　　　　
        } else {　　　　　　
          var elementScrollTop = document.documentElement.scrollTop;　　　　
        }　
        return actualTop
      }

      function getPath(ele) {
        if(ele.nodeName == "HTML") {
        return ele.nodeName;
      } else {
        var className = "";
        var idName = ele.id;
        var className = ele.className;
        var nodes = nodes = ele.nodeName;

        if(idName) {
          nodes = nodes + "#" + idName;
        }
        if(className) {
          nodes = nodes + "." + className.replace(/(\s*$)/g, "").split(/\s+/).join(".")
        }
        if(ele.parentNode.childNodes) {
          var childd;

          var Arr = []
          for(var j = 0; j < ele.parentNode.childNodes.length; j++) {
            if(ele.parentNode.childNodes[j].nodeName == ele.nodeName) {
              var classArr = ele.parentNode.childNodes[j].className || ele.parentNode.childNodes[j].className.split(" ");
              if(classArr.indexOf(ele.className) != -1) {
                Arr.push(ele.parentNode.childNodes[j])
              }

            }
          }
          var length = Arr.length;
          for(var i = 0; i < length; i++) {
            var sibling = Arr[i];
            if(sibling == ele) {
              nodes = nodes + "**" + i;
            }
          }
        }
        return getPath(ele.parentNode) + ">" + nodes;
      }
      }
    }
  }
  infoBeatCj.fn.init.prototype = infoBeatCj.fn;
  root.infoBeatCj = infoBeatCj;
  root.setupWebViewJavascriptMTSSBridge = function(callback) {
    if(root.WebViewJavascriptMTSSBridge) {
      return callback(WebViewJavascriptMTSSBridge);
    }
    if(root.WVJBCallbacks) {
      return root.WVJBCallbacks.push(callback);
    }
    root.WVJBCallbacks = [callback];
    var WVJBIframe = document.createElement('iframe');
    WVJBIframe.style.display = 'none';
    WVJBIframe.src = 'wvjbscheme://__BRIDGE_LOADED__';
    document.documentElement.appendChild(WVJBIframe);
    setTimeout(function() {
      document.documentElement.removeChild(WVJBIframe)
    }, 0)
  }
  root.setupWebViewJavascriptMTSSBridge(function(bridge) {

  })
  if(!root.first) {
    infoBeatCj().events();
  }
})(window);