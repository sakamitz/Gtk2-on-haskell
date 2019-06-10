<div align="center">
<h1>Gtk2 on Haskell</h1>
<p>
      <a href="https://github.com/sakamitz/Gtk2-on-haskell/releases"><img src="https://img.shields.io/badge/build-passing-brightgreen.svg" alt="Releases"></a>
      <a href="https://github.com/sakamitz/Gtk2-on-haskell/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-lightgrey.svg" alt="LICENSE"></a>
      <a href="https://wiki.haskell.org/Gtk2Hs"><img src="https://img.shields.io/badge/package-gtk2hs-informational.svg" alt="Dependency"></a>
</p>
</div>

# Brief

Some Gtk2 programs written in haskell with **Gtk2hs**

GUI are built with **Glade**

# Dependency

Hackage: gtk-0.15.2 (or >= 0.14.5)

[Glade 3.8](https://glade.gnome.org/)


# Note

You don't need hackage *glade*, because its functionality is now provided in gtk directly (as of version 2.12 of the gtk+ C lib) by the Graphics.UI.Gtk.Builder module. And more, its now a **LEGACY** hackage that can't get compiled on ghc >= 7.6
