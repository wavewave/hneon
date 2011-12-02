{-# LANGUAGE ForeignFunctionInterface #-}

#include <bindings.dsl.h>

module Network.HTTP.Neon.Session.Internal where
#strict_import 

import Network.HTTP.Neon.Socket.Internal

#include "neon/ne_session.h"

#opaque_t ne_session

#ccall ne_session_create , CString -> CString -> CUInt -> IO (Ptr <ne_session>)
#ccall ne_session_destroy , Ptr <ne_session> -> IO ()
#ccall ne_close_connection , Ptr <ne_session> -> IO ()
#ccall ne_session_proxy , Ptr <ne_session> -> CString -> CUInt -> IO ()
#ccall ne_session_socks_proxy , Ptr <ne_session> -> CInt -> CString -> CUInt -> CString -> CString -> IO ()
#ccall ne_session_system_proxy , Ptr <ne_session> -> CUInt -> IO ()

#integral_t ne_session_flag
#num NE_SESSFLAG_PERSIST
#num NE_SESSFLAG_ICYPROTO
#num NE_SESSFLAG_SSLv2
#num NE_SESSFLAG_RFC4918
#num NE_SESSFLAG_CONNAUTH
#num NE_SESSFLAG_TLS_SNI
#num NE_SESSFLAG_EXPECT100
#num NE_SESSFLAG_LAST

#ccall ne_set_session_flag , Ptr <ne_session> -> <ne_session_flag> -> CInt -> IO ()
#ccall ne_get_session_flag , Ptr <ne_session> -> <ne_session_flag> -> IO CInt 
#ccall ne_set_addrlist , Ptr <ne_session> -> Ptr (Ptr <ne_inet_addr>) -> CSize -> IO ()
#ccall ne_set_localaddr , Ptr <ne_session> -> Ptr <ne_inet_addr> -> IO ()

