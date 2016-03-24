# My Planck Keyboard Layout

The Planck is a 40% computer keyboard with an [ortholinear][olkb] layout
(the keys are arranged in columns rather than being staggered as on a traditional typewriter keyboard).
The keys are laid out in a 4 by 12 grid with a 2-unit wide spacebar on the bottom row (the so-called MIT layout), for a total of 47 keys.

The board's microcontroller is programmed through the free/libre [Quantum MK firmware][qmk], which allows for a great
deal of flexibility in implementing keyboard layouts. The keymap is organized into layers that can be switched between
by hold or tapping function keys.

[olkb]: http://ortholinearkeyboards.com/education
[qmk]: https://github.com/jackhumbert/qmk_firmware

## Base layer (Qwerty)

```
               ,-----------------------------------------------------------------------.
               | Tab | Q   | W   | E   | R   | T   | Y   | U   | I   | O   | P   | Fn5 | -- Tap for '
               |-----------------------------------------------------------------------|
Tap for Esc -- |Ctrl | A   | S   | D   | F   | G   | H   | J   | K   | L   |; Fn4|Ctrl | -- Tap for Enter
               |-----------------------------------------------------------------------|
  Tap for ( -- |Shift| Z   | X   | C   | V   | B   | N   | M   | ,   | .   | /   |Shift| -- Tap for )
               |-----------------------------------------------------------------------|
  Tap for [ -- | Fn3 |Hyper| Alt |Super| Fn1 |   Space   | Fn2 |Super| Alt |Hyper| Fn3 | -- Tap for ]
               `-----------------------------------------------------------------------'
                       /     /                                         /     /
  Tap for < > --------'---- / --------------------------------------- / ----'
    Tap for { } -----------'-----------------------------------------'
```

## Base layer (Colemak)

```
               ,-----------------------------------------------------------------------.
               |     | Q   | W   | F   | P   | G   | J   | L   | U   | Y   | ;   |     |
               |-----------------------------------------------------------------------|
               |     | A   | R   | S   | T   | D   | H   | N   | E   | I   |O Fn4|     |
               |-----------------------------------------------------------------------|
               |     | Z   | X   | C   | V   | B   | K   | M   |     |     |     |     |
               |-----------------------------------------------------------------------|
               |     |     |     |     |     |           |     |     |     |     |     |
               `-----------------------------------------------------------------------'
```

## Numeric layer

```
               ,-----------------------------------------------------------------------.
Application -- |D-Grv| F1  | F2  | F3  | F4  | F5  | F6  | F7  | F8  | F9  | F10 |     |
     window    |-----------------------------------------------------------------------|
   switcher    |     | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 0   |     |
               |-----------------------------------------------------------------------|
               |     | -   | =   | `   | \   | a   | b   | c   | d   | e   | f   |     |
               |-----------------------------------------------------------------------|
               |     |     |     |     |>> <<| Backspace |     |     |     |     |     |
               `-----------------------------------------------------------------------'
```

## Symbol layer

```
               ,-----------------------------------------------------------------------.
               |     | F11 | F12 | F13 | F14 | F15 | F16 | F17 | F18 | F19 | F20 |     |
               |-----------------------------------------------------------------------|
               |     | !   | @   | #   | $   | %   | ^   | &   | *   | '   | "   |     | \
               |-----------------------------------------------------------------------|  |-- Mostly shifted version
               |     | _   | +   | ~   | |   |     |ndash|mdash|     |     |     |     | /    of lower layer
               |-----------------------------------------------------------------------|
               |     |     |     |     |     |  Delete   |>> <<|     |     |     |     |
               `-----------------------------------------------------------------------'
```

## Directional navigation layer

```
        Large movements -----/```````````````````\   /```````````````````\----- Vim-style arrow keys
               ,-----------------------------------------------------------------------.
               |     |     |     |     |     |     |     |     |     |     |     |     |
               |-----------------------------------------------------------------------|
               |     |     |Home |PgUp |PgDn | End |Left |Down | Up  |Right|>> <<|     |
               |-----------------------------------------------------------------------|
               |     |     |     |     |     |     |     |     |     |     |     |     |
               |-----------------------------------------------------------------------|
               |     |     |     |     |     |           |     |     |     |     |     |
               `-----------------------------------------------------------------------'
```

## GUI (window management/mouse/media controls) layer

```
       Mouse keys -----/```````````````````\               /```````````````````\----- Window manager
               ,-----------------------------------------------------------------------.
               |     |Ms B2|Ms Up|Ms B1|Ms WD|     |     |Prev | TL  | Top | TR  |     |
               |-----------------------------------------------------------------------|
               |     |Ms L |Ms Dn|Ms R |Ms WU|     |     |Full |Left |Centr|Right|     |
               |-----------------------------------------------------------------------|
               |     |Ms WL|Ms B3|Ms WR|     |     |     |Next | BL  | Bot | BR  |     |
               |-----------------------------------------------------------------------|
               |>> <<|Prev |Play |Next |Brig-|   Sleep   |Brig+|Mute |Vol- |Vol+ |>> <<|
               `-----------------------------------------------------------------------'
                       \___ Media ___/   \___ Screen/sleep __/   \___ Volume __/
```

## Keyboard layer

```
               ,-----------------------------------------------------------------------.
   Firmware -- |     |Reset|Debug|     |     |     |     |     |     |     |     |>> <<|
               |-----------------------------------------------------------------------|
Set default -- |     |Qwert|Colem| ... |     |     |     |     |     |     |     |     |
      layer    |-----------------------------------------------------------------------|
               |     |     |     |     |     |     |     |     |     |     |     |     |
               |-----------------------------------------------------------------------|
               |     |     |     |     |LED- |  Toggle   |LED+ |     |     |     |     |
               `-----------------------------------------------------------------------'
                                         \___ LED controls __/
```

----------

You can find the latest version of my keymap file at <https://github.com/noahfrederick/dots/tree/master/planck>.