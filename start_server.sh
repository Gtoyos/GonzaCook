#!/bin/bash
PATH="$HOME/Library/Python/3.8/bin:$PATH"
PATH="/home/ubuntu/.local/bin:$PATH"
cd /home/ubuntu/GonzaCook
waitress-serve --port 10111 --call 'gonzacook:create_app'
