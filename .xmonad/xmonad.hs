import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.ManageDocks
import System.IO

-- The main function
main = do
   xmproc <- spawnPipe "xmobar"
   xmonad $ defaultConfig
      {  layoutHook           = avoidStruts $ layoutHook defaultConfig
      ,  logHook              = dynamicLogWithPP $ xmobarPP
                                 {  ppOutput = hPutStrLn xmproc
                                 ,  ppTitle = xmobarColor "green" "" . shorten 50
                                 }
      ,  terminal             = "gnome-terminal"
      ,  focusedBorderColor   = "#FFFFFF"
      ,  normalBorderColor    = "#000000"
      }
