
  $(function(){
  $(".post-form").on('click', function(event){
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response) {
        var vote1 = '<%=@vote1%>';
        var vote2 = '<%=@vote2%>';
        if (vote1 > 0) {
          $('#heart_div_1').html('<i class="fas fa-heart"></i>')
        }
        if (vote2 > 0) {
        $('#heart_div_2').html('<i class="fas fa-heart"></i>');
        }
      }
    });
    event.preventDefault();
  });
})