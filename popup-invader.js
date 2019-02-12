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
 **************************************************************************/


/**************************
*         SETTINGS        *
**************************/
var website = "https://tamaractalk.com/wp-content/uploads/2014/12/wtf-lol.png"; // Website that the pop-ups will browse to
var title   = "_blank";                                                         // Title of the pop-up
var size    = [200, 200];                                                       // Size of pop-ups ([width, height])
var delay   = 2;                                                                // Delay (in milliseconds) between each pop-up

/**************************
*        MAIN CODE        *
**************************/
setInterval(function() {  // Make script run each *delay* milliseconds
  var v = window.open(website, title, "height=" + size[1]                                                 // Setting pop-up height to size[1]
                            + ",width=" + size[0]                                                         // Setting pop-up width to size[0]
                            + ",top=" + Math.floor(Math.random() * Math.floor(screen.height - size[1]))   // Setting window y to a random location in [0 ; clientHeight - popupHeight]
                            + ",left=" + Math.floor(Math.random() * Math.floor(screen.width - size[0]))); // Setting window x to a random location in [0 ; clientWidth - popupWidth]
  console.log("hello");
}, delay, delay);
