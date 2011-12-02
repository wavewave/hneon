{-# LANGUAGE ForeignFunctionInterface #-}

#include <bindings.dsl.h>

module Network.HTTP.Neon.SSL.Internal where
#strict_import 

#include "neon/ne_ssl.h"

#opaque_t ne_ssl_dname 
#opaque_t ne_ssl_certificate
#opaque_t ne_ssl_client_cert

