#ifndef BATCHEDFILES_NETWORKCLIENT_BI
#define BATCHEDFILES_NETWORKCLIENT_BI

#include "Network.bi"

Declare Function ConnectToServer( _
	ByVal sServer As WString Ptr, _
	ByVal ServiceName As WString Ptr, _
	ByVal localServer As WString Ptr, _
	ByVal LocalServiceName As WString Ptr _
)As SOCKET

#endif
