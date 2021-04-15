#!/bin/zsh

# <bitbar.title>Yabai-Spaces</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Shrey Choudhary</bitbar.author>
# <bitbar.author.github>SxC97</bitbar.author.github>
# <bitbar.desc>Plugin that displays total number of spaces and highlights the current space.</bitbar.desc>
# <bitbar.dependencies>brew,yabai,skhd,jq,zsh</bitbar.dependencies>

# Info about yabai, see: https://github.com/koekeishiya/yabai
# For skhd, see: https://github.com/koekeishiya/skhd
# Although very little of the original code remains, this plugin was inspired by James Won's "yabai/skhd helper" https://getbitbar.com/plugins/Tools/yabai_skhd.1s.sh

# Sets unicode encoding to UTF-8. Fixes issues with displaying *many* but not *all* unicode charecters.
export LANG="es_ES.UTF-8"

# Exports the plugin to your $PATH to allow execution. Make sure you run `chmod +x yabai.1d.sh` after downloading
# export PATH=/usr/local/bin:$PATH

# Stops yabai and skhd
if [ "$1" = "stop" ]; then
  brew services stop yabai
  brew services stop skhd
fi

# Restarts yabai and skhd
if [ "$1" = "restart" ]; then
  brew services restart yabai
  brew services restart skhd
fi

# Opens your .yabairc file in VSCode if you have the CLI tools installed. Make sure to change path to your file if needed. See https://code.visualstudio.com/docs/editor/command-line

if [ "$1" = "editY" ]; then
  code ~/.yabairc
fi
# Opens your .shkdrc file in VSCode
if [ "$1" = "editS" ]; then
  code ~/.skhdrc
fi
# Opens this file in VSCode
if [ "$1" = "editBB" ]; then
  code ~/Bitbar/yabai.*.sh
fi

# Avaliable colors and their associated ANSI color codes. Don't change your color here unless you know what you're doing!
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
RESET='\033[m'

# Change your color here to one of the options above! $COLOR will be the color of the current space.
# $DEFAULT will be the color of the other spaces

COLOR=''
DEFAULT=''

# Change your icons here! $LEFT and $RIGHT refer to the icons on either end of the bar and $DIV refers to the icon between spaces.
# e.x. if $LEFT='\〈', $RIGHT='\〉', and $DIV='|', your bar would look like this ⟨ ｜ ⟩.
# NOTE: the pipe '｜' is not a valid charecter as it is reserved by Bitbar. Use "vertical line" or "vertical bar" instead.
# List of all Unicode charecters can be found here: https://unicode-table.com/en/
# P.S. Check out the "Math" and "Misc" sections for cool and unique symbols to use!ˈ

LEFT=''
RIGHT=' '
DIV=' '
SELECTLEFT=''
SELECTRIGHT=''

# Change your font here! Make sure you only change the stuff on the right of the '='. You can get the exact name of your font from the FontBook application on MacOS.
# A monowidth font (such as FuraCode) is recomended. Ligatures are a plus!

FONT=' | font=FiraMono Nerd Font Regular | trim=true | size=14'

# Change your space indicies here! Add a space between the indicies if you would like padding.
# Feel free to use this as a template and increase the $SPACES array as you see fit. 
# Make sure you add '' around your elements
# example: SPACES=('I' 'II' 'III' 'IV' 'V' 'VI' 'VII' 'VIII' 'IX' 'X' 'XI' 'XII' 'XIII' 'XIV' 'XV' 'XVI') will give you roman neumerals up to 16 spaces.

SPACES=(':paperplane.circle:' ':safari:' ':message.circle:' ':book.circle:' ':chevron.right.circle:' ':play.circle:' ':command.circle:' ':smallcircle.circle:' ':smallcircle.circle:' ':smallcircle.circle:' ':smallcircle.circle:' ':smallcircle.circle:' ':smallcircle.circle:' ':smallcircle.circle:' ':smallcircle.circle:' ':smallcircle.circle:')

# Choose your style. Options "NUMBER" and "CUSTOM".
# NUMBER uses arabic neumerals e.g. 1, 2, 3, etc...
# CUSTOM uses your array elements from SPACES. e.g. I, II, III, etc...
# SELECT allows you to change the selected space icon to a different one to differentiate the space.

STYLE="CUSTOM"
SELECT=(':paperplane.circle.fill:' ':safari.fill:' ':message.circle.fill:' ':book.circle.fill:' ':chevron.right.circle.fill:' ':play.circle.fill:' ':command.circle.fill:' ':smallcircle.circle.fill:' ':smallcircle.circle.fill:' ':smallcircle.circle.fill:' ':smallcircle.circle.fill:' ':smallcircle.circle.fill:' ':smallcircle.circle.fill:' ':smallcircle.circle.fill:' ':smallcircle.circle.fill:' ':smallcircle.circle.fill:')

# Choose weather or not you want to see the type of the current space. i.e. BSP, STACK, or FLOAT
# Options, `true` or `false`

SPACETYPE=true
BSP=":uiwindow.split.2x1:"
STACK=":square.stack.3d.down.forward:"
FLOAT=":rectangle.on.rectangle:"
SPACELEFT=""
SPACERIGHT=" "

# Choose weather or not you want to see the type of the window. i.e. floating or managed
# Options, `true` or `false`

WINTYPE=true
WINMANAGED=":rectangle.inset.fill:"
WINFLOAT=":rectangle.center.inset.fill:"
WINLEFT=""
WINRIGHT=""

# Set left and right separators for displays
DISPLAYLEFT=""
DISPLAYRIGHT=""

# -------------------------------------------------------------------------#
# Don't edit anything below this point if you dont know what you're doing! #
# -------------------------------------------------------------------------#

CURRENT=$(yabai -m query --spaces --display | jq 'map(select(."focused" == 1))[-1].index')
TOTAL=$(yabai -m query --spaces | jq '. | length')
STRING="$DEFAULT$LEFT" 
i=1

for DISPLAY in $(yabai -m query --displays | jq '. | length'); do 
  VAR=$(yabai -m query --displays --display $DISPLAY | jq '.spaces | .[0]')
  SPACES[VAR]=$DISPLAYLEFT$SPACES[VAR]
done

for DISPLAY in $(yabai -m query --displays | jq '. | length'); do 
  VAR=$(yabai -m query --displays --display $DISPLAY | jq '.spaces | .[-1]')
  SPACES[VAR]=$SPACES[VAR]$DISPLAYRIGHT
done

if [ "$STYLE" = "NUMBER" ]; then  
  while [ $i -le $TOTAL ]; do
    if [ $i -eq $CURRENT ]; then
      STRING+="$COLOR$SELECTLEFT${i}$SELECTRIGHT$DEFAULT"
      i=$(( $i + 1 ))
    else
      STRING+="$DIV${i}$DIV"
      i=$(( $i + 1 ))
    fi
  done
elif [ "$STYLE" = "CUSTOM" ]; then
  while [ $i -le $TOTAL ] || [ $i -eq $TOTAL ]; do
    if [ $i -eq $CURRENT ]; then
        SPACES[i]=${SELECT[i]}
      STRING+="$COLOR$SELECTLEFT${SPACES[i]}$SELECTRIGHT$DEFAULT"
      i=$(( $i + 1 ))
    else
      STRING+="$DIV${SPACES[i]}$DIV"
      i=$(( $i + 1 ))
    fi
  done
fi

FINALSTRING=$(echo "$STRING$RIGHT" | tr -s "$DIV")

TYPE=$(yabai -m query --spaces --space | jq .type)

if [[ $TYPE == *"bsp"* ]]; then
  TYPE=$BSP
elif [[ $TYPE == *"stack"* ]]; then
  TYPE=$STACK
elif [[ $TYPE == *"float"* ]]; then
  TYPE=$FLOAT
else
  TYPE=''
fi

WINDOW=$(yabai -m query --windows --window | jq .floating) 2> /dev/null

if ! [ -z "$WINDOW" ] && [[ $WINDOW -eq "0" ]]; then
  WINDOW=$WINMANAGED
elif ! [ -z "$WINDOW" ] && [[ $WINDOW -eq "1" ]]; then
  WINDOW=$WINFLOAT
else
  WINDOW=''
fi

if [[ "$SPACETYPE" = true ]] && [[ "$WINTYPE" = true ]]; then
  FINAL=$FINALSTRING$SPACELEFT$TYPE$SPACERIGHT$WINLEFT$WINDOW$WINRIGHT
elif [[ "$SPACETYPE" = true ]]; then
  FINAL=$FINALSTRING$SPACELEFT$TYPE$SPACERIGHT
elif [[ "$WINTYPE" = true ]]; then
  FINAL=$FINALSTRING$WINLEFT$WINDOW$WINRIGHT
fi

echo -e "$FINAL"

echo "---"
echo "Restart yabai & skhd | bash='$0' param1=restart terminal=false"
echo "Stop yabai & skhd | bash='$0' param1=stop terminal=false"
echo "Edit yabairc | bash='$0' param1=editY terminal=true"
echo "Edit skhdrc | bash='$0' param1=editS terminal=false"
echo "Edit this plugin | bash='$0' param1=editBB terminal=false"
