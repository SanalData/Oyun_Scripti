<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FacebookShare.ascx.cs" Inherits="FacebookShare" %>
<div>
    <div id="fb-root">
    </div>
    <div onclick="return shareWithFacebook();" style="border: 1px solid black; background-color: #d3dde5;
        padding: 5pt; width: 175pt; cursor: pointer;">
        <img src='http://www.codeproject.com/images/fb_share.gif' border="0" alt="facebook likeus" style="vertical-align: middle;
            padding-right: 5pt;" />
        <strong>Share with Facebook</strong>
    </div>
    <script type="text/javascript">
        window.fbAsyncInit = function () {
            FB.init({
                appId: '<%= ApplicationId %>', status: true, cookie: true,
                xfbml: true
            });
        };
        (function () {
            var e = document.createElement('script');
            e.async = true;
            e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
            document.getElementById('fb-root').appendChild(e);
        }());

        function shareWithFacebook() {
            FB.ui({
                method: 'stream.publish',
                message: '<%= Message %>',
                user_message_prompt: '<%= Prompt %>',
                attachment: {
                    name: '<%= Name %>',
                    caption: '<%= Caption %>',
                    description: ('<%= Description %>'),
                    href: '<%= Href %>',
                    media: [{ 'type': 'image', 'src': '<%= Image %>', 'href': '<%= Href %>' }]
                },
                action_links: [
                { text: '<%= Name %>', href: '<%= Href %>' }
                ]
            },
            function (response) {
                if (response && response.post_id) {
                    // Do some custom action after the user successfully posts this to their wall
                    alert('Thanks for sharing!');
                }
            }
        );
            return false;
        }
    </script>
</div>