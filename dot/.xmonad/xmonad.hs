-- default desktop configuration for Fedora

import System.Posix.Env (getEnv)
import Data.Maybe (maybe)
import qualified Data.Map as M

import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce

import XMonad.Layout.Tabbed
import XMonad.Layout.TabBarDecoration
import XMonad.Layout.SimpleDecoration
import XMonad.Layout.NoFrillsDecoration
import XMonad.Util.Themes

-- myLayout = Tiled ||| tabbed shrinkText defaultTheme ||| Accordion ||| tabbed shrinkText defaultTheme ||| simpleTabbed ||| tabbed ||| Full ||| addTabs ||| tabbed shrinkText (theme donaldTheme) ||| (Tall 1 (3/100) (1/2))
myLayout = noFrillsDeco shrinkText defaultTheme (layoutHook defaultConfig)

main = do
	session <- getEnv "DESKTOP_SESSION"
	-- xmonad  defaultConfig
	let foundconfig = maybe desktopConfig desktop session
	xmonad foundconfig
		{ modMask = mod4Mask
		, terminal="gnome-terminal --hide-menubar"
		-- , terminal="mate-terminal --show-menubar"
		-- , terminal = "/usr/bin/urxvt"
		, layoutHook = myLayout
		, keys = myKeys <+> keys foundconfig
		}
	where
		myKeys (XConfig {modMask = modm}) = M.fromList $
			[ ((modm, xK_f), spawn "firefox -P default")
			, ((modm, xK_f), spawn "libreoffice --writer")
			]

desktop "gnome" = gnomeConfig
desktop "kde" = kde4Config
desktop "xfce" = xfceConfig
desktop "xmonad-mate" = gnomeConfig
desktop "xmonad-gnome" = gnomeConfig
desktop _ = desktopConfig
