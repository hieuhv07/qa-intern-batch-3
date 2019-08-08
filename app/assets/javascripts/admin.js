//= require rails-ujs
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap
//= require admin/custom
//= require admin/datatable
//= require toastr

toastr.options = {
  "timeOut": "1000",
};

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});
