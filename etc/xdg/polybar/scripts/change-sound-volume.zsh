#!/bin/zsh

#change  the volume based on input argument that is passed by mouse clicks assotiated
case "$1" in
  increase)
    wpctl set-volume @DEFAULT_SINK@ 5%+
    ;;
  decrease)
    wpctl set-volume @DEFAULT_SINK@ 5%-
    ;;
  toggle)
    wpctl set-mute @DEFAULT_SINK@ toggle
    ;;
  *)
    echo "Usage: $0 {increase|decrease|toggle}"
    ;;
esac

