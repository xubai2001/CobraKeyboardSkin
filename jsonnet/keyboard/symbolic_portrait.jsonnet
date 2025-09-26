local animation = import '../lib/animation.libsonnet';
local center = import '../lib/center.libsonnet';
local collectionData = import '../lib/collectionData.libsonnet';
local color = import '../lib/color.libsonnet';
local fontSize = import '../lib/fontSize.libsonnet';
local others = import '../lib/others.libsonnet';
// local toolbar = import "../lib/toolbar.libsonnet";

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
              {
                Cell: 'categoryCollection',
              },
              {
                Cell: 'descriptionCollection',
              },
            ],
          },
        },
        {
          HStack: {
            style: 'HStackStyle2',
            subviews: [
              {
                Cell: 'returnButton',
              },
              {
                Cell: 'pageUpButton',
              },
              {
                Cell: 'pageDownButton',
              },
              {
                Cell: 'lockButton',
              },
              {
                Cell: 'backspaceButton',
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
      backgroundStyle: 'listBackgroundStyle',
      type: 'classifiedSymbols',
      dataSource: 'category',
      cellStyle: 'collectionCellStyle',
    },
    listBackgroundStyle: {
      buttonStyleType: 'geometry',
      insets: { top: 5, left: 3, bottom: 5, right: 3 },
      normalColor: color[theme]['符号键盘左侧collection背景颜色'],
      cornerRadius: 7,
      normalShadowColor: color[theme]['符号键盘左侧collection背景下边缘颜色'],
      normalLowerEdgeColor: color[theme]['符号键盘左侧collection背景下边缘颜色'],
    },
    collectionCellStyle: {
      backgroundStyle: 'collectionCellBackgroundStyle',
      foregroundStyle: 'collectionCellForegroundStyle',
    },
    collectionCellBackgroundStyle: {
      buttonStyleType: 'geometry',
      insets: { top: 7, left: 4, bottom: 7, right: 4 },
      normalColor: '00000000',
      highlightColor: color[theme]['字母键背景颜色-普通'],
      cornerRadius: 7,
    },
    collectionCellForegroundStyle: {
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
    },
    descriptionCollectionBackgroundStyle: {
      buttonStyleType: 'geometry',
      insets: { top: 5, left: 3, bottom: 5, right: 3 },
      normalColor: color[theme]['符号键盘右侧collection背景颜色'],
      cornerRadius: 7,
      normalLowerEdgeColor: color[theme]['符号键盘右侧collection背景下边缘颜色'],
    },
    descriptionCollectionCellStyle: {
      backgroundStyle: 'collectionCellBackgroundStyle',
      foregroundStyle: 'descriptionCollectionCellForegroundStyle',
    },
    descriptionCollectionCellForegroundStyle: {
      buttonStyleType: 'text',
      normalColor: color[theme]['列表未选中字体颜色'],
      highlightColor: color[theme]['列表选中字体颜色'],
      fontSize: fontSize['符号键盘右侧collection前景字体大小'],
      fontWeight: 0,
    },
    returnButton: {
      size: {
        width: '56/375',
      },
      backgroundStyle: 'systemButtonBackgroundStyle',
      foregroundStyle: [
        'returnButtonForegroundStyle',
      ],
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
    pageUpButton: {
      size: {
        width: '87/375',
      },
      backgroundStyle: 'systemButtonBackgroundStyle',
      foregroundStyle: 'pageUpButtonForegroundStyle',
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
    pageDownButton: {
      size: {
        width: '87/375',
      },
      backgroundStyle: 'systemButtonBackgroundStyle',
      foregroundStyle: 'pageDownButtonForegroundStyle',
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
    lockButton: {
      size: {
        width: '87/375',
      },
      backgroundStyle: 'systemButtonBackgroundStyle',
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
      notification: 'symbolicKeyboardLockStateNotification',
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
    backspaceButton: {
      size: {
        width: '60/375',
      },
      backgroundStyle: 'systemButtonBackgroundStyle',
      foregroundStyle: [
        'backspaceButtonForegroundStyle',
      ],
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
    alphabeticBackgroundAnimation: animation['26键按键背景动画'],
    functionBackgroundAnimation: animation['26键功能键背景动画'],
    ButtonForegroundAnimation: animation['26键按键前景动画'],
    dataSource: collectionData.symbolicDataSource,

    symbolicKeyboardLockStateNotification: {
      notificationType: 'symbolicKeyboardLockedState',
      lockedState: true,
      backgroundStyle: 'systemButtonBackgroundStyle',
      foregroundStyle: 'lockButtonForegroundStyle',
    },
  };
{
  new(theme):
    keyboard(theme),
}
