$(document).ready(function() {
  return $(".screenshot").click(function(event) {
    event.preventDefault();
    $('.modal-body > img').attr('src', $(event.target).attr('src'));
    return $('#screenshotModal').modal();
  });
});
