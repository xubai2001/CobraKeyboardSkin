local animation = import '../lib/animation.libsonnet';
local center = import '../lib/center.libsonnet';
local color = import '../lib/color.libsonnet';
local fontSize = import '../lib/fontSize.libsonnet';
local _hintSymbolsData = import '../lib/hintSymbolsData.libsonnet';
local keyboardLayout = import '../lib/keyboardLayout.libsonnet';
local others = import '../lib/others.libsonnet';
local swipeData = import '../lib/swipeData-en.libsonnet';
local toolbar = import '../lib/toolbar-en.libsonnet';
local utils = import '../lib/utils.libsonnet';

local hintSymbolsStyles = import '../lib/hintSymbolsStyles.libsonnet';
local swipeStyles = import '../lib/swipeStyles2.libsonnet';

// 划动以及长按数据
local swipe_up = std.get(swipeData, 'swipe_up', {});
local swipe_down = std.get(swipeData, 'swipe_down', {});
local hintSymbolsData = std.get(_hintSymbolsData, 'pinyin', {});

local isBindSchema = std.objectHas(others, '英文键盘方案');

local createButton(params={}) =
  local isLetter = std.get(params, 'isLetter', true);
  std.prune({
    size: std.get(params, 'size'),
    bounds: std.get(params, 'bounds'),
    backgroundStyle: if isLetter then 'alphabeticBackgroundStyle' else std.get(params, 'backgroundStyle', 'systemButtonBackgroundStyle'),
    foregroundStyle:
      if isLetter then
        std.prune([
          params.key + 'ButtonForegroundStyle',
          if std.objectHas(swipe_up, params.key) then params.key + 'ButtonUpForegroundStyle' else null,
          if std.objectHas(swipe_down, params.key) then params.key + 'ButtonDownForegroundStyle' else null,
        ])
      else
        std.get(params, 'foregroundStyle', params.key + 'ButtonForegroundStyle'),

    [if isLetter then 'uppercasedStateForegroundStyle']: std.prune([
      params.key + 'ButtonUppercasedStateForegroundStyle',
      if std.objectHas(swipe_up, params.key) then params.key + 'ButtonUpForegroundStyle' else null,
      if std.objectHas(swipe_down, params.key) then params.key + 'ButtonDownForegroundStyle' else null,
    ]),
    [if isLetter then 'capsLockedStateForegroundStyle']: self.uppercasedStateForegroundStyle,  // 同uppercaseStateForegroundStyle
    hintStyle: params.key + 'ButtonHintStyle',
    action: std.get(params, 'action', { [if isBindSchema then 'character' else 'symbol']: params.key }),
    [if isLetter then 'uppercasedStateAction']: {
      [if isBindSchema then 'character' else 'symbol']: std.asciiUpper(params.key),
    },
    repeatAction: std.get(params, 'repeatAction'),
    [if std.objectHas(swipe_up, params.key) then 'swipeUpAction']: swipe_up[params.key].action,
    [if std.objectHas(swipe_down, params.key) then 'swipeDownAction']: swipe_down[params.key].action,
    [if std.objectHas(hintSymbolsData, params.key) then 'hintSymbolsStyle']: params.key + 'ButtonHintSymbolsStyle',

    // 动画
    animation: [
      'ButtonScaleAnimation',
      // 'CartoonAniamtion',
    ],
  });


local keyboard(theme, orientation) =
  {
    local ButtonSize = keyboardLayout.getButtonSize(theme, orientation),

    [if isBindSchema then 'rimeSchema']: others['英文键盘方案'],
    preeditHeight: others[if orientation == 'portrait' then '竖屏' else '横屏']['preedit高度'],
    toolbarHeight: others[if orientation == 'portrait' then '竖屏' else '横屏']['toolbar高度'],
    keyboardHeight: others[if orientation == 'portrait' then '竖屏' else '横屏']['keyboard高度'],

    qButton: createButton(
      params={
        key: 'q',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),


    qButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'qButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'qButtonSwipeUpHintForegroundStyle',
    },

    wButton: createButton(
      params={
        key: 'w',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    wButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'wButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'wButtonSwipeUpHintForegroundStyle',
    },
    eButton: createButton(
      params={
        key: 'e',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    eButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'eButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'eButtonSwipeUpHintForegroundStyle',
    },

    rButton: createButton(
      params={
        key: 'r',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    rButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'rButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'rButtonSwipeUpHintForegroundStyle',
    },

    tButton: createButton(
      params={
        key: 't',
        size: std.get(ButtonSize, '普通键size'),
        bounds: std.get(ButtonSize, 't键bounds'),
      }
    ),


    tButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'tButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'tButtonSwipeUpHintForegroundStyle',
    },

    yButton: createButton(
      params={
        key: 'y',
        size: std.get(ButtonSize, '普通键size'),
        bounds: std.get(ButtonSize, 'y键bounds'),
      }
    ),

    yButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'yButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'yButtonSwipeUpHintForegroundStyle',
    },

    uButton: createButton(
      params={
        key: 'u',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    uButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'uButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'uButtonSwipeUpHintForegroundStyle',
    },

    iButton: createButton(
      params={
        key: 'i',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    iButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'iButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'iButtonSwipeUpHintForegroundStyle',
    },


    oButton: createButton(
      params={
        key: 'o',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    oButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'oButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'oButtonSwipeUpHintForegroundStyle',
    },

    pButton: createButton(
      params={
        key: 'p',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    pButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'pButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'pButtonSwipeUpHintForegroundStyle',
    },

    aButton: createButton(
      params={
        key: 'a',
        size: std.get(ButtonSize, 'a键size'),
        bounds: std.get(ButtonSize, 'a键bounds'),
      }
    ),

    aButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'aButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'aButtonSwipeUpHintForegroundStyle',
    },

    sButton: createButton(
      params={
        key: 's',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    sButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'sButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'sButtonSwipeUpHintForegroundStyle',
    },
    dButton: createButton(
      params={
        key: 'd',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    dButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'dButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'dButtonSwipeUpHintForegroundStyle',
    },

    fButton: createButton(
      params={
        key: 'f',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    fButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'fButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'fButtonSwipeUpHintForegroundStyle',
    },

    gButton: createButton(
      params={
        key: 'g',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    gButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'gButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'gButtonSwipeUpHintForegroundStyle',
    },

    hButton: createButton(
      params={
        key: 'h',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    hButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'hButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'hButtonSwipeUpHintForegroundStyle',
    },

    jButton: createButton(
      params={
        key: 'j',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    jButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'jButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'jButtonSwipeUpHintForegroundStyle',
    },

    kButton: createButton(
      params={
        key: 'k',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    kButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'kButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'kButtonSwipeUpHintForegroundStyle',
    },

    lButton: createButton(
      params={
        key: 'l',
        size: std.get(ButtonSize, 'l键size'),
        bounds: std.get(ButtonSize, 'l键bounds'),
      }
    ),

    lButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'lButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'lButtonSwipeUpHintForegroundStyle',
    },

    shiftButton: createButton(
      params={
        key: 'shift',
        action: 'shift',
        size: std.get(ButtonSize, 'shift键size'),
        isLetter: false,
      },
    ) + {
      uppercasedStateAction: 'shift',
      capsLockedStateForegroundStyle: 'shiftButtonCapsLockedForegroundStyle',
      uppercasedStateForegroundStyle: 'shiftButtonUppercasedForegroundStyle',
    },

    shiftButtonForegroundStyle: utils.makeSystemImageStyle(
      params={
        systemImageName: 'shift',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'],
        // center: { y: 0.53 },
      }
    ),
    shiftButtonUppercasedForegroundStyle: utils.makeSystemImageStyle(
      params={
        systemImageName: 'shift.fill',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'],
        // center: { y: 0.53 },
      }
    ),
    shiftButtonCapsLockedForegroundStyle: utils.makeSystemImageStyle(
      params={
        systemImageName: 'capslock.fill',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'],
        // center: { y: 0.53 },
      }
    ),

    zButton: createButton(
      params={
        key: 'z',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    zButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'zButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'zButtonSwipeUpHintForegroundStyle',
    },

    xButton: createButton(
      params={
        key: 'x',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    xButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'xButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'xButtonSwipeUpHintForegroundStyle',
    },

    cButton: createButton(
      params={
        key: 'c',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    cButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'cButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'cButtonSwipeUpHintForegroundStyle',
    },

    vButton: createButton(
      params={
        key: 'v',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    vButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'vButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'vButtonSwipeUpHintForegroundStyle',
    },

    bButton: createButton(
      params={
        key: 'b',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    bButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'bButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'bButtonSwipeUpHintForegroundStyle',
    },

    nButton: createButton(
      params={
        key: 'n',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    nButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'nButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'nButtonSwipeUpHintForegroundStyle',
    },

    mButton: createButton(
      params={
        key: 'm',
        size: std.get(ButtonSize, '普通键size'),
      }
    ),

    mButtonHintStyle: {
      backgroundStyle: 'alphabeticHintBackgroundStyle',
      foregroundStyle: 'mButtonHintForegroundStyle',
      swipeUpForegroundStyle: 'mButtonSwipeUpHintForegroundStyle',
    },
    backspaceButton: createButton(
      params={
        key: 'backspace',
        size: ButtonSize['backspace键size'],
        action: 'backspace',
        repeatAction: 'backspace',
        isLetter: false,
      }
    ),

    backspaceButtonForegroundStyle: utils.makeSystemImageStyle(
      params={
        systemImageName: 'delete.left',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'],
        targetScale: 0.7,
        // center: { y: 0.53 },
      }
    ),
    symbolButton: createButton(
      params={
        key: 'symbol',
        size: ButtonSize['symbol键size'],
        action: { keyboardType: 'symbolic' },
        isLetter: false,
      }
    ),

    symbolButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '#+=',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'] { y: 0.5 },
      }
    ),

    '123Button': createButton(
      params={
        key: '123',
        size: ButtonSize['123键size'],
        action: { keyboardType: if orientation == 'portrait' then 'numeric' else 'symbolic' },
        isLetter: false,
      }
    ),

    '123ButtonForegroundStyle': utils.makeTextStyle(
      params={
        text: '123',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'] { y: 0.5 },
      }
    ),

    spaceButton: createButton(
      params={
        key: 'space',
        size: ButtonSize['space键size'],
        backgroundStyle: 'alphabeticBackgroundStyle',
        action: 'space',
        isLetter: false,
      }
    ),

    spaceButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: '空格',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'],
      }
    ),
    spaceRightButton: createButton(
      params={
        key: 'spaceRight',
        size: ButtonSize['spaceRight键size'],
        action: { symbol: '.' },
        backgroundStyle: 'alphabeticBackgroundStyle',
        foregroundStyle: [
          'spaceRightButtonForegroundStyle',
          'spaceRightButtonForegroundStyle2',
        ],
        isLetter: false,
      }
    ),

    spaceRightButtonForegroundStyle: utils.makeTextStyle(
      params={
        text: ',',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'],
        center: { x: 0.5, y: 0.34 },
      }
    ),
    spaceRightButtonForegroundStyle2: utils.makeTextStyle(
      params={
        text: '.',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'],
        center: { x: 0.5, y: 0.54 },
      }
    ),

    enterButton: createButton(
      params={
        key: 'enter',
        size: ButtonSize['enter键size'],
        action: 'enter',
        isLetter: false,
      }
    ) + {
      backgroundStyle: [
        {
          styleName: 'systemButtonBackgroundStyle',
          conditionKey: '$returnKeyType',
          conditionValue: [0, 2, 3, 5, 8, 10, 11],
        },
        {
          styleName: 'enterButtonBlueBackgroundStyle',
          conditionKey: '$returnKeyType',
          conditionValue: [1, 4, 6, 7, 9],
        },
      ],
      foregroundStyle: [
        {
          styleName: 'enterButtonForegroundStyle0',
          conditionKey: '$returnKeyType',
          conditionValue: [0, 2, 3, 5, 8, 10, 11],
        },
        {
          styleName: 'enterButtonForegroundStyle14',
          conditionKey: '$returnKeyType',
          conditionValue: [1, 4],
        },
        {
          styleName: 'enterButtonForegroundStyle6',
          conditionKey: '$returnKeyType',
          conditionValue: [6],
        },
        {
          styleName: 'enterButtonForegroundStyle7',
          conditionKey: '$returnKeyType',
          conditionValue: [7],
        },
        {
          styleName: 'enterButtonForegroundStyle9',
          conditionKey: '$returnKeyType',
          conditionValue: [9],
        },
      ],
      action: 'enter',

      // 按键通知
      notification: [
        'garyReturnKeyTypeNotification',
        'blueReturnKeyTypeNotification14',
        'blueReturnKeyTypeNotification6',
        'blueReturnKeyTypeNotification7',
        'blueReturnKeyTypeNotification9',
      ],
    },

    enterButtonForegroundStyle0: utils.makeTextStyle(
      params={
        text: '回车',
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'],
      }
    ),
    enterButtonForegroundStyle6: utils.makeTextStyle(
      params={
        text: '搜索',
        normalColor: color[theme]['长按选中字体颜色'],
        highlightColor: color[theme]['长按非选中字体颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'],
      }
    ),

    enterButtonForegroundStyle7: utils.makeTextStyle(
      params={
        text: '发送',
        normalColor: color[theme]['长按选中字体颜色'],
        highlightColor: color[theme]['长按非选中字体颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'],
      }
    ),

    enterButtonForegroundStyle14: utils.makeTextStyle(
      params={
        text: '前往',
        normalColor: color[theme]['长按选中字体颜色'],
        highlightColor: color[theme]['长按非选中字体颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'],
      }
    ),

    enterButtonForegroundStyle9: utils.makeTextStyle(
      params={
        text: '完成',
        normalColor: color[theme]['长按选中字体颜色'],
        highlightColor: color[theme]['长按非选中字体颜色'],
        fontSize: fontSize['按键前景文字大小'] - 3,
        center: center['功能键前景文字偏移'],
      }
    ),

    enterButtonBlueBackgroundStyle: utils.makeGeometryStyle(
      params={
        buttonStyleType: 'geometry',
        insets: { top: 5, left: 3, bottom: 5, right: 3 },
        normalColor: color[theme]['enter键背景(蓝色)'],
        highlightColor: color[theme]['功能键背景颜色-高亮'],
        cornerRadius: 7,
        normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
        highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
      }
    ),
    // 灰色回车通知（前景 0）
    garyReturnKeyTypeNotification: {
      notificationType: 'returnKeyType',
      returnKeyType: [0, 2, 3, 5, 8, 10, 11],
      backgroundStyle: 'systemButtonBackgroundStyle',
      foregroundStyle: 'enterButtonForegroundStyle0',
    },

    // 蓝色回车通知（按前景细分）
    blueReturnKeyTypeNotification14: {
      notificationType: 'returnKeyType',
      returnKeyType: [1, 4],
      backgroundStyle: 'enterButtonBlueBackgroundStyle',
      foregroundStyle: 'enterButtonForegroundStyle14',
    },
    blueReturnKeyTypeNotification6: {
      notificationType: 'returnKeyType',
      returnKeyType: [6],
      backgroundStyle: 'enterButtonBlueBackgroundStyle',
      foregroundStyle: 'enterButtonForegroundStyle6',
    },
    blueReturnKeyTypeNotification7: {
      notificationType: 'returnKeyType',
      returnKeyType: [7],
      backgroundStyle: 'enterButtonBlueBackgroundStyle',
      foregroundStyle: 'enterButtonForegroundStyle7',
    },
    blueReturnKeyTypeNotification9: {
      notificationType: 'returnKeyType',
      returnKeyType: [9],
      backgroundStyle: 'enterButtonBlueBackgroundStyle',
      foregroundStyle: 'enterButtonForegroundStyle9',
    },

    alphabeticBackgroundStyle: utils.makeGeometryStyle(
      params={
        insets: { top: 5, left: 3, bottom: 5, right: 3 },
        normalColor: color[theme]['字母键背景颜色-普通'],
        highlightColor: color[theme]['字母键背景颜色-高亮'],
        cornerRadius: 7,
        normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
        highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
      }
    ),

    systemButtonBackgroundStyle: utils.makeGeometryStyle(
      params={
        insets: { top: 5, left: 3, bottom: 6, right: 3 },
        normalColor: color[theme]['功能键背景颜色-普通'],
        highlightColor: color[theme]['功能键背景颜色-高亮'],
        cornerRadius: 7,
        normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
        highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
      }
    ),
    alphabeticHintBackgroundStyle: utils.makeGeometryStyle(
      params={
        normalColor: color[theme]['气泡背景颜色'],
        highlightColor: color[theme]['气泡高亮颜色'],
        cornerRadius: 7,
        shadowColor: color[theme]['长按背景阴影颜色'],
        shadowOffset: { x: 0, y: 5 },
      }
    ),
    ButtonScaleAnimation: animation['26键按键动画'],
    alphabeticHintSymbolsBackgroundStyle: hintSymbolsStyles['长按背景样式'],
    alphabeticHintSymbolsSelectedStyle: hintSymbolsStyles['长按选中背景样式'],

  };

{
  new(theme, orientation):
    keyboard(theme, orientation) +
    keyboardLayout.getEnLayout(theme, orientation) +  // 布局
    swipeStyles.makeSwipeStyles(theme, {
      swipe_up: swipe_up,
      swipe_down: swipe_down,
      type: 'pinyin',
    }) +
    hintSymbolsStyles.getStyle(theme, hintSymbolsData) +  // 长按
    toolbar.getToolBar(theme) +  // 工具栏
    utils.genAlphabeticStyles(theme) +  // 批量生成前景
    utils.genHintStyles(theme),
}
