import Graphics.UI.Gtk
import Graphics.UI.Gtk.Builder

main = do
    initGUI
    builder <- builderNew
    builderAddFromFile builder "fortune-x.glade"
    mainWindow <- builderGetObject builder castToWindow "mainWindow"
    textView <- builderGetObject builder castToTextView "textView"
    buttonFortune <- builderGetObject builder castToButton "buttonFortune"
    buttonSave <- builderGetObject builder castToButton "buttonSave"
    onClicked buttonFortune mainQuit
    onDestroy mainWindow mainQuit
    widgetShowAll mainWindow
    mainGUI