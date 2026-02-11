import XMonad
import XMonad.Util.EZConfig -- (additionalKeysP)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar ~/.config/xmobar/xmobarrc" (pure def)) defToggleStrutsKey
     $ myConfig

myConfig = def
  { modMask = mod4Mask
  } `additionalKeysP`
  myKeys

myKeys =
  [ ("M-d",                    spawn "dmenu_run")
  , ("<XF86AudioRaiseVolume>", spawn "pamixer -i 5")
  , ("<XF86AudioLowerVolume>", spawn "pamixer -d 5")
  , ("<XF86AudioMute>",        spawn "pamixer -t")
  ]
