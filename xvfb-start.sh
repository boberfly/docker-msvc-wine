#!/bin/bash
Xvfb :99 -screen 0 1280x1024x24 -ac &
export DISPLAY=:99
