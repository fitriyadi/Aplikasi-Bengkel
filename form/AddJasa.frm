VERSION 5.00
Begin VB.Form AddJasa 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Olah Jasa"
   ClientHeight    =   3540
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
   ScaleHeight     =   3540
   ScaleWidth      =   7035
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtharga 
      Height          =   375
      Left            =   2760
      TabIndex        =   6
      Top             =   1320
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
      TabIndex        =   2
      Top             =   2880
      Width           =   1095
   End
   Begin VB.CommandButton cmdbatal 
      Caption         =   "Batal"
      Height          =   495
      Left            =   5760
      TabIndex        =   4
      Top             =   2880
      Width           =   1095
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Harga Jasa"
      Height          =   255
      Left            =   360
      TabIndex        =   7
      Top             =   1320
      Width           =   1935
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Nama Jasa"
      Height          =   255
      Left            =   360
      TabIndex        =   5
      Top             =   840
      Width           =   1935
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Kode Jasa"
      Height          =   255
      Left            =   360
      TabIndex        =   3
      Top             =   360
      Width           =   1935
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00FF0000&
      Height          =   2655
      Left            =   120
      Top             =   120
      Width           =   6735
   End
End
Attribute VB_Name = "AddJasa"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdbatal_Click()
Unload Me
End Sub

Private Sub cmdsimpan_Click()
If CekNull(Me) = True Then
    MsgBox "Silahkan Lengkapi data", vbExclamation, "Peringtaan"
ElseIf CekDuplikatNama("Jasa", "Kode_jasa", txtkode.Text, "Nama_jasa", txtnama.Text) = True Then
    MsgBox "Nama " & txtnama & " sudah ada ", vbExclamation, "Peringtaan"
Else
    If statusCRUD = True Then
        SimpanMaster "Jasa", "Kode_jasa,Nama_jasa,harga", txtkode.Text + "," + txtnama.Text + "," + txtharga.Text
        Unload Me
        FormJasa.ReloadData
    Else
        UbahMaster "Jasa", "Nama_jasa=?,Harga=?", txtnama + "," + txtharga.Text, "kode_jasa=?", txtkode.Text
        Unload Me
        FormJasa.ReloadData
    End If
End If
End Sub

Private Sub Form_Load()
Me.BackColor = FormMenuUtama.ACPRibbon1.BackColor
Me.Picture = FormMenuUtama.ACPRibbon1.LoadBackground
If statusCRUD = True Then
    txtkode.Text = Kode_Otomatis("Jasa", "kode_jasa", "01", "JAS", "00", 4, 2)
End If
End Sub




