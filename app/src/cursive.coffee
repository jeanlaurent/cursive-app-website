$(document).ready ->
  $(".screenshot").click (event) ->
    event.preventDefault()
    $('.modal-body > img').attr('src', $(event.target).attr('src'))
    $('#screenshotModal').modal()
