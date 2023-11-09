Add-Type -AssemblyName System.Windows.Forms

# Uus vorm
$form = New-Object System.Windows.Forms.Form
$form.Text = "Martini Windowsi Toolbox"
$form.Size = New-Object System.Drawing.Size(400, 400)
$form.FormBorderStyle = "Fixed3D"

# Loo 5 nuppu
$button1 = New-Object System.Windows.Forms.Button
$button1.Text = "Muuda System Locale to et-EE"
$button1.Location = New-Object System.Drawing.Point(20, 20)
$button1.Size = New-Object System.Drawing.Size(350, 50)
$button1.Add_Click({
    Set-WinSystemLocale -SystemLocale "et-EE"
    [System.Windows.Forms.MessageBox]::Show("Süsteemi locale on muudetud to et-EE")
})
$form.Controls.Add($button1)

$button2 = New-Object System.Windows.Forms.Button
$button2.Text = "Eemalda Cortana"
$button2.Location = New-Object System.Drawing.Point(20, 80)
$button2.Size = New-Object System.Drawing.Size(350, 50)
$button2.Add_Click({
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0
Stop-Process -Name SearchUI -Force
    [System.Windows.Forms.MessageBox]::Show("Cortana eemaldatud")
})
$form.Controls.Add($button2)

$button3 = New-Object System.Windows.Forms.Button
$button3.Text = "Eemalda TikTok"
$button3.Location = New-Object System.Drawing.Point(20, 140)
$button3.Size = New-Object System.Drawing.Size(350, 50)
$button3.Add_Click({
    Get-AppxPackage *tiktok* | Remove-AppxPackage
    [System.Windows.Forms.MessageBox]::Show("TikTok eemaldatud")
})
$form.Controls.Add($button3)

$button4 = New-Object System.Windows.Forms.Button
$button4.Text = "Eemalda OneDrive"
$button4.Location = New-Object System.Drawing.Point(20, 200)
$button4.Size = New-Object System.Drawing.Size(350, 50)
$button4.Add_Click({
    Stop-Process -Name "OneDrive" -ErrorAction SilentlyContinue
Uninstall-Package -Name MicrosoftOneDrive -Force
    [System.Windows.Forms.MessageBox]::Show("OneDrive eemaldatud")
})
$form.Controls.Add($button4)

$button5 = New-Object System.Windows.Forms.Button
$button5.Text = "Seadista klaviatuuri keeled (en-US, et-EE)"
$button5.Location = New-Object System.Drawing.Point(20, 260)
$button5.Size = New-Object System.Drawing.Size(350, 50)
$button5.Add_Click({
    Set-WinUserLanguageList -LanguageList "en-US", "et-EE" -Force
    [System.Windows.Forms.MessageBox]::Show("Keelevalikusse on lisatud en-US, et-EE")
})
$form.Controls.Add($button5)

# Näita vorm
$form.ShowDialog()