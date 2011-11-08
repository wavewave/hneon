{-# LANGUAGE DeriveDataTypeable #-}

module Network.HTTP.Neon.ProgType where 

import System.Console.CmdArgs

data Hneon = Test 
              deriving (Show,Data,Typeable)

test :: Hneon
test = Test 

mode = modes [test]

