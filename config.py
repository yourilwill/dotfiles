# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

# define timeout for multipurpose_modmap
define_timeout(1)

# [Global modemap] Change modifier keys as in xmodmap
define_modmap({
    Key.CAPSLOCK: Key.LEFT_CTRL
})

# [Conditional modmap] Change modifier keys in certain applications
define_conditional_modmap(re.compile(r'Emacs'), {
    Key.RIGHT_CTRL: Key.ESC,
})

# [Multipurpose modmap] Give a key two meanings. A normal key when pressed and
# released, and a modifier key when held down with another key. See Xcape,
# Carabiner and caps2esc for ideas and concept.
define_multipurpose_modmap(
    # Enter is enter when pressed and released. Control when held down.
    {Key.ENTER: [Key.ENTER, Key.RIGHT_CTRL]}

    # Capslock is escape when pressed and released. Control when held down.
    # {Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL]
    # To use this example, you can't remap capslock with define_modmap.
)

# [Conditional multipurpose modmap] Multipurpose modmap in certain conditions,
# such as for a particular device.
define_conditional_multipurpose_modmap(lambda wm_class, device_name: device_name.startswith("Microsoft"), {
   # Left shift is open paren when pressed and released.
   # Left shift when held down.
   Key.LEFT_SHIFT: [Key.KPLEFTPAREN, Key.LEFT_SHIFT],

   # Right shift is close paren when pressed and released.
   # Right shift when held down.
   Key.RIGHT_SHIFT: [Key.KPRIGHTPAREN, Key.RIGHT_SHIFT]
})


# Keybindings for Firefox/Chrome
define_keymap(re.compile("Firefox|Google-chrome"), {
    # Ctrl+Alt+j/k to switch next/previous tab
    K("LC-M-j"): K("C-TAB"),
    K("LC-M-k"): K("C-Shift-TAB"),
    # Type C-j to focus to the content
    K("LC-j"): K("C-f6"),
    # very naive "Edit in editor" feature (just an example)
    K("LC-o"): [K("C-a"), K("C-c"), launch(["gedit"]), sleep(0.5), K("C-v")]
}, "Firefox and Chrome")

# Keybindings for Zeal https://github.com/zealdocs/zeal/
define_keymap(re.compile("Zeal"), {
    # Ctrl+s to focus search area
    K("LC-s"): K("C-k"),
}, "Zeal")

# Emacs-like keybindings in non-Emacs applications
define_keymap(lambda wm_class: wm_class not in ("Emacs", "URxvt", "fcitx", "tilix", "Tilix"), {
    # Cursor
    K("LC-b"): with_mark(K("left")),
    K("LC-f"): with_mark(K("right")),
    K("LC-p"): with_mark(K("up")),
    K("LC-n"): with_mark(K("down")),
    K("LC-h"): with_mark(K("backspace")),
    # Forward/Backward word
    K("M-b"): with_mark(K("C-left")),
    K("M-f"): with_mark(K("C-right")),
    # Beginning/End of line
    K("LC-a"): with_mark(K("home")),
    K("LC-e"): with_mark(K("end")),
    # Page up/down
    K("LM-v"): with_mark(K("page_up")),
    K("LC-v"): with_mark(K("page_down")),
    # Beginning/End of file
    K("LM-Shift-comma"): with_mark(K("C-home")),
    K("M-Shift-dot"): with_mark(K("C-end")),
    # Newline
    K("LC-m"): K("enter"),
    K("LC-j"): K("enter"),
    K("LC-o"): [K("enter"), K("left")],
    # Copy
    K("LC-w"): [K("C-x"), set_mark(False)],
    K("LM-w"): [K("C-c"), set_mark(False)],
    K("LC-y"): [K("C-v"), set_mark(False)],
    # Delete
    K("LC-d"): [K("delete"), set_mark(False)],
    K("LM-d"): [K("C-delete"), set_mark(False)],
    # Kill line
    K("LC-k"): [K("Shift-end"), K("C-x"), set_mark(False)],
    # Undo
    K("LC-slash"): [K("C-z"), set_mark(False)],
    K("LC-Shift-ro"): K("C-z"),
    # Mark
    K("LC-space"): set_mark(True),
    K("LC-M-space"): with_or_set_mark(K("C-right")),
    # Search
    K("LC-s"): K("F3"),
    K("LC-r"): K("Shift-F3"),
    K("LM-Shift-key_5"): K("C-h"),
    # Cancel
    # K("LC-g"): [K("esc"), set_mark(False)],
    K("LC-g"): [set_mark(False), K("esc")],
    # Escape
    K("LC-q"): escape_next_key,
    # C-x YYY
    K("LC-x"): {
        # C-x h (select all)
        K("h"): [K("C-home"), K("C-a"), set_mark(True)],
        # C-x C-f (open)
        K("LC-f"): K("C-o"),
        # C-x C-s (save)
        K("LC-s"): K("C-s"),
        # C-x k (kill tab)
        K("k"): K("C-f4"),
        # C-x C-c (exit)
        K("LC-c"): K("C-q"),
        # cancel
        K("LC-g"): pass_through_key,
        # C-x u (undo)
        K("u"): [K("C-z"), set_mark(False)],
    }
}, "Emacs-like keys")
