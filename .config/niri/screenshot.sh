#!/bin/bash

# Take screenshot of selected area and open in swappy
# Save only happens when you click save in swappy
grim -g "$(slurp)" - | swappy -f -
