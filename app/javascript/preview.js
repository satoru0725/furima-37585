document.addEventListener('DOMContentLoaded', function(){
  const postForm = document.getElementById('new_post');
  const previewList = document.getElementById('previews');
  if (!postForm) return null;

  //プレビュー画像を生成・表示する関数
  const buildPreviewImage = (dataIndex, blob) =>{
    //画像を表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);

    //表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    //生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  };
  
  //file_fieldを生成・表示する関数
  const buildNewFileField = () => {
    //２枚目用のfile_fieldを作成
    const newFileField = document.createElement('input');
    newFileField.setAttribute('type', 'file');
    newFileField.setAttribute('name', 'item[images][]');

    //最後のfile_fieldを取得
    const lastFileField = document.querySelector('input[type="file"][name="item[images][]"]:last-child');
    //nextDataIndex = 最後のfile_fieldのdata-index + 1
    const nextDataIndex = Number(lastFileField.getAttribute('data-index')) + 1;
    newFileField.setAttribute('data-index', nextDataIndex);

    //生成したfile_fieldを表示
    const fileFieldsArea = document.querySelector('.click-upload');
    fileFieldsArea.appendChild(newFileField);
  };

  //input要素で値の変化が起きた際に呼び出される関数の中身
  const changeFileField = (e) => {
    //data-index(何番目を操作しているか)を取得
    const dataIndex = e.target.getAttribute('data-index');

    //古いプレビューが存在する場合は削除
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    buildPreviewImage(dataIndex, blob);
    buildNewFileField();
  };

  //input要素を取得
  const fileField = document.querySelector('input[type="file"][name="item[images][]"]');

  //input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', changeFileField);
});
/*
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
*/