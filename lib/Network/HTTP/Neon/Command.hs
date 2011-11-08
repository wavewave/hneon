module Network.HTTP.Neon.Command where

import Network.HTTP.Neon.Type
import Network.HTTP.Neon.Job

commandLineProcess :: Hneon -> IO ()
commandLineProcess Test = do 
  putStrLn "test called"
  startJob
