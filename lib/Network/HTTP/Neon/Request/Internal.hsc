{-# LANGUAGE ForeignFunctionInterface #-}

#include <bindings.dsl.h>

module Network.HTTP.Neon.Request.Internal where
#strict_import 

import Network.HTTP.Neon.Utils.Internal
import Network.HTTP.Neon.Session.Internal

#include "neon/ne_request.h"

#num NE_OK
#num NE_ERROR
#num NE_LOOKUP
#num NE_AUTH
#num NE_PROXYAUTH
#num NE_CONNECT
#num NE_TIMEOUT
#num NE_FAILED
#num NE_RETRY
#num NE_REDIRECT

#opaque_t ne_request

#ccall ne_request_create , Ptr <ne_session> -> CString -> CString -> IO (Ptr <ne_request>)
#ccall ne_set_request_body_buffer , Ptr <ne_request> -> CString -> CSize -> IO ()

#ccall ne_response_header_iterate , Ptr <ne_request> -> Ptr () -> CString -> CString -> IO (Ptr ())
#ccall ne_add_request_header , Ptr <ne_request> -> CString -> CString -> IO () 
#ccall ne_print_request_header , Ptr <ne_request> -> CString -> CString -> IO ()
#ccall ne_request_dispatch , Ptr <ne_request> -> IO CInt
#ccall ne_get_status , Ptr <ne_request> -> IO (Ptr <ne_status>)

