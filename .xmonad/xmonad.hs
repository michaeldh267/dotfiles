-- Running on XMonad 0.11 with XMobar 0.20.1 on Slackware 14.1
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.UrgencyHook
import System.IO
import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.StackSet as W (focusUp, focusDown)
import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)
import XMonad.Actions.CycleWS




main = do
  xmproc <- spawnPipe "/home/myk/.cabal/bin/xmobar /home/myk/.xmobarrc"

  xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
       { modMask = mod4Mask
       , terminal = "xfce4-terminal"
       , borderWidth = 2
       , manageHook = manageDocks <+>  manageHook defaultConfig
       , layoutHook = smartBorders $ avoidStruts  $  layoutHook defaultConfig
       , logHook = dynamicLogWithPP $ xmobarPP
                   { ppOutput = hPutStrLn xmproc
                   , ppTitle = xmobarColor "green" "" . shorten 50
                   }
       , startupHook = myStartupHook
       }
       `additionalKeys` [((mod4Mask, xK_r), spawn "dmenu_run -fn '-xos4-terminus-bold-r-normal-*-16-*-*-*-*-*-*-*' -nb 'Black' -nf 'grey60' -sb 'grey20' -sf 'Gold'")]
       `additionalKeysP` [ ("<XF86AudioRaiseVolume>", spawn "amixer sset Master 5%+")
                         , ("<XF86AudioLowerVolume>", spawn "amixer sset Master 5%-")
                         -- Set up our sound buttons
                        
                         , ("M-n", windows W.focusUp)
                         , ("M-p", windows W.focusDown)
                         , ("M-o", toggleWS)
                         ]

myStartupHook = do
--	spawn "xsetroot -cursor_name left_ptr"
	spawn "pkill xfsettingsd; xfsettingsd"
