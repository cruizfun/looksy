
  $(function(){
  $(".post-form").on('click', function(event){
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response) {
        $('i').removeClass('far fa-heart').addClass('fas fa-heart');
      }
    });
    event.preventDefault();
  });
})