# 元书已经有内置emoji键盘了，这个就没什么用了，只是放在这里。


local collectionData = import '../lib/collectionData.libsonnet';
local symbolic = import './symbolic_portrait.jsonnet';


local keyboard(theme) =
  symbolic.getKeyboard(theme);

{
  new(theme):
    keyboard(theme) + collectionData.emojiDataSource,
}
