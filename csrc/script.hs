{-# LANGUAGE PackageImports, ScopedTypeVariables #-}

import System.FilePath
import System.Directory 
import System.IO

import Text.StringTemplate
import "HStringTemplateHelpersIW" Text.StringTemplate.Helpers

lst = 
  [ "ne_207.h"
  , "ne_basic.h"
  , "ne_locks.h"
  , "ne_request.h"
  , "ne_uri.h"
  , "ne_acl.h"
  , "ne_compress.h"
  , "ne_md5.h"
  , "ne_session.h"
  , "ne_utils.h"
  , "ne_acl3744.h"
  , "ne_dates.h"
  , "ne_pkcs11.h"
  , "ne_socket.h"
  , "ne_xml.h"
  , "ne_alloc.h"
  , "ne_defs.h"
  , "ne_props.h"
  , "ne_ssl.h"
  , "ne_xmlreq.h"
  , "ne_auth.h"
  , "ne_i18n.h"
  , "ne_redirect.h"
  , "ne_string.h" ] 

hshname str = ('h' : str) <.> "h"

hscname str = ('h' : str) <.> "c"

mkname str = drop 3 str  

makeCstr templates str =  
  let hnamestr = str <.> "h"
      hsnamestr = hshname str
      namestr = mkname str
      rstr = renderTemplateGroup 
              templates 
              [ ("hname" , hnamestr) 
              , ("hshname", hsnamestr)
              , ("name", namestr) ]
              "hnestub.c" 
  in rstr



main :: IO () 
main = do 
  let names = map (fst . splitExtension) lst
  mapM_ (putStrLn .  hshname) names 

  dir <- getCurrentDirectory 
  (templates :: STGroup String) <- directoryGroup dir 
  mapM_ putStrLn $ map (\x-> replicate 20 ' ' ++ "csrc/" ++ hscname x) $ names 
  
  --  mapM_ (\n->writeFile (hscname n) (makeCstr templates n)) names

  -- mapM_ (\n->writeFile (hshname n) "\n\n") names 

  

             

