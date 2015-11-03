VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FormPemasok 
   Caption         =   "PEMASOK"
   ClientHeight    =   8115
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   20370
   ControlBox      =   0   'False
   DrawMode        =   2  'Blackness
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8115
   ScaleWidth      =   20370
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdHapus 
      Caption         =   "Hapus"
      Height          =   495
      Left            =   18960
      TabIndex        =   5
      Top             =   7440
      Width           =   1095
   End
   Begin VB.CommandButton cmdEdit 
      Caption         =   "Edit"
      Height          =   495
      Left            =   17760
      TabIndex        =   4
      Top             =   7440
      Width           =   1095
   End
   Begin VB.CommandButton cmdTambah 
      Caption         =   "Tambah"
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   7440
      Width           =   1095
   End
   Begin VB.TextBox txtcari 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   7080
      TabIndex        =   2
      Top             =   7560
      Width           =   8775
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   6615
      Left            =   240
      TabIndex        =   0
      Top             =   720
      Width           =   19815
      _ExtentX        =   34951
      _ExtentY        =   11668
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   16777215
      BorderStyle     =   1
      Appearance      =   0
      NumItems        =   0
   End
   Begin VB.Image cmdKeluar 
      Height          =   240
      Left            =   19800
      Picture         =   "FormPemasok.frx":0000
      Stretch         =   -1  'True
      Top             =   240
      Width           =   240
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Pencarian Data (Kata Kunci : Nama Pemasok)"
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
      Left            =   1560
      TabIndex        =   6
      Top             =   7560
      Width           =   5535
   End
   Begin VB.Shape Shape5 
      BackColor       =   &H00FFC0C0&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00C00000&
      Height          =   495
      Left            =   1440
      Top             =   7440
      Width           =   15855
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "TABEL DATA PEMASOK"
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
      TabIndex        =   1
      Top             =   240
      Width           =   19455
   End
   Begin VB.Shape Shape2 
      BackColor       =   &H00FFFF00&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00C00000&
      Height          =   495
      Left            =   120
      Top             =   120
      Width           =   20055
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00C0C0FF&
      BorderColor     =   &H00C00000&
      Height          =   7455
      Left            =   120
      Top             =   600
      Width           =   20055
   End
End
Attribute VB_Name = "FormPemasok"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim kondisicari As String

Private Sub cmdEdit_Click()
PilihData
End Sub

Private Sub cmdHapus_Click()
jawab = MsgBox("Apakah yakin mau menghapus data dengan kode " & ListView1.SelectedItem.SubItems(1) & "", vbYesNo, "Konfirmasi")
    If jawab = vbYes Then
    HapusData "Pemasok", "kode_pemasok", ListView1.SelectedItem.SubItems(1)
    ReloadData
End If
End Sub

Private Sub cmdKeluar_Click()
Unload Me
End Sub

Private Sub cmdTambah_Click()
statusCRUD = True
AddPemasok.Show 1
End Sub

Private Sub Form_Load()
Koneksi
AturTabel "No,Kode Pemasok,Nama Pemasok,Alamat,No Telpon", "500,4000,5000,7000,4000", ListView1
ReloadData
kondisicari = ""
End Sub

Private Sub txtcari_Change()
kondisicari = "where nama_pemasok like '%" & txtcari.Text & "%'"
MasterTampilData "Pemasok", "Kode_pemasok,nama_pemasok,Alamat,No_telp", kondisicari, ListView1
End Sub

Public Sub ReloadData()
MasterTampilData "Pemasok", "Kode_pemasok,nama_pemasok,Alamat,No_telp", "", ListView1
End Sub

Sub PilihData()
statusCRUD = False
With AddPemasok
    .txtkode.Text = ListView1.SelectedItem.SubItems(1)
    .txtnama.Text = ListView1.SelectedItem.SubItems(2)
    .txtalamat.Text = ListView1.SelectedItem.SubItems(3)
    .txtnotelpon.Text = ListView1.SelectedItem.SubItems(4)
    .Show
End With
End Sub


