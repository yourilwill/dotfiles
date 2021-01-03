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

-- myWorkspaces = map show [1..5 ::Int]
---WORKSPACES
xmobarEscape = concatMap doubleLts
  where
        doubleLts '<' = "<<"
        doubleLts x   = [x]

myWorkspaces :: [String]
myWorkspaces = clickable . (map xmobarEscape)
               $ ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  where
        clickable l = [ "<action=xdotool key alt+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
                      (i,ws) <- zip [1..9] l,
                      let n = i ]
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
-- mynormalBorderColor  = "#cccccc"
mynormalBorderColor  = "#292d3e"
-- myfocusedBorderColor = "#00bbff"
myfocusedBorderColor = "#6666ff"

--------------------------------------------------------------------------- }}}
-- main                                                                     {{{
-------------------------------------------------------------------------------

main = do
  h <- spawnPipe "~/.local/bin/xmobar"
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
                 , ppCurrent = xmobarColor "#FF9F1C" "#1A1B41" . wrap "[" "]"
                 , ppVisible = xmobarColor "#c3e88d" ""
                 , ppHidden = xmobarColor "#82AAFF" "" .wrap "*" ""
                 , ppHiddenNoWindows = xmobarColor "#F07178" ""
                 , ppTitle = xmobarColor "#d0d0d0" "" . shorten 60
                 , ppSep = "<fc=#666666> | </fc>"
                 , ppUrgent = xmobarColor "#C45500" "" . wrap "|" "|"
                 }

myStartupHook = do
    -- spawn "unity-settings-daemon"
    spawn "xcompmgr"
    -- spawn "sudo xkeysnail ~/config.py"
    spawn "feh --bg-scale ~/Downloads/catalina001.jpg"

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
