import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders (smartBorders)

main = xmonad desktopConfig { 
	terminal = myTerminal,
        modMask = mod4Mask,
        borderWidth = 1,
        focusedBorderColor = "#00ff00",
        normalBorderColor = "#ff00ff",
        layoutHook = smartBorders $ myLayout,
	manageHook = myManageHook <+> manageHook desktopConfig
}

myTerminal = "terminator"

myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled = Tall nmaster delta ratio
      where
        nmaster = 1
        delta = 3/100
        ratio = 3/5

myManageHook = composeAll
	[ className =? "Yakuake" --> doFloat,
	manageDocks ]
