// local center = import 'center.libsonnet';
local toolbar = import 'toolbar.libsonnet';

local custom = {  // 中英键盘有不同，在这里加上，会覆盖掉toolbar.libsonnet中对应的按键设置以供英文键盘使用。
  // "toolbarButton2Style": {
  // "backgroundStyle": "toolbarButtonBackgroundStyle",
  // "foregroundStyle": "// JavaScript\nfunction getText() {\n  if ($getRimeOptionState(\"ascii_mode\") === null) {\n    return \"offStyle\"; //默认关闭\n  }\n  return $getRimeOptionState(\"ascii_mode\") ? \"offStyle\" : \"onStyle\";\n}",
  // "action": {
  //   "shortcutCommand": "#中英切换"
  // }
  // },
  // "onStyle": {
  //   "normalImage": {
  //     "file": "more",
  //     "image": "IMG12"
  //   },
  //   "highlightImage": {
  //     "file": "more2",
  //     "image": "IMG12"
  //   },
  //   "targetScale": 0.8,
  //   "center": center["toolbar按键偏移"]
  // },
  // "offStyle": {
  //   "normalImage": {
  //     "file": "more",
  //     "image": "IMG13"
  //   },
  //   "highlightImage": {
  //     "file": "more2",
  //     "image": "IMG13"
  //   },
  //   "targetScale": 0.8,
  //   "center": center["toolbar按键偏移"]
  // },
};

// 下面不要动
{
  getToolBar(theme): toolbar.getToolBar(theme) + custom,
}
