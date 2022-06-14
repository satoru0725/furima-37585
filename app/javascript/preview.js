document.addEventListener('DOMContentLoaded', function(){
  const postForm = document.getElementById('new_post');
  const previewList = document.getElementById('previews');
  if (!postForm) return null;

  const fileField = document.querySelector('input[type="file"][name="item[images][]"]');
  fileField.addEventListener('change', function(e){

    const dataIndex = e.target.getAttribute('data-index');
    console.log(dataIndex);

    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    console.log(e.target.files[0]);
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    console.log(blob);
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    //previewImage.setAttribute('width', '400');
    //previewImage.setAttribute('height', '260');
    previewImage.setAttribute('src', blob);

    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);

    const newFileField = document.createElement('input');
    newFileField.setAttribute('type', 'file');
    newFileField.setAttribute('name', 'post[images][]');

    const lastFileField = document.querySelector('input[type="file"][name="item[images][]"]:last-child');
    const nextDataIndex = Number(lastFileField.getAttribute('data-index')) +1;
    newFileField.setAttribute('data-index', nextDataIndex);

    const fileFieldsArea = document.querySelector('.click-upload');
    fileFieldsArea.appendChild(newFileField);
  });
});