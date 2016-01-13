-- changes a little from http://www.umiacs.umd.edu/~hal/docs/daume02yaht.pdf chapter 5.2

module Main
  where
import System.IO

main = do
  doLoop

doLoop :: IO ()
doLoop = do
  putStrLn "Ener a command rFN or wFN or q to quit:"
  command <- getLine
  case command of
    'q': _ -> return ()
    'r':filename -> do putStrLn $ "Reading " ++ filename
                       doRead filename
                       doLoop
    'w':filename -> do putStrLn $ "Writing " ++ filename
                       doWrite filename
                       doLoop
    _            -> doLoop


doWrite :: FilePath -> IO ()
doWrite fp = do
  putStrLn $ "Enter Text to go into the file:"
  getLine >>= (\c -> do h <- openFile fp WriteMode
                        hPutStrLn h c
                        hClose h)

doRead :: FilePath -> IO ()
doRead fp = do
  openFile fp ReadMode >>= (\h -> do contents <- hGetContents h
                                     putStrLn (take 100 contents)
                                     hClose h)

