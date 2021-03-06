#include "ValueBSTR.bi"

Constructor ValueBSTR()
	
	BytesCount = 0
	StringData(0) = 0
	
End Constructor

Constructor ValueBSTR(ByRef lhs As Const WString)
	
	Dim lhsLength As Integer = lstrlenW(lhs)
	Dim m As Integer = min(MAX_VALUEBSTR_BUFFER_LENGTH, lhsLength)
	
	BytesCount = m * SizeOf(OLECHAR)
	lstrcpynW(@StringData(0), lhs, m + 1)
	
End Constructor

Constructor ValueBSTR(ByRef lhs As Const WString, ByVal Length As Const Integer)
	
	Dim m As Integer = min(MAX_VALUEBSTR_BUFFER_LENGTH, Length)
	
	BytesCount = m * SizeOf(OLECHAR)
	lstrcpynW(@StringData(0), lhs, m + 1)
	
End Constructor

Constructor ValueBSTR(ByRef lhs As Const ValueBSTR)
	
	BytesCount = lhs.BytesCount
	CopyMemory(@StringData(0), @lhs.StringData(0), BytesCount + SizeOf(OLECHAR))
	
End Constructor

Constructor ValueBSTR(ByRef lhs As Const BSTR)
	
	Dim lhsLength As UINT = SysStringLen(lhs)
	Dim m As Integer = min(MAX_VALUEBSTR_BUFFER_LENGTH, lhsLength)
	
	BytesCount = m * SizeOf(OLECHAR)
	CopyMemory(@StringData(0), lhs, BytesCount + SizeOf(OLECHAR))
	
End Constructor

' Destructor ValueBSTR()
	
' End Destructor

Operator ValueBSTR.Let(ByRef lhs As Const WString)
	
	Dim lhsLength As Integer = lstrlenW(lhs)
	Dim m As Integer = min(MAX_VALUEBSTR_BUFFER_LENGTH, lhsLength)
	
	BytesCount = m * SizeOf(OLECHAR)
	lstrcpynW(@StringData(0), lhs, m + 1)
	
End Operator

Operator ValueBSTR.Let(ByRef lhs As Const ValueBSTR)
	
	BytesCount = lhs.BytesCount
	CopyMemory(@StringData(0), @lhs.StringData(0), BytesCount + SizeOf(OLECHAR))
	
End Operator

Operator ValueBSTR.Let(ByRef lhs As Const BSTR)
	
	Dim lhsLength As UINT = SysStringLen(lhs)
	Dim m As Integer = min(MAX_VALUEBSTR_BUFFER_LENGTH, lhsLength)
	
	BytesCount = m * SizeOf(OLECHAR)
	CopyMemory(@StringData(0), lhs, BytesCount + SizeOf(OLECHAR))
	
End Operator

Operator ValueBSTR.Cast()ByRef As Const WString
	
	Return StringData(0)
	
End Operator

Operator ValueBSTR.Cast()As Const BSTR
	
	Return @StringData(0)
	
End Operator

Operator ValueBSTR.Cast()As Const Any Ptr
	
	Return CPtr(Any Ptr, @StringData(0))
	
End Operator

Operator ValueBSTR.&=(ByRef rhs As Const WString)
	
	Append(rhs, lstrlenW(rhs))
	
End Operator

' Declare Operator &=(ByRef rhs As Const ValueBSTR)
' Declare Operator &=(ByRef rhs As Const BSTR)

Operator ValueBSTR.+=(ByRef rhs As Const WString)
	
#if __FB_DEBUG__
	Print "Append", lstrlenW(rhs), rhs
#endif
	Append(rhs, lstrlenW(rhs))
	
End Operator

' Declare Operator +=(ByRef rhs As Const ValueBSTR)
' Declare Operator +=(ByRef rhs As Const BSTR)

Sub ValueBSTR.Append(ByRef rhs As Const WString, ByVal Length As Const Integer)
	
	Dim meLength As Integer = Len(this)
#if __FB_DEBUG__
	Print "meLength", meLength
#endif
	Dim EmptySpace As Integer = MAX_VALUEBSTR_BUFFER_LENGTH - meLength
#if __FB_DEBUG__
	Print "EmptySpace", EmptySpace
#endif
	
	If EmptySpace > 0 Then
		
		Dim m As Integer = min(EmptySpace, Length)
#if __FB_DEBUG__
		Print "m", m, rhs
#endif
		
		BytesCount = (m + meLength) * SizeOf(OLECHAR)
		lstrcpynW(@StringData(meLength), rhs, m + 1)
		
	End If

End Sub

Operator Len(ByRef b As Const ValueBSTR)As Integer
	
	Return b.BytesCount \ SizeOf(OLECHAR)
	' Return SysStringLen(b)
	
End Operator
