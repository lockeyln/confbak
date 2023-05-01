## 特点

- 高自由  
    - 全平台兼容：windows、mac、linux，甚至安卓都有衍生（[同文安卓输入法平台](https://github.com/osfans/trime)）  
    - 众多可选方案：包括小鹤、微软在内的双拼方案，还能实现小鹤双拼形码辅助；注音、五笔、仓颉……以及自定方案。  
    - 标点自定、模糊音、词语联想、个人词库，基本囊括常规输入工具的功能。

- 高门槛
    - 无图形界面，自定全靠代码。
    - 配置繁琐，容易出错。

## 安装RIME

**资源**

1. [RIME安装包下载](https://rime.im/download/)  
2. [输入方案下载](https://github.com/rime)
3. [rime_pro增强包下载](https://pan.baidu.com/s/1jI1a8eE)


### 安装仅以Windows平台小鹤双拼方案为例

1. 按照上文1下载安装包，跟随安装向导完成安装。在用户资料夹页面，下方空白处选择使用默认位置。  
    (默认位置在windows的个人文件夹~\AppData\Roaming\Rime，也可以选择我来指定位置，在下方空白框内填入你指定的文件夹的绝对路径。下文所称用户资料夹，均指这个文件夹）。  
    
    ![](https://upload-images.jianshu.io/upload_images/850975-eb908e955d0c1676.png?imageMogr2/auto-orient/strip|imageView2/2/w/356/format/webp)

2. 按照上文2下载所需的输入方案，全拼用户可略过此步。

    - 在开始菜单，点击【小狼毫】输入法设定，点击获取更多输入方案，打开rime package installer 命令行界面。  

    ![](https://upload-images.jianshu.io/upload_images/850975-b60c23d16181c050.png?imageMogr2/auto-orient/strip|imageView2/2/w/492/format/webp)  
    
    - 将上文2下载的输入方案拖入该窗口，回车完成安装。(若第一步选择了指定文件夹，需从默认文件夹将输入方案拷贝粘贴至你指定的文件夹内)。  
    
    ![](https://upload-images.jianshu.io/upload_images/850975-529eef252235488f.png?imageMogr2/auto-orient/strip|imageView2/2/w/978/format/webp)  
    
    - 重新打开【小狼毫】输入法设定，在左侧方案名称内勾选所需使用的方案，小鹤双拼。  

    - 点击中进入下一步【小狼毫】界面风格设定，选取喜欢的界面风格。不喜欢没关系，后面会给一个微软拼音同款自定界面。  

3. 到此步，Rime小狼毫输入法已经基本可用了。当然，我们并不会满足于此，下面进入定制阶段。


### 如何定制RIME

- 上文3 Rime_pro增强包就是一份全面的配置。

**需要事前了解的常识**

- Rime的各种配置，均是由.yaml文件所定义。yaml是一种标记语言。.yaml文件实际上是文本文档。可使用记事本、或Emeditor等进行编辑。

- 对Rime进行自定义，是通过对.custom.yaml文件修改达成。不同的.custom.yaml文件，控制不同的功能实现。 .custom.yaml实际上是相当于对.yaml文件打补丁，在重新部署后，会将.custom.yaml中的内容写入.yaml文件中，完成自定。  

    - 例一：weasel.yaml是常规设置，主要控制托盘图标、候选词横竖排列、界面配色等等功能。那么，我们需要定制界面配色，只需在weasel.custom.yaml中修改，重新部署后就可实现。

    - 例二：default.yaml是默认设置，主要控制快捷键、按键上屏等等。同样，作修改就编辑default.custom.yaml文件即可。  

    - 例三：以上是全局设置，亦即不论使用何种输入方案，均起作用。double_pinyin_flypy.custom.yaml这种则是输入法方案设置。主要实现特殊标点符号、词库等功能。是针对特定输入方案  的配置。  

- 我们绝大部分的自定，都只需修改对应的.custom.yaml文件即可。

- 所有自定修改，都必须重新部署。在开始菜单可以找到【小狼毫】重新部署。

    - 在开始菜单可以找到【小狼毫】重新部署。  

    - 右键托盘图标重新部署。  

#### 开始配置Rime  

1. 解压Rime_pro软件增强包，并把里面的文件拷贝到 ~/Rime （此处是上文所述指定用户资料夹），覆盖即可。  

2. 请注意，该增强包在最新版小狼毫不能很好地支持小鹤双拼方案，故而，需首先将double_pinyin_flypy.custom.yaml文件中的内容清空。  

3. 现在，来配置小鹤双拼方案。将如下代码，复制黏贴进入double_pinyin_flypy.custom.yaml文件。

    ```
    patch:

      # 載入朙月拼音擴充詞庫
      "translator/dictionary": luna_pinyin.extended

      # 输入双拼码的时候不转化为全拼码
      translator/preedit_format: {}

      #载入custom_phrase自定义短语
      engine/translators:
          - punct_translator
          - reverse_lookup_translator
          - script_translator
          - table_translator@custom_phrase #表示调用custom_phrase段编码
          - table_translator
      custom_phrase:
        dictionary: ""
        user_dict: custom_phrase
        db_class: stabledb
        enable_completion: false
        enable_sentence: false
        initial_quality: 1

      #  符号快速输入和部分符号的快速上屏
      punctuator:
        import_preset: symbols
        half_shape:
      #      "#": "#"
          '`': ["·","`"]
      #      "~": "~"
      #      "@": "@"
      #      "=": "="
      #      "!": "!"
      #      "/": ["/", "÷"]
          '\': "、"
      #      "'": {pair: ["「", "」"]}
      #      "[": ["【", "["]
      #      "]": ["】", "]"]
      #      "$": ["¥", "$", "€", "£", "¢", "¤"]
      #      "<": ["《", "〈", "«", "<"]
      #      ">": ["》", "〉", "»", ">"]
    ```
  
    这些代码的含义，已经有详细注释说明了。如不需要某项自定义，将其注释掉就可禁用了。 如果需要某些自定义，可以找到相关教程，添加相应的代码段即可。  
  
    **注意**
  
    - 该文档只有最开头需要一句patch:，从其他教程拷贝的自定义代码段，请注意不要再次带入patch:  

    - 该文档有严格的缩进要求，请注意按照格式缩进。  

4. 现在，来配置扩展词库。打开luna_pinyin.extended.dict.yaml文件。找到如下代码段。  

    ```
        ---
        name: luna_pinyin.extended
        version: "2014.10.28"
        sort: by_weight
        use_preset_vocabulary: true
        #此處爲明月拼音擴充詞庫（基本）默認鏈接載入的詞庫，有朙月拼音官方詞庫、明月拼音擴充詞庫（漢語大詞典）、明月拼音擴充詞庫（詩詞）、明月拼音擴充詞庫（含西文的詞彙）。如果不需要加載某个詞庫請將其用「#」註釋掉。
        #雙拼不支持 luna_pinyin.cn_en 詞庫，請用戶手動禁用。
        import_tables:
          - luna_pinyin
        #- luna_pinyin.cn_en
          - luna_pinyin.computer
        #- luna_pinyin.emoji
          - luna_pinyin.hanyu
        #- luna_pinyin.kaomoji
          - luna_pinyin.movie
          - luna_pinyin.music
          - luna_pinyin.name
          - luna_pinyin.poetry
          - luna_pinyin.sgmain
          - luna_pinyin.i
        #
          - f_myphrases
          - f_mysecretphrases
        ... 
    ```  
    
    将luna_pinyin.cn_en禁用。禁用的方式很简单，在相应代码行前加上#将其注释掉即可。  
    当然，全拼用户请跳过这步。这些词库，大家根据需要禁用或启用。这里禁用了两个emoji词库。  
    
5. 现在，来配置自定义短语。在文件夹中，新建文本文档，更名为：Custom_phrase.txt。复制如下代码段到这个文档。  

    ```
    # Rime table
    # coding: utf-8
    #@/db_name custom_phrase.txt
    #@/db_type tabledb
    #
    # 用於【朙月拼音】系列輸入方案
    # 【小狼毫】0.9.21 以上
    #
    # 請將該文件以UTF-8編碼保存爲
    # Rime用戶文件夾/custom_phrase.txt
    #
    # 碼表各字段以製表符（Tab）分隔
    # 順序爲：文字、編碼、權重（決定重碼的次序、可選）
    #
    # 雖然文本碼表編輯較爲方便，但不適合導入大量條目
    #
    # no comment
    xxx@gmail.com   gmail   1
    ```  
    
    以第一条gmail为例，根据文字、編碼、權重的先后顺序，按照每行一条的格式，输入你的自定义短语。注意，各个字段之间以制表符（tab）分隔，不是空格！  
    
6. 最后，在开始菜单【小狼毫】重新部署即可。
    
    
