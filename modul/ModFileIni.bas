Attribute VB_Name = "ModFileIni"
Public Const FILE_INI As String = "config.ini"
Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long

Public Function readINI(ByVal fileName As String, ByVal sectionHeader As String, ByVal variableName As String, ByVal strDefault As String) As String
    Dim buffer  As String
    Dim x       As Long

    buffer = String(255, 0)
    x = GetPrivateProfileString(sectionHeader, variableName, strDefault, buffer, 255, fileName)
    If x <> 0 Then
        buffer = Left$(buffer, x)
        readINI = buffer
    Else
        readINI = ""
    End If
End Function

Public Sub writeINI(ByVal fileName As String, ByVal sectionHeader As String, ByVal variableName As String, ByVal value As String)
    Dim ret As Long
    ret = WritePrivateProfileString(sectionHeader, variableName, value, fileName)
End Sub

