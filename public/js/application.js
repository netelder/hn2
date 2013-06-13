$(document).ready(function() {

 $(".comment_upvote").on('click', function(event){
    var comment_id = $(this).attr('value');
    console.log(event);
    $.ajax({
      url: '/comments/vote/'+comment_id,
      method: "POST"

    }).done(function(response){
      $(event.delegateTarget).next('#comment_score').text(response);
    });
  });


 $(".post_upvote").on('click', function(event){
    var post_id = $(this).attr('value');
    console.log(event);
    $.ajax({
      url: '/posts/vote/'+post_id,
      method: "POST"
    }).done(function(response){
      $(event.delegateTarget).next('#post_score').text(response);
    });

  });


});
