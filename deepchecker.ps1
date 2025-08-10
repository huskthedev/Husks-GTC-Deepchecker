Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function New-RoundedButton {
    param (
        [string]$Text,
        [int]$X,
        [int]$Y,
        [int]$Width = 120,
        [int]$Height = 35
    )

    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = $Text
    $btn.Location = New-Object System.Drawing.Point($X, $Y)
    $btn.Size = New-Object System.Drawing.Size($Width, $Height)
    $btn.FlatStyle = 'Flat'
    $btn.BackColor = [System.Drawing.Color]::FromArgb(50, 130, 200)
    $btn.ForeColor = [System.Drawing.Color]::White
    $btn.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
    $btn.FlatAppearance.BorderSize = 0

    $btn.add_Paint({
        param($s, $e)
        $gp = New-Object System.Drawing.Drawing2D.GraphicsPath
        $gp.AddArc(0, 0, 20, 20, 180, 90)
        $gp.AddArc($s.Width-21, 0, 20, 20, 270, 90)
        $gp.AddArc($s.Width-21, $s.Height-21, 20, 20, 0, 90)
        $gp.AddArc(0, $s.Height-21, 20, 20, 90, 90)
        $gp.CloseAllFigures()
        $s.Region = New-Object System.Drawing.Region($gp)
    })

    return $btn
}

$form = New-Object System.Windows.Forms.Form
$form.Text = "Husks Deepchecker for GTag"
$form.Width = 800
$form.Height = 600
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)

$form.Controls.Add( (New-RoundedButton "Settings" 20 10 120 35) )
$form.Controls.Add( (New-RoundedButton "Scan" 150 10 120 35) )
$form.Controls.Add( (New-RoundedButton "Advanced Settings" 280 10 180 35) )

[void]$form.ShowDialog()
