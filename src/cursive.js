$(document).ready(function() {
  return $(".thumbnail").click(function(event) {
    event.preventDefault();
    $('.modal-body > img').attr('src', $(event.target).attr('src'));
    return $('#myModal').modal();
  });
});
