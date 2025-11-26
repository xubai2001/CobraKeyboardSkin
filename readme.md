# 功能说明
- 空格上划是切换中英键盘
- 键盘上的符号可以通过上滑或滑动按键触发。部分按键（如 z 到 m）上的功能可能需要开启“完全访问”权限才能使用。
- 在数字键盘（123键）向下滑动，可以触发 `#RimeSwitcher` 功能。

# 常见问题

## 如何修改按键上的划动功能？
打开 `jsonnet/lib/swipeData.libsonnet` 文件，按照里面的格式说明来增加、删除或修改滑动功能。英文键盘的配置单独放在同目录下的 `swipeData-en.libsonnet` 中。

修改完成后，记得在软件的皮肤选择界面，长按当前皮肤，然后选择「运行 `main.jsonnet`」来生效。

## 如何修改按键上的长按功能？
打开 `jsonnet/lib/hintSymbolsData.libsonnet` 文件，按照里面的格式说明来调整长按功能。

## 工具栏上的「简繁切换」按键为什么不会变？
这个需要改`keyboard/lib/toolbar.libsonnet`, 找到`rime$simplification`, 将`$`后面的部分改成你方案里(.schema.yaml后缀的文件) `switches`中的简繁切换的option name。
这里列几个常见方案的，雾凇拼音：traditionalization， 薄荷拼音: transcription_cc，万象拼音：

修改完成后，同样需要在皮肤选择界面长按皮肤，选择「运行 `main.jsonnet`」。

# 详细说明
## 目录结构
一个皮肤文件夹通常包含以下内容：
- `light/` – 存放亮色主题的配置文件和图片
- `dark/` – 存放暗色主题的配置文件和图片
- `jsonnet/` – 存放核心配置文件
- `demo.png` – 皮肤预览图

## Jsonnet 目录配置文件说明

### keyboard/ 目录下的文件：
- `alphabetic_26` – 英文键盘（同时生成竖屏和横屏配置）
- `pinyin_26` – 中文拼音键盘
- `numeric_9` – 数字键盘
- `symbolic` – 符号键盘
- `emoji` – 表情键盘(元书已内置有emoji键盘，这个就没什么用了)
- `panel` – 键盘面板配置

### lib/ 目录下的文件：
- `color` – 颜色设置
- `fontSize` – 字体大小
- `toolbar` – 工具栏配置
- `swipeData` – 按键滑动功能
- `hintSymbolsData` – 按键长按功能
- `others` – 键盘高度、方案绑定等
- `center` – 偏移和缩放设置
- `collectionData` – 符号和表情集合
- `keyboardLayout` – 键盘布局（仅中英文）
- `utils` – 实用工具函数


# 修改说明
- **在手机上修改**：编辑 `jsonnet/` 目录下的文件后，在皮肤选择界面长按当前皮肤，选择「运行 `main.jsonnet`」即可应用修改。
- **在电脑上修改**：配置好 Jsonnet 工具后，在皮肤目录打开终端，执行以下命令生成配置文件：
  ```bash
  jsonnet -S -m .\jsonnet\main.jsonnet
  ```
