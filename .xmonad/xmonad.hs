import qualified Data.Map as M
import System.IO

import XMonad
import XMonad.Actions.Navigation2D
import qualified XMonad.Actions.Search as S
import XMonad.Actions.Search
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run (spawnPipe, unsafeSpawn)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.LayoutScreens
import XMonad.Layout.Renamed
import XMonad.Layout.Spacing
import XMonad.Layout.TwoPane
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W

dmenu_cmd = "dmenu_run -b -nb '#000' -nf '#fff' -sb '#fff' -sf '#000'"

myLogHook h = dynamicLogWithPP $ def
    {   ppOutput = hPutStrLn h
    ,   ppTitle = xmobarColor "green" "" . shorten 100
    }

myManageHook = composeAll
   [ isFullscreen --> doFullFloat
   ] <+> manageDocks


-- avoidStruts adjusts the layout to prevent it from covering up statusbars and such
-- CutWordsLeft 2 removes "Spacing 2" from the name
myLayout = renamed [CutWordsLeft 2] $ avoidStruts $ spacing 4 $ bsp ||| tall ||| Full
    where tall = Tall 1 (3/100) (1/2)
          bsp = renamed [Replace "BSP"] emptyBSP

myKeys =
    [ ("M-p", 			 spawn dmenu_cmd)
    , ("M-S-<Space>",    layoutScreens 2 (TwoPane 0.5 0.5))
    , ("M-C-S-<Space>",  rescreen)
    , ("M-r",            sendMessage Rotate)
    , ("M-C-n",          sendMessage SelectNode)
    , ("M-S-n",          sendMessage MoveNode)
    , ("M-a",            sendMessage Balance)
    , ("M-S-a",          sendMessage Equalize)
    ]

myConfig p = def
	{  layoutHook           = myLayout
    ,  logHook              = myLogHook p
    ,  startupHook          = setWMName "LG3D"
    ,  manageHook           = myManageHook
    ,  modMask              = mod4Mask  -- <super> key
    ,  terminal             = "terminator"
    ,  focusedBorderColor   = "#FFFFFF"
    ,  normalBorderColor    = "#000000"
 } `additionalKeysP`  myKeys


nav2DConfig = def {
	layoutNavigation = [("BSP", centerNavigation)]
    }

nav2D = navigation2DP nav2DConfig
                      -- (up, left, down, right)
					  ("k", "h", "j", "l")
					  [("M-M1-",   windowGo  ),
					  ("M-M1-S-", windowSwap)]
					  False

-- The main function
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ nav2D $ myConfig xmproc
