#!/bin/sh

# Materiterm: Material for iTerm
# Material Light scheme by Seth Wright (https://github.com/asethwright)

# Based on the base16-shell template
# by Chris Kempson (https://github.com/chriskempson)

# Colors by Mattia Astorino (https://github.com/equinusocio)
# from the Sublime Text 3 Material Theme

color00="b0/be/c5" # Base 00 - Black
color01="e8/3b/3f" # Base 08 - Red
color02="40/a3/3f" # Base 0B - Green
color03="f6/98/1e" # Base 0A - Yellow
color04="1e/80/f0" # Base 0D - Blue
color05="99/2b/ae" # Base 0E - Magenta
color06="16/af/ca" # Base 0C - Cyan
color07="c4/cf/d4" # Base 05 - White
color08="7e/93/9e" # Base 03 - Bright Black
color09="f0/71/78" # Base 08 - Bright Red
color10="f7/8c/6c" # Base 0B - Bright Green
color11="f6/98/1e" # Base 0A - Bright Yellow
color12="bb/80/b3" # Base 0D - Bright Blue
color13="ab/79/67" # Base 0E - Bright Magenta
color14="e5/e9/ea" # Base 0C - Bright Cyan
color15="3c/4c/54" # Base 07 - Bright White
color16="f0/71/78" # Base 09 (pink)
color17="f7/8c/6c" # Base 0F (orange)
color18="b2/cc/d6" # Base 01 (pale blue)
color19="bb/80/b3" # Base 02 (violet)
color20="ab/79/67" # Base 04 (brown)
color21="e5/e9/ea" # Base 06
color_foreground="1c/26/2a" # Base 00
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
  printf $printf_template_custom Pg 1c262a # forground
  printf $printf_template_custom Ph ffffff # background
  printf $printf_template_custom Pi e83b3f # bold color
  printf $printf_template_custom Pj cfd8dc # selection color
  printf $printf_template_custom Pk 3c4c54 # selected text color
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
echo "if !exists('g:colors_name') || g:colors_name != 'materitermlight'\ncolorscheme materitermlight\nendif" > ~/.vimrc_background
