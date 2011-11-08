module Main where

import System.Console.CmdArgs

import Network.HTTP.Neon.ProgType
import Network.HTTP.Neon.Command

main :: IO () 
main = do 
  putStrLn "hneon"
  param <- cmdArgs mode

  commandLineProcess param