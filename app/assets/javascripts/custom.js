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

$(document).ready(function() {
  $(".sidebar-dropdown > a").click(function() {
    $(".sidebar-submenu").slideUp(20);
    if (
      $(this)
        .parent()
        .hasClass("active")
    ) {
      $(".sidebar-dropdown").removeClass("active");
      $(this)
        .parent()
        .removeClass("active");
    } else {
      $(".sidebar-dropdown").removeClass("active");
      $(this)
        .next(".sidebar-submenu")
        .slideDown(20);
      $(this)
        .parent()
        .addClass("active");
    }
  });

  $("#close-sidebar").click(function() {
    $(".page-wrapper").removeClass("toggled");
  });

  $("#show-sidebar").click(function() {
    $(".page-wrapper").addClass("toggled");
  });
});
