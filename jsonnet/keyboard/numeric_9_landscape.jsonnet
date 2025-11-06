// 尝试直接引用九键竖屏配置，再用横屏的进行patch

local numeric_9_portrit = import 'numeric_9_portrait.jsonnet';
local symbolic_portrait = import 'symbolic_portrait.jsonnet';

local animation = import '../lib/animation.libsonnet';
local collectionData = import '../lib/collectionData.libsonnet';
local color = import '../lib/color.libsonnet';
local fontSize = import '../lib/fontSize.libsonnet';
local _hintSymbolsData = import '../lib/hintSymbolsData.libsonnet';
local others = import '../lib/others.libsonnet';
local swipeData = import '../lib/swipeData.libsonnet';
local toolbar = import '../lib/toolbar.libsonnet';
local utils = import '../lib/utils.libsonnet';

local hintSymbolsStyles = import '../lib/hintSymbolsStyles.libsonnet';
local swipeStyles = import '../lib/swipeStyles2.libsonnet';

// 上下和下划的数据
local swipe_up = std.get(swipeData, 'number_swipe_up', {});
local swipe_down = std.get(swipeData, 'number_swipe_down', {});
local hintSymbolsData = std.get(_hintSymbolsData, 'number', {});

// 暂时这里应该是没什么用了，该键盘直接引用了竖屏的数字键盘和竖屏的符号键盘
local createButton(params={}) =
  local isNumber = std.get(params, 'isNumber', true);
  std.prune({
    size: std.get(params, 'size'),
    bounds: std.get(params, 'bounds'),
    // params中没有isNumber: falsa和背景时，就是数字键背景，非数字键时，设置了背景就用设置的，没设置就默认 key+ButtonBackgroundStyle
    backgroundStyle: if isNumber then 'numberButtonBackgroundStyle' else std.get(params, 'backgroundStyle', 'systemButtonBackgroundStyle'),
    // 和背景是差不多的逻辑
    foregroundStyle:
      if isNumber then
        std.prune([
          if isNumber then 'number' + params.key + 'ButtonForegroundStyle' else params.key + 'ButtonForegroundStyle',
          if std.objectHas(swipe_up, params.key) then 'number' + params.key + 'ButtonUpForegroundStyle' else null,
          if std.objectHas(swipe_down, params.key) then 'number' + params.key + 'ButtonDownForegroundStyle' else null,
        ])
      else
        std.get(params, 'foregroundStyle', params.key + 'ButtonForegroundStyle'),

    action: std.get(params, 'action', { character: params.key }),
    repeatAction: std.get(params, 'repeatAction'),

    [if std.objectHas(swipe_up, params.key) then 'swipeUpAction']: swipe_up[params.key].action,
    [if std.objectHas(swipe_down, params.key) then 'swipeDownAction']: swipe_down[params.key].action,
    // [if isNumber then 'hintSymbolsStyle']: 'number' + params.key + 'ButtonHintSymbolsStyle',
    [if std.objectHas(hintSymbolsData, 'number' + params.key) then 'hintSymbolsStyle']: params.key + 'ButtonHintSymbolsStyle',

    // 动画
    animation: [
      'ButtonScaleAnimation',
    ],
  });

local keyboard(theme) =
  {
    [if std.objectHas(others, '中文键盘方案') then 'rimeSchema']: others['中文键盘方案'],
    preeditHeight: others['横屏']['preedit高度'],
    toolbarHeight: others['横屏']['toolbar高度'],
    keyboardHeight: others['横屏']['keyboard高度'],

    keyboardLayout: [
      {
        VStack: {
          style: 'columnStyle1',
          subviews: [
            {
              VStack: {
                style: 'VStackStyle1',
                subviews: [
                  { Cell: 'collection' },
                  { Cell: 'symbolButton' },
                ],
              },
            },
            {
              VStack: {
                style: 'VStackStyle2',
                subviews: [
                  { Cell: 'number1Button' },
                  { Cell: 'number4Button' },
                  { Cell: 'number7Button' },
                  { Cell: 'returnButton' },
                ],
              },
            },
            {
              VStack: {
                style: 'VStackStyle2',
                subviews: [
                  { Cell: 'number2Button' },
                  { Cell: 'number5Button' },
                  { Cell: 'number8Button' },
                  { Cell: 'number0Button' },
                ],
              },
            },
            {
              VStack: {
                style: 'VStackStyle2',
                subviews: [
                  { Cell: 'number3Button' },
                  { Cell: 'number6Button' },
                  { Cell: 'number9Button' },
                  { Cell: 'spaceButton' },
                ],
              },
            },
            {
              VStack: {
                style: 'VStackStyle1',
                subviews: [
                  { Cell: 'backspaceButton' },
                  { Cell: 'periodButton' },
                  { Cell: 'equalButton' },
                  { Cell: 'enterButton' },
                ],
              },
            },
          ],
        },
      },
      {
        VStack: {
          style: 'columnStyle2',
        },
      },
      {
        VStack: {
          style: 'columnStyle3',
          subviews: [
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
    columnStyle1: {
      size: {
        width: '9/20',
      },
    },
    columnStyle2: {
      size: {
        width: '2/20',
      },
    },
    columnStyle3: {
      size: {
        width: '9/20',
      },
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
    VStackStyle1: {
      size: {
        width: '29/183',
      },
    },
    VStackStyle2: {
      size: {
        width: '125/549',
      },
    },
    // ButtonScaleAnimation: animation['26键按键动画'],

  };

{
  new(theme):
    // 先用竖屏的，后面的拼接后会覆盖
    numeric_9_portrit.keyboard(theme) +
    symbolic_portrait.new(theme) +
    keyboard(theme) +
    swipeStyles.makeSwipeStyles(theme, {
      swipe_up: swipe_up,
      swipe_down: swipe_down,
      type: 'number',
    }) +
    hintSymbolsStyles.getStyle(theme, hintSymbolsData) +  // 长按
    toolbar.getToolBar(theme) +  // 工具栏
    utils.genNumberStyles(theme),  // 批量生成前景
}
