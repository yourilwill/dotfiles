import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks

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
      , layoutHook = avoidStruts $ layoutHook def
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
    spawn "sudo xkeysnail ~/config.py"
    spawn "unity-settings-daemon"
