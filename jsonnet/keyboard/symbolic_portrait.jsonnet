local animation = import '../lib/animation.libsonnet';
local center = import '../lib/center.libsonnet';
local collectionData = import '../lib/collectionData.libsonnet';
local color = import '../lib/color.libsonnet';
local fontSize = import '../lib/fontSize.libsonnet';
local others = import '../lib/others.libsonnet';

local createButton(key, size, bounds, root) = {
  [if size != {} then 'size']: size,
  backgroundStyle: 'systemButtonBackgroundStyle',
  foregroundStyle: key + 'ButtonForegroundStyle',
  action: {
    character: key,
  },
  // 动画
  animation: [
    'ButtonScaleAnimation',
  ],
};

local keyboard(theme) =
  {
    keyboardHeight: others['竖屏']['键盘总高度'],
    // "toolbarHeight": others["竖屏"]["toolbar高度"],
    keyboardLayout:
      [
        {
          HStack: {
            style: 'HStackStyle1',
            subviews: [
              { Cell: 'categoryCollection' },
              { Cell: 'descriptionCollection' },
            ],
          },
        },
        {
          HStack: {
            style: 'HStackStyle2',
            subviews: [
              { Cell: 'returnButton' },
              { Cell: 'pageUpButton' },
              { Cell: 'pageDownButton' },
              { Cell: 'lockButton' },
              { Cell: 'backspaceButton' },
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
      backgroundStyle: 'keyboardBackgroundStyle',
    },
    keyboardBackgroundStyle: {
      buttonStyleType: 'geometry',
      normalColor: color[theme]['键盘背景颜色'],
    },

    HStackStyle1: {
      size: {
        height: '227/281',
      },
    },
    HStackStyle2: {
      size: {
        height: '54/281',
      },
    },
    categoryCollection: {
      size: {
        width: '56/375',
      },
      backgroundStyle: 'categoryCollectionBackgroundStyle',
      type: 'classifiedSymbols',
      dataSource: 'category',
      cellStyle: 'categoryCollectionCellStyle',
    },
    categoryCollectionBackgroundStyle: {
      buttonStyleType: 'geometry',
      insets: { top: 5, left: 3, bottom: 5, right: 3 },
      normalColor: color[theme]['符号键盘左侧collection背景颜色'],
      cornerRadius: 7,
      normalShadowColor: color[theme]['符号键盘左侧collection背景下边缘颜色'],
      normalLowerEdgeColor: color[theme]['符号键盘左侧collection背景下边缘颜色'],
    },
    categoryCollectionCellStyle: {
      backgroundStyle: 'categoryCollectionCellBackgroundStyle',
      foregroundStyle: 'categoryCollectionCellForegroundStyle',
    },
    categoryCollectionCellBackgroundStyle: {
      buttonStyleType: 'geometry',
      insets: { top: 7, left: 4, bottom: 7, right: 4 },
      normalColor: '00000000',
      highlightColor: color[theme]['字母键背景颜色-普通'],
      cornerRadius: 7,
    },
    categoryCollectionCellForegroundStyle: {
      buttonStyleType: 'text',
      normalColor: color[theme]['列表未选中字体颜色'],
      highlightColor: color[theme]['列表选中字体颜色'],
      fontSize: fontSize['符号键盘左侧collection前景字体大小'],
      fontWeight: 0,
    },
    descriptionCollection: {
      size: {
        width: '319/375',
      },
      backgroundStyle: 'descriptionCollectionBackgroundStyle',
      type: 'subClassifiedSymbols',
      cellStyle: 'descriptionCollectionCellStyle',
      insets: {left: 4, right: 4, top: 4, bottom: 4}
    },
    descriptionCollectionBackgroundStyle: {
      buttonStyleType: 'geometry',
      insets: { top: 5, left: 3, bottom: 5, right: 3 },
      normalColor: color[theme]['符号键盘右侧collection背景颜色'],
      cornerRadius: 7,
      normalLowerEdgeColor: color[theme]['符号键盘右侧collection背景下边缘颜色'],
    },
    descriptionCollectionCellStyle: {
      backgroundStyle: 'categoryCollectionCellBackgroundStyle',
      foregroundStyle: 'descriptionCollectionCellForegroundStyle',
    },
    descriptionCollectionCellForegroundStyle: {
      buttonStyleType: 'text',
      normalColor: color[theme]['列表未选中字体颜色'],
      highlightColor: color[theme]['列表选中字体颜色'],
      fontSize: fontSize['符号键盘右侧collection前景字体大小'],
      fontWeight: 0,
    },
    returnButton: createButton(
      'return',
      { width: '56/375' },
      {},
      $
    ) + {
      action: 'returnPrimaryKeyboard',
    },

    returnButtonForegroundStyle: {
      buttonStyleType: 'text',
      text: '返回',
      normalColor: color[theme]['按键前景颜色'],
      highlightColor: color[theme]['按键前景颜色'],
      fontSize: fontSize['按键前景文字大小'] - 3,
      // center: center['26键中文前景偏移'],
    },

    pageUpButton: createButton(
      'pageUp',
      { width: '87/375' },
      {},
      $
    ) + {
      backgroundStyle: 'systemButtonBackgroundStyle',
      action: { shortcut: '#subCollectionPageUp' },
    },

    pageUpButtonForegroundStyle: {
      buttonStyleType: 'systemImage',
      systemImageName: 'chevron.up',
      normalColor: color[theme]['按键前景颜色'],
      highlightColor: color[theme]['按键前景颜色'],
      fontSize: fontSize['数字键盘数字前景字体大小'] - 3,
      center: { y: 0.53 },
    },

    pageDownButton: createButton(
      'pageDown',
      { width: '87/375' },
      {},
      $
    ) + {
      backgroundStyle: 'systemButtonBackgroundStyle',
      action: { shortcut: '#subCollectionPageDown' },
    },

    pageDownButtonForegroundStyle: {
      buttonStyleType: 'systemImage',
      systemImageName: 'chevron.down',
      normalColor: color[theme]['按键前景颜色'],
      highlightColor: color[theme]['按键前景颜色'],
      fontSize: fontSize['数字键盘数字前景字体大小'] - 3,
      center: { y: 0.53 },
    },
    lockButton: createButton(
      'lock',
      { width: '87/375' },
      {},
      $
    ) + {
      foregroundStyle: [
        {
          styleName: 'unlockButtonForegroundStyle',
          conditionKey: '$symbolicKeyboardLockState',
          conditionValue: false,
        },
        {
          styleName: 'lockButtonForegroundStyle',
          conditionKey: '$symbolicKeyboardLockState',
          conditionValue: true,
        },
      ],
      action: 'symbolicKeyboardLockStateToggle',
    },

    lockButtonForegroundStyle: {
      buttonStyleType: 'systemImage',
      systemImageName: 'lock',
      normalColor: color[theme]['按键前景颜色'],
      highlightColor: color[theme]['按键前景颜色'],
      fontSize: fontSize['按键前景sf符号大小'],
      targetScale: 0.6,
    },
    unlockButtonForegroundStyle: {
      buttonStyleType: 'systemImage',
      systemImageName: 'lock.open',
      normalColor: color[theme]['按键前景颜色'],
      highlightColor: color[theme]['按键前景颜色'],
      fontSize: fontSize['按键前景sf符号大小'],
      targetScale: 0.6,
    },
    backspaceButton: createButton(
      'backspace',
      { width: '60/375' },
      {},
      $
    ) + {
      action: 'backspace',
      repeatAction: 'backspace',
    },

    backspaceButtonForegroundStyle: {
      buttonStyleType: 'systemImage',
      systemImageName: 'delete.left',
      normalColor: color[theme]['按键前景颜色'],
      highlightColor: color[theme]['按键前景颜色'],
      fontSize: fontSize['数字键盘数字前景字体大小'] - 3,
      center: { y: 0.53 },
    },
    systemButtonBackgroundStyle: {
      buttonStyleType: 'geometry',
      insets: { top: 4, left: 3, bottom: 4, right: 3 },
      normalColor: color[theme]['功能键背景颜色-普通'],
      highlightColor: color[theme]['功能键背景颜色-高亮'],
      cornerRadius: 7,
      normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
      highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
    },

    ButtonScaleAnimation: animation['26键按键动画'],
    dataSource: collectionData.symbolicDataSource,

    // symbolicKeyboardLockStateNotification: {
    //   notificationType: 'symbolicKeyboardLockedState',
    //   lockedState: true,
    //   backgroundStyle: 'systemButtonBackgroundStyle',
    //   foregroundStyle: 'lockButtonForegroundStyle',
    // },
  };
{
  new(theme):
    keyboard(theme),
}
