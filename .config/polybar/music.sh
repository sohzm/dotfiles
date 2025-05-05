if [ "$(playerctl status)" = "Playing" ]; then
  title=`exec playerctl metadata xesam:title`
  artist=`exec playerctl metadata xesam:artist`
  if [ "$artist" = "Various" ]; then
    artist="";
    echo "  $title"
  else
    echo "  $title"
  fi
else
  echo " "
fi
