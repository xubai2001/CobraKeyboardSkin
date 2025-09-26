// 图片型

// key: 按键名, a-z, shift, space....
// contentMode: center, scaleAspectFill 更多类型见文档
// normalFile、highlightFile 
local center = import './center.libsonnet';
// 单个生成函数
local makeImageStyle(contentMode, normalFile, highlightFile, normalImage, highlightImage, center, insets) = {
  [if contentMode != null then 'contentMode']: contentMode,
  buttonStyleType: "fileImage",
  normalImage: {
    file: normalFile,
    image: normalImage,
  },
  highlightImage: {
    file: highlightFile,
    image: highlightImage,
  },
  [if insets != {} then 'insets']: insets,
  [if center != {} then 'center']: center,
};

local makeTextStyle(text, fontSize, normalColor, highlightColor, center) = {
  buttonStyleType: "text",
  text: text,
  fontSize: fontSize,
  normalColor: normalColor,
  highlightColor: highlightColor,
  [if center != {} then 'center']: center,
};

// 按键前景批量生成
local keyMap = {
  q: 'Q', w: 'W', e: 'E', r: 'R', t: 'T', y: 'Y', u: 'U', i: 'I', o: 'O', p: 'P',
  a: 'A', s: 'S', d: 'D', f: 'F', g: 'G', h: 'H', j: 'J', k: 'K', l: 'L',
  z: 'Z', x: 'X', c: 'C', v: 'V', b: 'B', n: 'N', m: 'M',
};

// 生成26字母键前景
local genPinyinStyles(fontSize, color, theme, center) = 
  {
    [keyName + 'ButtonForegroundStyle']: makeTextStyle(
      keyMap[keyName],
      fontSize['按键前景文字大小'],
      color[theme]['按键前景颜色'],
      color[theme]['按键前景颜色'],
      center['26键中文前景偏移']
    )
    for keyName in std.objectFields(keyMap)
  } + {
    [keyName + 'ButtonUppercasedStateForegroundStyle']: makeTextStyle(
      keyMap[keyName],
      fontSize['按键前景文字大小'],
      color[theme]['按键前景颜色'],
      color[theme]['按键前景颜色'],
      center['26键中文前景偏移']
    )
    for keyName in std.objectFields(keyMap)
  };

// 生成英文26键前景
local genAlphabeticStyles(fontSize, color, theme, center) = 
  {
    [keyName + 'ButtonForegroundStyle']: makeTextStyle(
      std.asciiLower(keyMap[keyName]),
      fontSize['按键前景文字大小'],
      color[theme]['按键前景颜色'],
      color[theme]['按键前景颜色'],
      center['26键中文前景偏移']
    )
    for keyName in std.objectFields(keyMap)
  } + {
    [keyName + 'ButtonUppercasedStateForegroundStyle']: makeTextStyle(
      keyMap[keyName],
      fontSize['按键前景文字大小'],
      color[theme]['按键前景颜色'],
      color[theme]['按键前景颜色'],
      center['26键中文前景偏移']
    )
    for keyName in std.objectFields(keyMap)
  };

local genNumberStyles(fontSize, color, theme, center) = {
  ['number' + num + 'ButtonForegroundStyle']: {
    buttonStyleType: "text",
    text: std.toString(num),
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    fontSize: fontSize['数字键盘数字前景字体大小'],
    center: center['数字键盘数字前景偏移'],
  }
  for num in std.range(0, 9)
};


{
    makeImageStyle(contentMode, normalFile, highlightFile, normalImage, highlightImage, center, insets):
      makeImageStyle(contentMode, normalFile, highlightFile, normalImage, highlightImage, center, insets),
    makeTextStyle(text, fontSize, normalColor, highlightColor, center):
      makeTextStyle(text, fontSize, normalColor, highlightColor, center),
    genPinyinStyles(fontSize, color, theme, center):
      genPinyinStyles(fontSize, color, theme, center),
    genAlphabeticStyles(fontSize, color, theme, center):
      genAlphabeticStyles(fontSize, color, theme, center),
    genNumberStyles(fontSize, color, theme, center):
      genNumberStyles(fontSize, color, theme, center),
}
