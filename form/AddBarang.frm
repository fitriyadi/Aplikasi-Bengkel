VERSION 5.00
Begin VB.Form AddBarang 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Olah Barang"
   ClientHeight    =   3900
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   7035
   ClipControls    =   0   'False
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
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   3900
   ScaleWidth      =   7035
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox txtkategori 
      Height          =   315
      Left            =   2760
      TabIndex        =   2
      Top             =   1320
      Width           =   3495
   End
   Begin VB.TextBox txtketerangan 
      Height          =   735
      Left            =   2760
      TabIndex        =   4
      Top             =   2280
      Width           =   3495
   End
   Begin VB.TextBox txthargabarang 
      Height          =   375
      Left            =   2760
      TabIndex        =   3
      Top             =   1800
      Width           =   3495
   End
   Begin VB.TextBox txtnama 
      Height          =   375
      Left            =   2760
      TabIndex        =   1
      Top             =   840
      Width           =   3495
   End
   Begin VB.TextBox txtkode 
      Enabled         =   0   'False
      Height          =   375
      Left            =   2760
      TabIndex        =   0
      Top             =   360
      Width           =   3495
   End
   Begin VB.CommandButton cmdsimpan 
      Caption         =   "Simpan"
      Height          =   495
      Left            =   4560
      TabIndex        =   5
      Top             =   3240
      Width           =   1095
   End
   Begin VB.CommandButton cmdbatal 
      Caption         =   "Batal"
      Height          =   495
      Left            =   5760
      TabIndex        =   6
      Top             =   3240
      Width           =   1095
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Keterangan"
      Height          =   255
      Left            =   360
      TabIndex        =   11
      Top             =   2400
      Width           =   1935
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Harga Barang"
      Height          =   255
      Left            =   360
      TabIndex        =   10
      Top             =   1800
      Width           =   1935
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Kategori"
      Height          =   255
      Left            =   360
      TabIndex        =   9
      Top             =   1320
      Width           =   1935
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Nama Barang"
      Height          =   255
      Left            =   360
      TabIndex        =   8
      Top             =   840
      Width           =   1935
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Kode Barang"
      Height          =   255
      Left            =   360
      TabIndex        =   7
      Top             =   360
      Width           =   1935
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00FF0000&
      Height          =   3015
      Left            =   120
      Top             =   120
      Width           =   6735
   End
End
Attribute VB_Name = "AddBarang"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdbatal_Click()
Unload Me
End Sub

Private Sub cmdsimpan_Click()
Dim stok As String
stok = "0"

If CekNull(Me) = True Then
    MsgBox "Silahkan Lengkapi data", vbExclamation, "Peringtaan"
ElseIf CekDuplikatNama("Barang", "kode_barang", txtkode.Text, "Nama_barang", txtnama.Text) = True Then
    MsgBox "Nama " & txtnama & " sudah ada ", vbExclamation, "Peringtaan"
Else
    If statusCRUD = True Then
        SimpanMaster "Barang", "kode_barang,nama_barang,harga_jual,kode_kategori,keterangan,Stok", txtkode.Text + "," + txtnama.Text + "," + txthargabarang.Text + "," + Mid(txtkategori.Text, 1, 5) + "," + txtketerangan.Text + "," + stok
        Unload Me
        FormBarang.ReloadData
    Else
        UbahMaster "Barang", "Nama_barang=?,harga_jual=?,kode_kategori=?,keterangan=?", txtnama.Text + "," + txthargabarang.Text + "," + Mid(txtkategori.Text, 1, 5) + "," + txtketerangan.Text, "kode_barang=?", txtkode.Text
        Unload Me
        FormBarang.ReloadData
    End If
End If
End Sub

Private Sub Form_Load()
DataCombo txtkategori, "Kategori", "Kode_kategori", "nama_kategori"
Me.BackColor = FormMenuUtama.ACPRibbon1.BackColor
Me.Picture = FormMenuUtama.ACPRibbon1.LoadBackground
If statusCRUD = True Then
    txtkode.Text = Kode_Otomatis("Barang", "kode_barang", "0001", "B", "0000", 2, 4)
End If
End Sub




