import System.IO
import System.Process
import System.Directory
import Graphics.UI.Gtk

main :: IO ()
main = do
    initGUI
    builder <- builderNew
    builderAddFromFile builder "fortune-x.glade"

    mainWindow <- builderGetObject builder castToWindow "mainWindow"
    textView <- builderGetObject builder castToTextView "textView"
    textBuffer <- builderGetObject builder castToTextBuffer "textBuffer"
    buttonGet <- builderGetObject builder castToButton "buttonGet"
    buttonSave <- builderGetObject builder castToButton "buttonSave"

    textViewSetBuffer textView textBuffer
    onClicked buttonGet  $ getFortune textBuffer
    onReleased buttonGet $ widgetSetSensitivity buttonSave True
    onClicked buttonSave $ saveFortune textBuffer
    onDestroy mainWindow mainQuit
    widgetShowAll mainWindow
    mainGUI

getFortune :: (TextBufferClass self) => self -> IO ()
getFortune tbf = do
    fortune <- readProcess "fortune" [] ""
    textBufferSetText tbf fortune

saveFortune :: (TextBufferClass self) => self -> IO ()
saveFortune tbf = do
    start <- textBufferGetStartIter tbf
    end <- textBufferGetEndIter tbf
    fortune <- textBufferGetText tbf start end False

    existP <- doesDirectoryExist "fortunes"
    _ <- if existP then return () else callCommand "mkdir fortunes"

    nameEnd <- textBufferGetStartIter tbf
    textIterForwardWordEnds nameEnd 3
    filename <- textBufferGetText tbf start nameEnd False
    writeFile ("fortunes/" ++ filename ++ "...") fortune
