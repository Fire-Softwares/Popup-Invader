<!-- MIT License

Copyright (c) 2019 Renaud, Fire-Softwares

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
-->
<!-- Popup-Invader by Renaud42 from Fire-Softwares -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <title>Popup Invader Demo</title>
    <!-- Fire-API Minified CSS -->
    <link rel='stylesheet' type='text/css' href='https://cdn.fire-softwares.ga/fire-api/web-framework/css/fire-api.min.css'/>
    <!-- Main stylesheet -->
    <style>
      h2 {
        margin-top: 21.5%;                         /* Center vertically */
        text-align: center;                        /* Center horizontally */
      }
      .ok {
        font-size: 32px;                           /* Increasing font size */
        margin-left: calc(50% - 35px);             /* Center horizontally */
      }
      .source {
        font-size: 32px;                           /* Increasing font size */
        margin-left: calc(50% - 88px);             /* Center horizontally */
      }
      #pu-version {
        color: gray;                               /* Recolorize */
        margin-top: 200px;                         /* Positionning down version information */
        text-align: center;                        /* Center horizontally */
      }
    </style>
  </head>

<?php
  // Popup-Invader version
  $version = 1.1;

  // If user confirmed to join the website
  if (isset($_GET["confirm"]) && $_GET["confirm"] == "yes")
    setcookie("confirm-popup-invader", "yes", time() + 86400);  // One day cookie
  // If user haven't already confirmed to join the website
  if (!isset($_COOKIE["confirm-popup-invader"]) && !(isset($_GET["confirm"]) && ($_GET["confirm"] == "yes"))):
?>
  <body>
    <!-- Just a warning -->
    <h2>Warning : this website can harm your web browser.<br/>
    Click "OK" to confirm you know what you're doing.</h2><br/>
    <!-- Just a button who can destroy your life -->
    <a class="light-red hypertext ok" href="?confirm=yes">OK</a>
  </body>
<?php
  else:
?>
  <body>
    <h2>If nothing happens, try allow popups :)</h2><br/>
    <a class="light-red hypertext source" href="https://github.com/Fire-Softwares/Popup-Invader" target="_blank">Source code</a>
    <br/>
    <h5 id="pu-version">Popup-Invader version : <?= $version ?></h5>
    <!-- Fire-Softwares Popup Invader minified script invoke -->
    <script src='popup-invader.min.js'></script>
    <!-- Background wave -->
    <script>
      var x1 = .0, x2 = .25, x3 = .5; // x Sinus
      var red, green, blue;

      setInterval(function() {
        red = Math.sin(x1 += .04);
        green = Math.sin(x2 += .02);
        blue = Math.sin(x3 += .01);
        document.body.style.backgroundColor = "rgb(" + (191 + red * 64)  + ", " + (191 + green * 64) + ", " + (191 + blue * 64) + ")";
      }, 30);
    </script>
    <!-- Fire-API Minified JavaScript -->
    <script src='https://cdn.fire-softwares.ga/fire-api/web-framework/js/fire-api.min.js'></script>
  </body>
<?php
  endif;
?>
</html>
