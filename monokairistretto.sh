#!/bin/sh

# Materiterm: Material for iTerm
# Material Dark scheme by Seth Wright (https://github.com/asethwright)

# Based on the base16-shell template
# by Chris Kempson (https://github.com/chriskempson)

# Colors by Mattia Astorino (https://github.com/equinusocio)
# from the Sublime Text 3 Material Theme

color00="37/2F/2F" # Base 00 - Black (gray3)
color01="FE/69/83" # Base 08 - Red
color02="AD/D9/78" # Base 0B - Green
color03="FA/CB/6C" # Base 0A - Yellow
color04="84/DA/CC" # Base 0D - Blue
color05="A7/AB/EB" # Base 0E - Magenta
color06="84/DA/CC" # Base 0C - Cyan
color07="42/3A/3A" # Base 05 - White (active pane, gray2)
color08="37/2F/2F" # Base 03 - Bright Black, (inactive pane, offwhite)
color09="$color01" # Base 08 - Bright Red
color10="$color02" # Base 0B - Bright Green
color11="$color03" # Base 0A - Bright Yellow
color12="$color04" # Base 0D - Bright Blue
color13="$color05" # Base 0E - Bright Magenta
color14="$color06" # Base 0C - Bright Cyan
color15="$color07" # Base 07 - Bright White
color_foreground="FF/F1/F3" # Base 05
color_background="2C/25/25" # Base 00
color_cursor="$color_foreground" # Base 05

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
  printf $printf_template_custom Pg fff1f3 # forground
  printf $printf_template_custom Ph 2c2525 # background
  printf $printf_template_custom Pi fff1f3 # bold color
  printf $printf_template_custom Pj 372f2f # selection color
  printf $printf_template_custom Pk fff1f3 # selected text color
  printf $printf_template_custom Pl fff1f3 # cursor
  printf $printf_template_custom Pm 2c2525 # cursor text
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

# it2setcolor tab 253238

# add a dotfile that vim can read when loading up
# will automatically set the color scheme to materitermdark
echo "if !exists('g:colors_name') || g:colors_name != 'monokaiproristretto'\ncolorscheme monokaiproristretto\nendif" > ~/.vimrc_background
