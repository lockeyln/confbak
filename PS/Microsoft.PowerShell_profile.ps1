Import-Module posh-git # 引入 posh-git
Import-Module oh-my-posh # 引入 oh-my-posh
Import-Module -Name Terminal-Icons  # 引入文件图标库
# 设置主题
oh-my-posh init pwsh --config "C:\Users\nrnr\AppData\Local\Programs\oh-my-posh\themes\robbyrussell.omp.json"  |  Invoke-Expression
 
# Set-PSReadLineOption -PredictionSource History # 设置预测文本来源为历史记录
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete # 设置 Tab 键，命令行自动补全和提示
# Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete # 设置 Ctrl+d 为菜单补全和 Intellisense
# Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward # 设置向上键为后向搜索历史记录
# Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward # 设置向下键为前向搜索历史纪录
