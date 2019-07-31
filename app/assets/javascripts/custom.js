function readURL(f) {
  if (f.files && f.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('#img_prev')
        .attr('src', e.target.result);
    };

    reader.readAsDataURL(f.files[0]);
  }
}

$(document).on("turbolinks:load", function(){
  $(".preview").change(function(){
    readURL(this);
  })
})
