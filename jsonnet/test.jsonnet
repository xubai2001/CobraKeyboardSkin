

local pinyin = import 'keyboard/pinyin_26_portrait.jsonnet';
local alphabetic = import 'keyboard/alphabetic_26_portrait.jsonnet';
local numericPortrait = import 'keyboard/numeric_9_portrait.jsonnet';
local numericLandscape = import 'keyboard/numeric_9_landscape.jsonnet';
local symbolic = import 'keyboard/symbolic_portrait.jsonnet';
local emoji = import 'keyboard/emoji_portrait.jsonnet';
local panel = import 'keyboard/panel.jsonnet';

// 拼音
local lightPinyinPortrait = pinyin.new("light", "portrait");
local darkPinyinPortrait = pinyin.new("dark", "portrait");
local lightPinyinLandscape = pinyin.new("light", "landscape");
local darkPinyinLandscape = pinyin.new("dark", "landscape");

// 字母
local lightAlphabeticPortrait = alphabetic.new("light", "portrait");
local darkAlphabeticPortrait = alphabetic.new("dark", "portrait");
local lightAlphabeticLandscape = alphabetic.new("light", "landscape");
local darkAlphabeticLandscape = alphabetic.new("dark", "landscape");

// 数字
local lightNumericPortrait = numericPortrait.new("light");
local darkNumericPortrait = numericPortrait.new("dark");
local lightNumericLandscape = numericLandscape.new("light");
local darkNumericLandscape = numericLandscape.new("dark");

// 符号
local lightSymbolicPortrait = symbolic.new("light");
local darkSymbolicPortrait = symbolic.new("dark");

// emoji
local lightEmojiPortrait = emoji.new("light");
local darkEmojiPortrait = emoji.new("dark");

// 面板
local lightPanelPortrait = panel.new("light", "portrait");
local darkPanelPortrait = panel.new("dark", "portrait");
local lightPanelLandscape = panel.new("light", "landscape");
local darkPanelLandscape = panel.new("dark", "landscape");


std.manifestYamlDoc(lightAlphabeticLandscape, indent_array_in_object=true, quote_keys=false)
