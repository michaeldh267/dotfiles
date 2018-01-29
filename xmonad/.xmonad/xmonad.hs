import XMonad
import XMonad.Config.Desktop

main = xmonad desktopConfig
	{ 
	terminal = "terminator",
	modMask = mod4Mask,
	borderWidth = 1,
	focusedBorderColor = "#00ff00",
	normalBorderColor = "#ff00ff"
 }
