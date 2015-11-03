VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form BrowseBarangBeli 
   Caption         =   "BARANG"
   ClientHeight    =   5040
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   14775
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   5040
   ScaleWidth      =   14775
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtcari 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   5760
      TabIndex        =   1
      Top             =   240
      Width           =   8175
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   3735
      Left            =   240
      TabIndex        =   0
      Top             =   720
      Width           =   14295
      _ExtentX        =   25215
      _ExtentY        =   6588
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   16777215
      BorderStyle     =   1
      Appearance      =   0
      NumItems        =   0
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "* Double Click / [Enter] Untuk Memilih Data Barang"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   4680
      Width           =   5055
   End
   Begin VB.Image cmdKeluar 
      Height          =   240
      Left            =   14160
      Picture         =   "BrowseBarangBeli.frx":0000
      Stretch         =   -1  'True
      Top             =   240
      Width           =   240
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00C0C0FF&
      BorderColor     =   &H00C00000&
      Height          =   3975
      Left            =   120
      Top             =   600
      Width           =   14535
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Pencarian Data (Kata Kunci : Nama Barang"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   240
      Width           =   5535
   End
   Begin VB.Shape Shape5 
      BackColor       =   &H00FFC0C0&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00C00000&
      Height          =   495
      Left            =   120
      Top             =   120
      Width           =   14535
   End
   Begin VB.Shape Shape2 
      BackColor       =   &H00FFFF00&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00C00000&
      Height          =   495
      Left            =   120
      Top             =   120
      Width           =   14535
   End
End
Attribute VB_Name = "BrowseBarangBeli"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim kondisicari As String

Private Sub cmdKeluar_Click()
Unload Me
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyEscape Then
    Unload Me
End If
End Sub

Private Sub Form_Load()
AturTabel "No,Kode Barang,Nama Barang,Harga,Stok,Kategori,Keterangan,Kat", "500,4000,6000,4000,2000,5000,6000,100", ListView1
ReloadData
kondisicari = ""
End Sub


Private Sub ListView1_DblClick()
PilihData
End Sub

Private Sub ListView1_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        PilihData
    End If
End Sub

Private Sub txtcari_Change()
kondisicari = "where nama_barang like '%" & txtcari.Text & "%'"
JoinTampilData "Barang join kategori on barang.Kode_kategori=kategori.kode_kategori", "Kode_Barang,nama_barang,Harga_jual,Stok,Nama_kategori,keterangan,barang.Kode_Kategori", kondisicari, ListView1
End Sub

Public Sub ReloadData()
JoinTampilData "Barang join kategori on barang.Kode_kategori=kategori.kode_kategori", "Kode_Barang,nama_barang,Harga_jual,Stok,Nama_kategori,keterangan,barang.Kode_Kategori", kondisicari, ListView1
End Sub

Sub PilihData()
With FormPembelian
    .txtkodebarang.Text = ListView1.SelectedItem.SubItems(1)
    .txtnamabarang.Text = ListView1.SelectedItem.SubItems(2)
End With
    Unload Me
    FormPembelian.txthargabarang.SetFocus
End Sub



