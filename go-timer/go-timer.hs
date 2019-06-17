import System.IO
import System.Process
import System.Directory
import Graphics.UI.Gtk

main :: IO ()
main = do
    initGUI
    builder <- builderNew
    builderAddFromFile builder "go-timer.glade"

    mainWindow <- builderGetObject builder castToWindow "mainWindow"
    onDestroy mainWindow mainQuit
    widgetShowAll mainWindow
    mainGUI