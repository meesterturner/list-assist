Type=Activity
Version=4
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: True
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.

	Private chkAlive As CheckBox
	Private optAuto1 As RadioButton
	Private optAuto2 As RadioButton
	Private Loading As Boolean = True
	Private chkOrdering As CheckBox
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("settings")
	
	If modCore.LoadSetting("AutoComplete") = "1" Then
		optAuto1.Checked = True
	Else
		optAuto2.Checked = True
	End If
	
	If modCore.LoadSetting("KeepAlive") = "1" Then
		chkAlive.Checked = True
	End If

	If modCore.LoadSetting("TickedBottom") = "1" Then
		chkOrdering.Checked = True
	End If
	
	Loading = False
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub



Sub optAuto2_CheckedChange(Checked As Boolean)
	If Loading = False Then
		modCore.SaveSetting("AutoComplete", "2")
	End If
End Sub

Sub optAuto1_CheckedChange(Checked As Boolean)
	If Loading = False Then
		modCore.SaveSetting("AutoComplete", "1")
	End If
End Sub
Sub chkAlive_CheckedChange(Checked As Boolean)
Dim NewVal As String

	If Loading = False Then
		If Checked = True Then
			NewVal = "1"
		Else
			NewVal = "0"
		End If
		
		modCore.SaveSetting("KeepAlive", NewVal)
	End If
End Sub

Sub chkOrdering_CheckedChange(Checked As Boolean)
Dim NewVal As String

	If Loading = False Then
		If Checked = True Then
			NewVal = "1"
		Else
			NewVal = "0"
		End If
		
		modCore.SaveSetting("TickedBottom", NewVal)
	End If	
End Sub