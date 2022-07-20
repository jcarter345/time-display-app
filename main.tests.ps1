. $PSScriptRoot\main.ps1

Describe "Update-TimeDisplay" {
    it 'Function should return a string for label' {
        (update-timeDisplay).gettypeCode() | should be 'String'
        }
    it 'String should match date pattern' {
        (update-timeDisplay) | Should Match "\d.:\d.:\d."
    }
}