local animation = import '../lib/animation.libsonnet';
local center = import '../lib/center.libsonnet';
local color = import '../lib/color.libsonnet';
local fontSize = import '../lib/fontSize.libsonnet';
local utils = import '../lib/utils.libsonnet';
// key: 按键名称
local createButton(params, theme, textColor={}, systemImageColor={}) = {
  [params.key + 'Button']: {
    size: {
      height: '1/4',
    },
    backgroundStyle: 'ButtonBackgroundStyle',
    foregroundStyle: [
      params.key + 'ButtonForegroundStyle',
      params.key + 'ButtonForegroundStyle2',
    ],
    action: params.action,
  },

  [params.key + 'ButtonForegroundStyle']: utils.makeSystemImageStyle({
    systemImageName: params.systemImageName,
    fontSize: fontSize['panel按键前景sf符号大小'],
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    center: center['panel键盘按键sf符号前景偏移'],
  }) + std.get(systemImageColor, theme, {}),

  [params.key + 'ButtonForegroundStyle2']: utils.makeTextStyle({
    text: params.text,
    fontSize: fontSize['panel按键前景文字大小'],
    normalColor: color[theme]['按键前景颜色'],
    highlightColor: color[theme]['按键前景颜色'],
    center: center['panel键盘按键文字前景偏移'],
  }) + std.get(textColor, theme, {}),

  animation: [
    'ButtonScaleAnimation',
  ],
};
local keyboard(theme, orientation) =
  createButton(
    params={
      key: 'Hamster',
      action: { openURL: 'hamster3://com.ihsiao.apps.hamster3/' },
      systemImageName: 'keyboard',
      text: '元书',
    },
    // 单独指定按键上文本和systemImage的颜色示例, 在仅设置light或dark，也可只设置normalColor或highlightColor
    // textColor = { light: { normalColor: '#ff0000' , highlightColor: "#0000ff"} },
    // systemImageColor = { dark: { normalColor: '#00ff00' } },
    theme=theme
  ) +

  createButton(
    params={
      key: 'Switcher',
      action: { shortcut: '#RimeSwitcher' },
      systemImageName: 'switch.2',
      text: 'Switcher',
    },
    theme=theme
  ) +
  createButton(
    params={
      key: 'Phrase',
      action: { shortcut: '#showPhraseView' },
      systemImageName: 'clipboard',
      text: '常用语',
    },
    theme=theme
  ) +
  createButton(
    params={
      key: 'HamsterSkin',
      action: { openURL: 'hamster3://com.ihsiao.apps.hamster3/keyboardSkins' },
      systemImageName: 'tshirt',
      text: '皮肤设置',
    },
    theme=theme
  ) +
  createButton(
    params={
      key: 'Upload',
      action: { openURL: 'hamster3://com.ihsiao.apps.hamster3/wifi' },
      systemImageName: 'square.and.arrow.up',
      text: '方案上传',
    },
    theme=theme
  ) +
  createButton(
    params={
      key: 'Deploy',
      action: { openURL: 'hamster3://com.ihsiao.apps.hamster3/rime?action=deploy' },
      systemImageName: 'command.circle',
      text: '部署',
    },
    theme=theme
  ) +
  createButton(
    params={
      key: 'Finder',
      action: { openURL: 'hamster3://com.ihsiao.apps.hamster3/finder' },
      systemImageName: 'folder',
      text: '文件',
    },
    theme=theme
  ) +
  createButton(
    params={
      key: 'toogleEmbedded',
      action: { shortcut: '#toggleEmbeddedInputMode' },
      systemImageName: 'square.and.pencil',
      text: '内嵌开关',
    },
    theme=theme
  ) +
  {
    keyboardLayout: [
      {
        HStack: {
          subviews: [
            { Cell: 'HamsterButton' },
            { Cell: 'SwitcherButton' },
            { Cell: 'PhraseButton' },
            { Cell: 'FinderButton' },
          ],
        },
      },
      {
        HStack: {
          subviews: [
            { Cell: 'HamsterSkinButton' },
            { Cell: 'UploadButton' },
            { Cell: 'DeployButton' },
            { Cell: 'toogleEmbeddedButton' },
          ],
        },
      },
    ],
    floatTargetScale:
      if orientation == 'portrait' then
        { x: 0.75, y: 0.6 }
      else
        { x: 0.45, y: 0.8 }
    ,
    keyboardStyle: {
      insets: {
        top: 24,
        left: 24,
        bottom: 24,
        right: 24,
      },
      backgroundStyle: 'keyboardBackgroundStyle',
    },
    keyboardBackgroundStyle: {
      buttonStyleType: 'fileImage',
      normalImage: {
        file: 'float_back',
        image: 'IMG1',
      },
      highlightImage: {
        file: 'float_back',
        image: 'IMG1',
      },
    },

    ButtonBackgroundStyle: {
      buttonStyleType: 'geometry',
      insets: { top: 5, left: 3, bottom: 5, right: 3 },
      normalColor: color[theme]['字母键背景颜色-普通'],
      highlightColor: color[theme]['字母键背景颜色-高亮'],
      cornerRadius: 5,
      normalLowerEdgeColor: color[theme]['底边缘颜色-普通'],
      highlightLowerEdgeColor: color[theme]['底边缘颜色-高亮'],
    },
    ButtonScaleAnimation: animation['26键按键动画'],
  };

{
  new(theme, orientation):
    keyboard(theme, orientation),
}
