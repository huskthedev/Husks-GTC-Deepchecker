Add-Type -AssemblyName PresentationFramework

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Husks Deepchecker for GTag" Height="300" Width="500"
        Background="#1e1e1e" WindowStartupLocation="CenterScreen">
    <Grid>
        <StackPanel Orientation="Horizontal" HorizontalAlignment="Center" Margin="0,10,0,0">
            <Button Content="Settings" Width="120" Height="30" Margin="5" 
                    Background="#2d2d30" Foreground="White" BorderThickness="0"
                    FontWeight="Bold" Cursor="Hand" 
                    Style="{DynamicResource {x:Static ToolBar.ButtonStyleKey}}"/>
            <Button Content="Scan" Width="120" Height="30" Margin="5" 
                    Background="#2d2d30" Foreground="White" BorderThickness="0"
                    FontWeight="Bold" Cursor="Hand" 
                    Style="{DynamicResource {x:Static ToolBar.ButtonStyleKey}}"/>
            <Button Content="Advanced settings" Width="150" Height="30" Margin="5" 
                    Background="#2d2d30" Foreground="White" BorderThickness="0"
                    FontWeight="Bold" Cursor="Hand" 
                    Style="{DynamicResource {x:Static ToolBar.ButtonStyleKey}}"/>
        </StackPanel>
    </Grid>
</Window>
"@

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

$window.ShowDialog() | Out-Null
