local center = import 'center.libsonnet';
local color = import 'color.libsonnet';
local fontSize = import 'fontSize.libsonnet';
local keyboardLayout = import 'keyboardLayout.libsonnet';

// key: 按键名, a-z, shift, space....
// contentMode: center, scaleAspectFill 更多类型见文档
// normalFile、highlightFile

// 单个生成函数
// local makeImageStyle(contentMode, normalFile, highlightFile, normalImage, highlightImage, center, insets) = {
//   [if contentMode != null then 'contentMode']: contentMode,
//   buttonStyleType: 'fileImage',
//   normalImage: {
//     file: normalFile,
//     image: normalImage,
//   },
//   highlightImage: {
//     file: highlightFile,
//     image: highlightImage,
//   },
//   [if insets != {} then 'insets']: insets,
//   [if center != {} then 'center']: center,
// };

// local makeTextStyle(text, fontSize, normalColor, highlightColor, center) = {
//   buttonStyleType: 'text',
//   text: text,
//   fontSize: fontSize,
//   normalColor: normalColor,
//   highlightColor: highlightColor,
//   [if center != {} then 'center']: center,
// };

local makeTextStyle(params={}) =
  std.prune({
    buttonStyleType: 'text',
    text: std.get(params, 'text'),
    fontSize: std.get(params, 'fontSize'),
    normalColor: std.get(params, 'normalColor'),
    highlightColor: std.get(params, 'highlightColor'),
    center: std.get(params, 'center'),
    fontWeight: std.get(params, 'fontWeight'),
  });

local makeSystemImageStyle(params={}) =
  std.prune({
    buttonStyleType: 'systemImage',
    insets: std.get(params, 'insets'),
    center: std.get(params, 'center'),
    systemImageName: std.get(params, 'systemImageName'),
    contentMode: std.get(params, 'contentMode'),
    fontSize: std.get(params, 'fontSize'),
    fontWeight: std.get(params, 'fontWeight'),
    normalColor: std.get(params, 'normalColor'),
    highlightColor: std.get(params, 'highlightColor'),
  });

  local makeGeometryStyle(params = {}) =
    std.prune({
      buttonStyleType: 'geometry',
      insets: std.get(params, 'insets'),
      normalColor: std.get(params, 'normalColor'),
      highlightColor: std.get(params, 'highlightColor'),
      colorLocation: std.get(params, 'colorLocation'),
      colorStartPoint: std.get(params, 'colorStartPoint'),
      colorEndPoint: std.get(params, 'colorEndPoint'),
      colorGradientType: std.get(params, 'colorGradientType'),
      cornerRadius: std.get(params, 'cornerRadius'),
      borderSize: std.get(params, 'borderSize'),
      borderColor: std.get(params, 'borderColor'),
      normalLowerEdgeColor: std.get(params, 'normalLowerEdgeColor'),
      highlightLowerEdgeColor: std.get(params, 'highlightLowerEdgeColor'),
      normalShadowColor: std.get(params, 'normalShadowColor'),
      highlightShadowColor: std.get(params, 'highlightShadowColor'),
      shadowOpacity: std.get(params, 'shadowOpacity'),
      shadowRadius: std.get(params, 'shadowRadius'),
      shadowOffset: std.get(params, 'shadowOffset'),
    });

local makeAssetImageStyle(params = {}) =
  std.prune({
    buttonStyleType: 'assetImage',
    insets: std.get(params, 'insets'),
    assetImageName: std.get(params, 'assetImageName'),
    contentMode: std.get(params, 'contentMode'),
    normalColor: std.get(params, 'normalColor'),
    highlightColor: std.get(params, 'highlightColor'),
  });


// 按键前景批量生成
local keyMap = {
  q: 'Q',
  w: 'W',
  e: 'E',
  r: 'R',
  t: 'T',
  y: 'Y',
  u: 'U',
  i: 'I',
  o: 'O',
  p: 'P',
  a: 'A',
  s: 'S',
  d: 'D',
  f: 'F',
  g: 'G',
  h: 'H',
  j: 'J',
  k: 'K',
  l: 'L',
  z: 'Z',
  x: 'X',
  c: 'C',
  v: 'V',
  b: 'B',
  n: 'N',
  m: 'M',
};

// 生成26字母键前景
local genPinyinStyles(theme) =
  {
    [keyName + 'ButtonForegroundStyle']: makeTextStyle(
      params={
        text: keyMap[keyName],
        fontSize: fontSize['按键前景文字大小'],
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        center: center['26键中文前景偏移'],
      },
    )
    for keyName in std.objectFields(keyMap)
  } + {
    [keyName + 'ButtonUppercasedStateForegroundStyle']: makeTextStyle(
      params={
        text: keyMap[keyName],
        fontSize: fontSize['按键前景文字大小'],
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        center: center['26键中文前景偏移'],
      },
    )
    for keyName in std.objectFields(keyMap)
  };

// 生成英文26键前景
local genAlphabeticStyles(theme) =
  {
    [keyName + 'ButtonForegroundStyle']: makeTextStyle(
      params={
        text: std.asciiLower(keyMap[keyName]),
        fontSize: fontSize['按键前景文字大小'],
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        center: center['26键中文前景偏移'],
      },
    )
    for keyName in std.objectFields(keyMap)
  } + {
    [keyName + 'ButtonUppercasedStateForegroundStyle']: makeTextStyle(
      params={
        text: keyMap[keyName],
        fontSize: fontSize['按键前景文字大小'],
        normalColor: color[theme]['按键前景颜色'],
        highlightColor: color[theme]['按键前景颜色'],
        center: center['26键中文前景偏移'],
      },
    )
    for keyName in std.objectFields(keyMap)
  };

local genNumberStyles(theme) = {
  ['number' + num + 'ButtonForegroundStyle']: makeTextStyle(
    params = {
      text: std.toString(num),
      fontSize: fontSize['数字键盘数字前景字体大小'],
      normalColor: color[theme]['按键前景颜色'],
      highlightColor: color[theme]['按键前景颜色'],
      center: center['数字键盘数字前景偏移'],
    },
  )
  for num in std.range(0, 9)
};

// 生成按下气泡前景
local genHintStyles(theme) =
  {
    [key + 'ButtonHintForegroundStyle']: makeTextStyle({
      center: center['按下气泡文字偏移'],
      text: keyMap[key],
      fontSize: fontSize['划动气泡前景文字大小'],
      normalColor: color[theme]['按下气泡文字颜色'],
    })
    for key in std.objectFields(keyMap)
  };


// 生成双拼提示
local doublePinyinKeyMap = {
  "q": ["iu"],
  "w": ["ia", "ua"],
  "e": ["e"],
  "r": ["uan"],
  "t": ["ue", "ve"],
  "y": ["ing", "uai"],
  "u": ["u"],
  "i": ["i"],
  "o": ["o", "uo"],
  "p": ["un"],
  "a": ["a"],
  "s": ["iong", "ong"],
  "d": ["iang", "uang"],
  "f": ["en"],
  "g": ["eng"],
  "h": ["ang"],
  "j": ["an"],
  "k": ["ao"],
  "l": ["ai"],
  "z": ["ei"],
  "x": ["ie"],
  "c": ["iao"],
  "v": ["ui", "v"],
  "b": ["ou"],
  "n": ["in"],
  "m": ["ian"]
};

local genDoublePinyinHintStyles(theme) = {
  [keyName + 'ButtonPinyinHintForegroundStyle']: makeTextStyle(
    params={
      text: doublePinyinKeyMap[keyName][0],
      fontSize: fontSize['上划文字大小'],
      normalColor: color[theme]['划动字符颜色'],
      highlightColor: color[theme]['划动字符颜色'],
      center: {x: 0.5, y: 0.8},
    },
  )
  for keyName in std.objectFields(doublePinyinKeyMap)
} + {
  [if std.length(doublePinyinKeyMap[keyName]) == 2 then keyName + 'ButtonPinyinHintForegroundStyle2']: makeTextStyle(
    params={
      text: doublePinyinKeyMap[keyName][1],
      fontSize: fontSize['上划文字大小'],
      normalColor: color[theme]['划动字符颜色'],
      highlightColor: color[theme]['划动字符颜色'],
      center: {y: 0.28},
    },
  )
  for keyName in std.objectFields(doublePinyinKeyMap)
};

local genDoublePinyinNotification(theme, orientation) = {
  local ButtonSize = keyboardLayout.getButtonSize(theme, orientation),
  [keyName + "ButtonPinyinHintNotification"]: {
    notificationType: "preeditChanged",
    backgroundStyle: 'alphabeticBackgroundStyle',
    [if std.contains(['a', 'l'], keyName) then 'bounds']: std.get(ButtonSize, keyName+'键bounds'),
    foregroundStyle: [
      keyName + 'ButtonForegroundStyle',
      keyName + 'ButtonPinyinHintForegroundStyle',
      if std.length(doublePinyinKeyMap[keyName]) == 2 then keyName + 'ButtonPinyinHintForegroundStyle2'
    ]
  }
  for keyName in std.objectFields(doublePinyinKeyMap)
};


{
  // makeImageStyle(contentMode, normalFile, highlightFile, normalImage, highlightImage, center, insets):
  //   makeImageStyle(contentMode, normalFile, highlightFile, normalImage, highlightImage, center, insets),
  makeTextStyle: makeTextStyle,
  makeSystemImageStyle: makeSystemImageStyle,
  makeGeometryStyle: makeGeometryStyle,
  makeAssetImageStyle: makeAssetImageStyle,

  genPinyinStyles: genPinyinStyles,
  genAlphabeticStyles: genAlphabeticStyles,
  genNumberStyles: genNumberStyles,
  genHintStyles: genHintStyles,

  // 生成双拼提示前景和通知
  genDoublePinyinHintStyles: genDoublePinyinHintStyles,
  genDoublePinyinNotification: genDoublePinyinNotification,
}
