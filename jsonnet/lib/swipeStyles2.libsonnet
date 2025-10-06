// lib/swipeStyles.libsonnet
local center = import 'center.libsonnet';
local color = import 'color.libsonnet';
local fontSize = import 'fontSize.libsonnet';

// 解析颜色，支持多种形式
local pickColors = function(overridesColor, theme)
  // 从覆盖颜色中提取特定主题的颜色，如果overridesColor为空则返回空对象
  if overridesColor == {} then {}
  else {
    normalColor: overridesColor[theme].normalColor,
    highlightColor: overridesColor[theme].highlightColor,
  };

local colorsOrDefault = function(overrides, theme)
  local overridesColor = std.get(overrides, 'color', {});
  local picked = pickColors(overridesColor, theme);
  // 如果有覆盖颜色则使用，否则使用默认的划动字符颜色
  if picked != {} then picked else { normalColor: color[theme]['划动字符颜色'], highlightColor: color[theme]['划动字符颜色'] };

local defaultCenter = function(direction, type)
  local map = {
    up: {
      pinyin: center['上划文字偏移'],
      number: center['数字键盘上划文字偏移'],
      cn9: center['数字键盘上划文字偏移'],
    },
    down: {
      pinyin: center['下划文字偏移'],
      number: center['数字键盘下划文字偏移'],
      cn9: center['数字键盘下划文字偏移'],
    },
  };
  map[direction][type];


local defaultFontSize = function(direction) if direction == 'up' then fontSize['上划文字大小'] else fontSize['下划文字大小'];

local makeTextStyle = function(theme, label, direction, type, overrides={})
  local c = colorsOrDefault(overrides, theme);
  {
    buttonStyleType: 'text',
    text: label.text,
    fontSize: std.get(overrides, 'fontSize', defaultFontSize(direction)),
    normalColor: c.normalColor,
    highlightColor: c.highlightColor,
    center: std.get(overrides, 'center', defaultCenter(direction, type)),
  };

local makeSystemImageStyle = function(theme, label, direction, type, overrides={})
  local c = colorsOrDefault(overrides, theme);
  {
    buttonStyleType: 'systemImage',
    systemImageName: label.systemImageName,
    fontSize: std.get(overrides, 'fontSize', defaultFontSize(direction)),
    normalColor: c.normalColor,
    highlightColor: c.highlightColor,
    center: std.get(overrides, 'center', defaultCenter(direction, type)),
  };

// 根据 key 生成样式名称
local styleName = function(type, key, direction)
  // 数字类型且单字符的键使用特殊命名规则
  if type == 'number' && std.length(key) == 1
  then 'number' + key + 'Button' + (if direction == 'up' then 'Up' else 'Down') + 'ForegroundStyle'
  else key + 'Button' + (if direction == 'up' then 'Up' else 'Down') + 'ForegroundStyle';

local makeForegroundStyle = function(key, direction, theme, type, data)
  local label = std.get(data, 'label', {});

  // 根据标签类型生成相应的前景样式
  if std.objectHas(label, 'text') then
    { [styleName(type, key, direction)]: makeTextStyle(theme, label, direction, type, data) }
  else if std.objectHas(label, 'systemImageName') then
    { [styleName(type, key, direction)]: makeSystemImageStyle(theme, label, direction, type, data) }
  else {};

local makeSwipeUpHintForegroundStyle = function(key, direction, theme, type, data)
  local label = std.get(data, 'label', {});
  // 为单字符键生成特殊的上滑提示样式
  if std.length(key) == 1 && std.objectHas(data, 'label') then
  {
    [key+'ButtonSwipeUpHintForegroundStyle']: makeTextStyle(theme, label, direction, type, data)
  } else {};


local processDirection = function(dirData, direction, theme, type)
  // 生成基本前景样式
  std.foldl(
    function(acc, k) acc + makeForegroundStyle(k, direction, theme, type, dirData[k]),
    std.objectFields(dirData),
    {}
  )+
  // 上滑气泡显示，原先的按下气泡移到utils中集中生成
  if direction == 'up' && type == "pinyin" then
    std.foldl(
      function(acc, k) acc + makeSwipeUpHintForegroundStyle(k, direction, theme, type, dirData[k]),
      std.objectFields(dirData),
      {}
    )
  else {};



// params 结构: { swipe_up: {...}, swipe_down: {...}, type: 'pinyin'|'number'|'cn9' }
local makeSwipeStyles = function(theme, params)
  local swipe_up = std.get(params, 'swipe_up', {});
  local swipe_down = std.get(params, 'swipe_down', {});
  local type = std.get(params, 'type', '');

  // 处理上滑和下滑数据，生成相应的样式
  processDirection(swipe_up, 'up', theme, type) +
  processDirection(swipe_down, 'down', theme, type);

// 导出主函数
{
  makeSwipeStyles: makeSwipeStyles,
}
