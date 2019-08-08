$(document).ready(function() {
  $(".sidebar-dropdown > a").click(function() {
    $(".sidebar-submenu").slideUp(20);
    if ($(this).parent().hasClass("active")) {
        $(".sidebar-dropdown").removeClass("active");
        $(this).parent().removeClass("active");
    } else {
        $(".sidebar-dropdown").removeClass("active");
        $(this).next(".sidebar-submenu").slideDown(20);
        $(this).parent().addClass("active");
    }
  });

  $("#close-sidebar").click(function() {
    $(".page-wrapper").removeClass("toggled");
    $(".dataTables_scrollHeadInner").css('width', '100%')
    $(".table.table-striped.table-bordered.dataTable.no-footer").css('width', '100%')
  });

  $("#show-sidebar").click(function() {
    $(".page-wrapper").addClass("toggled");
    $(".dataTables_scrollHeadInner").css('width', '100%')
    $(".table.table-striped.table-bordered.dataTable.no-footer").css('width', '100%')
  });

  $('#table_id').DataTable({
    scrollY: 500,
    "order": [[ 0, 'DESC' ]],
    "pageLength": 25,
    "columnDefs": [
      { "orderable": false, "targets": [6] },
    ]
  });

// Table tags
  $('#container_tags').DataTable({
    scrollY: 500,
    "order": [[ 0, 'DESC' ]],
    "pageLength": 10,
    "columnDefs": [
    { "orderable": false, "targets": [2] },
    ]
  });

  $(".preview").change(function() {
    readURL(this, '#img_prev');
  });
});



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
