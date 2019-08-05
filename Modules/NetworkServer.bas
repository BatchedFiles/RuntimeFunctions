#include "NetworkServer.bi"

Function CreateSocketAndListen( _
		ByVal LocalAddress As WString Ptr, _
		ByVal LocalPort As WString Ptr _
	)As SOCKET
	
	Dim iSocket As SOCKET = CreateSocketAndBind(LocalAddress, LocalPort)
	
	If iSocket <> INVALID_SOCKET Then
		
		If listen(iSocket, 1) <> SOCKET_ERROR Then
			Return iSocket
		End If
		
		closesocket(iSocket)
		
	End If
	
	Return INVALID_SOCKET
	
End Function
