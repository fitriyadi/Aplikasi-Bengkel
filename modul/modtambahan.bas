Attribute VB_Name = "modtambahan"
Public BrowseData As String
Public statusCRUD As Boolean
Public jawab As Variant
Public kirimrespin As Boolean 'True=Load Data, False=Transaksi

'Prosedur Input Hanya Angka
Public Sub HanyaAngka(Inputan As Integer)
If InStr("0123456789", Chr(Inputan)) = 0 Then
    If Inputan <> vbKeyBack Then
    Inputan = 0
    End If
End If
End Sub

Public Sub HanyaAngkaEnter(Inputan As Integer)
If InStr("0123456789", Chr(Inputan)) = 0 Then
    If Inputan <> 13 Then
    If Inputan <> vbKeyBack Then
        Inputan = 0
        End If
    End If
End If
End Sub

'Prosedur Format Bilangan / Mata Uang
Public Sub FungsiNumber(field As TextBox)
If field.Text = "" Then
    field.Text = 0
End If
    field.Text = FormatNumber(field.Text, 0)
    field.SelStart = Len(field.Text)
End Sub

'Prosedur Format Maksimal
Public Sub BatasMaksimal(frm As TextBox, Jumlah As Integer)
frm.MaxLength = Jumlah
End Sub

'Prosedur Lock ComboBox
Public Sub LockCombo(Inputan As Integer)
If InStr("", Chr(Inputan)) = 0 Then
    Inputan = 0
End If
End Sub

'Fungsi Form Tampil Ditengah
Public Sub Tengah(X As Form)
Dim Atas As Long
Dim Kiri As Long
    'menjabarkan tata letak posisi form pada saat di running dengan perbandingan tinggi & lebar yang sama
    Atas = (Screen.Height - X.Height) / 2 - 1000
    Kiri = (Screen.Width - X.Width) / 2
    X.Move Kiri, Atas 'posisi gerak form pad
End Sub

'Hidup Mati Text
Public Sub TextMati(X As Variant)
X.Enabled = False
X.BackColor = &HC0C0FF
End Sub

Public Sub TextHidup(X As Variant)
X.Enabled = True
X.BackColor = &H80000005
End Sub

'Input Tanggal
Public Function InputTanggal(X As DTPicker) As String
Dim tanggal As String
tanggal = Format(X.value, "YYYY/MM/DD")
InputTanggal = tanggal
End Function



'=======================================================================================================
'================ Data KOneksi Database '===============================================================
'================ Berhubungan Dengan Database '=========================================================
'=======================================================================================================
Public Function Kode_Otomatis(tabel As String, ID As String, no As String, inisial As String, panjang As String, X As String, Y As String) As String
Dim rskode As Recordset
Dim t As Integer
Dim Nos As String
Dim KodeOtomatis As String

strsql = "select " & ID & "  from " & tabel & " ORDER BY " & ID & " DESC"
Set rskode = Conn.Execute(strsql)
If rskode.EOF = True Then
KodeOtomatis = inisial + no
Else
t = Val(Mid(rskode(0), X, Y))
Nos = inisial + Format(Str(t + 1), "" & panjang & "")
KodeOtomatis = Nos
End If

Kode_Otomatis = KodeOtomatis
End Function

Public Sub DataCombo(cmb As ComboBox, tabel As String, ID As String, nama As String)
    Dim RsData As Recordset
    Set RsData = New Recordset
    Dim SqlData As String
    
    SqlData = "SELECT * FROM " & tabel & ""
    RsData.Open SqlData, Conn, adOpenStatic, adLockReadOnly
    
    Do While Not RsData.EOF
        cmb.AddItem RsData("" & ID & "") + "-" + RsData("" & nama & "")
        RsData.MoveNext
    Loop
End Sub


Public Function CekData(Data As String) As Boolean
Dim Rscek As Recordset
sql = Data
Set Rscek = Conn.Execute(sql)
If Not Rscek.EOF Then
    CekData = True
Else
    CekData = False
End If
End Function

Public Function CekDuplikatNama(tabel As String, pk As String, nilaipk As String, kolom As String, NilaiKolom As String) As Boolean
Dim Rscek As Recordset
sql = "Select * from " & tabel & " where " & pk & " !='" & nilaipk & "' and " & kolom & "='" & NilaiKolom & "'"
Set Rscek = Conn.Execute(sql)
If Not Rscek.EOF Then
    CekDuplikatNama = True
Else
    CekDuplikatNama = False
End If
End Function

Public Sub datatahun(cmb As ComboBox)
For i = 2015 To CInt(Format(Now, "yyyy"))
    cmb.AddItem i
Next i
End Sub

Public Sub databulan(cmb As ComboBox)
    cmb.AddItem "01-Januari"
    cmb.AddItem "02-Februari"
    cmb.AddItem "03-Maret"
    cmb.AddItem "04-April"
    cmb.AddItem "05-Mei"
    cmb.AddItem "06-Juni"
    cmb.AddItem "07-Juli"
    cmb.AddItem "08-Agustus"
    cmb.AddItem "09-September"
    cmb.AddItem "10-Oktober"
    cmb.AddItem "11-November"
    cmb.AddItem "12-Desember"
End Sub

Public Sub AturTabel(header As String, lebar As String, lst As ListView)
Dim i As Integer
Dim n As Integer
Dim pisahKata() As String
Dim pisahJarak() As String


pisahKata() = Split(header, ",")
pisahJarak() = Split(lebar, ",")

n = UBound(pisahKata)
With lst
    .Appearance = ccFlat
    .BorderStyle = ccNone
    .ColumnHeaders.Clear
    .View = lvwReport
    
    .HoverSelection = True
    .FullRowSelect = True
    .MultiSelect = True
    .GridLines = True
    .HideSelection = True
    .LabelWrap = True
    .HotTracking = True
    
    For i = 0 To n
    .ColumnHeaders.Add.Text = pisahKata(i)
    .ColumnHeaders.Item(i + 1).Width = pisahJarak(i)
    Next i
End With
End Sub

Public Sub MasterTampilData(Table As String, kolom As String, Kondisi As String, lst As ListView)
Dim RsData As Recordset
Set RsData = New Recordset
Dim SqlData As String
Dim no As Integer
Dim n As Integer

Dim PilihKolom() As String
PilihKolom = Split(kolom, ",")
n = UBound(PilihKolom)

lst.ListItems.Clear
no = 1
SqlData = "SELECT " & kolom & " from " & Table & " " & Kondisi & ""
RsData.Open SqlData, Conn, adOpenStatic, adLockReadOnly
Do While Not RsData.EOF
    With lst.ListItems.Add
        .Text = no
        For i = 0 To n
            .SubItems(i + 1) = RsData(i)
        Next i
    End With
RsData.MoveNext
no = no + 1
Loop
End Sub

Public Sub JoinTampilData(Join As String, kolom As String, Kondisi As String, lst As ListView)
Dim RsData As Recordset
Set RsData = New Recordset
Dim SqlData As String
Dim no As Integer
Dim n As Integer

Dim PilihKolom() As String
PilihKolom = Split(kolom, ",")
n = UBound(PilihKolom)

lst.ListItems.Clear
no = 1
SqlData = "SELECT " & kolom & " from " & Join & " " & Kondisi & ""
RsData.Open SqlData, Conn, adOpenStatic, adLockReadOnly
Do While Not RsData.EOF
    With lst.ListItems.Add
        .Text = no
        For i = 0 To n
            .SubItems(i + 1) = RsData(i)
        Next i
    End With
RsData.MoveNext
no = no + 1
Loop
End Sub

Public Sub SimpanMaster(tabel As String, kolom As String, nilai As String)
On Error GoTo salah
Dim Konvert() As String
Dim panjang As Integer

Konvert = Split(nilai, ",")
panjang = UBound(Konvert)

Set CMD = New ADODB.Command
With CMD
    .ActiveConnection = strConn
    .CommandType = adCmdText
    .CommandText = " INSERT INTO " & tabel & "(" & kolom & ")values (" & KolomPanjang(panjang) & ")" '
    
    For i = 0 To panjang
    .Parameters(i).value = Konvert(i)
    Next i
    .Execute
End With
    MsgBox "Data " & tabel & " berhasil disimpan", vbInformation, "Berhasil"

Exit Sub
salah:
    MsgBox "Data " & tabel & " Gagal Disimpan", vbCritical, "Berhasil"
End Sub

Public Sub UbahMaster(tabel As String, kolom As String, nilai As String, Kondisi As String, NilaiKondisi As String)
On Error GoTo salah
Dim Konvert() As String
Dim panjang As Integer
Konvert = Split(nilai, ",")
panjang = UBound(Konvert)

Set CMD = New ADODB.Command
With CMD
    .ActiveConnection = strConn
    .CommandType = adCmdText
    
    .CommandText = "update " & tabel & " set " & kolom & "" _
                & " where " & Kondisi & ""
                
    For i = 0 To panjang
    .Parameters(i).value = Konvert(i)
    Next i
    .Parameters((panjang + 1)).value = NilaiKondisi
    .Execute
End With
MsgBox "Data " & tabel & " berhasil Diubah", vbInformation, "Berhasil"
Exit Sub
salah:
MsgBox "Data " & tabel & " Gagal Diubah", vbExclamation, "Berhasil"
End Sub

Public Function CekNull(a As Form) As Boolean
    On Error Resume Next
    CekNull = False
    For Each eachField In a.Controls
        If TypeOf eachField Is TextBox Or TypeOf eachField Is ComboBox Or TypeOf eachField Is MaskEdBox Then
            If eachField.Text = "" Then
                CekNull = True
            End If
        End If
    Next
End Function

Public Function CariSingleData(tabel As String, kolomcari As String, pk As String, nilaipk As String) As String
Dim sql As String
Dim RsData As Recordset
Set RsData = New Recordset
sql = "select " & kolomcari & " from " & tabel & " where " & pk & "='" & nilaipk & "'"
Set RsData = Conn.Execute(sql)
CariSingleData = RsData(0)
End Function

Public Sub HapusData(tabel As String, pk As String, nilai As String)
On Error GoTo salah
    Dim sql As String
    sql = "delete from " & tabel & " where " & pk & "='" & nilai & "'"
    Conn.Execute (sql)
    
Exit Sub
MsgBox "Data " & tabel & " berhasil dihapus", vbInformation, "Berhasil"
salah:
MsgBox "Data " & tabel & " Gagal Dihapus", vbCritical, "Peringatan"
End Sub

Private Function KolomPanjang(X As Integer) As String
Dim Hasil As String
Dim i As Integer
For i = 0 To X
    If i = 0 Then
        Hasil = "?" + ","
    ElseIf i = X Then
        Hasil = Hasil + "?"
    Else
        Hasil = Hasil + "?" + ","
    End If
Next i
KolomPanjang = Hasil
End Function

Public Function PanjangListPas(X As ListView, persen As String) As Double
    PanjangListPas = (CDbl(persen) / 100) * (X.Width - 500)
End Function

Public Sub LoadPekerjaan(cmb As ComboBox)
    cmb.AddItem "Petani"
    cmb.AddItem "PNS"
    cmb.AddItem "Wiraswasta"
    cmb.AddItem "Polisi"
    cmb.AddItem "Dokter"
    cmb.AddItem "Lainnya"
End Sub

Public Function CekUmur(par1 As Date, par2 As Date, max As Integer, min As Integer) As Boolean
Selisih = DateDiff("yyyy", par1, par2)
If Selisih < min Then
    CekUmur = False
ElseIf Selisih > max Then
    CekUmur = False
Else
    CekUmur = True
End If
End Function
