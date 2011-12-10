// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $("#facebook-post").click(function() {
    FB.ui(
      {
       method: 'feed',
       message: 'Do things with people near you',
       name: 'Grupi.co',
       caption: 'Do things with people near you',
       description: (
          'Do things with people near you'
       ),
       link: 'http://www.fbrell.com/',
       picture: 'http://www.fbrell.com/f8.jpg',
       actions: [
            { name: 'fbrell', link: 'http://www.fbrell.com/' }
       ],
       user_message_prompt: 'Invite your friends to do things'
      },
      function(response) {
        if (response && response.post_id) {
          alert('Post was published.');
        } else {
          alert('Post was not published.');
        }
      }
    );
  });
});