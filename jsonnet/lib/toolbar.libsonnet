local center = import 'center.libsonnet';
local color = import 'color.libsonnet';
local fontSize = import 'fontSize.libsonnet';
local utils = import 'utils.libsonnet';

local getToolBar(theme) = {
  preeditStyle: {
    insets: {
      left: 8,
      top: 2,
    },
    backgroundStyle: 'preeditBackgroundStyle',
    foregroundStyle: 'preeditForegroundStyle',
  },
  preeditBackgroundStyle: {
    buttonStyleType: 'geometry',
    normalColor: color[theme]['键盘背景颜色'],
  },
  preeditForegroundStyle: {
    textColor: color[theme]['候选字体未选中字体颜色'],
    fontSize: fontSize['preedit区字体大小'],
    fontWeight: 0,
  },

  // 工具栏
  toolbarStyle: {
    backgroundStyle: 'toolbarBackgroundStyle',
  },

  // 工具栏布局
  toolbarLayout: [
    {
      HStack: {
        subviews: [
          // 工具栏会和其他键盘合并在一起，这里按键名称添加前缀以防冲突
          { Cell: 'toolbarMenuButton' },
          { Cell: 'toolbarTranslateButton' },
          { Cell: 'toolbarEmojiButton' },
          { Cell: 'toolbarPhraseeButton' },
          { Cell: 'toolbarPasteboardButton' },
          { Cell: 'toolbarScriptButton' },
          { Cell: 'toolbarSimp2tranButton' },
          { Cell: 'toolbarCloseButton' },
        ],
      },
    },
  ],
  // 工具栏背景样式
  toolbarBackgroundStyle: {
    buttonStyleType: 'geometry',
    normalColor: color[theme]['键盘背景颜色'],
  },

  // 工具栏按键背景样式
  toolbarButtonBackgroundStyle: {
    buttonStyleType: 'geometry',
    normalColor: '#00000001',
    highlightColor: '#00000001',
  },

  // 占位空按键
  toolbarPlaceholderButton: {
  },

  toolbarMenuButton: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarMenuButtonForegroundStyle',
    action: {
      floatKeyboardType: 'panel',
    },
  },

  toolbarMenuButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '面板',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },

  toolbarTranslateButton: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarTranslateButtonForegroundStyle',
    action: {
      runScript: '快捷翻译',
    },
  },
  toolbarTranslateButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '翻译',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },

  toolbarEmojiButton: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarEmojiButtonForegroundStyle',
    action: {
      keyboardType: 'emojis',
    },
  },
  toolbarEmojiButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '表情',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },

  toolbarPhraseeButton: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarPhraseeButtonForegroundStyle',
    action: {
      shortcutCommand: '#showPhraseView',
    },
  },
  toolbarPhraseeButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '短语',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },

  toolbarPasteboardButton: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarPasteboardButtonForegroundStyle',
    action: {
      shortcutCommand: '#showPasteboardView',
    },
  },
  toolbarPasteboardButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '剪贴',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },


  toolbarScriptButton: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarScriptButtonForegroundStyle',
    action: {
      shortcutCommand: '#toggleScriptView',
    },
  },
  toolbarScriptButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '脚本',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },
  toolbarSimp2tranButton: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: [
      {
        styleName: 'tranStyle',
        conditionKey: 'rime$simplification',
        conditionValue: true,
      },
      {
        styleName: 'simpStyle',
        conditionKey: 'rime$simplification',
        conditionValue: false,
      },
    ],
    // notification: "simpstateNotification",
    action: {
      shortcutCommand: '#简繁切换',
    },
  },

  simpStyle: {
    buttonStyleType: 'text',
    text: '简体',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },
  tranStyle: {
    buttonStyleType: 'text',
    text: '繁体',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },
  toolbarCloseButton: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarCloseButtonForegroundStyle',
    action: 'dismissKeyboard',
  },
  toolbarCloseButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '收起',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },

  // 横向候选样式
  horizontalCandidatesStyle: {
    insets: {
      top: 8,
      bottom: 3,
      left: 5,
    },
    backgroundStyle: 'toolbarBackgroundStyle',
  },
  // 横向候选布局
  horizontalCandidatesLayout: [
    {
      HStack: {
        subviews: [
          { Cell: 'horizontalCandidates' },
          { Cell: 'expandButton' },
        ],
      },
    },
  ],
  // 横向候选文字部分组件
  horizontalCandidates: {
    type: 'horizontalCandidates',
    size: { width: '7/8' },
    // maxColumns: 4,
    insets: { left: 3 },
    // backgroundStyle:
    candidateStyle: 'candidateStyle',
  },
  // 横向候选文字样式
  candidateStyle: {
    highlightBackgroundColor: 0,
    preferredBackgroundColor: color[theme]['选中候选背景颜色'],
    preferredIndexColor: color[theme]['候选字体选中字体颜色'],
    preferredTextColor: color[theme]['候选字体选中字体颜色'],
    preferredCommentColor: color[theme]['候选字体选中字体颜色'],
    indexColor: color[theme]['候选字体未选中字体颜色'],
    textColor: color[theme]['候选字体未选中字体颜色'],
    commentColor: color[theme]['候选字体未选中字体颜色'],
    indexFontSize: fontSize['未展开候选字体选中字体大小'],
    textFontSize: fontSize['未展开候选字体选中字体大小'],
    commentFontSize: fontSize['未展开comment字体大小'],
  },
  // 横向候选展开按键
  expandButton: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'expandButtonForegroundStyle',
    action: { shortcut: '#candidatesBarStateToggle' },
  },
  expandButtonForegroundStyle: {
    buttonStyleType: 'systemImage',
    systemImageName: 'chevron.down',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景sf符号大小'],
    // center: center['toolbar按键sf符号偏移'],
  },

  // 纵向候选定义
  verticalCandidatesStyle: {
    insets: { left: 3, bottom: 1, top: 3 },
    backgroundStyle: 'verticalCandidateBackgroundStyle',
  },
  // 纵向候选背景
  verticalCandidateBackgroundStyle: {
    buttonStyleType: 'fileImage',
    normalImage: {
      file: 'bg',
      image: 'IMG1',
    },
  },
  // 纵向候选布局
  verticalCandidatesLayout: [
    {
      VStack: {
        subviews: [
          { Cell: 'verticalCandidates' },
        ],
      },
    },
    {
      VStack: {
        style: 'VStackStyle',
        subviews: [
          { Cell: 'verticalCandidateReturnButton' },
          { Cell: 'verticalCandidateBackspaceButton' },
          { Cell: 'verticalCandidatePageUpButton' },
          { Cell: 'verticalCandidatePageDownButton' },
        ],
      },
    },
  ],
  // verticalCandidatesLayout: [
  //   {
  //     HStack: {
  //       subviews: [
  //         { Cell: 'verticalCandidates' },
  //       ],
  //     },
  //   },
  //   {
  //     HStack: {
  //       style: 'HStackStyle',
  //       subviews: [
  //         { Cell: 'verticalCandidatePageUpButton' },
  //         { Cell: 'verticalCandidatePageDownButton' },
  //         { Cell: 'verticalCandidateReturnButton' },
  //         { Cell: 'verticalCandidateBackspaceButton' },
  //       ],
  //     },
  //   },
  // ],
  HStackStyle: {
    size: {
      height: '1/5',
    },
  },
  VStackStyle: {
    size: {
      width: '29/183',
    },
  },
  // 纵向候选配置
  verticalCandidates: {
    type: 'verticalCandidates',
    insets: {
      top: 3,
      bottom: 3,
      left: 4,
      right: 4,
    },
    // （非必须，默认值为 4）显示区域内候选文字最大行数
    // maxRows: 4
    // （非必须，默认值为 5）显示区域内候选文字最大列数
    // maxColumns: 5
    // bottomRowHeight: 50,
    backgroundStyle: 'verticalCandidateBackgroundStyle',
    candidateStyle: 'verticalCandidateCellStyle',
  },
  // 纵向候选文字样式
  verticalCandidateCellStyle: {
    insets: {
      top: 8,
      bottom: 8,
      left: 8,
      right: 8,
    },
    highlightBackgroundColor: 0,
    preferredBackgroundColor: color[theme]['选中候选背景颜色'],
    preferredIndexColor: color[theme]['候选字体选中字体颜色'],
    preferredTextColor: color[theme]['候选字体选中字体颜色'],
    preferredCommentColor: color[theme]['候选字体选中字体颜色'],
    indexColor: color[theme]['长按非选中字体颜色'],
    textColor: color[theme]['长按非选中字体颜色'],
    commentColor: color[theme]['长按非选中字体颜色'],
    indexFontSize: fontSize['展开候选字体选中字体大小'],
    textFontSize: fontSize['展开候选字体选中字体大小'],
    commentFontSize: fontSize['未展开候选字体选中字体大小'],
  },

  // verticalCandidateOfCandidateStyle: {
  //   insets: {
  //     top: 8,
  //     bottom: 8,
  //     left: 8,
  //     right: 8,
  //   },
  //   backgroundInsets: {
  //     top: 8,
  //     bottom: 8,
  //     left: 8,
  //     right: 8,
  //   },
  //   cornerRadius: 7,
  //   backgroundColor: 0,
  //   separatorColor: 0,
  //   highlightBackgroundColor: 0,
  //   preferredBackgroundColor: color[theme]['选中候选背景颜色'],
  //   preferredIndexColor: color[theme]['候选字体选中字体颜色'],
  //   preferredTextColor: color[theme]['候选字体选中字体颜色'],
  //   preferredCommentColor: color[theme]['候选字体选中字体颜色'],
  //   indexColor: color[theme]['长按非选中字体颜色'],
  //   textColor: color[theme]['长按非选中字体颜色'],
  //   commentColor: color[theme]['长按非选中字体颜色'],
  //   indexFontSize: fontSize['展开候选字体选中字体大小'],
  //   textFontSize: fontSize['展开候选字体选中字体大小'],
  //   commentFontSize: fontSize['未展开候选字体选中字体大小'],
  // },

  // 纵向候选页面，按键背景样式，除了退格键
  verticalCandidateButtonBackgroundStyle: utils.makeGeometryStyle(
    params={
      insets: { top: 5, left: 3, bottom: 6, right: 3 },
      normalColor: color[theme]['功能键背景颜色-普通'],
      highlightColor: color[theme]['功能键背景颜色-高亮'],
      cornerRadius: 7,
      normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
      highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
    }
  ),

  // 纵向候选页面，向上翻页按键
  verticalCandidatePageUpButton: {
    backgroundStyle: 'verticalCandidateButtonBackgroundStyle',
    foregroundStyle: 'verticalCandidatePageUpButtonForegroundStyle',
    action: { shortcut: '#verticalCandidatesPageUp' },
  },
  // 纵向候选页面，向下翻页按键
  verticalCandidatePageDownButton: {
    backgroundStyle: 'verticalCandidateButtonBackgroundStyle',
    foregroundStyle: 'verticalCandidatePageDownButtonForegroundStyle',
    action: { shortcut: '#verticalCandidatesPageDown' },
  },

  verticalCandidatePageUpButtonForegroundStyle: {
    buttonStyleType: 'systemImage',
    systemImageName: 'chevron.up',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'] - 3,
    center: { y: 0.53 },
  },
  verticalCandidatePageDownButtonForegroundStyle: {
    buttonStyleType: 'systemImage',
    systemImageName: 'chevron.down',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'] - 3,
    center: { y: 0.53 },
  },
  verticalCandidateReturnButton: {
    backgroundStyle: 'verticalCandidateButtonBackgroundStyle',
    foregroundStyle: 'verticalCandidateReturnButtonForegroundStyle',
    action: { shortcut: '#candidatesBarStateToggle' },
  },
  verticalCandidateReturnButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '返回',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    // center: center['26键中文前景偏移'],
  },
  verticalCandidateBackspaceButton: {
    backgroundStyle: 'verticalCandidateButtonBackgroundStyle',
    foregroundStyle: 'verticalCandidateBackspaceButtonForegroundStyle',
    action: 'backspace',
  },

  verticalCandidateBackspaceButtonForegroundStyle: {
    buttonStyleType: 'systemImage',
    systemImageName: 'delete.left',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'] - 3,
    center: { y: 0.53 },
  },
};

{
  getToolBar: getToolBar,
}
