// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $("#facebook-share").click(function() {
    FB.ui(
      {
       method: 'feed',
       message: 'Do things with people near you',
       name: 'Grupi.co',
       caption: titleShare,
       description: (
          titleShare
       ),
       link: inviteLink,
       picture: 'http://www.fbrell.com/f8.jpg',
       user_message_prompt: titleShare
      },
      function(response) {
        if (response && response.post_id) {
          //alert('Post was published.');
        } else {
          //alert('Post was not published.');
        }
      }
    );
  });

  $('#facebook-login').click(function() {
    FB.login(function(response) {
      if(response.authResponse) 
        window.location = '/auth/facebook/callback';
    }, {scope:'email'});
  });
});