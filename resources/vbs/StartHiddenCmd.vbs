' this script launch a an external program
Set WshShell = WScript.CreateObject("WScript.Shell")
Set filesys = CreateObject("Scripting.FileSystemObject")
Set objArgs = Wscript.Arguments

For Each strArg in objArgs
    If (strLine = "") Then
        If filesys.FileExists(strArg) Then
            WshShell.CurrentDirectory = filesys.GetParentFolderName(strArg)
        Else
            MsgBox "ERROR : " & strArg & " does not exist", 4112, "CEMU's BatchFw"
            WScript.Quit(99)
        End If
        strLine = """" & strArg & """"
    Else    
        strLen=Len(strArg)
        If (strLen >= 2) then
            If (Mid(strArg,2,1) = ":") then
                 strLine = strLine & " """ & strArg & """"
            Else
                 strLine = strLine & " " & strArg
            End If
        Else
            strLine = strLine & " " & strArg
        End If
    End If
Next
' WScript.Echo strLine
intReturn = WshShell.Run(strLine, 0, false)
WScript.Quit(intReturn)
