#!/bin/bash 

img_dir="$HOME/img/wallpapers"
wall_links() {
  links=$(cat search.json)
  for i in $links ;do
      echo "  $i"
  done
}

declare op=(" Yes 
 No")

while true; do
  input=$(wall_links | rofi -dmenu)

  case "$input" in
    "")  exit
    ;;
  esac

  feh $input

  choice=$(echo -e "${op[@]}"  |rofi -dmenu -theme "vrofi" -p "Want to download it?")
  case "$choice" in
    "")  exit
    ;;
  esac

  if [ ${choice#* } = "Yes" ]; then
      name=$(rofi -dmenu -theme "drofi" -p "Choose the name of the file:")
      file=$(wget $input -O $img_dir/$name.jpg)
      dunstify 'Done!'
  elif [ ${choice#* } = "No"  ]; then
    echo "Ok"
  else
    exit
  fi
  chs=$( echo -e "${op[@]}" |rofi -dmenu -theme "vrofi" -p "Do you want to change the json file?")
  if [ ${chs#* } = "Yes" ]; then
    python3 "wallpaper_machine.py"
    exit
  fi
done

