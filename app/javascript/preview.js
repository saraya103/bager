document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item_image')){
    const ImgPreview = document.getElementById('img_preview')

    const createImgHTML = (blob) => {
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', 'preview_image');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);

      imageElement.appendChild(blobImage);
      ImgPreview.appendChild(imageElement);
    };
    
    document.getElementById('item_image').addEventListener('change', function(e){
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImgHTML(blob);
    });
  }
});