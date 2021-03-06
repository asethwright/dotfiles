#!/bin/sh

# Materiterm: Material for iTerm
# Material Light scheme by Seth Wright (https://github.com/asethwright)

# Based on the base16-shell template
# by Chris Kempson (https://github.com/chriskempson)

# Colors by Mattia Astorino (https://github.com/equinusocio)
# from the Sublime Text 3 Material Theme

color00="33/33/33" # Base 00 - Black
color01="d3/2f/2f" # Base 08 - Red
color02="22/86/3a" # Base 0B - Green
color03="f2/97/18" # Base 0A - Yellow
color04="19/76/d2" # Base 0D - Blue
color05="6f/42/c1" # Base 0E - Magenta
color06="4d/bf/99" # Base 0C - Cyan
color07="c7/c7/c7" # Base 05 - White
color08="a1/a1/a1" # Base 03 - Bright Black
color09="d6/65/6a" # Base 08 - Bright Red
color10="a3/d9/00" # Base 0B - Bright Green
color11="e7/c5/47" # Base 0A - Bright Yellow
color12="68/71/ff" # Base 0D - Bright Blue
color13="a3/7a/cc" # Base 0E - Bright Magenta
color14="57/d9/ad" # Base 0C - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color_foreground="00/00/00" # Base 00
color_background="ff/ff/ff" # Base 05
color_cursor="fc/74/53" # Base 05

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template='\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\'
  printf_template_var='\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\'
  printf_template_custom='\033Ptmux;\033\033]%s%s\033\033\\\033\\'
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template='\033P\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033P\033]%d;rgb:%s\033\\'
  printf_template_custom='\033P\033]%s%s\033\\'
else
  printf_template='\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033]%d;rgb:%s\033\\'
  printf_template_custom='\033]%s%s\033\\'
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg 000000 # forground
  printf $printf_template_custom Ph ffffff # background
  printf $printf_template_custom Pi 000000 # bold color
  printf $printf_template_custom Pj c7c7c7 # selection color
  printf $printf_template_custom Pk 000000 # selected text color
  printf $printf_template_custom Pl fbc02d # cursor
  printf $printf_template_custom Pm 364851 # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
unset color_cursor

# it2setcolor tab f7f7f7

# add a dotfile that vim can read when loading up
# will automatically set the color scheme to materitermdark
echo "if !exists('g:colors_name') || g:colors_name != 'minlight'\ncolorscheme minlight\nendif" > ~/.vimrc_background
