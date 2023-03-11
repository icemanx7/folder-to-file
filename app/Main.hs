module Main where

import Control.Monad (filterM)
import System.Directory (doesDirectoryExist, listDirectory)
import System.Directory.Internal.Prelude (for_)

newtype SourceDirectory = SourceDirectory String

getListOfDirectories :: SourceDirectory -> IO [FilePath]
getListOfDirectories (SourceDirectory srcDirectory) = do
  allFiles <- listDirectory srcDirectory
  filterM doesDirectoryExist allFiles

main :: IO ()
main = do
  res <- getListOfDirectories (SourceDirectory "./")
  for_ res putStrLn
