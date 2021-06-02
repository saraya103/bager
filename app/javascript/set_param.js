function set(){
  if(document.URL.match(/\?/)) {
    var url = location.search;
    var urlParam = url.split('?');
    var urlArray = urlParam[1].split('&');
    var paramArray = [];
    for(i=0; i<urlArray.length; i++) {
      var paramData = urlArray[i].split('=');
      paramArray.push(paramData[0]);
      paramArray[paramData[0]] = paramData[1];
    }
    var text = paramArray['key'];
    if(text!='undefined') {
      $('#id').prop('value', `${paramArray['id']}`);
      $('#pass').prop('value', `${paramArray['pass']}`);
    }
  }
};

window.addEventListener('load', set);