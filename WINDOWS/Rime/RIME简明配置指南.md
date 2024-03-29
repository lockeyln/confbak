## 特点

- 高自由  
    - 全平台兼容：windows、mac、linux，甚至安卓都有衍生（[同文安卓输入法平台](https://github.com/osfans/trime)）  
    - 众多可选方案：包括小鹤、微软在内的双拼方案，还能实现小鹤双拼形码辅助；注音、五笔、仓颉……以及自定方案。  
    - 标点自定、模糊音、词语联想、个人词库，基本囊括常规输入工具的功能。
    - 支持多平台一套配置，Linux和macOS以及Windows一次性统一。
    - 支持自定义字库（比如：古汉语大全、新华成语大全和现在计算机名词解释等），还可以实现拆字、颜文字和Emoji表情等。
    - 支持Lua语法插件（比如：输入date，可以打印今天的日期）。
    - 无需联网，保证个人隐私不通过输入法流入大数据。

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

**不同操作系统默认配置文件夹的地址**  

  - Linux上默认配置文件地址：~/.config/ibus/rime/
  - macOS上默认配置文件地址：~/Library/Rime/
  - Windows上默认配置文件地址： %APPDATA%\Rime

  部分操作系统，可以更改默认配置文件夹的地址；比如Windows：
  
- 默认的配置文件主要有

| 文件 | 说明 |
|  ----  | ----  |
| default.custom.yaml | 核心配置、全局配置 |
| squirrel.custom.yaml / weasel.custom.yaml / ibus_rime.yaml | 平台相关配置。样式皮肤，不同软件默认输入法状态等。 |
| <方案标识>.custom.yaml | 输入方案的定制配置 |
| <名称>.dict.yaml | 词典 |
| custom_phrase.txt | 自定义短语 |

**优先级上**

> 输入方案的定制配置  > 核心配置、全局配置 > 系统自带的default.yaml

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

**部署编译**

```
Rime是如何运用个性化配置呢？很简单，用户在修改配置目录内的文件，这个只是临时修改，而真正要生效，就需要Rime重新进行部署操作。

在执行部署操作后，Rime会进行编译，将用户的自定义内容（包括词典），编译到配置目录内的build文件夹内。

部署编译，基本上三大系统是一样的。
```

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
    
 ### 配置Rime皮肤  
 
1. 打开weasel.custom.yaml文件，若没有，则新建。  

2. 复制如下代码段到该文件。  

  ```
  customization:
  distribution_code_name: Weasel
  distribution_version: 0.14.3
  generator: "Weasel::UIStyleSettings"
  modified_time: "Thu Jun 27 17:32:21 2019"
  rime_version: 1.5.3

patch:
  "style/display_tray_icon": true
  "style/horizontal": true #横排显示
  "style/font_face": "Microsoft YaHei" #字体
  "style/font_point": 13 #字体大小
  "style/inline_preedit": true # 嵌入式候选窗单行显示


  "style/layout/border_width": 0
  "style/layout/border": 0
  "style/layout/margin_x": 12 #候选字左右边距
  "style/layout/margin_y": 12 #候选字上下边距
  "style/layout/hilite_padding": 12 #候选字背景色色块高度 若想候选字背景色块无边界填充候选框，仅需其高度和候选字上下边距一致即可
  "style/layout/hilite_spacing": 3 # 序号和候选字之间的间隔
  "style/layout/spacing": 10 #作用不明
  "style/layout/candidate_spacing": 24 # 候选字间隔
  "style/layout/round_corner": 0 #候选字背景色块圆角幅度


  "style/color_scheme": Micosoft
  "preset_color_schemes/Micosoft":
    name: "Micosoft"
    author: "XNOM"
    back_color: 0xffffff #候选框 背景色
    border_color: 0xD77800 #候选框 边框颜色
    text_color: 0x000000 #已选择字 文字颜色
    hilited_text_color: 0x000000 #已选择字右侧拼音 文字颜色
    hilited_back_color: 0xffffff #已选择字右侧拼音 背景色
    hilited_candidate_text_color: 0xffffff #候选字颜色
    hilited_candidate_back_color: 0xD77800 #候选字背景色
    candidate_text_color: 0x000000 #未候选字颜色  
    
  ```  
    
3. 重新部署，查看效果。该配色方案是近乎完全还原win10微软输入法皮肤。
  
  ![](https://upload-images.jianshu.io/upload_images/850975-20d1a75edae7245f.png?imageMogr2/auto-orient/strip|imageView2/2/w/549/format/webp)  
  
### 使用RIME

到此，RIME基本配置完毕。如果更多定制化要求，请自行搜寻相关教程。  

- 切换为RIME输入法后，按下Ctrl+`或F4快捷键，调出方案选单，第一次选择：选择所需方案，第二次选择：选择简体或繁体、半角或全角、中文或英文、中文标点或英文标点输出，即可开始使用。  

  ![](https://upload-images.jianshu.io/upload_images/850975-06d0a75c26ee4e96.png?imageMogr2/auto-orient/strip|imageView2/2/w/396/format/webp)
  
  ![](https://upload-images.jianshu.io/upload_images/850975-23a20a94306a0309.png?imageMogr2/auto-orient/strip|imageView2/2/w/669/format/webp)
  
- 开始您的自由输入之旅吧。  


### 如何同步个人词典和配置方案

Rime没有云同步功能，但有本地同步功能，我们可以借助坚果云、onedrive等第三方云实现个人词典和配置方案在不同电脑间的同步和备份。以坚果云举例：  

1. 在你的坚果云同步文件夹内，这里举例为'D:\Nutstore‘，新建一个RimeSync文件夹。其他第三方同步云请自行同理修改。  

2. 先打开用户资料夹，打开installation.yaml文件，在最下方添加如下代码：

```
sync_dir: 'D:\Nutstore\RimeSync'
```

其中，installation_id后的一长串字段，可以自行修改为喜欢的名称。这里举例为XNOM。
最后完成的样子如下：

```
distribution_code_name: Weasel
distribution_name: "小狼毫"
distribution_version: 0.14.3
install_time: "Wed Jul 10 15:57:26 2019"
installation_id: "XNOM"
rime_version: 1.5.3
sync_dir: 'D:\Nutstore\RimeSync'
```  
3. 在开始菜单找到【小狼毫】用户资料同步，(也可以点击托盘图标，选择用户资料同步)，完成后，你就能在RimeSync文件夹中找到XNOM文件夹，其中的内容就是你的个人词典文件和配置文件。  

4. 以后若在另外的电脑上使用Rime，则按照相同的步骤，将RimeSync的内容同步即可。

**关于同步功能的注意**

Rime的同步功能，在个人词典是双向同步，在个人配置是单项同步。怎么理解呢？

- 个人词典双向同步，举例来说，甲电脑个人词典累积了词汇ABC，乙电脑累积了词汇DEF，那么，通过第三方云同步和Rime同步后，个人词典词汇会双向同步合并为ABCDEF。

- 配置单向同步，是指将配置文件，单向地从「用户文件夹」同步进入「同步文件夹」。这也是为了保持配置的一致性的必须方案。因为，若这两个文件夹中的配置不一致时，必然产生混乱。因而必须由用户手动。  

- 所以，上述的第四步，是将云端同步好的个人词典文件同步，而个人配置文件，需要你手动复制粘贴进入「用户资料夹」。  

### 一些没能实现的功能

在Rime，利用反斜杆可以实现输入特殊符号、颜文字等等强大功能。例如：输入/xl，能输出希腊字母。  

  ![](https://upload-images.jianshu.io/upload_images/850975-0cc8ec7e30f41eaf.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/204/format/webp)  
  
输入/wz，能输出常用网址  
  
  ![](https://upload-images.jianshu.io/upload_images/850975-6e13249379c1abe2.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/206/format/webp)  
  
这个功能，用家可以选用明月拼音方案进行体验。但在双拼方案中，似乎无法实现码表的对应，以至于该功能缺失。目前我还没有找到好的方法能够在双拼方案中实现反斜杠特殊符号功能。  

### 参考资料及扩展阅读

1. [RIME帮助文档](https://rime.im/docs/)
  
2. [鼠须管输入法傻瓜配置 基于rime_pro](https://segmentfault.com/a/1190000005754706)    

3. [致第一次安装RIME的你](https://www.zybuluo.com/eternity/note/81763)

4. [Rime自定义符号](https://blog.csdn.net/u013410771/article/details/79422576)

5. [推荐一个神级输入法RIME](https://byvoid.com/zhs/blog/recommend-rime/)

6. [一位匠人的中州韵——专访Rime输入法作者佛振](https://segmentfault.com/a/1190000002424698)

7. [最新版 Rime 输入法使用](https://jdhao.github.io/2019/02/18/rime_configuration_intro/)

8. [oh-my-rime](https://github.com/Mintimate/oh-my-rime) 

9. [打造跨平台rime定制指南](https://www.mintimate.cn/2023/03/18/rimeQuickInit/)
