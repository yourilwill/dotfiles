import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Spacing
import XMonad.Layout.ResizeScreen
import XMonad.Layout.WindowNavigation
import XMonad.Layout.SubLayouts
import XMonad.Layout.Simplest
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile

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
    spawn "unity-settings-daemon"
    spawn "xcompmgr"
    -- spawn "sudo xkeysnail ~/config.py"
    -- spawn "feh --bg-scale ~/Downloads/catalina001.jpg"

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True
mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

-- myTabTheme = def { fontName            = "xft:Noto Sans CJK JP:size=10:antialias=true"
--                  , activeColor         = "#46d9ff"
--                  , inactiveColor       = "#313846"
--                  , activeBorderColor   = "#46d9ff"
--                  , inactiveBorderColor = "#282c34"
--                  , activeTextColor     = "#282c34"
--                  , inactiveTextColor   = "#d0d0d0"
--                  }

gap_tall = renamed [Replace "gap_tall"]
           $ windowNavigation
           -- $ subLayout [] (smartBorders Simplest)
           $ addTabs shrinkText myTabConfig
           $ mySpacing 8
           $ ResizableTall 1 (3/100) (1/2) []

mylayouthook =   gap_tall
             ||| mytall
             ||| mymirror
             ||| myfull
             ||| noBorders (tabbed shrinkText myTabConfig)
  where mytall   =  Tall 1 0.03 0.5
        mymirror =  Mirror mytall
        myfull   =  Full

myTabConfig = def {
                    activeColor = myfocusedBorderColor
                  , inactiveColor = mynormalBorderColor
                  -- , urgentColor = "#FDF6E3"
                  , activeBorderColor = myfocusedBorderColor
                  , inactiveBorderColor = mynormalBorderColor
                  -- , urgentBorderColor = "#268BD2"
                  , activeTextColor = "#80FFF9"
                  , inactiveTextColor = "#1ABC9C"
                  -- , urgentTextColor = "#1ABC9C"
                  , fontName = "xft:Noto Sans CJK JP:size=10:antialias=true"
                  }
