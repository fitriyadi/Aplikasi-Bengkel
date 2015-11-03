VERSION 5.00
Begin VB.Form Pembayaran 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Pembayaran"
   ClientHeight    =   2640
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6630
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   11.25
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
   ScaleHeight     =   2640
   ScaleWidth      =   6630
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdbatal 
      Caption         =   "Batal"
      Height          =   495
      Left            =   5400
      TabIndex        =   2
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CommandButton cmdsimpan 
      Caption         =   "Simpan"
      Height          =   495
      Left            =   4200
      TabIndex        =   1
      Top             =   2040
      Width           =   1095
   End
   Begin VB.TextBox txttotal 
      BackColor       =   &H00E0E0E0&
      Height          =   375
      Left            =   2760
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   360
      Width           =   3495
   End
   Begin VB.TextBox txtdibayar 
      Height          =   375
      Left            =   2760
      TabIndex        =   0
      Top             =   840
      Width           =   3495
   End
   Begin VB.TextBox txtkembali 
      BackColor       =   &H00E0E0E0&
      Height          =   375
      Left            =   2760
      Locked          =   -1  'True
      TabIndex        =   4
      Top             =   1320
      Width           =   3495
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00FF0000&
      Height          =   1815
      Left            =   120
      Top             =   120
      Width           =   6375
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Total"
      Height          =   255
      Left            =   360
      TabIndex        =   7
      Top             =   360
      Width           =   1935
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Dibayar"
      Height          =   255
      Left            =   360
      TabIndex        =   6
      Top             =   840
      Width           =   1935
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Kembali"
      Height          =   255
      Left            =   360
      TabIndex        =   5
      Top             =   1320
      Width           =   1935
   End
End
Attribute VB_Name = "Pembayaran"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdbatal_Click()
Unload Me
End Sub

Private Sub cmdsimpan_Click()
If Val(txtkembali.Text) < 0 Then
    MsgBox "Maaf uang yang dibayarkan kurang", vbExclamation, "Peringatan"
Else
    FormPenjualan.SimpanData
    FormPenjualan.ClearServis
    FormPenjualan.ClearTransaksi
    Unload Me
End If
End Sub

Private Sub Form_Load()
Me.BackColor = FormMenuUtama.ACPRibbon1.BackColor
Me.Picture = FormMenuUtama.ACPRibbon1.LoadBackground
End Sub

Private Sub txtdibayar_Change()
On Error Resume Next
txtkembali.Text = Val(txtdibayar.Text) - Val(txttotal.Text)
End Sub
