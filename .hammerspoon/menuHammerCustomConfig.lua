---------------------
--General Config
---------------------

-- If enabled, the menus will appear over full screen applications.
-- However, the Hammerspoon dock icon will also be disabled (required for fullscreen).
menuShowInFullscreen = false

-- If enabled, a menu bar item will appear that shows what menu is currently being displayed or
-- "idle" if no menu is open.
showMenuBarItem = true

-- The number of seconds that a hotkey alert will stay on screen.
-- 0 = alerts are disabled.
hs.hotkey.alertDuration = 0

-- Show no titles for Hammerspoon windows.
hs.hints.showTitleThresh = 0

-- Disable animations
hs.window.animationDuration = 0

-- Editor path
menuTextEditor = "/usr/local/bin/emacsclient -c"

-- Location of the askpass executable.  Required for running script with admin privs.
askpassLocation = "/usr/local/bin/ssh-askpass"

--------------------
--Menu Options
--------------------

-- The number of columns to display in the menus.  Setting this too high or too low will
-- probably have odd results.
menuNumberOfColumns = 5

-- The minimum number of rows to show in menus
menuMinNumberOfRows = 2

-- The height of menu rows in pixels
menuRowHeight = 50

-- The padding to apply to each side of the menu
menuOuterPadding = 50

--------------------
--Font Options
--------------------

-- The font to apply to menu items.
menuItemFont = "FiraCode-Retina"

-- The font size to apply to menu items.
menuItemFontSize = 14

-- The text alignment to apply to menu items.
menuItemTextAlign = "left"

-------------------
--Color Options
-------------------

menuItemColors = {
    -- The default colors to use.
    default = {
        background = "#2E3440",
        text = "#aaaaaa"
    },
    -- The colors to use for the Exit menu item
    exit = {
        background = "#2E3440",
        text = "#B04B57"
    },
    -- The colors to use for the Back menu items
    back = {
        background = "#2E3440",
        text = "#A4799D"
    },
    -- The colors to use for menu menu items
    submenu = {
        background = "#2E3440",
        text = "#aaaaaa"
    },
    -- The colors to use for navigation menu items
    navigation = {
        background = "#2E3440",
        text = "#77B3C5"
    },
    -- The colors to use for empty menu items
    empty = {
        background = "#2E3440",
        text = "#aaaaaa"
    },
    -- The colors to use for action menu items
    action = {
        background = "#2E3440",
        text = "#EBCB8B"
    },
    menuBarActive = {
        background = "#2E3440",
        text = "#aaaaaa"
    },
    menuBarIdle = {
        background = "#2E3440",
        text = "#aaaaaa"
    },
    display = {
        background = "#2E3440",
        text = "#aaaaaa"
    }
}

-----------------------
--Menu Bar Options
-----------------------

-- Key bindings

-- The hotkey that will enable/disable MenuHammer
menuHammerToggleKey = {{"cmd", "shift", "ctrl"}, "Q"}

-- Menu Prefixes
menuItemPrefix = {
    action = '↩',
    submenu = '→',
    back = '⌫',
    exit = '⎋',
    navigation = '↩',
    empty = '',
    display = '',
}

-- Menu item separator
menuKeyItemSeparator = " "

--------------------------------------------------------------------------------
-- Menus
--------------------------------------------------------------------------------

--Main Yabai Menu
local yabaiMenu = "yabaiMenu"

--Yabai Focus Menu
local yabaiFocus = "yabaiFocus"

--Yabai Move Menu
local yabaiMove = "yabaiMove"

--Yabai Swap Menu
local yabaiSwap = "yabaiSwap"

--Main Yabai Menu
local yabaiResize = "yabaiResize"

--Main Yabai Menu
local yabaiInsert = "yabaiInsert"

--Main Yabai Menu
local yabaiStack = "yabaiStack"

--Main Yabai Menu
local yabaiHalves = "yabaiHalves"

--Main Yabai Menu
local yabaiQuarters = "yabaiQuarters"

--Main Yabai Menu
local yabaiPadding = "yabaiPadding"

--Main Yabai Menu
local yabaiSpecific = "yabaiSpecific"

--Main Yabai Menu
local yabaiGeneral = "yabaiGeneral"

--Main Yabai Menu
local yabaiMisc = "yabaiMisc"

menuHammerMenuList = {
  [yabaiMenu] = {
    parentMenu = nil,
    menuHotkey = {{'ctrl', 'alt', 'cmd', 'shift'}, 'a'},
    menuItems =  {
      {cons.cat.navigation, nil, nil, "1 = ⌃ + ⌥"},
      {cons.cat.navigation, nil, nil, "2 = ⌃ + ⇧"},
      {cons.cat.navigation, nil, nil, "3 = ⌃ + ⌥ + ⇧"},
      {cons.cat.navigation, nil, nil, ""},
      {cons.cat.navigation, nil, nil, ""},
      {cons.cat.submenu, '', 'h', 'Focus', {
        {cons.act.menu, "yabaiFocus"}
      }},
      {cons.cat.submenu, '', 'j', "Move", {
        {cons.act.menu, 'yabaiMove'}
      }},
      {cons.cat.submenu, '', 'k', 'Swap', {
        {cons.act.menu, 'yabaiSwap'}
      }},
      {cons.cat.submenu, '', 'l', "Resize", {
        {cons.act.menu, 'yabaiResize'}
      }},
      {cons.cat.submenu, '', 'u', "Insert", {
        {cons.act.menu, 'yabaiInsert'}
      }},
      {cons.cat.submenu, '', 'i', 'Stack', {
        {cons.act.menu, 'yabaiStack'}
      }},
      {cons.cat.submenu, '', 'o', "Halves", {
        {cons.act.menu, 'yabaiHalves'}
      }},
      {cons.cat.submenu, '', 'p', "Quarters", {
        {cons.act.menu, 'yabaiQuarters'}
      }},
      {cons.cat.submenu, '', 'v', "Padding", {
        {cons.act.menu, 'yabaiPadding'}
      }},
      {cons.cat.submenu, '', 'b', "General Commands", {
        {cons.act.menu, 'yabaiGeneral'}
      }},
      {cons.cat.submenu, '', 'n', "Specific Commands", {
        {cons.act.menu, 'yabaiSpecific'}
      }},
      {cons.cat.submenu, '', 'm', "Misc", {
        {cons.act.menu, 'yabaiMisc'}
      }},
      {cons.cat.action, '', 'delete', "<3-R> Reload Yabai", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'r'},
      }},
      {cons.cat.action, '', 'return', "<3-↩> Open Terminal", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'return'},
      }}
    }
  },
  [yabaiFocus] = {
    parentMenu = yabaiMenu,
    menuHotkey = nil,
    menuItems = {
      {cons.cat.action, '', 'H', "<1-H> Focus West", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'h'},
      }},
      {cons.cat.action, '', 'J', "<1-J> Focus South", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'j'},
      }},
      {cons.cat.action, '', 'K', "<1-K> Focus North", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'k'},
      }},
      {cons.cat.action, '', 'L', "<1-L> Focus East", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'l'},
      }},
    }
  },
  [yabaiMove] = {
    parentMenu = yabaiMenu,
    menuHotkey = nil,
    menuItems = {
      {cons.cat.action, '', 'H', "<2-H> Move West", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'h'},
      }},
      {cons.cat.action, '', 'J', "<2-J> Move South", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'j'},
      }},
      {cons.cat.action, '', 'K', "<2-K> Move North", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'k'},
      }},
      {cons.cat.action, '', 'L', "<2-L> Move East", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'l'},
      }},
    }
  },
  [yabaiSwap] = {
    parentMenu = yabaiMenu,
    menuHotkey = nil,
    menuItems = {
      {cons.cat.action, '', 'H', "<3-H> Swap West", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'h'},
      }},
      {cons.cat.action, '', 'J', "<3-J> Swap South", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'j'},
      }},
      {cons.cat.action, '', 'K', "<3-K> Swap North", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'k'},
      }},
      {cons.cat.action, '', 'L', "<3-L> Swap East", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'l'},
      }},
    }
  },
  [yabaiResize] = {
    parentMenu = yabaiMenu,
    menuHotkey = nil,
    menuItems = {
      {cons.cat.action, '', 'H', "<1-U> Resize West", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'u'},
      }},
      {cons.cat.action, '', 'J', "<1-I> Resize South", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'i'},
      }},
      {cons.cat.action, '', 'K', "<1-O> Resize North", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'o'},
      }},
      {cons.cat.action, '', 'L', "<1-P> Resize East", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'p'},
      }},
    }
  },
  [yabaiInsert] = {
    parentMenu = yabaiMenu,
    menuHotkey = nil,
    menuItems = {
      {cons.cat.action, '', 'H', "<2-U> Insert West", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'u'},
      }},
      {cons.cat.action, '', 'J', "<2-I> Insert South", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'i'},
      }},
      {cons.cat.action, '', 'K', "<2-O> Insert North", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'o'},
      }},
      {cons.cat.action, '', 'L', "<2-P> Insert East", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'p'},
      }},
    }
  },
  [yabaiStack] = {
    parentMenu = yabaiMenu,
    menuHotkey = nil,
    menuItems = {
      {cons.cat.action, '', 'H', "<1-V> Swap Previous", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'v'},
      }},
      {cons.cat.action, '', 'J', "<1-B> Focus Next", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'b'},
      }},
      {cons.cat.action, '', 'K', "<1-N> Focus Previous", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'n'},
      }},
      {cons.cat.action, '', 'L', "<1-M> Swap Next", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'm'},
      }},
    }
  },
  [yabaiHalves] = {
    parentMenu = yabaiMenu,
    menuHotkey = nil,
    menuItems = {
      {cons.cat.action, '', 'H', "<2-V> Fill Left Half", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'v'},
      }},
      {cons.cat.action, '', 'J', "<2-B> Fill Bottom Half", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'b'},
      }},
      {cons.cat.action, '', 'K', "<2-N> Fill Top Half", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'n'},
      }},
      {cons.cat.action, '', 'L', "<2-M> Fill Right Half", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'm'},
      }},
    }
  },
  [yabaiQuarters] = {
    parentMenu = yabaiMenu,
    menuHotkey = nil,
    menuItems = {
      {cons.cat.action, '', 'H', "<3-V> Fill Top-Left", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'v'},
      }},
      {cons.cat.action, '', 'J', "<3-B> Fill Top-Right", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'b'},
      }},
      {cons.cat.action, '', 'K', "<3-N> Fill Bottom-Right", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'n'},
      }},
      {cons.cat.action, '', 'L', "<3-M> Fill Bottom-Left", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'm'},
      }},
    }
  },
  [yabaiPadding] = {
    parentMenu = yabaiMenu,
    menuHotkey = nil,
    menuItems = {
      {cons.cat.action, '', 'H', "<1-0> Desktop Padding 0", {
      {cons.act.keycombo, {'ctrl', 'alt'}, '0'},
      }},
      {cons.cat.action, '', 'J', "<3-0> Desktop/Window Padding 0", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, '0'},
      }},
      {cons.cat.action, '', 'K', "<2-0> Window Padding 0", {
      {cons.act.keycombo, {'ctrl', 'shift'}, '0'},
      }},
      {cons.cat.action, '', 'U', "<1-+> Increase Desktop Padding", {
      {cons.act.keycombo, {'ctrl', 'alt'}, '+'},
      }},
      {cons.cat.action, '', 'I', "<3-+> Increase Desktop/Window Padding", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, '+'},
      }},
      {cons.cat.action, '', 'O', "<2-+> Increase Window Padding", {
      {cons.act.keycombo, {'ctrl', 'shift'}, '+'},
      }},
      {cons.cat.action, '', 'V', "<1--> Decrease Desktop Padding", {
      {cons.act.keycombo, {'ctrl', 'alt'}, '-'},
      }},
      {cons.cat.action, '', 'B', "<3--> Decrease Desktop/Window Padding", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, '-'},
      }},
      {cons.cat.action, '', 'N', "<2--> Decrease Window Padding", {
      {cons.act.keycombo, {'ctrl', 'shift'}, '-'},
      }},
     }
  },
  [yabaiSpecific] = {
    parentMenu = yabaiMenu,
    menuHotkey = nil,
    menuItems = {
      {cons.cat.action, '', 'H', "Move West", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'h'},
      }},
      {cons.cat.action, '', 'J', "Move South", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'j'},
      }},
      {cons.cat.action, '', 'K', "Move North", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'k'},
      }},
      {cons.cat.action, '', 'L', "Move East", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'l'},
      }},
    }
  },
  [yabaiGeneral] = {
    parentMenu = yabaiMenu,
    menuHotkey = nil,
    menuItems = {
      {cons.cat.action, '', 'H', "<1-T> New Space", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 't'},
      }},
      {cons.cat.action, '', 'J', "<2-T> New Space With Window", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 't'},
      }},
      {cons.cat.action, '', 'K', "<1-T> Destroy Space", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'w'},
      }},
      {cons.cat.action, '', 'I', "<⌃-←> Focus Left Space", {
      {cons.act.keycombo, {'ctrl'}, 'left'},
      }},
      {cons.cat.action, '', 'O', "<⌃-→> Focus Right Space", {
      {cons.act.keycombo, {'ctrl'}, 'right'},
      }},
      {cons.cat.action, '', 'U', "<2-←> Move Space Left", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'left'},
      }},
      {cons.cat.action, '', 'P', "<2-→> Move Space Right", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'right'},
      }},
      {cons.cat.action, '', 'L', "<1-⇥> Focus Recent Space", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'tab'},
      }},
      {cons.cat.action, '', ';', "<⌃-⇥> Focus Recent Display", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'tab'},
      }},
      {cons.cat.action, '', 'V', "<3-←> Window To Prev Display", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'left'},
      }},
      {cons.cat.action, '', 'M', "<3-→> Window To Next Display", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'right'},
      }},
      {cons.cat.action, '', 'B', "<⌥-⇥> Focus Next Display", {
      {cons.act.keycombo, {'alt'}, 'tab'},
      }},
      {cons.cat.action, '', 'N', "<⌥⇧-⇥> Focus Previous Display", {
      {cons.act.keycombo, {'alt', 'shift'}, 'tab'},
      }},
    }
  },
  [yabaiMisc] = {
    parentMenu = yabaiMenu,
    menuHotkey = nil,
    menuItems = {
      {cons.cat.action, '', 'H', "<1-⌫> Toggle Float", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'delete'},
      }},
      {cons.cat.action, '', 'J', "<2-⌫> Fill Screen", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'delete'},
      }},
      {cons.cat.action, '', 'K', "<3-⌫> Space Management Type", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'delete'},
      }},
      {cons.cat.action, '', 'U', "<1-↩> Rotate Tree CW", {
      {cons.act.keycombo, {'ctrl', 'alt'}, 'return'},
      }},
      {cons.cat.action, '', 'I', "<2-↩> Rotate Tree CCW", {
      {cons.act.keycombo, {'ctrl', 'shift'}, 'return'},
      }},
      {cons.cat.action, '', 'O', "<3-↩> Balance Windows", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, 'return'},
      }},
      {cons.cat.action, '', 'P', "<1-\\> Toggle Split Type", {
      {cons.act.keycombo, {'ctrl', 'alt'}, '\\'},
      }},
      {cons.cat.action, '', 'M', "<2-\\> Toggle Parent Zoom", {
      {cons.act.keycombo, {'ctrl', 'shift'}, '\\'},
      }},
      {cons.cat.action, '', 'L', "<3-\\> Toggle Picture-In-Picture", {
      {cons.act.keycombo, {'ctrl', 'alt', 'shift'}, '\\'},
      }},
      {cons.cat.action, '', ';', "<1-;> Zoom Window", {
      {cons.act.keycombo, {'ctrl', 'alt'}, ';'},
      }},
      {cons.cat.action, '', ',', "<1-[> Mirror Y-Axis", {
      {cons.act.keycombo, {'ctrl', 'alt'}, '['},
      }},
      {cons.cat.action, '', '.', "<1-]> Mirror X-Axis", {
      {cons.act.keycombo, {'ctrl', 'alt'}, ']'},
      }},
      {cons.cat.action, '', 'Y', "<2-[> Swap Largest Window", {
      {cons.act.keycombo, {'ctrl', 'shift'}, '['},
      }},
      {cons.cat.action, '', 'G', "<2-]> Swap Smallest Window", {
      {cons.act.keycombo, {'ctrl', 'shift'}, ']'},
      }},
    },
  }
}
