VERSION 5.00
Begin VB.Form FormLogin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Halaman Login"
   ClientHeight    =   4680
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5400
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FormLogin.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4680
   ScaleWidth      =   5400
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtpassword 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   600
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   2880
      Width           =   3975
   End
   Begin VB.TextBox txtusername 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      Height          =   375
      Left            =   480
      TabIndex        =   0
      Top             =   2040
      Width           =   3975
   End
   Begin VB.Image cmdMasuk 
      Height          =   495
      Left            =   360
      Top             =   3600
      Width           =   1335
   End
   Begin VB.Image cmdKeluar 
      Height          =   495
      Left            =   1800
      Top             =   3600
      Width           =   1335
   End
   Begin VB.Image Image1 
      Appearance      =   0  'Flat
      Height          =   4725
      Left            =   -120
      Picture         =   "FormLogin.frx":0D7A
      Top             =   0
      Width           =   5685
   End
End
Attribute VB_Name = "FormLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdKeluar_Click()
End
End Sub

Private Sub mndata_Click()
KonfigurasiDatabase.Show
End Sub

Private Sub cmdMasuk_Click()
masuk
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyF1 Then
    KonfigurasiDatabase.Show 1
End If
End Sub

Private Sub Form_Load()
Koneksi
End Sub

Private Sub txtpassword_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
    cmdMasuk_Click
End If
End Sub

Sub MasukAdmin()
Dim rsCekadmin As Recordset
    strsql = "Select * from pengguna where "
    strsql = strsql & "username= '" & txtusername.Text & "' and "
    strsql = strsql & "password= '" & txtpassword.Text & "' and "
    strsql = strsql & "jabatan= 'admin'"
    
Set rsCekadmin = Conn.Execute(strsql)
If Not rsCekadmin.EOF Then
    nama = rsCekadmin(1)
    FormMenuUtama.Show
    'MenuUtama.MenuAdmin
    'MenuUtama.StatusBar1.Panels(1) = nama
    'MenuUtama.StatusBar1.Panels(2) = txtusername.Text
    Unload Me
Else
    MasukKasir
End If
End Sub

Sub MasukKasir()
Dim rsCekPetugas As Recordset
    strsql = "Select * from pengguna where "
    strsql = strsql & "username= '" & txtusername.Text & "' and "
    strsql = strsql & "password= '" & txtpassword.Text & "' and "
    strsql = strsql & "jabatan= 'kasir'"

Set rsCekPetugas = Conn.Execute(strsql)
If Not rsCekPetugas.EOF Then
    nama = rsCekPetugas(1)
    FormMenuUtama.Show
    'MenuUtama.MenuKasir
    'MenuUtama.StatusBar1.Panels(1) = nama
    'MenuUtama.StatusBar1.Panels(2) = txtusername.Text
    Unload Me
Else
    MsgBox "Maaf username tidak terdaftar", vbCritical, "Peringatan"
End If
End Sub

Sub masuk()
If txtpassword.Text = "" Or txtusername.Text = "" Then
    MsgBox "Data masih ada yang kosong", vbCritical, "Peringatan"
Else
    MasukAdmin
End If
End Sub

Sub Bersih()
txtpassword.Text = ""
txtusername.Text = ""
End Sub

