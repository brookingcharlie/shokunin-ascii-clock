import Shokunin

main = do
  line <- getLine
  mapM putStrLn (outputLines line)
