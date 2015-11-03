VERSION 5.00
Begin VB.MDIForm MenuUtama 
   BackColor       =   &H8000000C&
   Caption         =   "MDIForm1"
   ClientHeight    =   7965
   ClientLeft      =   60
   ClientTop       =   705
   ClientWidth     =   11145
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnFile 
      Caption         =   "File"
      Begin VB.Menu mnLogout 
         Caption         =   "Log Out"
      End
      Begin VB.Menu mnkeluar 
         Caption         =   "Keluar"
      End
   End
   Begin VB.Menu mnmaster 
      Caption         =   "Master Data"
      Begin VB.Menu mnBarang 
         Caption         =   "Barang"
      End
   End
End
Attribute VB_Name = "MenuUtama"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub mnBarang_Click()
FormBarang.Show
End Sub
