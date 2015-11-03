VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form FormPenjualan 
   Caption         =   "TRANSAKSI"
   ClientHeight    =   8115
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   20370
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
   MDIChild        =   -1  'True
   ScaleHeight     =   11055
   ScaleWidth      =   20370
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtketerangan 
      BackColor       =   &H00FFFFFF&
      Height          =   1095
      Left            =   12120
      TabIndex        =   39
      Top             =   1080
      Width           =   2895
   End
   Begin VB.ComboBox txtmekanik 
      Height          =   315
      Left            =   8040
      TabIndex        =   35
      Top             =   840
      Width           =   3855
   End
   Begin VB.OptionButton Option2 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Penjualan dan Servis"
      Height          =   255
      Left            =   3720
      TabIndex        =   34
      Top             =   840
      Width           =   2175
   End
   Begin VB.TextBox txtjenismotor 
      BackColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   9720
      TabIndex        =   32
      Top             =   1800
      Width           =   2175
   End
   Begin VB.OptionButton Option1 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Penjualan"
      Height          =   255
      Left            =   2160
      TabIndex        =   30
      Top             =   840
      Value           =   -1  'True
      Width           =   1455
   End
   Begin VB.TextBox txtkodepelanggan 
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   375
      Left            =   8040
      TabIndex        =   29
      Top             =   1320
      Width           =   1695
   End
   Begin VB.CommandButton CmdHapus 
      Caption         =   "Hapus"
      Height          =   495
      Left            =   16440
      TabIndex        =   27
      Top             =   7440
      Width           =   1095
   End
   Begin VB.TextBox txtjumlah 
      Height          =   375
      Left            =   11880
      TabIndex        =   2
      Top             =   3120
      Width           =   3015
   End
   Begin VB.TextBox txthargabarang 
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   375
      Left            =   8880
      TabIndex        =   1
      Top             =   3120
      Width           =   2895
   End
   Begin VB.TextBox txtnamabarang 
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   375
      Left            =   2880
      TabIndex        =   22
      Top             =   3120
      Width           =   5895
   End
   Begin VB.TextBox txtkodebarang 
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   375
      Left            =   360
      TabIndex        =   20
      Top             =   3120
      Width           =   2415
   End
   Begin VB.TextBox txtnopolisi 
      BackColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   8040
      TabIndex        =   15
      Top             =   1800
      Width           =   1695
   End
   Begin VB.TextBox txtpetugas 
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   375
      Left            =   2160
      TabIndex        =   13
      Top             =   2160
      Width           =   3495
   End
   Begin VB.TextBox txtnamapelanggan 
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   375
      Left            =   9720
      TabIndex        =   10
      Top             =   1320
      Width           =   2175
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   375
      Left            =   2160
      TabIndex        =   0
      Top             =   1680
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   661
      _Version        =   393216
      Format          =   102629377
      CurrentDate     =   42279
   End
   Begin VB.TextBox txtkode 
      BackColor       =   &H00E0E0E0&
      Enabled         =   0   'False
      Height          =   375
      Left            =   2160
      TabIndex        =   7
      Top             =   1200
      Width           =   3495
   End
   Begin VB.CommandButton CmdSimpan 
      Caption         =   "Bayar"
      Height          =   495
      Left            =   17760
      TabIndex        =   4
      Top             =   7440
      Width           =   1095
   End
   Begin VB.CommandButton CmdBatal 
      Caption         =   "Batal"
      Height          =   495
      Left            =   18960
      TabIndex        =   3
      Top             =   7440
      Width           =   1095
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   3615
      Left            =   360
      TabIndex        =   5
      Top             =   3600
      Width           =   19575
      _ExtentX        =   34528
      _ExtentY        =   6376
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   16777215
      BorderStyle     =   1
      Appearance      =   0
      NumItems        =   0
   End
   Begin VB.Label Label20 
      BackStyle       =   0  'Transparent
      Caption         =   "Keterangan"
      Height          =   255
      Left            =   12120
      TabIndex        =   38
      Top             =   840
      Width           =   1935
   End
   Begin VB.Label Label19 
      BackStyle       =   0  'Transparent
      Caption         =   "*F3 -- > Melakukan Pembayaran"
      Height          =   375
      Left            =   3480
      TabIndex        =   37
      Top             =   7440
      Width           =   4215
   End
   Begin VB.Label Label18 
      BackStyle       =   0  'Transparent
      Caption         =   "*F8 -- > Input Daftar Pelanggan"
      Height          =   375
      Left            =   12120
      TabIndex        =   36
      Top             =   2280
      Width           =   4215
   End
   Begin VB.Label Label17 
      BackStyle       =   0  'Transparent
      Caption         =   "*F7 -- > Mencari Daftar Pelanggan"
      Height          =   375
      Left            =   8040
      TabIndex        =   33
      Top             =   2280
      Width           =   4215
   End
   Begin VB.Label Label16 
      BackStyle       =   0  'Transparent
      Caption         =   "Jenis Layanan"
      Height          =   255
      Left            =   360
      TabIndex        =   31
      Top             =   840
      Width           =   1935
   End
   Begin VB.Label LabelTotal 
      BackStyle       =   0  'Transparent
      Caption         =   " 0"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   17160
      TabIndex        =   28
      Top             =   1680
      Width           =   2535
   End
   Begin VB.Label Label15 
      BackStyle       =   0  'Transparent
      Caption         =   "*F1 -- > Mencari Daftar Barang"
      Height          =   375
      Left            =   240
      TabIndex        =   26
      Top             =   7440
      Width           =   4215
   End
   Begin VB.Label Label14 
      BackStyle       =   0  'Transparent
      Caption         =   "*F2 --> Mencari Daftar Jasa"
      Height          =   255
      Left            =   240
      TabIndex        =   25
      Top             =   7680
      Width           =   4095
   End
   Begin VB.Label Label13 
      BackStyle       =   0  'Transparent
      Caption         =   "Jumlah [*Tekan Enter Masuk Data]"
      Height          =   255
      Left            =   11880
      TabIndex        =   24
      Top             =   2880
      Width           =   3255
   End
   Begin VB.Label Label12 
      BackStyle       =   0  'Transparent
      Caption         =   "Harga Barang / Jasa"
      Height          =   255
      Left            =   9480
      TabIndex        =   23
      Top             =   2880
      Width           =   1815
   End
   Begin VB.Label Label11 
      BackStyle       =   0  'Transparent
      Caption         =   "Nama Barang / Jasa"
      Height          =   255
      Left            =   4560
      TabIndex        =   21
      Top             =   2880
      Width           =   1935
   End
   Begin VB.Label Label10 
      BackStyle       =   0  'Transparent
      Caption         =   "Kode Barang /Jasa"
      Height          =   255
      Left            =   960
      TabIndex        =   19
      Top             =   2880
      Width           =   1935
   End
   Begin VB.Shape Shape4 
      BorderColor     =   &H00FF0000&
      Height          =   4575
      Left            =   240
      Top             =   2760
      Width           =   19815
   End
   Begin VB.Label Label9 
      BackStyle       =   0  'Transparent
      Caption         =   "Rp."
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   16440
      TabIndex        =   18
      Top             =   1680
      Width           =   735
   End
   Begin VB.Label Label8 
      BackStyle       =   0  'Transparent
      Caption         =   "Total"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   15480
      TabIndex        =   17
      Top             =   960
      Width           =   1215
   End
   Begin VB.Shape Shape3 
      Height          =   1455
      Left            =   15360
      Top             =   840
      Width           =   4575
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "No Polisi /Jenis"
      Height          =   255
      Left            =   6360
      TabIndex        =   16
      Top             =   1800
      Width           =   1935
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "Petugas"
      Height          =   255
      Left            =   360
      TabIndex        =   14
      Top             =   2160
      Width           =   1695
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Mekanik"
      Height          =   255
      Left            =   6360
      TabIndex        =   12
      Top             =   840
      Width           =   1935
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Nama Pelanggan"
      Height          =   255
      Left            =   6360
      TabIndex        =   11
      Top             =   1320
      Width           =   1935
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "No Faktur"
      Height          =   255
      Left            =   360
      TabIndex        =   9
      Top             =   1200
      Width           =   1935
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Tanggal Pembelian"
      Height          =   255
      Left            =   360
      TabIndex        =   8
      Top             =   1680
      Width           =   1695
   End
   Begin VB.Shape Shape5 
      BackColor       =   &H00FFC0C0&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00C00000&
      Height          =   1935
      Left            =   120
      Top             =   720
      Width           =   20055
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00C0C0FF&
      BorderColor     =   &H00C00000&
      Height          =   7335
      Left            =   120
      Top             =   720
      Width           =   20055
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "TRANSAKSI PENJUALAN DAN SERVIS"
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
      TabIndex        =   6
      Top             =   240
      Width           =   19455
   End
   Begin VB.Image cmdKeluar 
      Height          =   240
      Left            =   19800
      Picture         =   "FormPenjualan.frx":0000
      Stretch         =   -1  'True
      Top             =   240
      Width           =   240
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
End
Attribute VB_Name = "FormPenjualan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdbatal_Click()
ClearTransaksi
End Sub

Private Sub cmdHapus_Click()
jawab = MsgBox("Apakah yakin mau menghapus data dengan kode " & ListView1.SelectedItem.SubItems(1) & "", vbYesNo, "Konfirmasi")
    If jawab = vbYes Then
        ListView1.ListItems.Remove (ListView1.SelectedItem.Index)
        FungsiCariTotal
    End If
End Sub

Private Sub AturKondisi(status As Boolean)
Label17.Visible = status
Label18.Visible = status
txtmekanik.Visible = status
txtnamapelanggan.Visible = status
txtkodepelanggan.Visible = status
Label5.Visible = status
Label4.Visible = status
Label7.Visible = status
Label20.Visible = status
txtnopolisi.Visible = status
txtjenismotor.Visible = status
txtketerangan.Visible = status
End Sub

Private Sub cmdKeluar_Click()
Unload Me
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
If KeyCode = vbKeyF1 Then
    BrowseBarangJual.Show 1

ElseIf KeyCode = vbKeyF2 Then
    If Option1.value = True Then
        MsgBox "Jasa hanya aktif dalam pilih penjualan dan servis", vbExclamation, "Peringatan"
    Else
        If txtmekanik.Text = "" Or txtnamapelanggan.Text = "" Or txtjenismotor.Text = "" Or txtnopolisi.Text = "" Or txtketerangan.Text = "" Then
            MsgBox "Silahkan lengkapi informasi servise", vbExclamation, "Peringatan"
        Else
            BrowseJasa.Show 1
        End If
    End If
ElseIf KeyCode = vbKeyF3 Then
    FPembayaran
ElseIf KeyCode = vbKeyF7 Then
    If Option2.value = True Then
        BrowsePelanggan.Show 1
    End If
ElseIf KeyCode = vbKeyF8 Then
    If Option2.value = True Then
        statusCRUD = True
        kirimrespin = False
        AddPelanggan.Show 1
    End If
End If
End Sub

Private Sub Form_Load()
Koneksi
ClearTransaksi
AturKondisi False
txtpetugas.Text = "PEG01"
DTPicker1.MaxDate = Format(Now, "dd/MM/yyyy")
AturTabel "Kode,Nama,Harga,Jumlah,Sub Total,Jenis", "2500,6000,3000,3000,3000,2000", ListView1
DataCombo txtmekanik, "Mekanik", "Kode_mekanik", "nama_mekanik"
End Sub

Public Sub ClearTransaksi()
txtkode.Text = Kode_Otomatis("Transaksi", "Kode_transaksi", "00000001", "PJ", "00000000", 3, 8)
ListView1.ListItems.Clear
ClearBarang
ClearServis
FungsiCariTotal
End Sub

Sub ClearServis()
txtkodepelanggan.Text = ""
txtnamapelanggan.Text = ""
txtjenismotor.Text = ""
txtnopolisi.Text = ""
txtmekanik.Text = ""
txtketerangan.Text = ""
End Sub

Sub MasukData()
Dim Jenis As String
If Mid(txtkodebarang.Text, 1, 1) = "B" Then
    Jenis = "Barang"
Else
    Jenis = "Jasa"
End If

If Jenis = "Barang" Then
    If (txtjumlah.Text) <= Val(CariSingleData("barang", "stok", "Kode_barang", txtkodebarang.Text)) Then
        With ListView1.ListItems.Add
            .Text = txtkodebarang.Text
            .SubItems(1) = txtnamabarang.Text
            .SubItems(2) = txthargabarang.Text
            .SubItems(3) = txtjumlah.Text
            .SubItems(4) = Val(txthargabarang.Text) * Val(txtjumlah.Text)
            .SubItems(5) = Jenis
        End With
        ClearBarang
    Else
        MsgBox "Stok tidak cukup, Barang " + txtnamabarang.Text + " Hanya tersedia " + CariSingleData("barang", "stok", "Kode_barang", txtkodebarang.Text), vbExclamation
    End If
Else
With ListView1.ListItems.Add
        .Text = txtkodebarang.Text
        .SubItems(1) = txtnamabarang.Text
        .SubItems(2) = txthargabarang.Text
        .SubItems(3) = txtjumlah.Text
        .SubItems(4) = Val(txthargabarang.Text) * Val(txtjumlah.Text)
        .SubItems(5) = Jenis
    End With
    ClearBarang
End If
End Sub

Sub FungsiCariTotal()
Dim total As Double
total = 0
For i = 1 To ListView1.ListItems.Count
    With ListView1.ListItems.Item(i)
        total = total + Val(.SubItems(4))
    End With
Next
LabelTotal.Caption = total
End Sub

Sub ClearBarang()
    txtkodebarang.Text = ""
    txtnamabarang.Text = ""
    txthargabarang.Text = ""
    txtjumlah.Text = ""
End Sub


Sub PilihData()
With ListView1.SelectedItem
    txtkodebarang.Text = .Text
    txtnamabarang.Text = .SubItems(1)
    txthargabarang.Text = .SubItems(2)
    txtjumlah.Text = .SubItems(3)
End With
txtjumlah.SetFocus
End Sub

Private Sub ListView1_Click()
PilihData
End Sub


Private Sub Option1_Click()
If Option1.value = True Then
    AturKondisi False
    ListView1.ListItems.Clear
    ClearServis
    FungsiCariTotal
End If
End Sub

Private Sub Option2_Click()
If Option2.value = True Then
    AturKondisi True
    ClearServis
    ListView1.ListItems.Clear
    FungsiCariTotal
End If
End Sub

Private Sub txthargabarang_KeyPress(KeyAscii As Integer)
HanyaAngkaEnter KeyAscii
If KeyAscii = 13 Then
    txtjumlah.SetFocus
End If
End Sub

Private Sub txtjumlah_KeyPress(KeyAscii As Integer)
HanyaAngkaEnter KeyAscii
Dim status As Boolean
Dim posisi As Integer

If KeyAscii = 13 Then
If txtjumlah.Text = "" Or txtkodebarang = "" Or txthargabarang = "" Then
    MsgBox "Lengkapi Data Barang Terlebih Dahulu", vbExclamation, "Peringatan"
Else
    status = False
    For i = 1 To ListView1.ListItems.Count
        With ListView1.ListItems.Item(i)
        If txtkodebarang.Text = .Text Then
            status = True
            posisi = i
        End If
        End With
    Next
    If status = False Then
        MasukData
        'ClearBarang
        FungsiCariTotal
    Else
        ListView1.ListItems.Remove (posisi)
        MasukData
        FungsiCariTotal
        'ClearBarang
    End If
End If
End If
End Sub

Sub SimpanData()
Dim Petugas  As String
Dim Stok As Integer
Petugas = "PEG01"

If Option1.value = True Then
    SimpanMaster "transaksi", "kode_transaksi,kode_pengguna,tgl_transaksi,total", txtkode.Text + "," + Petugas + "," + Format(DTPicker1.value, "yyyy/MM/dd") + "," + LabelTotal.Caption
ElseIf Option2.value = True Then
    SimpanMaster "transaksi", "kode_transaksi,kode_pengguna,kode_mekanik,kode_pelanggan,tgl_transaksi,total,no_polisi,keterangan", txtkode.Text + "," + Petugas + "," + Mid(txtmekanik.Text, 1, 5) + "," + txtkodepelanggan.Text + "," + Format(DTPicker1.value, "yyyy/MM/dd") + "," + LabelTotal.Caption + "," + txtnopolisi.Text + "," + txtketerangan.Text
End If

For i = 1 To ListView1.ListItems.Count
    With ListView1.ListItems.Item(i)
    If .SubItems(5) = "Barang" Then
        SimpanMaster "Detail_jual", "kode_transaksi,kode_barang,harga,jumlah", txtkode.Text + "," + .Text + ", " + .SubItems(2) + ", " + .SubItems(3)
        Stok = CariSingleData("barang", "stok", "kode_barang", .Text)
        UbahMaster "barang", "stok=?", (Stok - .SubItems(3)), "kode_barang=?", .Text
    Else
        SimpanMaster "detail_servis", "kode_transaksi,kode_jasa,harga,jumlah", txtkode.Text + "," + .Text + ", " + .SubItems(2) + ", " + .SubItems(3)
    End If
    End With
Next i
End Sub

Sub FPembayaran()
If ListView1.ListItems.Count = 0 Then
    MsgBox "Minimal harus ada 1 barang atau jasa", vbExclamation, "Peringatan"
Else
    With Pembayaran
        .txttotal.Text = LabelTotal.Caption
        .txtdibayar.Text = 0
        .txtkembali.Text = Val(LabelTotal.Caption) - (2 * Val(LabelTotal.Caption))
        .Show 1
    End With
End If
End Sub
