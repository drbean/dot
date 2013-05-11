-- default desktop configuration for Fedora

import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce

import XMonad.Layout.Tabbed
import XMonad.Layout.TabBarDecoration
import XMonad.Layout.SimpleDecoration
import XMonad.Layout.Accordion
import XMonad.Util.Themes

-- myLayout = Tiled ||| tabbed shrinkText defaultTheme ||| Accordion ||| tabbed shrinkText defaultTheme ||| simpleTabbed ||| tabbed ||| Full ||| addTabs ||| tabbed shrinkText (theme donaldTheme) ||| (Tall 1 (3/100) (1/2))
myLayout = simpleDeco shrinkText defaultTheme (layoutHook desktopConfig)

main = do
     session <- getEnv "DESKTOP_SESSION"
     -- xmonad  defaultConfig
     xmonad  ( maybe desktopConfig desktop session )
		{ modMask = mod4Mask
		, terminal="gnome-terminal --hide-menubar"
		-- , terminal = "/usr/bin/urxvt"
		, layoutHook = myLayout
		}

desktop "gnome" = gnomeConfig
desktop "kde" = kde4Config
desktop "xfce" = xfceConfig
desktop "xmonad-gnome" = gnomeConfig
desktop _ = desktopConfig

