local animation = import '../lib/animation.libsonnet';
local center = import '../lib/center.libsonnet';
local color = import '../lib/color.libsonnet';
local fontSize = import '../lib/fontSize.libsonnet';
local keyboardLayout_ = import '../lib/keyboardLayout.libsonnet';
local others = import '../lib/others.libsonnet';
local swipeData = import '../lib/swipeData.libsonnet';
local hintSymbolsData = import "../lib/hintSymbolsData.libsonnet";
local toolbar = import '../lib/toolbar.libsonnet';
local utils = import '../lib/utils.libsonnet';

local swipeStyles = import '../lib/swipeStyle.libsonnet';
local hintSymbolsStyles = import '../lib/hintSymbolsStyles.libsonnet';

// 上下和下划的数据
local swipe_up = if std.objectHas(swipeData, 'swipe_up') then swipeData.swipe_up else {};
local swipe_down = if std.objectHas(swipeData, 'swipe_down') then swipeData.swipe_down else {};

local createButton(key, size, bounds, root, isUpper=true) = {
  size: size,
  [if bounds != {} then 'bounds']: bounds,
  backgroundStyle: 'alphabeticBackgroundStyle',
  foregroundStyle: std.filter(  // 这样写避免了没有的上下划前景变成null
    function(x) x != null,
    [
      key + 'ButtonForegroundStyle',
      if std.objectHas(swipe_up, key) then key + 'ButtonUpForegroundStyle' else null,
      if std.objectHas(swipe_down, key) then key + 'ButtonDownForegroundStyle' else null,
    ]
  ),
  [if isUpper then 'uppercasedStateForegroundStyle']: std.filter(
    function(x) x != null,
    [
      key + 'ButtonUppercasedStateForegroundStyle',
      if std.objectHas(swipe_up, key) then key + 'ButtonUpForegroundStyle' else null,
      if std.objectHas(swipe_down, key) then key + 'ButtonDownForegroundStyle' else null,
    ]
  ),
  [if isUpper then 'capsLockedStateForegroundStyle']: self.uppercasedStateForegroundStyle,  // 同uppercaseStateForegroundStyle
  hintStyle: key + 'ButtonHintStyle',
  action: {
    character: key,
  },
  [if std.length(key) == 1 then 'uppercasedStateAction']: {
    character: std.asciiUpper(key),
  },
  [if std.objectHas(swipe_up, key) then 'swipeUpAction']: swipe_up[key].action,
  [if std.objectHas(swipe_down, key) then 'swipeDownAction']: swipe_down[key].action,
  [if std.objectHas(root, key + 'ButtonHintSymbolsStyle') then 'hintSymbolsStyle']: key + 'ButtonHintSymbolsStyle',
  // 动画
  animation: [
    'alphabeticBackgroundAnimation',
  ],
};

// 26个按键前景批量生成


local keyboard(theme, orientation, keyboardLayout) = 
keyboardLayout[if orientation == 'portrait' then '竖屏中文26键' else '横屏中文26键'] +
swipeStyles.getStyle('cn', theme, swipe_up, swipe_down) +
hintSymbolsStyles.getStyle(theme, hintSymbolsData.pinyin) +
toolbar.getToolBar(theme) +
{
  [if std.objectHas(others, '中文键盘方案') then 'rimeSchema']: others['中文键盘方案'],
  preeditHeight: others[if orientation == 'portrait' then '竖屏' else '横屏']['preedit高度'],
  toolbarHeight: others[if orientation == 'portrait' then '竖屏' else '横屏']['toolbar高度'],
  keyboardHeight: others[if orientation == 'portrait' then '竖屏' else '横屏']['keyboard高度'],
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

  qButton: createButton(
    'q',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  // qButtonForegroundStyle: utils.makeTextStyle(
  //   "Q", fontSize['按键前景文字大小'], 
  //   color[theme]['按键前景颜色'],
  //   color[theme]['按键前景颜色'],
  //   center['26键中文前景偏移'],
  // ),

  qButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'Q',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  qButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'Q',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  qButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'qButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'qButtonSwipeUpHintForegroundStyle',
  },

  wButton: createButton(
    'w',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  wButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'W',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  wButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'W',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  wButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'wButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'wButtonSwipeUpHintForegroundStyle',
  },
  eButton: createButton(
    'e',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  eButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'E',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  eButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'E',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  eButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'eButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'eButtonSwipeUpHintForegroundStyle',
  },

  rButton: createButton(
    'r',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  rButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'R',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  rButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'R',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  rButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'rButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'rButtonSwipeUpHintForegroundStyle',
  },

  tButton: createButton(
    't',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    if orientation == 'portrait' then {}
    else
      keyboardLayout['横屏按键尺寸']['t键size和bounds'].bounds,
    $
  ),

  tButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'T',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  tButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'T',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  tButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'tButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'tButtonSwipeUpHintForegroundStyle',
  },

  yButton: createButton(
    'y',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['y键size和bounds'].size,
    if orientation == 'portrait' then {}
    else
      keyboardLayout['横屏按键尺寸']['y键size和bounds'].bounds,
    $
  ),
  yButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'Y',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  yButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'Y',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  yButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'yButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'yButtonSwipeUpHintForegroundStyle',
  },

  uButton: createButton(
    'u',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  uButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'U',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  uButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'U',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  uButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'uButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'uButtonSwipeUpHintForegroundStyle',
  },

  iButton: createButton(
    'i',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  iButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'I',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  iButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'I',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  iButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'iButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'iButtonSwipeUpHintForegroundStyle',
  },


  oButton: createButton(
    'o',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  oButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'O',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  oButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'O',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  oButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'oButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'oButtonSwipeUpHintForegroundStyle',
  },

  pButton: createButton(
    'p',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  pButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'P',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  pButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'P',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  pButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'pButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'pButtonSwipeUpHintForegroundStyle',
  },
  aButton: createButton(
    'a',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['a键size和bounds'].size
    else
      keyboardLayout['横屏按键尺寸']['a键size和bounds'].size,
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['a键size和bounds'].bounds
    else
      keyboardLayout['横屏按键尺寸']['a键size和bounds'].bounds,
    $
  ),

  aButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'A',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  aButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'A',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  aButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'aButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'aButtonSwipeUpHintForegroundStyle',
  },

  sButton: createButton(
    's',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  sButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'S',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  sButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'S',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  sButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'sButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'sButtonSwipeUpHintForegroundStyle',
  },

  dButton: createButton(
    'd',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  dButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'D',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  dButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'D',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  dButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'dButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'dButtonSwipeUpHintForegroundStyle',
  },

  fButton: createButton(
    'f',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  fButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'F',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  fButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'F',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  fButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'fButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'fButtonSwipeUpHintForegroundStyle',
  },

  gButton: createButton(
    'g',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  gButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'G',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  gButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'G',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  gButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'gButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'gButtonSwipeUpHintForegroundStyle',
  },

  hButton: createButton(
    'h',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  hButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'H',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  hButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'H',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  hButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'hButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'hButtonSwipeUpHintForegroundStyle',
  },

  jButton: createButton(
    'j',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  jButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'J',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  jButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'J',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  jButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'jButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'jButtonSwipeUpHintForegroundStyle',
  },

  kButton: createButton(
    'k',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  kButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'K',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  kButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'K',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  kButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'kButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'kButtonSwipeUpHintForegroundStyle',
  },
  lButton: createButton(
    'l',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['l键size和bounds'].size
    else
      keyboardLayout['横屏按键尺寸']['l键size和bounds'].size,
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['l键size和bounds'].bounds
    else
      keyboardLayout['横屏按键尺寸']['l键size和bounds'].bounds,
    $
  ),
  lButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'L',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  lButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'L',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },


  lButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'lButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'lButtonSwipeUpHintForegroundStyle',
  },
  shiftButton: createButton(
    'shift',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['shift键size']
    else
      keyboardLayout['横屏按键尺寸']['shift键size'],
    {},
    $,
    false
  ) + {
    backgroundStyle: 'systemButtonBackgroundStyle',
    action: 'shift',
    uppercasedStateAction: 'shift',
    capsLockedStateForegroundStyle: 'shiftButtonCapsLockedForegroundStyle',
    uppercasedStateForegroundStyle: 'shiftButtonUppercasedForegroundStyle',
  },


  shiftButtonForegroundStyle: {
    buttonStyleType: 'systemImage',
    animation: 'ButtonForegroundAnimation',
    systemImageName: 'shift',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: { y: 0.53 },
  },
  shiftButtonUppercasedForegroundStyle: {
    buttonStyleType: 'systemImage',
    systemImageName: 'shift.fill',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: { y: 0.53 },
  },
  shiftButtonCapsLockedForegroundStyle: {
    buttonStyleType: 'systemImage',
    systemImageName: 'capslock.fill',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: { y: 0.53 },
  },
  zButton: createButton(
    'z',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  zButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'Z',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  zButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'Z',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },

  zButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'zButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'zButtonSwipeUpHintForegroundStyle',
  },

  xButton: createButton(
    'x',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  xButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'X',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  xButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'X',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },

  xButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'xButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'xButtonSwipeUpHintForegroundStyle',
  },

  cButton: createButton(
    'c',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  cButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'C',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },
  cButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'C',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },

  cButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'cButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'cButtonSwipeUpHintForegroundStyle',
  },

  vButton: createButton(
    'v',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  vButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'V',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  vButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'V',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },

  vButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'vButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'vButtonSwipeUpHintForegroundStyle',
  },

  bButton: createButton(
    'b',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  bButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'B',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  bButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'B',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },

  bButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'bButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'bButtonSwipeUpHintForegroundStyle',
  },

  nButton: createButton(
    'n',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  nButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'N',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  nButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'N',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },

  nButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'nButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'nButtonSwipeUpHintForegroundStyle',
  },

  mButton: createButton(
    'm',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['普通键size']
    else
      keyboardLayout['横屏按键尺寸']['普通键size'],
    {},
    $
  ),
  mButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: 'M',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],

  },
  mButtonUppercasedStateForegroundStyle: {
    buttonStyleType: 'text',
    text: 'M',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },

  mButtonHintStyle: {
    backgroundStyle: 'alphabeticHintBackgroundStyle',
    foregroundStyle: 'mButtonHintForegroundStyle',
    swipeUpForegroundStyle: 'mButtonSwipeUpHintForegroundStyle',
  },
  backspaceButton: createButton(
    'backspace',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['backspace键size']
    else
      keyboardLayout['横屏按键尺寸']['backspace键size'],
    {},
    $,
    false
  ) + {
    backgroundStyle: 'systemButtonBackgroundStyle',
    action: 'backspace',
    repeatAction: 'backspace',
  },

  backspaceButtonForegroundStyle: {
    buttonStyleType: 'systemImage',
    animation: 'ButtonForegroundAnimation',
    systemImageName: 'delete.left',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    targetScale: 0.7,
    center: { y: 0.53 },
  },
  symbolButton: createButton(
    'symbol',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['symbol键size']
    else
      keyboardLayout['横屏按键尺寸']['symbol键size'],
    {},
    $,
    false
  ) + {
    backgroundStyle: 'systemButtonBackgroundStyle',
    action: { keyboardType: if orientation == 'portrait' then 'symbolic' else 'numeric' },
  },

  symbolButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '#+=',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    center: center['功能键前景文字偏移'] { y: 0.5 },
  },

  '123Button': createButton(
    '123',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['123键size']
    else
      keyboardLayout['横屏按键尺寸']['123键size'],
    {},
    $,
    false
  ) + {
    backgroundStyle: 'systemButtonBackgroundStyle',
    action: { keyboardType: 'numeric' },
  },

  '123ButtonForegroundStyle': {
    buttonStyleType: 'text',
    text: '123',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    center: center['功能键前景文字偏移'] { y: 0.5 },
  },
  spaceButton: createButton(
    'space',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['space键size']
    else
      keyboardLayout['横屏按键尺寸']['space键size'],
    {},
    $,
    false
  ) + {
    backgroundStyle: 'alphabeticBackgroundStyle',
    action: 'space',
  },

  spaceButtonForegroundStyle: {
    buttonStyleType: 'text',
    animation: 'ButtonForegroundAnimation',
    text: '空格',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    center: center['功能键前景文字偏移'],
  },
  local srBtn = createButton(
    'spaceRight',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['spaceRight键size']
    else
      keyboardLayout['横屏按键尺寸']['spaceRight键size'],
    {},
    $,
    false
  ),
  spaceRightButton: srBtn {
    foregroundStyle: [
      'spaceRightButtonForegroundStyle',
      'spaceRightButtonForegroundStyle2',
    ],
    action: {
      symbol: '，',
    },
  },

  spaceRightButtonForegroundStyle: {
    buttonStyleType: 'text',
    text: '，',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: { x: 0.64, y: 0.45 },
  },
  spaceRightButtonForegroundStyle2: {
    buttonStyleType: 'text',
    text: '。',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'] - 2,
    center: { x: 0.6, y: 0.3 },
  },

  local slBtn = createButton(
    'spaceLeft',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['spaceRight键size']
    else
      keyboardLayout['横屏按键尺寸']['spaceRight键size'],
    {},
    $,
    false
  ),
  spaceLeftButton: slBtn {
    foregroundStyle: 'spaceLeftButtonForegroundStyle',
    action: {
      symbol: '@',
    },
  },

  spaceLeftButtonForegroundStyle: {
    text: '@',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'],
    center: center['26键中文前景偏移'],
  },

  enterButton: createButton(
    'enter',
    if orientation == 'portrait' then
      keyboardLayout['竖屏按键尺寸']['enter键size']
    else
      keyboardLayout['横屏按键尺寸']['enter键size'],
    {},
    $,
    false
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

  enterButtonForegroundStyle0: {
    buttonStyleType: 'text',
    text: '回车',
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    center: center['功能键前景文字偏移'],
  },
  enterButtonForegroundStyle6: {
    buttonStyleType: 'text',
    text: '搜索',
    normalColor: color[theme]['长按选中字体颜色'],
    highlightColor: color[theme]['长按非选中字体颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    center: center['功能键前景文字偏移'],
  },
  // 白色文字
  enterButtonForegroundStyle7: {
    buttonStyleType: 'text',
    text: '发送',
    normalColor: color[theme]['长按选中字体颜色'],
    highlightColor: color[theme]['长按非选中字体颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    center: center['功能键前景文字偏移'],
  },
  enterButtonForegroundStyle14: {
    buttonStyleType: 'text',
    text: '前往',
    normalColor: color[theme]['长按选中字体颜色'],
    highlightColor: color[theme]['长按非选中字体颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    center: center['功能键前景文字偏移'],
  },
  enterButtonForegroundStyle9: {
    buttonStyleType: 'text',
    text: '完成',
    normalColor: color[theme]['长按选中字体颜色'],
    highlightColor: color[theme]['长按非选中字体颜色'],
    fontSize: fontSize['按键前景文字大小'] - 3,
    center: center['功能键前景文字偏移'],
  },

  enterButtonBlueBackgroundStyle: {
    buttonStyleType: 'geometry',
    insets: { top: 5, left: 3, bottom: 5, right: 3 },
    normalColor: color[theme]['enter键背景(蓝色)'],
    highlightColor: color[theme]['功能键背景颜色-高亮'],
    cornerRadius: 5,
    normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
    highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
  },
  alphabeticBackgroundStyle: {
    buttonStyleType: 'geometry',
    insets: { top: 5, left: 3, bottom: 5, right: 3 },
    normalColor: color[theme]['字母键背景颜色-普通'],
    highlightColor: color[theme]['字母键背景颜色-高亮'],
    cornerRadius: 5,
    normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
    highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
  },
  systemButtonBackgroundStyle: {
    buttonStyleType: 'geometry',
    insets: { top: 5, left: 3, bottom: 6, right: 3 },
    normalColor: color[theme]['功能键背景颜色-普通'],
    highlightColor: color[theme]['功能键背景颜色-高亮'],
    cornerRadius: 5,
    normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
    highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
  },

  alphabeticBackgroundAnimation: animation['26键按键背景动画'],
  functionBackgroundAnimation: animation['26键功能键背景动画'],
  ButtonForegroundAnimation: animation['26键按键前景动画'],
  alphabeticHintBackgroundStyle: {
    buttonStyleType: 'geometry',
    normalColor: color[theme]['气泡背景颜色'],
    highlightColor: color[theme]['气泡高亮颜色'],
    cornerRadius: 5,
    shadowColor: color[theme]['长按背景阴影颜色'],
    shadowOffset: { x: 0, y: 5 },
  },
  alphabeticHintSymbolsBackgroundStyle: hintSymbolsStyles['长按背景样式'],
  alphabeticHintSymbolsSelectedStyle: hintSymbolsStyles['长按选中背景样式'],
  // "alphabeticHintSymbolsBackgroundStyle": {
  //       "type": "original",
  //       "normalColor": color[theme]["长按背景颜色"],
  //       "highlightColor": color[theme]["长按背景颜色"],
  //       "cornerRadius": 5,
  //       "shadowColor": color[theme]["长按背景阴影颜色"],
  //       "shadowOffset": {'x': 0, 'y': 5}
  //   },
  // "alphabeticHintSymbolsSelectedStyle": {
  //       "type": "original",
  //       "normalColor": color[theme]["长按选中背景颜色"],
  //       "highlightColor": color[theme]["长按选中背景颜色"],
  //       "cornerRadius": 5,
  //   }
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
};

{
  new(theme, orientation):
    keyboard(theme, orientation, keyboardLayout_.getKeyboardLayout(theme))
}
