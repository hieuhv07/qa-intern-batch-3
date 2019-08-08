function readURL(f, previewId) {
  if (f.files && f.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $(previewId)
        .attr('src', e.target.result);
    };

    reader.readAsDataURL(f.files[0]);
  }
}

$(document).ready(function() {
  $(".preview").change(function() {
    readURL(this, '#img_prev');
  });
});
