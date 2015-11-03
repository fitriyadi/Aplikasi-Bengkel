VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F8C087E7-04C1-4D00-96CA-99926666EAB3}#1.0#0"; "EcoEngine.ocx"
Begin VB.MDIForm FormMenuUtama 
   BackColor       =   &H8000000C&
   Caption         =   "Sistem Informasi Bengkel"
   ClientHeight    =   7995
   ClientLeft      =   60
   ClientTop       =   420
   ClientWidth     =   12870
   Icon            =   "FormMenuUtama.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   7740
      Width           =   12870
      _ExtentX        =   22701
      _ExtentY        =   450
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin WinEcoEngine.EcoEngine EcoEngine1 
      Left            =   1080
      Top             =   4080
      _ExtentX        =   3175
      _ExtentY        =   926
      ColorScheme     =   2
      WindowsStyle    =   1
      SourceLanguage  =   "Indonesia"
      ControlsNumeric =   "~"
      ControlsCurrency=   "~"
      ControlsMustBeFilled=   "~"
      FormatCurrencyLos=   "Rp #.###,##"
      ControlsDate    =   "~"
      ControlsTime    =   "~"
      ControlsDecimal =   "~"
      FormatDateLos   =   "MM/DD/YYYY"
      ReadOnlyCombo   =   "0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:"
      NameCombo       =   " :::::::::::::::::::"
      ValueCombo      =   " ~ :::::::::::::::::::"
      MsgEmpty        =   "Tidak boleh kosong"
   End
   Begin AplikasiBengkel.ACPRibbon ACPRibbon1 
      Align           =   1  'Align Top
      Height          =   1740
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   12870
      _ExtentX        =   22701
      _ExtentY        =   3069
      BackColor       =   4210752
      ForeColor       =   -2147483630
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   2160
      Top             =   2520
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   24
      ImageHeight     =   23
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMenuUtama.frx":0A02
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMenuUtama.frx":1414
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMenuUtama.frx":1E26
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMenuUtama.frx":2838
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMenuUtama.frx":324A
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMenuUtama.frx":3C5C
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMenuUtama.frx":466E
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMenuUtama.frx":5080
            Key             =   ""
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "FormMenuUtama"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Theme As Integer
Dim fchild As Form

Private Sub ACPRibbon1_ButtonClick(ByVal ID As String, ByVal Caption As String)
If ID = 99 Then
    Theme = Theme + 1
    If Theme = 3 Then Theme = 0
    '# Set Theme
    ACPRibbon1.Theme = Theme
    '# Refresh control
    ACPRibbon1.Refresh
    
    '# OPTIONAL - Load Background for Form.
    FormMenuUtama.Picture = ACPRibbon1.LoadBackground
    
    '# OPTIONAL - Load Background for Form
    FormMenuUtama.BackColor = ACPRibbon1.BackColor
    
    '# Search for all MDIChild loaded
    For i = 0 To Forms.Count - 1
        If Forms(i).Name = "ChildMDI" Then
            '# Change Theme from MDIChild Forms
            Forms(i).Picture = ACPRibbon1.LoadBackground
            Forms(i).BackColor = ACPRibbon1.BackColor
            '# Change Forecolor from all Labels on MDIChild forms
            For Each ctl In Forms(i)
                If TypeOf ctl Is Label Then ctl.ForeColor = ACPRibbon1.ForeColor
            Next
        End If
    Next
    
    
    
    
End If

ReturForm
If ID = 0 Then
    FormBarang.Show
ElseIf ID = 1 Then
    FormKategori.Show
ElseIf ID = 2 Then
    FormJasa.Show
ElseIf ID = 3 Then
    FormPelanggan.Show
ElseIf ID = 4 Then
    FormMekanik.Show
ElseIf ID = 5 Then
    FormPengguna.Show
ElseIf ID = 6 Then
    FormPemasok.Show
ElseIf ID = 7 Then
    FormPembelian.Show
ElseIf ID = 8 Then
    FormPenjualan.Show
ElseIf ID = 9 Then
    FormMekanik.Show
ElseIf ID = 10 Then
    FormPengguna.Show
ElseIf ID = 11 Then
    FormPemasok.Show
ElseIf ID = 12 Then
    FormPemasok.Show
End If
End Sub

Private Sub ReturForm()
Unload FormPelanggan
Unload FormPemasok
Unload FormPembelian
Unload FormPengguna
Unload FormBarang
Unload FormKategori
Unload FormMekanik
Unload FormJasa
End Sub

Private Sub MDIForm_Load()
Theme = 1

'# SET Theme
ACPRibbon1.Theme = Theme    ' 0 - Black
                            ' 1 - Blue
                            ' 2 - Silver
                        

'# OPTIONAL - Load Background for Form.
FormMenuUtama.Picture = ACPRibbon1.LoadBackground

'# OPTIONAL - Load Background for Form
FormMenuUtama.BackColor = ACPRibbon1.BackColor

'# Set ImageList to use for icons
ACPRibbon1.ImageList = ImageList1

'# Set Buttons on Center verticaly    (True = Center, False(Default) = Align on Top)
ACPRibbon1.ButtonCenter = False

'# Add Tabs ---   ID - Caption
ACPRibbon1.AddTab "1", "Master"
ACPRibbon1.AddTab "2", "Transaksi"
ACPRibbon1.AddTab "3", "Laporan"
ACPRibbon1.AddTab "4", "Setting"


'# Add Cats ---   ID - Tab - Caption - ShowDialogButton
ACPRibbon1.AddCat "1", "1", "Master Barang", False
ACPRibbon1.AddCat "2", "1", "Master Data", False
ACPRibbon1.AddCat "3", "2", "Transkasi", True
ACPRibbon1.AddCat "4", "3", "Data Laporan", False
ACPRibbon1.AddCat "5", "3", "Laporan Transaksi", False
ACPRibbon1.AddCat "6", "4", "SMS", False
ACPRibbon1.AddCat "7", "4", "Sistem", False
ACPRibbon1.AddCat "8", "4", "Akun", False


'# Add Button ---    ID - Cat - Capt. - Icons -   More Arrow   - ToolTip
'Tab 1
ACPRibbon1.AddButton "0", "1", "Data" & vbNewLine & "Barang", 2
ACPRibbon1.AddButton "1", "1", "Data" & vbNewLine & "Kategori", 2

ACPRibbon1.AddButton "2", "2", "Data" & vbNewLine & "Jasa", 2
ACPRibbon1.AddButton "3", "2", "Data" & vbNewLine & "Pelanggan", 2
ACPRibbon1.AddButton "4", "2", "Data" & vbNewLine & "Montir", 2
ACPRibbon1.AddButton "5", "2", "Data" & vbNewLine & "Pengguna", 2
ACPRibbon1.AddButton "6", "2", "Data" & vbNewLine & "Pemasok", 2

'Tab 2
ACPRibbon1.AddButton "7", "3", "Transaksi" & vbNewLine & "Pembelian", 2
ACPRibbon1.AddButton "8", "3", "Transaksi" & vbNewLine & "Penjualan", 2

'Tab 3
ACPRibbon1.AddButton "9", "4", "Lap." & vbNewLine & "Barang", 2
ACPRibbon1.AddButton "10", "4", "Lap." & vbNewLine & "Pemasok", 2

ACPRibbon1.AddButton "11", "5", "Lap." & vbNewLine & "Pembelian", 2
ACPRibbon1.AddButton "12", "5", "Lap." & vbNewLine & "Nota", 2
ACPRibbon1.AddButton "13", "5", "Lap." & vbNewLine & "Penjualan Barang", 2
ACPRibbon1.AddButton "14", "5", "Lap." & vbNewLine & "Service", 2

ACPRibbon1.AddButton "15", "6", "Format" & vbNewLine & "SMS", 2
ACPRibbon1.AddButton "16", "6", "Atur" & vbNewLine & "SMS", 2

ACPRibbon1.AddButton "17", "7", "Tentang" & vbNewLine & "Pembuat", 2
ACPRibbon1.AddButton "18", "7", "Bantuan", 2

ACPRibbon1.AddButton "19", "8", "Log Out", 2
ACPRibbon1.AddButton "20", "8", "Keluar", 2

'# Repaint Ribbon
ACPRibbon1.Refresh

End Sub
