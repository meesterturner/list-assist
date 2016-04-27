Type=StaticCode
Version=4
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
'Code module
'Subs in this code module will be accessible from all modules.
Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub


Sub SaveSetting(SettingName As String, SettingData As String)
	Main.dbConn.ExecNonQuery2("DELETE FROM Settings WHERE SettingName = ?",Array As String(SettingName))
	Main.dbConn.ExecNonQuery2("INSERT INTO Settings VALUES (?, ?)",Array As String(SettingName, SettingData))
	Log("SaveSetting: " & SettingName & " = " & SettingData)
End Sub

Sub LoadSetting(SettingName As String) As String
Dim SData As String

	SData = Main.dbConn.ExecQuerySingleResult2("SELECT SettingData FROM Settings WHERE SettingName = ?", Array As String(SettingName))
	If SData = Null Then
		SData = ""
	End If
	Log("LoadSetting: " & SettingName & " = " & SData)
	Return SData ' This will be Null (not "Null") if nothing was found
End Sub