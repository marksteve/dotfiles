#!/bin/bash
urxvtd --quiet --opendisplay --fork
dwmstatus &
exec dwm
