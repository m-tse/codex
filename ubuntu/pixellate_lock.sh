#!/bin/bash

import -window root /tmp/lock.png

mogrify -scale 10% -scale 1000% /tmp/lock.png

i3lock -i /tmp/lock.png

