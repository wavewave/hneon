{-# LANGUAGE ForeignFunctionInterface #-}

#include <bindings.dsl.h>
#include <sys/types.h>

module Network.HTTP.Neon.Utils.Internal where
#strict_import 

#include "neon/ne_utils.h"

#starttype ne_status
#field major_version , CInt 
#field minor_version , CInt 
#field code , CInt
#field klass , CInt 
#field reason_phrase , Ptr CChar
#stoptype
