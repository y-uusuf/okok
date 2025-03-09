# Hide the PowerShell window
$code = @"
using System;
using System.Runtime.InteropServices;

public class Win32 {
    [DllImport("user32.dll")]
    public static extern int ShowWindow(IntPtr hWnd, uint nCmdShow);
    [DllImport("kernel32.dll")]
    public static extern IntPtr GetConsoleWindow();
}
"@
Add-Type -TypeDefinition $code
$consolePtr = [Win32]::GetConsoleWindow()
[Win32]::ShowWindow($consolePtr, 0) # 0 hides the window

# Function to log websites visited
function Log-Websites {
    $logFile = "C:\path\to\your\logfile.txt"
    $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $website = "example.com" # Replace with actual website tracking logic
    Add-Content -Path $logFile -Value "$date: $website"
}

# Example usage
Log-Websites
