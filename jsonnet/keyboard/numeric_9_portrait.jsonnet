local animation = import '../lib/animation.libsonnet';
local center = import '../lib/center.libsonnet';
local collectionData = import '../lib/collectionData.libsonnet';
local color = import '../lib/color.libsonnet';
local fontSize = import '../lib/fontSize.libsonnet';
local holdSymbolStyles = import '../lib/holdSymbolStyles.libsonnet';
local others = import '../lib/others.libsonnet';
local swipe = import '../lib/swipeData.libsonnet';
local swipeStyles = import '../lib/swipeStyle.libsonnet';
local toolbar = import '../lib/toolbar.libsonnet';

local swipe_up = swipe.number_swipe_up;
local swipe_down = swipe.number_swipe_down;


local createButton(key, size, bounds, root) = {
  [if size != {} then 'size']: size,
  backgroundStyle: if std.length(key) == 1 then 'numberButtonBackgroundStyle' else key + 'ButtonBackgroundStyle',
  foregroundStyle: std.filter(
    function(x) x != null,
    [
      if std.length(key) == 1 then 'number' + key + 'ButtonForegroundStyle' else key + 'ButtonForegroundStyle',
      if std.objectHas(swipe_up, key) then 'number' + key + 'ButtonUpForegroundStyle' else null,
      if std.objectHas(swipe_down, key) then 'number' + key + 'ButtonDownForegroundStyle' else null,
    ]
  ),
  action: {
    character: key,
  },
  [if std.objectHas(swipe_up, key) then 'swipeUpAction']: swipe_up[key].action,
  [if std.objectHas(swipe_down, key) then 'swipeDownAction']: swipe_down[key].action,
  [if std.objectHas(root, 'number' + key + 'ButtonHintSymbolsStyle') then 'hintSymbolsStyle']: 'number' + key + 'ButtonHintSymbolsStyle',
};

local keyboard(theme) = 
swipeStyles.getStyle('number', theme) +
holdSymbolStyles.getStyle('number', theme) +
toolbar.getToolBar(theme) +
{
  [if std.objectHas(others, '中文键盘方案') then 'rimeSchema']: others['中文键盘方案'],
  preeditHeight: others['竖屏']['preedit高度'],
  toolbarHeight: others['竖屏']['toolbar高度'],
  keyboardHeight: others['竖屏']['keyboard高度'],
  preedit: {
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

  keyboardLayout: [
    {
      VStack: {
        style: 'VStackStyle1',
        subviews: [
          {
            Cell: 'collection',
          },
          {
            Cell: 'symbolButton',
          },
        ],
      },
    },
    {
      VStack: {
        style: 'VStackStyle2',
        subviews: [
          {
            Cell: 'number1Button',
          },
          {
            Cell: 'number4Button',
          },
          {
            Cell: 'number7Button',
          },
          {
            Cell: 'returnButton',
          },
        ],
      },
    },
    {
      VStack: {
        style: 'VStackStyle2',
        subviews: [
          {
            Cell: 'number2Button',
          },
          {
            Cell: 'number5Button',
          },
          {
            Cell: 'number8Button',
          },
          {
            Cell: 'number0Button',
          },
        ],
      },
    },
    {
      VStack: {
        style: 'VStackStyle2',
        subviews: [
          {
            Cell: 'number3Button',
          },
          {
            Cell: 'number6Button',
          },
          {
            Cell: 'number9Button',
          },
          {
            Cell: 'spaceButton',
          },
        ],
      },
    },
    {
      VStack: {
        style: 'VStackStyle1',
        subviews: [
          {
            Cell: 'backspaceButton',
          },
          {
            Cell: 'spaceRightButton',
          },
          {
            Cell: 'atButton',
          },
          {
            Cell: 'enterButton',
          },
        ],
      },
    },
  ],
  keyboardStyle: {
    insets: {
      top: 3,
      bottom: 3,
      left: 4,
      right: 4,
    },
    // "backgroundStyle": "keyboardBackgroundStyle"
  },
  keyboardBackgroundStyle: {
    normalImage: {
      file: 'bg',
      image: 'IMG1',
    },
  },
  VStackStyle1: {
    size: {
      width: '29/183',
    },
  },
  VStackStyle2: {
    size: {
      width: '125/549',
    },
  },
  collection: {
    size: {
      height: '3/4',
    },
    backgroundStyle: 'collectionBackgroundStyle',
    type: 'symbols',
    dataSource: 'symbols',
    cellStyle: 'collectionCellStyle',
  },
  collectionBackgroundStyle: {
    buttonStyleType: 'geometry',
    insets: { top: 5, left: 3, bottom: 5, right: 3 },
    normalColor: color[theme]['符号键盘左侧collection背景颜色'],
    cornerRadius: 5,
    normalLowerEdgeColor: color[theme]['符号键盘左侧collection背景下边缘颜色'],
  },

  collectionCellStyle: {
    backgroundStyle: 'collectionCellBackgroundStyle',
    foregroundStyle: 'collectionCellForegroundStyle',
  },
  collectionCellBackgroundStyle: {
    buttonStyleType: 'geometry',
    insets: { top: 6, left: 3, bottom: 6, right: 3 },
    highlightColor: 'ffffff',
    normalColor: 'ffffff00',
    cornerRadius: 5,
  },
  collectionCellForegroundStyle: {
    buttonStyleType: "text",
    normalColor: color[theme]['collection前景颜色'],
    fontSize: fontSize['collection前景字体大小'],
    fontWeight: 0,
  },
  returnButton: createButton(
    'return', {}, {}, $
  ) + {
    backgroundStyle: 'systemButtonBackgroundStyle',
    action: 'returnPrimaryKeyboard',
  },

  returnButtonForegroundStyle: {
    buttonStyleType: "text",
    text: '返回',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    // center: center['26键中文前景偏移'],
  },
  number1Button: createButton(
    '1',
    {},
    {},
    $
  ),
  number1ButtonForegroundStyle: {
    buttonStyleType: "text",
    text: '1',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'],
    // center: center['数字键盘数字前景偏移'],
  },
  number4Button: createButton(
    '4',
    {},
    {},
    $
  ),
  number4ButtonForegroundStyle: {
    buttonStyleType: "text",
    text: '4',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'],
    // center: center['数字键盘数字前景偏移'],

  },
  number7Button: createButton(
    '7',
    {},
    {},
    $
  ),
  number7ButtonForegroundStyle: {
    buttonStyleType: "text",
    text: '7',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'],
    // center: center['数字键盘数字前景偏移'],
  },
  symbolButton: {
    size: {
      height: '1/4',
    },
    backgroundStyle: 'systemButtonBackgroundStyle',
    foregroundStyle: [
      'symbolButtonForegroundStyle',
    ],
    action: {
      keyboardType: 'symbolic',
    },
  },

  symbolButtonForegroundStyle: {
    buttonStyleType: "text",
    text: '#+=',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    // center: center['26键中文前景偏移'],
  },
  number2Button: createButton('2', {}, {}, $),

  number2ButtonForegroundStyle: {
    buttonStyleType: "text",
    text: '2',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'],
    // center: center['数字键盘数字前景偏移'],
  },
  number5Button: createButton('5', {}, {}, $),
  number5ButtonForegroundStyle: {
    buttonStyleType: "text",
    text: '5',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'],
    // center: center['数字键盘数字前景偏移'],
  },
  number8Button: createButton('8', {}, {}, $),
  number8ButtonForegroundStyle: {
    buttonStyleType: "text",
    text: '8',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'],
    // center: center['数字键盘数字前景偏移'],
  },

  number0Button: createButton('0', {}, {}, $),

  number0ButtonForegroundStyle: {
    buttonStyleType: "text",
    text: '0',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'],
    // center: center['数字键盘数字前景偏移'],
  },
  number3Button: createButton('3', {}, {}, $),
  number3ButtonForegroundStyle: {
    buttonStyleType: "text",
    text: '3',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'],
    // center: center['数字键盘数字前景偏移'],
  },
  number6Button: createButton('6', {}, {}, $),
  number6ButtonForegroundStyle: {
    buttonStyleType: "text",
    text: '6',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'],
    // center: center['数字键盘数字前景偏移'],
  },
  number9Button: createButton('9', {}, {}, $),
  number9ButtonForegroundStyle: {
    buttonStyleType: "text",
    text: '9',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'],
    // center: center['数字键盘数字前景偏移'],
  },
  spaceButton: createButton(
    'space', {}, {}, $
  ) + {
    backgroundStyle: 'systemButtonBackgroundStyle',
    action: 'space',
  },

  spaceButtonForegroundStyle: {
    buttonStyleType: "text",
    animation: 'ButtonForegroundAnimation',
    text: '空格',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    // center: center['功能键前景文字偏移'],
  },
  backspaceButton: createButton(
    'backspace', {}, {}, $
  ) + {
    backgroundStyle: 'systemButtonBackgroundStyle',
    action: 'backspace',
    repeatAction: 'backspace',
  },

  backspaceButtonForegroundStyle: {
    buttonStyleType: "systemImage",
    animation: 'ButtonForegroundAnimation',
    systemImageName: 'delete.left',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'] - 3,
    center: { y: 0.53 },
  },
  spaceRightButton: createButton(
    'spaceRight', {}, {}, $
  ) + {
    backgroundStyle: 'systemButtonBackgroundStyle',
    action: {
      character: '.',
    },
  },

  spaceRightButtonForegroundStyle: {
    buttonStyleType: "text",
    animation: 'ButtonForegroundAnimation',
    text: '.',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'],
    // center: {
    //   x: 0.5,
    //   y: 0.8,
    // },
  },
  atButton: createButton(
    'at', {}, {}, $
  ) + {
    backgroundStyle: 'systemButtonBackgroundStyle',
    action: {
      character: '=',
    },
  },

  atButtonForegroundStyle: {
    buttonStyleType: "text",
    animation: 'ButtonForegroundAnimation',
    text: '=',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['collection前景字体大小'],
    fontWeight: 0,
    // center: {
    //   x: 0.5,
    //   y: 0.8,
    // },
  },
  enterButton: createButton(
    'enter', {}, {}, $
  ) + {
    backgroundStyle: 'systemButtonBackgroundStyle',
    action: 'enter',
  },
  enterButtonForegroundStyle: {
    buttonStyleType: "text",
    animation: 'ButtonForegroundAnimation',
    text: '换行',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    // center: center['功能键前景文字偏移'],
  },
  numberButtonBackgroundStyle: {
    buttonStyleType: 'geometry',
    insets: { top: 4, left: 3, bottom: 4, right: 3 },
    normalColor: color[theme]['字母键背景颜色-普通'],
    highlightColor: color[theme]['字母键背景颜色-高亮'],
    cornerRadius: 5,
    normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
    highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
  },
  systemButtonBackgroundStyle: {
    buttonStyleType: 'geometry',
    insets: { top: 4, left: 3, bottom: 4, right: 3 },
    normalColor: color[theme]['功能键背景颜色-普通'],
    highlightColor: color[theme]['功能键背景颜色-高亮'],
    cornerRadius: 5,
    normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
    highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
  },
  alphabeticBackgroundAnimation: animation['26键按键背景动画'],
  ButtonForegroundAnimation: animation['26键按键前景动画'],
  alphabeticHintSymbolsBackgroundStyle: holdSymbolStyles['长按背景样式'],
  alphabeticHintSymbolsSelectedStyle: holdSymbolStyles['长按选中背景样式'],


  functionBackgroundAnimation: animation['26键功能键背景动画'],
  dataSource: {
    symbols: collectionData.numericSymbols,
  },
};
{
  new(theme):
    keyboard(theme)
}


// alphabeticHintSymbolsBackgroundStyle: {
//     normalImage: {
//       file: 'hold_back',
//       image: 'IMG1',
//     },
//     targetScale: {
//       x: 1,
//       y: 1.1,
//     },
//     // "type": "original",
//     // "normalColor": color[theme]["字母键背景颜色-普通"],
//     // "highlightColor": color[theme]["字母键背景颜色-普通"],
//     // "cornerRadius": 5,
//     // "shadowColor": color[theme]["长按背景阴影颜色"],
//     // "shadowOffset": {'x': 0, 'y': 5}
//   },
//   alphabeticHintSymbolsSelectedStyle: {
//     // "type": "original",
//     // "normalColor": color[theme]["长按选中背景颜色"],
//     // "highlightColor": color[theme]["长按选中背景颜色"],
//     // "cornerRadius": 5,
//     normalImage: {
//       file: 'hint',
//       image: 'IMG1',
//     },
//     targetScale: {
//       x: 0.8,
//       y: 0.7,
//     },
//   },

