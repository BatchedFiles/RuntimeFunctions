#ifndef BATCHEDFILES_NETWORK_BI
#define BATCHEDFILES_NETWORK_BI

#ifndef unicode
#define unicode
#endif
#include "windows.bi"
#include "win\winsock2.bi"
#include "win\ws2tcpip.bi"

Declare Function CreateSocketAndBind( _
	ByVal sServer As WString Ptr, _
	ByVal ServiceName As WString Ptr _
)As SOCKET

Declare Function ResolveHost( _
	ByVal sServer As WString Ptr, _
	ByVal ServiceName As WString Ptr _
)As addrinfoW Ptr

Declare Function SetReceiveTimeout( _
	ByVal ClientSocket As SOCKET, _
	ByVal dwTimeOut As DWORD _
)As Boolean

Declare Sub CloseSocketConnection( _
	ByVal mSock As SOCKET _
)

#endif
