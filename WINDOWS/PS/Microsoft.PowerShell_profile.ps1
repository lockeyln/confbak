Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons  # 引入文件图标库
# 设置预测文本来源为历史记录
# Set-PSReadLineOption -PredictionSource History 
# 设置 Tab 键，命令行自动补全和提示
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete 
# 用于临时更改当前 PowerShell 允许运行脚本而不受限制,不会影响其他会话或系统全局设置
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# disable bell/beep sound
Set-PSReadlineOption -BellStyle None

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

$env:HTTP_PROXY = "http://127.0.0.1:7890"
$env:HTTPS_PROXY = "http://127.0.0.1:7890"
$env:NO_PROXY = "localhost,127.0.0.1,::1,192.168.0.0/16"

function cdnvim()
{
  Set-Location $env:LOCALAPPDATA/nvim
}

function cdnvimdata()
{
  Set-Location $env:LOCALAPPDATA/nvim-data
}
