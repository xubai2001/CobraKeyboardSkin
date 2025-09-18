#!/usr/bin/env bash
set -euo pipefail

# 可选：输出时加颜色
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'

# 要处理的主题目录
themes=(light dark)

# 定义命令模板，{theme} 会被替换
cmds=(
  "jsonnet ./jsonnet_config/pinyin_26_portrait.jsonnet -o ./{theme}/pinyin_26_portrait.yaml -J ./lib/ --ext-str theme=\"{theme}\" --ext-str orientation=\"portrait\""
  "jsonnet ./jsonnet_config/pinyin_26_portrait.jsonnet -o ./{theme}/pinyin_26_landscape.yaml -J ./lib/ --ext-str theme=\"{theme}\" --ext-str orientation=\"landscape\""
  "jsonnet ./jsonnet_config/alphabetic_26_portrait.jsonnet -o ./{theme}/alphabetic_26_portrait.yaml -J ./lib/ --ext-str theme=\"{theme}\" --ext-str orientation=\"portrait\""
  "jsonnet ./jsonnet_config/alphabetic_26_portrait.jsonnet -o ./{theme}/alphabetic_26_landscape.yaml -J ./lib/ --ext-str theme=\"{theme}\" --ext-str orientation=\"landscape\""
  "jsonnet ./jsonnet_config/numeric_9_portrait.jsonnet -o ./{theme}/numeric_9_portrait.yaml -J ./lib/ --ext-str theme=\"{theme}\""
  "jsonnet ./jsonnet_config/numeric_9_landscape.jsonnet -o ./{theme}/numeric_9_landscape.yaml -J ./lib/ --ext-str theme=\"{theme}\""
  "jsonnet ./jsonnet_config/symbolic_portrait.jsonnet -o ./{theme}/symbolic_portrait.yaml -J ./lib/ --ext-str theme=\"{theme}\""
  "jsonnet ./jsonnet_config/emoji_portrait.jsonnet -o ./{theme}/emoji_portrait.yaml -J ./lib/ --ext-str theme=\"{theme}\""
  "jsonnet ./jsonnet_config/emoji_portrait.jsonnet -o ./{theme}/emoji_landscape.yaml -J ./lib/ --ext-str theme=\"{theme}\""
  "jsonnet ./jsonnet_config/panel.jsonnet -o ./{theme}/panel_portrait.yaml    -J ./lib/ --ext-str theme=\"{theme}\" --ext-str orientation=\"portrait\""
  "jsonnet ./jsonnet_config/panel.jsonnet -o ./{theme}/panel_landscape.yaml   -J ./lib/ --ext-str theme=\"{theme}\" --ext-str orientation=\"landscape\""
)

for theme in "${themes[@]}"; do
  # 创建目录（如果不存在）
  if [[ ! -d "$theme" ]]; then
    echo -e "${YELLOW}创建目录: $theme${NC}"
    mkdir -p "$theme"
  fi

  echo -e "${CYAN}正在处理主题: $theme${NC}"

  for tpl in "${cmds[@]}"; do
    # 替换 {theme}
    cmd="${tpl//\{theme\}/$theme}"
    echo "  执行: $cmd"
    if ! eval $cmd; then
      echo -e "${RED}命令失败: $cmd${NC}" >&2
      exit 1
    fi
    echo -e "${GREEN}  成功${NC}"
  done
done

echo -e "${GREEN}所有命令已成功执行${NC}"