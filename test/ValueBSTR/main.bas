#include "ValueBSTR.bi"

Dim b As ValueBSTR = "Привет, мир!"
Print b
b += "Ахаха"
Print b

Print b.BytesCount

Print Len(b)
Print SysStringLen(b)
