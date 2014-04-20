-- Running on XMonad 0.11 with XMobar 0.20.1 on Slackware 14.1
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO
import XMonad.Layout
import XMonad.Layout.NoBorders

main = do
  xmproc <- spawnPipe "/home/myk/.cabal/bin/xmobar /home/myk/.xmobarrc"

  xmonad $ defaultConfig 
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

myStartupHook = do
--	spawn "xsetroot -cursor_name left_ptr"
	spawn "pkill xfsettingsd; xfsettingsd"
