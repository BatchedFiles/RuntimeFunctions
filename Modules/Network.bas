#include "Network.bi"

Function ResolveHost( _
		ByVal sServer As WString Ptr, _
		ByVal ServiceName As WString Ptr _
	)As addrinfoW Ptr
	
	Dim hints As addrinfoW
	With hints
		.ai_family = AF_UNSPEC ' AF_INET или AF_INET6
		.ai_socktype = SOCK_STREAM
		.ai_protocol = IPPROTO_TCP
	End With
	
	Dim pResult As addrinfoW Ptr = 0
	
	If GetAddrInfoW(sServer, ServiceName, @hints, @pResult) = 0 Then
		Return pResult
	End If
	
	Return NULL
	
End Function

Function CreateSocketAndBind( _
		ByVal sServer As WString Ptr, _
		ByVal ServiceName As WString Ptr _
	)As SOCKET
	
	Dim iSocket As SOCKET = WSASocket(AF_UNSPEC, SOCK_STREAM, IPPROTO_TCP, NULL, 0, WSA_FLAG_OVERLAPPED)
	
	If iSocket <> INVALID_SOCKET Then
		
		Dim localIpList As addrinfoW Ptr = ResolveHost(sServer, ServiceName)
		
		If localIpList <> 0 Then
			
			Dim pPtr As addrinfoW Ptr = localIpList
			Dim BindResult As Integer = Any
			
			Do
				BindResult = bind(iSocket, Cast(LPSOCKADDR, pPtr->ai_addr), pPtr->ai_addrlen)
				
				If BindResult = 0 Then
					Exit Do
				End If
				
				pPtr = pPtr->ai_next
				
			Loop Until pPtr = 0
			
			FreeAddrInfoW(localIpList)
			
			If BindResult = 0 Then
				Return iSocket
			End If
			
		End If
		
		closesocket(iSocket)
		
	End If
	
	Return INVALID_SOCKET
	
End Function

Sub CloseSocketConnection( _
		ByVal mSock As SOCKET _
	)
	shutdown(mSock, SD_BOTH)
	closesocket(mSock)
End Sub

Function SetReceiveTimeout( _
		ByVal ClientSocket As SOCKET, _
		ByVal dwTimeOut As DWORD _
	)As Boolean
	
	Dim res As Integer = setsockopt( _
		ClientSocket, _
		SOL_SOCKET, _
		SO_RCVTIMEO, _
		CPtr(ZString Ptr, @dwTimeOut), _
		SizeOf(DWORD) _
	)
	
	If res <> 0 Then
		Return False
	End If
	
	Return True
	
End Function
