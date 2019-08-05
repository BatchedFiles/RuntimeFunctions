#include "NetworkClient.bi"

Function ConnectToServer( _
		ByVal sServer As WString Ptr, _
		ByVal ServiceName As WString Ptr, _
		ByVal localServer As WString Ptr, _
		ByVal LocalServiceName As WString Ptr _
	)As SOCKET
	
	Dim iSocket As SOCKET = CreateSocketAndBind(localServer, LocalServiceName)
	
	If iSocket <> INVALID_SOCKET Then
		
		Dim localIpList As addrinfoW Ptr = ResolveHost(sServer, ServiceName)
		
		If localIpList <> 0 Then
			
			Dim pPtr As addrinfoW Ptr = localIpList
			Dim ConnectResult As Integer = Any
			
			Do
				ConnectResult = connect(iSocket, Cast(LPSOCKADDR, pPtr->ai_addr), pPtr->ai_addrlen)
				
				If ConnectResult = 0 Then
					Exit Do
				End If
				
				pPtr = pPtr->ai_next
				
			Loop Until pPtr = 0
			
			FreeAddrInfoW(localIpList)
			
			If ConnectResult = 0 Then
				Return iSocket
			End If
			
		End If
		
		closesocket(iSocket)
		
	End If
	
	Return INVALID_SOCKET
	
End Function
