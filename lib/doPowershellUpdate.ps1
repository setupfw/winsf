.\lib\loadModules.ps1
Add-Type -AssemblyName PresentationFramework

$reponse = [System.Windows.MessageBox]::Show(
    (
        Get-Translation 'Please update to PowerShell 5!' `
            -cn '请升级 PowerShell 到 5 版以上'
    ),
    (
        Get-Translation 'Discarded PowerShell Version' `
            -cn '不支持旧版 PowerShell'
    ),
    'OK', 'Warning'
)

if ($reponse -eq 'OK') {
    if (!(Test-Path ($it = 'HKLM:\Software\Classes\.md'))) {
        Set-Item (mkdir -f $it).PSPath "md_auto_file"
        Set-Item (
            mkdir -f "HKLM:\Software\Classes\md_auto_file\shell\edit\command"
        ).PSPath "`"C:\Windows\system32\notepad.exe`" `"%1`""
    }
    Start-Process .\win7
}