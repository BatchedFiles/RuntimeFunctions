#ifndef BATCHEDFILES_VALUEBSTR_BI
#define BATCHEDFILES_VALUEBSTR_BI

#include "windows.bi"
#include "win\ole2.bi"

Const MAX_VALUEBSTR_BUFFER_LENGTH As Integer = 512

Type ValueBSTR
	
	Declare Constructor()
	Declare Constructor(ByRef rhs As Const WString)
	Declare Constructor(ByRef rhs As Const WString, ByVal Length As Const Integer)
	Declare Constructor(ByRef rhs As Const ValueBSTR)
	Declare Constructor(ByRef rhs As Const BSTR)
	
	'Declare Destructor()
	
	Declare Operator Let(ByRef rhs As Const WString)
	Declare Operator Let(ByRef rhs As Const ValueBSTR)
	Declare Operator Let(ByRef rhs As Const BSTR)

	Declare Operator Cast()ByRef As Const WString
	Declare Operator Cast()As Const BSTR
	Declare Operator Cast()As Const Any Ptr
	
	Declare Operator &=(ByRef rhs As Const WString)
	Declare Operator &=(ByRef rhs As Const ValueBSTR)
	Declare Operator &=(ByRef rhs As Const BSTR)
	
	Declare Operator +=(ByRef rhs As Const WString)
	Declare Operator +=(ByRef rhs As Const ValueBSTR)
	Declare Operator +=(ByRef rhs As Const BSTR)
	
	Declare Sub Append(ByRef rhs As Const WString, ByVal Length As Const Integer)

	Dim BytesCount As UINT
	Dim StringData(MAX_VALUEBSTR_BUFFER_LENGTH + 1 - 1) As OLECHAR
	
End Type

Declare Operator Len(ByRef lhs As Const ValueBSTR)As Integer

#endif
