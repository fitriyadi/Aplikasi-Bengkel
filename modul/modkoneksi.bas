Attribute VB_Name = "modkoneksi"
Public Conn As New Connection
Public strConn As String
Public rs As ADODB.Recordset
Public strsql As String

Sub Koneksi()
    Dim strSS, strPort, strDB, strUID, strPWD As String
            strSS = "localhost"
            strDB = "bengkelisokersa"
            strUID = "root"
            strPWD = ""
    
    Set Conn = New ADODB.Connection
    Conn.CursorLocation = adUseClient
    strConn = "" _
        & "DRIVER={MYSQL ODBC 3.51 Driver};" _
        & "SERVER=" & strSS & ";" _
        & "DATABASE=" & strDB & ";" _
        & "UID=" & strUID & ";" _
        & "PWD=" & strPWD & ";" _
        & "OPTION="
        
    On Error Resume Next
    
    If Conn.State = adStateOpen Then
        Conn.Close
        Set Conn = New ADODB.Connection
        Conn.Open (strConn)
    Else
        Conn.Open (strConn)
    End If
    If Err.Number <> 0 Then
        MsgBox "Tidak bisa Terhubung Ker Server,Program akan keluar", vbCritical, "Kesalahan"
        End
    End If
End Sub

