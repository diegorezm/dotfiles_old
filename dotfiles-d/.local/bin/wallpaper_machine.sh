#!/bin/bash 

img_dir="$HOME/img/wallpapers"
wall_links() {
  links=$(cat $HOME/.local/bin/search.json)
  for i in $links ;do
      echo "  $i"
  done
}

declare op=(" Yes 
 No")

while true; do
  input=$(wall_links |  dmenu -l 10 -p "Urls:")

  case "$input" in
    "")  exit
    ;;
  esac

  feh  -F $input

  choice=$(echo -e "${op[@]}"  | dmenu -p "Want to download it?")
  case "$choice" in
    "")  exit
    ;;
  esac

  if [ ${choice#* } = "Yes" ]; then
      name=$( dmenu  -p "Choose the name of the file:")
      file=$(wget $input -O $img_dir/$name.jpg)
      dunstify 'Done!'
  elif [ ${choice#* } = "No"  ]; then
    echo "Ok"
  else
    exit
  fi
  chs=$( echo -e "${op[@]}" | dmenu -p "Do you want to change the json file?")
  if [ ${chs#* } = "Yes" ]; then
    python3 ".local/bin/wallpaper_machine.py"
    exit
  fi
done

