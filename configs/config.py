# -*- coding: utf-8 -*-

from xkeysnail.transform import *

define_timeout(1)

define_modmap(
    {
        Key.CAPSLOCK: Key.ESC,
        Key.ESC: Key.CAPSLOCK,
    },
)

define_multipurpose_modmap(
    {
        Key.SPACE: [Key.SPACE, Key.LEFT_META],
    },
)

