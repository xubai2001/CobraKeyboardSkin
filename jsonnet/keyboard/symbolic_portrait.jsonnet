local animation = import '../lib/animation.libsonnet';
local center = import '../lib/center.libsonnet';
local collectionData = import '../lib/collectionData.libsonnet';
local color = import '../lib/color.libsonnet';
local fontSize = import '../lib/fontSize.libsonnet';
local others = import '../lib/others.libsonnet';
local utils = import '../lib/utils.libsonnet';

local createButton(params={}) =
  std.prune({
    size: std.get(params, 'size'),
    bounds: std.get(params, 'bounds'),
    backgroundStyle: std.get(params, 'backgroundStyle', 'systemButtonBackgroundStyle'),
    foregroundStyle: std.get(params, 'foregroundStyle', params.key + 'ButtonForegroundStyle'),

    action: std.get(params, 'action', { character: params.key }),
    repeatAction: std.get(params, 'repeatAction'),

    // 动画
    animation: [
      'ButtonScaleAnimation',
    ],
  });

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
              { Cell: 'symbolreturnButton' },
              { Cell: 'pageUpButton' },
              { Cell: 'pageDownButton' },
              { Cell: 'lockButton' },
              { Cell: 'symbolbackspaceButton' },
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
      insets: { left: 4, right: 4, top: 4, bottom: 4 },
    },
    descriptionCollectionBackgroundStyle: {
      buttonStyleType: 'geometry',
      insets: { top: 5, left: 3, bottom: 5, right: 3 },
      normalColor: color[theme]['符号键盘右侧collection背景颜色'],
      cornerRadius: 7,
      normalLowerEdgeColor: color[theme]['符号键盘右侧collection背景下边缘颜色'],
    },
    descriptionCollectionCellStyle: {
      // backgroundStyle: 'categoryCollectionCellBackgroundStyle',
      foregroundStyle: 'descriptionCollectionCellForegroundStyle',
    },
    descriptionCollectionCellForegroundStyle: {
      buttonStyleType: 'text',
      normalColor: color[theme]['列表未选中字体颜色'],
      highlightColor: color[theme]['列表选中字体颜色'],
      fontSize: fontSize['符号键盘右侧collection前景字体大小'],
      fontWeight: 0,
    },

    symbolreturnButton: createButton(
      params={
        key: 'symbolreturn',
        action: 'returnLastKeyboard',
        isNumber: false,
      }
    ),

    symbolreturnButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '返回',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
      }
    ),

    pageUpButton: createButton(
      params={
        key: 'pageUp',
        size: { width: '87/375' },
        backgroundStyle: 'systemButtonBackgroundStyle',
        action: { shortcut: '#subCollectionPageUp' },
        isNumber: false,
      }
    ),

    pageUpButtonForegroundStyle: utils.makeSystemImageStyle(
      params={
        systemImageName: 'chevron.up',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景sf符号大小'],
        center: { y: 0.53 },
      }
    ),

    pageDownButton: createButton(
      params={
        key: 'pageDown',
        size: { width: '87/375' },
        backgroundStyle: 'systemButtonBackgroundStyle',
        action: { shortcut: '#subCollectionPageDown' },
        isNumber: false,
      }
    ),

    pageDownButtonForegroundStyle: utils.makeSystemImageStyle(
      params={
        systemImageName: 'chevron.down',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景sf符号大小'],
        center: { y: 0.53 },
      }
    ),

    lockButton: createButton(
      params={
        key: 'lock',
        size: { width: '87/375' },
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
        isNumber: false,
      }
    ),

    lockButtonForegroundStyle: utils.makeSystemImageStyle(
      params={
        systemImageName: 'lock',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景sf符号大小'],
        center: { y: 0.53 },
      }
    ),
    unlockButtonForegroundStyle: utils.makeSystemImageStyle(
      params={
        systemImageName: 'lock.open',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景sf符号大小'],
        center: { y: 0.53 },
      }
    ),

    symbolbackspaceButton: createButton(
      params={
        key: 'symbolbackspace',
        size: { width: '60/375' },
        action: 'backspace',
        repeatAction: 'backspace',
        isNumber: false,
      }
    ),

    symbolbackspaceButtonForegroundStyle: utils.makeSystemImageStyle(
      params={
        systemImageName: 'delete.left',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['数字键盘数字前景字体大小'] - 3,
        center: { y: 0.53 },
      }
    ),

    systemButtonBackgroundStyle: utils.makeGeometryStyle(
      params={
        insets: { top: 4, left: 3, bottom: 4, right: 3 },
        normalColor: color[theme]['功能键背景颜色-普通'],
        highlightColor: color[theme]['功能键背景颜色-高亮'],
        cornerRadius: 7,
        normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
        highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
      }
    ),

    ButtonScaleAnimation: animation['26键按键动画'],
  };
{
  new(theme): keyboard(theme) + collectionData.symbolicDataSource,  // 符号数据源
  getKeyboard(theme): keyboard(theme),  // 给emoji键盘使用，提供无符号数据源的键盘配置
}
