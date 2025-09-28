local center = import 'center.libsonnet';
local color = import 'color.libsonnet';
local fontSize = import 'fontSize.libsonnet';

local getToolBar(theme) = {
  toolbar: {
    backgroundStyle: 'toolbarBackgroundStyle',
    primaryButtonStyle: 'primaryButtonStyle',
    secondaryButtonStyle: [
      'toolbarButton1Style',  // 收起键盘
      'toolbarButton2Style',  // 预测
      'toolbarButton3Style',  // 脚本
      'toolbarButton4Style',  // 剪贴板
      'toolbarButton7Style',  // 常用语
      'toolbarButton5Style',  // emoji
      'toolbarButton6Style',  // 翻译
    ],
    horizontalCandidateStyle: 'horizontalCandidateStyle',
    verticalCandidateStyle: 'verticalCandidateStyle',
  },
  toolbarBackgroundStyle: {
    buttonStyleType: 'geometry',
    normalColor: color[theme]['键盘背景颜色'],
  },
  primaryButtonStyle: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'primaryButtonForegroundStyle',
    action: {
      floatKeyboardType: 'panel',
    },
  },
  toolbarButtonBackgroundStyle: {
    normalColor: 0,
    highlightColor: 0,
  },
  primaryButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '面板',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },
  toolbarButton1Style: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarButton1ForegroundStyle',
    action: 'dismissKeyboard',
  },
  toolbarButton1ForegroundStyle: {
    buttonStyleType: 'text',
    text: '收起',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },
  toolbarButton2Style: {
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
  // simpstateNotification: {
  //   notificationType: "rime",
  //   rimeNotificationType: "optionChanged",
  //   rimeOptionName: "simplification",
  //   rimeOptionValue: false
  // },
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
  toolbarButton3Style: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarButton3ForegroundStyle',
    action: {
      shortcutCommand: '#toggleScriptView',
    },
  },
  toolbarButton3ForegroundStyle: {
    buttonStyleType: 'text',
    text: '脚本',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },

  toolbarButton4Style: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarButton4ForegroundStyle',
    action: {
      shortcutCommand: '#showPasteboardView',
    },
  },
  toolbarButton4ForegroundStyle: {
    buttonStyleType: 'text',
    text: '剪贴',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },

  toolbarButton5Style: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarButton5ForegroundStyle',
    action: {
      keyboardType: 'emoji',
    },
  },
  toolbarButton5ForegroundStyle: {
    buttonStyleType: 'text',
    text: '表情',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },

  toolbarButton6Style: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarButton6ForegroundStyle',
    action: {
      runScript: '快捷翻译',
    },
  },
  toolbarButton6ForegroundStyle: {
    buttonStyleType: 'text',
    text: '翻译',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },
  toolbarButton7Style: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'toolbarButton7ForegroundStyle',
    action: {
      shortcutCommand: '#showPhraseView',
    },
  },
  toolbarButton7ForegroundStyle: {
    buttonStyleType: 'text',
    text: '短语',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景文字大小'],
    center: center['toolbar按键文字偏移'],
    fontWeight: 'medium',
  },
  horizontalCandidateStyle: {
    insets: {
      top: 8,
      bottom: 3,
      left: 5,
    },
    candidateStateButtonStyle: 'candidateStateButtonStyle',
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
  candidateStateButtonStyle: {
    backgroundStyle: 'toolbarButtonBackgroundStyle',
    foregroundStyle: 'candidateStateButtonForegroundStyle',
  },
  candidateStateButtonForegroundStyle: {
    buttonStyleType: 'systemImage',
    systemImageName: 'chevron.down',
    normalColor: color[theme]['toolbar按键颜色'],
    highlightColor: color[theme]['toolbar按键颜色'],
    fontSize: fontSize['toolbar按键前景sf符号大小'],
    // center: center['toolbar按键sf符号偏移'],
  },
  verticalCandidateStyle: {
    insets: {
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
    },
    bottomRowHeight: 50,
    // "backgroundStyle": "verticalCandidateBackgroundStyle",
    candidateStyle: 'verticalCandidateOfCandidateStyle',
    pageUpButtonStyle: 'verticalCandidatePageUpButtonStyle',
    pageDownButtonStyle: 'verticalCandidatePageDownButtonStyle',
    returnButtonStyle: 'verticalCandidateReturnButtonStyle',
    backspaceButtonStyle: 'verticalCandidateBackspaceButtonStyle',
  },
  verticalCandidateBackgroundStyle: {
    buttonStyleType: 'fileImage',
    normalImage: {
      file: 'bg',
      image: 'IMG1',
    },
  },
  verticalCandidateOfCandidateStyle: {
    insets: {
      top: 8,
      bottom: 8,
      left: 8,
      right: 8,
    },
    backgroundInsets: {
      top: 8,
      bottom: 8,
      left: 8,
      right: 8,
    },
    cornerRadius: 7,
    backgroundColor: 0,
    separatorColor: 0,
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
  verticalCandidatePageUpButtonStyle: {
    backgroundStyle: 'systemButtonBackgroundStyle',
    foregroundStyle: 'verticalCandidatePageUpButtonForegroundStyle',
  },
  verticalCandidatePageDownButtonStyle: {
    backgroundStyle: 'systemButtonBackgroundStyle',
    foregroundStyle: 'verticalCandidatePageDownButtonForegroundStyle',
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
  verticalCandidateReturnButtonStyle: {
    backgroundStyle: 'systemButtonBackgroundStyle',
    foregroundStyle: 'verticalCandidateReturnButtonForegroundStyle',
  },
  verticalCandidateReturnButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '返回',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    // center: center['26键中文前景偏移'],
  },
  verticalCandidateBackspaceButtonStyle: {
    backgroundStyle: 'systemButtonBackgroundStyle',
    foregroundStyle: 'verticalCandidateBackspaceButtonForegroundStyle',
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
  getToolBar: getToolBar
}
