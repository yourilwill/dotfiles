import XMonad
import XMonad.Hooks.DynamicLog

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

main = xmonad =<< xmobar defaultConfig
    { terminal = "tilix"
    , borderWidth = borderwidth
    , focusFollowsMouse  = True
    , normalBorderColor  = mynormalBorderColor
    , focusedBorderColor = myfocusedBorderColor
    , workspaces        = myWorkspaces
    , startupHook = myStartupHook
    }

myStartupHook = do
    spawn "feh --bg-scale ~/Downloads/catalina001.jpg"
    spawn "xcompmgr"
