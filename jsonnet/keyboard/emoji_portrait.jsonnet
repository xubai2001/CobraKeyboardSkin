local collectionData = import '../lib/collectionData.libsonnet';
local symbolic = import './symbolic_portrait.jsonnet';

local keyboard(theme) =
  symbolic.new(theme) + { dataSource: collectionData.emojiDataSource };

{
  new(theme):
    keyboard(theme),
}
