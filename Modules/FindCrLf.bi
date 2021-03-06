#ifndef BATCHEDFILES_FINDCRLF_BI
#define BATCHEDFILES_FINDCRLF_BI

Declare Function FindCrLfA Alias "FindCrLfA"( _
	ByVal Buffer As ZString Ptr, _
	ByVal BufferLength As Integer, _
	ByVal pFindIndex As Integer Ptr _
)As Boolean

Declare Function FindCrLfW Alias "FindCrLfW"( _
	ByVal Buffer As WString Ptr, _
	ByVal BufferLength As Integer, _
	ByVal pFindIndex As Integer Ptr _
)As Boolean

#ifdef UNICODE
	Declare Function FindCrLf Alias "FindCrLfW"( _
		ByVal Buffer As WString Ptr, _
		ByVal BufferLength As Integer, _
		ByVal pFindIndex As Integer Ptr _
	)As Boolean
#else
	Declare Function FindCrLf Alias "FindCrLfA"( _
		ByVal Buffer As ZString Ptr, _
		ByVal BufferLength As Integer, _
		ByVal pFindIndex As Integer Ptr _
	)As Boolean
#endif

#endif
