# 使用`Jsonnet`配置「元书」皮肤。

## 皮肤文件目录结构
```

皮肤名称/
├── light/                  # 亮色主题资源目录
│   └── resources/          # 存放图片及描述文件（如牙齿素材）
├── dark/                   # 暗色主题资源目录
│   └── resources/          # 同上
├── jsonnet/                # 核心配置目录
│   ├── main.jsonnet        # 主配置文件（必须在此目录顶层）
│   ├── keyboard/           # 键盘文件主体
│   └── lib/                # 具体见下方
├── demo.png                # 皮肤预览图（必须PNG格式）
└── config.yaml             # 可选，可由main.jsonnet生成
```

## 不同文件管理的配置参数

|      lib/下的文件                    | 对应管理范围                  |
| :-------------------------: | --------------------------- |
|      `color.libsonnet`      | 各种颜色值                  |
|    `fontSize.libsonnet`     | 各处文本字体大小            |
|     `toolbar.libsonnet`     | toolbar配置                 |
|   `toolbar-en.libsonnet`    | 对应的英文键盘toolbar设置，会覆盖`toolbar`中相同名称的字段 |
|    `swipeData.libsonnet`    | 按键划动动作及显示参数      |
|  `swipeData-en.libsonnet`   | 对应的英文键盘设置，会覆盖`swipeData`中相同名称的字段 |
| `holdSymbolsData.libsonnet` | 长按动作及显示参数          |
|     `others.libsonnet`      | 键盘高度、键盘方案绑定      |
|     `center.libsonnet`      | 各种**偏移**以及**缩放**    |
| `collectionData.libsonnet` | 符号键盘、emoji键盘等的集合数据 |
| `keyboardLayout.libsonnet` | 中英文键盘的横竖屏布局 |

| keyboard/下的文件           | 介绍                         |
| --------------------------------- | ---------------------------- |
| `alphabetic_26_portrait.jsonnet`  | 英文键盘横竖屏统一的配置     |
| `pinyin_26_portrait.jsonnet`      | 中文键盘横竖屏统一的配置     |
| `numeric_9_portrait.jsonnet`      | 数字键盘竖屏配置     |
| `numeric_9_landscpae.jsonnet`     | **数字+符号**键盘横屏配置 |
| `symbolic_portrait.jsonnet`       | 符号键盘竖屏配置     |
| `emoji_portrait.jsonnet`          | emoji键盘横竖屏配置(横屏未适配)     |
| `panel.jsonnet`                   | 键盘面板横竖屏统一的配置                 |

## 使用
导入皮肤到「元书」内后，首次使用要**长按皮肤**，运行main.jsonnet以生成键盘配置，不然是显示不出来键盘的。
