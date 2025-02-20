#### 隐藏notebook终端窗口


**新建jupyter.bat，倒数第二行的D:\Jupyter_workspace修改为你想要作为根目录的路径**


```
%隐藏cmd窗口%

@echo off    
if "%1"=="h" goto begin 
start mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit 
:begin 
cd /d D:\Jupyter_workspace 
jupyter notebook    
```

#### 关闭notebook进程


**新建Kill jupyter.bat** 
```
%隐藏cmd窗口%

@echo off 
if "%1"=="h" goto begin 
start mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit      
:begin 
taskkill /f /im jupyter-notebook.exe 
```

