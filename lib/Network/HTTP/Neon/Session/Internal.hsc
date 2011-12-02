{-# LANGUAGE ForeignFunctionInterface #-}

#include <bindings.dsl.h>

module Network.HTTP.Neon.Session.Internal where
#strict_import 

import Network.HTTP.Neon.Defs.Internal
import Network.HTTP.Neon.Socket.Internal
import Network.HTTP.Neon.SSL.Internal
import Network.HTTP.Neon.URI.Internal

#include "neon/ne_session.h"
#include "hne_session.h"

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

#callback ne_progress , Ptr () -> <ne_off_t> -> <ne_off_t> -> IO ()
#ccall ne_set_progress , Ptr <ne_session> -> <ne_progress> -> Ptr () -> IO ()
#ccall ne_set_session_private , Ptr <ne_session> -> CString -> Ptr () -> IO ()
#ccall ne_get_session_private , Ptr <ne_session> -> CString -> IO (Ptr ())

#integral_t ne_session_status
#num ne_status_lookup
#num ne_status_connecting
#num ne_status_connected 
#num ne_status_sending
#num ne_status_recving
#num ne_status_disconnected



#starttype ne_session_status_info_lu
#field hostname , CString 
#stoptype

#starttype ne_session_status_info_ci
#field hostname , CString 
#field address , Ptr <ne_inet_addr>
#stoptype

#starttype ne_session_status_info_cd
#field hostname , CString 
#stoptype

#starttype ne_session_status_info_sr
#field progress , <ne_off_t>
#field total , <ne_off_t>
#stoptype


#starttype ne_session_status_info
#union_field lu , <ne_session_status_info_lu>
#union_field ci , <ne_session_status_info_ci>
#union_field cd , <ne_session_status_info_cd>
#union_field sr , <ne_session_status_info_sr>
#stoptype 

#callback ne_notify_status , Ptr () -> <ne_session_status> -> Ptr <ne_session_status_info> -> IO ()

#ccall ne_set_notifier , Ptr <ne_session> -> <ne_notify_status> -> Ptr () -> IO ()

#num NE_SSL_NOTYETVALID
#num NE_SSL_EXPIRED
#num NE_SSL_IDMISMATCH
#num NE_SSL_UNTRUSTED
#num NE_SSL_BADCHAIN
#num NE_SSL_REVOKED
#num NE_SSL_FAILMASK

#callback ne_ssl_verify_fn , Ptr () -> CInt -> Ptr <ne_ssl_certificate> -> IO CInt

#ccall ne_ssl_set_verify , Ptr <ne_session> -> <ne_ssl_verify_fn> -> Ptr () -> IO ()

#ccall ne_ssl_set_clicert , Ptr <ne_session> -> Ptr <ne_ssl_client_cert> -> IO ()

#ccall ne_ssl_trust_cert , Ptr <ne_session> -> Ptr <ne_ssl_certificate> -> IO ()

#ccall ne_ssl_trust_default_ca , Ptr <ne_session> -> IO ()

#callback ne_ssl_provide_fn , Ptr () -> Ptr <ne_session> -> Ptr <ne_ssl_dname> -> CInt -> IO () 

#ccall ne_ssl_provide_clicert , Ptr <ne_session> -> <ne_ssl_provide_fn> -> Ptr () -> IO ()
#ccall ne_set_read_timeout , Ptr <ne_session> -> CInt -> IO ()
#ccall ne_set_connect_timeout , Ptr <ne_session> -> CInt -> IO ()

#ccall ne_set_useragent , Ptr <ne_session> -> CString -> IO () 
#ccall ne_version_pre_http11 , Ptr <ne_session> -> IO CInt 
#ccall ne_get_server_hostport , Ptr <ne_session> -> IO CString 
#ccall ne_get_scheme , Ptr <ne_session> -> IO CString 
#ccall ne_fill_server_uri , Ptr <ne_session> -> Ptr <ne_uri> -> IO ()
#ccall ne_fill_proxy_uri , Ptr <ne_session> -> Ptr <ne_uri> -> IO ()
#ccall ne_set_error , Ptr <ne_session> -> CString -> IO ()
#ccall ne_get_error , Ptr <ne_session> -> IO CString 













