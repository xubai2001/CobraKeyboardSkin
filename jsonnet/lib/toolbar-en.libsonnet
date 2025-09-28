// local center = import 'center.libsonnet';
local toolbar = import 'toolbar.libsonnet';

local custom(theme) = {  // 中英键盘有不同，在这里加上，会覆盖掉toolbar.libsonnet中对应的按键设置以供英文键盘使用。
  // 示例：覆盖整个按键
  // toolbarButton4Style: {
  //   backgroundStyle: 'toolbarButtonBackgroundStyle',
  //   foregroundStyle: 'toolbarButton4ForegroundStyle',
  //   action: {
  //     shortcutCommand: '#showPasteboardView',
  //   },
  // },

  // 示例：只改其中某个值的
  toolbarButton4ForegroundStyle+:  { text: '英文' },

};

// 下面不要动
{
  getToolBar(theme): toolbar.getToolBar(theme) + custom(theme),
}
