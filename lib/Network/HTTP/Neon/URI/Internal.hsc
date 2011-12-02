{-# LANGUAGE ForeignFunctionInterface #-}

#include <bindings.dsl.h>

module Network.HTTP.Neon.URI.Internal where
#strict_import 

#include "neon/ne_uri.h"

#starttype ne_uri 
#field scheme , CString 
#field host , CString 
#field userinfo , CString 
#field port , CUInt
#field path , CString 
#field query , CString 
#field fragment , CString 
#stoptype 

