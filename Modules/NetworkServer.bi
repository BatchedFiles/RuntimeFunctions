#include "Network.bi"

Declare Function CreateSocketAndListen( _
	ByVal localServer As WString Ptr, _
	ByVal ServiceName As WString Ptr _
)As SOCKET

#endif
