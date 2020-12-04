import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W

import XMonad.Util.EZConfig


--------------------------------------------------------------------------- }}}
-- local variables                                                          {{{
-------------------------------------------------------------------------------

myWorkspaces = map show [1..5 ::Int]
modm = mod4Mask

-- Color Setting
colorBlue      = "#868bae"
colorGreen     = "#00d700"
colorRed       = "#ff005f"
colorGray      = "#666666"
colorWhite     = "#bdbdbd"
colorNormalbg  = "#1c1c1c"
colorfg        = "#a8b6b8"

-- Border width
borderwidth = 3

-- Border color
mynormalBorderColor  = "#cccccc"
myfocusedBorderColor = "#00bbff"

--------------------------------------------------------------------------- }}}
-- main                                                                     {{{
-------------------------------------------------------------------------------

main = do
  h <- spawnPipe "xmobar"
  xmonad $ ewmh $ docks def
      { terminal = "tilix"
      , borderWidth = borderwidth
      , focusFollowsMouse  = True
      , normalBorderColor  = mynormalBorderColor
      , focusedBorderColor = myfocusedBorderColor
      , workspaces        = myWorkspaces
      , startupHook = myStartupHook
      , logHook = myLogHook h
      , layoutHook = avoidStruts mylayouthook
      }


myLogHook h =
    dynamicLogWithPP
        xmobarPP { ppOutput = hPutStrLn h
                 , ppCurrent = xmobarColor "#FF9F1C" "#1A1B41" . pad . wrap "[" "]"
                 , ppTitle = xmobarColor "#1A1B41" "#C2E7DA" . shorten 50 . pad
                 }

myStartupHook = do
    -- spawn "feh --bg-scale ~/Downloads/catalina001.jpg"
    spawn "xcompmgr"
    -- spawn "sudo xkeysnail ~/config.py"
    spawn "unity-settings-daemon"

mylayouthook =
  mytall ||| mymirror ||| myfull ||| noBorders (tabbed shrinkText myTabConfig)
  where mytall   =  Tall 1 0.03 0.5
        mymirror =  Mirror mytall
        myfull   =  Full

myTabConfig = def { -- activeColor = "#556064"
                    activeColor = "#005FFF"
                  , inactiveColor = "#2F3D44"
                  , urgentColor = "#FDF6E3"
                  , activeBorderColor = "#454948"
                  , inactiveBorderColor = "#454948"
                  , urgentBorderColor = "#268BD2"
                  , activeTextColor = "#80FFF9"
                  , inactiveTextColor = "#1ABC9C"
                  , urgentTextColor = "#1ABC9C"
                  , fontName = "xft:Noto Sans CJK JP:size=10:antialias=true"
                  }
