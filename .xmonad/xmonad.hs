import XMonad
import XMonad.Prompt
import XMonad.Prompt.Shell
import qualified XMonad.Actions.Search as S
import XMonad.Actions.Search
import qualified Data.Map as M
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import System.IO

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
   [  ((modMask,  xK_p), spawn "dmenu_run -b -nb '#000' -nf '#fff' -sb '#fff' -sf '#000'")
   ]


-- The main function
main = do
   xmproc <- spawnPipe "xmobar"
   xmonad $ defaultConfig
     {  layoutHook            = avoidStruts $ layoutHook defaultConfig
      ,  logHook              = dynamicLogWithPP $ xmobarPP
                                 {  ppOutput = hPutStrLn xmproc
                                 ,  ppTitle = xmobarColor "green" "" . shorten 50
                                 }
      ,  manageHook           = myManageHooks
      ,  modMask              = mod4Mask
      ,  terminal             = "gnome-terminal"
      ,  focusedBorderColor   = "#FFFFFF"
      ,  normalBorderColor    = "#000000"
      ,  keys                 = \c -> myKeys c `M.union` keys defaultConfig c
      }

myManageHooks = composeAll
   [ isFullscreen --> doFullFloat
   ]
