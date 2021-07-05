function buttonClick() {
  let hide = document.getElementById("hide");
  let disp = document.getElementById("disp");
  let subForm = document.getElementById("sub-form");
  let ownerId = document.getElementById("owner-id");

  if ( document.getElementById("hide")){
    hide.addEventListener('click', function(){
      ownerId.options[0].selected = true;
      subForm.style.display = "none";
    })
    disp.addEventListener('click', function(){
      subForm.style.display = "";
    })
  }
};

window.addEventListener('load', buttonClick);