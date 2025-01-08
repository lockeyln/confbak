Import-Module posh-git # git
Import-Module -Name Terminal-Icons  # 文件图标库
Import-Module PSReadLine  # 提供语法高亮、错误提示、多行编辑、键绑定、历史记录搜索等功能

Invoke-Expression (& { (lua $HOME/z.lua/z.lua --init powershell once enhanced) -join "`n" })

# 设置主题
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/robbyrussell.omp.json"  |  Invoke-Expression

 
# Set-PSReadLineOption -EditMode Emacs
# Set-PSReadLineOption -PredictionSource HistoryAndPlugin
# Set-PSReadLineOption -PredictionViewStyle ListView
# Set-PSReadLineOption -BellStyle None
# Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar 

# Set-PSReadLineOption -PredictionSource History # 设置预测文本来源为历史记录
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete # 设置 Tab 键，命令行自动补全和提示
# Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete # 设置 Ctrl+d 为菜单补全和 Intellisense
# Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward # 设置向上键为后向搜索历史记录
# Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward # 设置向下键为前向搜索历史纪录
