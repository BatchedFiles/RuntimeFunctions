#ifndef FINDCRLF_BI
#define FINDCRLF_BI

Declare Function FindCrLfA( _
	ByVal Buffer As ZString Ptr, _
	ByVal BufferLength As Integer, _
	ByVal pFindIndex As Integer Ptr _
)As Boolean

Declare Function FindCrLfW( _
	ByVal Buffer As WString Ptr, _
	ByVal BufferLength As Integer, _
	ByVal pFindIndex As Integer Ptr _
)As Boolean

#endif
