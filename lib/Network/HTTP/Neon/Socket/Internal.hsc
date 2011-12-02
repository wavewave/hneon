{-# LANGUAGE ForeignFunctionInterface #-}

#include <bindings.dsl.h>
#include <sys/types.h>

module Network.HTTP.Neon.Socket.Internal where
#strict_import 

#include "neon/ne_socket.h"

#num NE_SOCK_SOCKSV4
#num NE_SOCK_SOCKSV4A
#num NE_SOCK_SOCKSV5

#opaque_t ne_socket
#opaque_t ne_sock_addr
#opaque_t ne_inet_addr

#ccall ne_sock_init , IO CInt 
