file { '/etc/default/keyboard':
  ensure  => file,
  content => '# KEYBOARD CONFIGURATION FILE

# Consult the keyboard(5) manual page.

XKBMODEL="pc105"
XKBLAYOUT="gb"
XKBVARIANT=""
XKBOPTIONS="lv3:ralt_switch"

BACKSPACE="guess"'
}
