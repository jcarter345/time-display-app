
#-------------------------------------------------------------#
#----Initial Declarations-------------------------------------#
#-------------------------------------------------------------#

Add-Type -AssemblyName PresentationCore, PresentationFramework

$Xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" Width="800" Height="400">
<Grid>
 <Button Content="Update Time" HorizontalAlignment="Left" VerticalAlignment="Top" Width="75" Margin="292,186,0,0" Name="UpdateDisplay"/>
<Button Content="Close App" HorizontalAlignment="Left" VerticalAlignment="Top" Width="75" Margin="292,225,0,0" Name="CloseApp"  IsCancel="True"/>
<Label VerticalAlignment="Top" Content="Label" Margin="292,123,0,0" Name="TimeDisplay"/>
</Grid></Window>
"@

#-------------------------------------------------------------#
#----Control Event Handlers-----------------------------------#
#-------------------------------------------------------------#


#region Logic
Function Update-TimeDisplay {
    #$TimeDisplay.Content = (get-date -Format "HH:mm:ss")
    return (get-date -Format "HH:mm:ss")
}
#endregion 


#-------------------------------------------------------------#
#----Script Execution-----------------------------------------#
#-------------------------------------------------------------#

$Window = [Windows.Markup.XamlReader]::Parse($Xaml)

[xml]$xml = $Xaml

$xml.SelectNodes("//*[@Name]") | ForEach-Object { Set-Variable -Name $_.Name -Value $Window.FindName($_.Name) }


$UpdateDisplay.Add_Click({$TimeDisplay.Content = (Update-TimeDisplay $this $_)})

#update time on first run.
$TimeDisplay.Content = Update-TimeDisplay

$Window.ShowDialog()


