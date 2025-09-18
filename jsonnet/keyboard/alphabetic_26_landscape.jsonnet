local toolbar = import "../lib/toolbar-en.libsonnet";
local color = import "../lib/color.libsonnet";
local fontSize = import "../lib/fontSize.libsonnet";
local center = import "../lib/center.libsonnet";
local swipeData = import "../lib/swipeData-en.libsonnet";
local others = import "../lib/others.libsonnet";

local swipe_up = swipeData.swipe_up;
local swipe_down = swipeData.swipe_down;

local swipeStyles = import "../lib/swipeStyle.libsonnet";
local holdSymbolStyles = import "../lib/holdSymbolStyles.libsonnet";
local theme = std.extVar("theme");

swipeStyles.getStyle("cn", theme)+
holdSymbolStyles.getStyle(theme)+
toolbar.getToolBar(theme) +
{
  [if std.objectHas(others, "英文键盘方案") then "rimeSchema"]: others["英文键盘方案"],
  "preeditHeight": others["横屏"]["preedit高度"],
  "toolbarHeight": others["横屏"]["toolbar高度"],
  "keyboardHeight": others["横屏"]["keyboard高度"],
  "preedit": {
    "insets": {
      "left": 8,
      "top": 2
    },
    "backgroundStyle": "preeditBackgroundStyle",
    "foregroundStyle": "preeditForegroundStyle"
  },
  "preeditBackgroundStyle": {
    "normalImage": {
      "file": "bj",
      "image": "IMG3"
    }
  },
  "preeditForegroundStyle": {
    "textColor": color[theme]["候选字体未选中字体颜色"],
    "fontSize": fontSize["preedit区字体大小"],
    "fontWeight": 0
  },
  

  "qButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "qButtonForegroundStyle",
      "qButtonUpForegroundStyle",
      "qButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "qButtonUppercasedStateForegroundStyle",
      "qButtonUpForegroundStyle",
      "qButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "qButtonUppercasedStateForegroundStyle",
      "qButtonUpForegroundStyle",
      "qButtonDownForegroundStyle"
    ],
    "hintStyle": "qButtonHintStyle",
    [if std.objectHas($, "qButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "qButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "q"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "Q"
    },
    [if std.objectHas(swipe_up, "q") then "swipeUpAction"]: swipe_up.q.action,
    [if std.objectHas(swipe_down, "q") then "swipeDownAction"]: swipe_down.q.action,
    
  },
  "qButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG27"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG27"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "qButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG1"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG1"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "qButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "qButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "qButtonSwipeUpHintForegroundStyle"
  },
  
  "wButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "wButtonForegroundStyle",
      "wButtonUpForegroundStyle",
      "wButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "wButtonUppercasedStateForegroundStyle",
      "wButtonUpForegroundStyle",
      "wButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "wButtonUppercasedStateForegroundStyle",
      "wButtonUpForegroundStyle",
      "wButtonDownForegroundStyle"
    ],
    "hintStyle": "wButtonHintStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "w"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "W"
    },
    [if std.objectHas(swipe_up, "w") then "swipeUpAction"]: swipe_up.w.action,
    [if std.objectHas(swipe_down, "w") then "swipeDownAction"]: swipe_down.w.action,
    [if std.objectHas($, "wButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "wButtonHoldSymbolsStyle",
  },
  "wButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG28"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG28"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "wButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG2"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG2"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  "wButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "wButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "wButtonSwipeUpHintForegroundStyle"
  },
  
  "eButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "eButtonForegroundStyle",
      "eButtonUpForegroundStyle",
      "eButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "eButtonUppercasedStateForegroundStyle",
      "eButtonUpForegroundStyle",
      "eButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "eButtonUppercasedStateForegroundStyle",
      "eButtonUpForegroundStyle",
      "eButtonDownForegroundStyle"
    ],
    "hintStyle": "eButtonHintStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "e"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "E"
    },
    [if std.objectHas(swipe_up, "e") then "swipeUpAction"]: swipe_up.e.action,
    [if std.objectHas(swipe_down, "e") then "swipeDownAction"]: swipe_down.e.action,
    [if std.objectHas($, "eButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "eButtonHoldSymbolsStyle",
  },
  "eButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG29"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG29"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "eButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG3"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG3"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "eButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "eButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "eButtonSwipeUpHintForegroundStyle"
  },
  
  "rButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "rButtonForegroundStyle",
      "rButtonUpForegroundStyle",
      "rButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "rButtonUppercasedStateForegroundStyle",
      "rButtonUpForegroundStyle",
      "rButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "rButtonUppercasedStateForegroundStyle",
      "rButtonUpForegroundStyle",
      "rButtonDownForegroundStyle"
    ],
    "hintStyle": "rButtonHintStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "r"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "R"
    },
    [if std.objectHas(swipe_up, "r") then "swipeUpAction"]: swipe_up.r.action,
    [if std.objectHas(swipe_down, "r") then "swipeDownAction"]: swipe_down.r.action,
    [if std.objectHas($, "rButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "rButtonHoldSymbolsStyle",
  },
  "rButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG30"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG30"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "rButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG4"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG4"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "rButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "rButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "rButtonSwipeUpHintForegroundStyle"
  },

  "tButton": {
    "size": {
      "width": "200/784"
    },
    "bounds": {
      "width": "146/200",
      "alignment": "left"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "tButtonForegroundStyle",
      "tButtonUpForegroundStyle",
      "tButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "tButtonUppercasedStateForegroundStyle",
      "tButtonUpForegroundStyle",
      "tButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "tButtonUppercasedStateForegroundStyle",
      "tButtonUpForegroundStyle",
      "tButtonDownForegroundStyle"
    ],
    "hintStyle": "tButtonHintStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "t"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "T"
    },
    [if std.objectHas(swipe_up, "t") then "swipeUpAction"]: swipe_up.t.action,
    [if std.objectHas(swipe_down, "t") then "swipeDownAction"]: swipe_down.t.action,
    [if std.objectHas($, "tButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "tButtonHoldSymbolsStyle",
  },
  "tButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG31"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG31"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "tButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG5"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG5"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "tButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "tButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "tButtonSwipeUpHintForegroundStyle"
  },
  
  "yButton": {
    "size": {
      "width": "200/784"
    },
    "bounds": {
      "width": "146/200",
      "alignment": "right"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "yButtonForegroundStyle",
      "yButtonUpForegroundStyle",
      "yButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "yButtonUppercasedStateForegroundStyle",
      "yButtonUpForegroundStyle",
      "yButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "yButtonUppercasedStateForegroundStyle",
      "yButtonUpForegroundStyle",
      "yButtonDownForegroundStyle"
    ],
    "hintStyle": "yButtonHintStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "y"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "Y"
    },
    [if std.objectHas(swipe_up, "y") then "swipeUpAction"]: swipe_up.y.action,
    [if std.objectHas(swipe_down, "y") then "swipeDownAction"]: swipe_down.y.action,
    [if std.objectHas($, "yButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "yButtonHoldSymbolsStyle",
  },
  "yButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG32"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG32"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "yButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG6"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG6"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "yButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "yButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "yButtonSwipeUpHintForegroundStyle"
  },
  
  "uButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "uButtonForegroundStyle",
      "uButtonUpForegroundStyle",
      "uButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "uButtonUppercasedStateForegroundStyle",
      "uButtonUpForegroundStyle",
      "uButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "uButtonUppercasedStateForegroundStyle",
      "uButtonUpForegroundStyle",
      "uButtonDownForegroundStyle"
    ],
    "hintStyle": "uButtonHintStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "u"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "U"
    },
    [if std.objectHas(swipe_up, "u") then "swipeUpAction"]: swipe_up.u.action,
    [if std.objectHas(swipe_down, "u") then "swipeDownAction"]: swipe_down.u.action,
    [if std.objectHas($, "uButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "uButtonHoldSymbolsStyle",
  },
  "uButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG33"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG33"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "uButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG7"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG7"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "uButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "uButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "uButtonSwipeUpHintForegroundStyle"
  },
  
  "iButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "iButtonForegroundStyle",
      "iButtonUpForegroundStyle",
      "iButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "iButtonUppercasedStateForegroundStyle",
      "iButtonUpForegroundStyle",
      "iButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "iButtonUppercasedStateForegroundStyle",
      "iButtonUpForegroundStyle",
      "iButtonDownForegroundStyle"
    ],
    "hintStyle": "iButtonHintStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "i"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "I"
    },
    [if std.objectHas(swipe_up, "i") then "swipeUpAction"]: swipe_up.i.action,
    [if std.objectHas(swipe_down, "i") then "swipeDownAction"]: swipe_down.i.action,
    [if std.objectHas($, "iButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "iButtonHoldSymbolsStyle",
  },
  "iButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG34"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG34"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "iButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG8"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG8"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "iButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "iButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "iButtonSwipeUpHintForegroundStyle"
  },
  

  "oButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "oButtonForegroundStyle",
      "oButtonUpForegroundStyle",
      "oButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "oButtonUppercasedStateForegroundStyle",
      "oButtonUpForegroundStyle",
      "oButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "oButtonUppercasedStateForegroundStyle",
      "oButtonUpForegroundStyle",
      "oButtonDownForegroundStyle"
    ],
    "hintStyle": "oButtonHintStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "o"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "O"
    },
    [if std.objectHas(swipe_up, "o") then "swipeUpAction"]: swipe_up.o.action,
    [if std.objectHas(swipe_down, "o") then "swipeDownAction"]: swipe_down.o.action,
    [if std.objectHas($, "oButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "oButtonHoldSymbolsStyle",
  },
  "oButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG35"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG35"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "oButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG9"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG9"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "oButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "oButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "oButtonSwipeUpHintForegroundStyle"
  },
  
  "pButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "pButtonForegroundStyle",
      "pButtonUpForegroundStyle",
      "pButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "pButtonUppercasedStateForegroundStyle",
      "pButtonUpForegroundStyle",
      "pButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "pButtonUppercasedStateForegroundStyle",
      "pButtonUpForegroundStyle",
      "pButtonDownForegroundStyle"
    ],
    "hintStyle": "pButtonHintStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "p"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "P"
    },
    [if std.objectHas(swipe_up, "p") then "swipeUpAction"]: swipe_up.p.action,
    [if std.objectHas(swipe_down, "p") then "swipeDownAction"]: swipe_down.p.action,
    [if std.objectHas($, "pButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "pButtonHoldSymbolsStyle",
  },
  "pButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG36"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG36"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "pButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG10"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG10"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "pButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "pButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "pButtonSwipeUpHintForegroundStyle"
  },
  
  "aButton": {
    "size": {
      "width": "200/784"
    },
    "bounds": {
      "width": "146/200",
      "alignment": "right"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "aButtonForegroundStyle",
      "aButtonUpForegroundStyle",
      "aButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "aButtonUppercasedStateForegroundStyle",
      "aButtonUpForegroundStyle",
      "aButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "aButtonUppercasedStateForegroundStyle",
      "aButtonUpForegroundStyle",
      "aButtonDownForegroundStyle"
    ],
    "hintStyle": "aButtonHintStyle",
    [if std.objectHas($, "aButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "aButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "a"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "A"
    },
    [if std.objectHas(swipe_up, "a") then "swipeUpAction"]: swipe_up.a.action,
    [if std.objectHas(swipe_down, "a") then "swipeDownAction"]: swipe_down.a.action,
    },
  "aButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG37"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG37"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "aButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG11"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG11"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "aButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "aButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "aButtonSwipeUpHintForegroundStyle"
  },
  
  "sButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "sButtonForegroundStyle",
      "sButtonUpForegroundStyle",
      "sButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "sButtonUppercasedStateForegroundStyle",
      "sButtonUpForegroundStyle",
      "sButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "sButtonUppercasedStateForegroundStyle",
      "sButtonUpForegroundStyle",
      "sButtonDownForegroundStyle"
    ],
    "hintStyle": "sButtonHintStyle",
    [if std.objectHas($, "ButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "ButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "s"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "S"
    },
    [if std.objectHas(swipe_up, "s") then "swipeUpAction"]: swipe_up.s.action,
    [if std.objectHas(swipe_down, "s") then "swipeDownAction"]: swipe_down.s.action,
    },
  "sButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG38"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG38"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "sButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG12"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG12"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "sButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "sButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "sButtonSwipeUpHintForegroundStyle"
  },
  
  "dButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "dButtonForegroundStyle",
      "dButtonUpForegroundStyle",
      "dButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "dButtonUppercasedStateForegroundStyle",
      "dButtonUpForegroundStyle",
      "dButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "dButtonUppercasedStateForegroundStyle",
      "dButtonUpForegroundStyle",
      "dButtonDownForegroundStyle"
    ],
    "hintStyle": "dButtonHintStyle",
    [if std.objectHas($, "dButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "dButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "d"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "D"
    },
    [if std.objectHas(swipe_up, "d") then "swipeUpAction"]: swipe_up.d.action,
    [if std.objectHas(swipe_down, "d") then "swipeDownAction"]: swipe_down.d.action,
  },
  "dButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG39"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG39"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"],
  },
  "dButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG13"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG13"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "dButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "dButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "dButtonSwipeUpHintForegroundStyle"
  },
  
  "fButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "fButtonForegroundStyle",
      "fButtonUpForegroundStyle",
      "fButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "fButtonUppercasedStateForegroundStyle",
      "fButtonUpForegroundStyle",
      "fButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "fButtonUppercasedStateForegroundStyle",
      "fButtonUpForegroundStyle",
      "fButtonDownForegroundStyle"
    ],
    "hintStyle": "fButtonHintStyle",
    [if std.objectHas($, "fButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "fButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "f"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "F"
    },
    [if std.objectHas(swipe_up, "f") then "swipeUpAction"]: swipe_up.f.action,
    [if std.objectHas(swipe_down, "f") then "swipeDownAction"]: swipe_down.f.action,
    },
  "fButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG40"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG40"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "fButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG14"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG14"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "fButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "fButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "fButtonSwipeUpHintForegroundStyle"
  },
  
  "gButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "gButtonForegroundStyle",
      "gButtonUpForegroundStyle",
      "gButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "gButtonUppercasedStateForegroundStyle",
      "gButtonUpForegroundStyle",
      "gButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "gButtonUppercasedStateForegroundStyle",
      "gButtonUpForegroundStyle",
      "gButtonDownForegroundStyle"
    ],
    "hintStyle": "gButtonHintStyle",
    [if std.objectHas($, "gButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "gButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "g"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "G"
    },
    [if std.objectHas(swipe_up, "g") then "swipeUpAction"]: swipe_up.g.action,
    [if std.objectHas(swipe_down, "g") then "swipeDownAction"]: swipe_down.g.action,
    },
  "gButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG41"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG41"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "gButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG15"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG15"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "gButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "gButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "gButtonSwipeUpHintForegroundStyle"
  },
  
  "hButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "hButtonForegroundStyle",
      "hButtonUpForegroundStyle",
      "hButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "hButtonUppercasedStateForegroundStyle",
      "hButtonUpForegroundStyle",
      "hButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "hButtonUppercasedStateForegroundStyle",
      "hButtonUpForegroundStyle",
      "hButtonDownForegroundStyle"
    ],
    "hintStyle": "hButtonHintStyle",
    [if std.objectHas($, "hButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "hButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "h"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "H"
    },
    [if std.objectHas(swipe_up, "h") then "swipeUpAction"]: swipe_up.h.action,
    [if std.objectHas(swipe_down, "h") then "swipeDownAction"]: swipe_down.h.action,
  },
  "hButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG42"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG42"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "hButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG16"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG16"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "hButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "hButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "hButtonSwipeUpHintForegroundStyle"
  },
  "jButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "jButtonForegroundStyle",
      "jButtonUpForegroundStyle",
      "jButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "jButtonUppercasedStateForegroundStyle",
      "jButtonUpForegroundStyle",
      "jButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "jButtonUppercasedStateForegroundStyle",
      "jButtonUpForegroundStyle",
      "jButtonDownForegroundStyle"
    ],
    "hintStyle": "jButtonHintStyle",
    [if std.objectHas($, "jButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "jButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "j"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "J"
    },
    [if std.objectHas(swipe_up, "j") then "swipeUpAction"]: swipe_up.j.action,
    [if std.objectHas(swipe_down, "j") then "swipeDownAction"]: swipe_down.j.action,
  },
  "jButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG43"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG43"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "jButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG17"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG17"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "jButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "jButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "jButtonSwipeUpHintForegroundStyle"
  },
  
  "kButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "kButtonForegroundStyle",
      "kButtonUpForegroundStyle",
      "kButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "kButtonUppercasedStateForegroundStyle",
      "kButtonUpForegroundStyle",
      "kButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "kButtonUppercasedStateForegroundStyle",
      "kButtonUpForegroundStyle",
      "kButtonDownForegroundStyle"
    ],
    "hintStyle": "kButtonHintStyle",
    [if std.objectHas($, "kButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "kButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "k"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "K"
    },
    [if std.objectHas(swipe_up, "k") then "swipeUpAction"]: swipe_up.k.action,
    [if std.objectHas(swipe_down, "k") then "swipeDownAction"]: swipe_down.k.action,
    },
  "kButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG18"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG18"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "kButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG18"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG18"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "kButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "kButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "kButtonSwipeUpHintForegroundStyle"
  },
  
  "lButton": {
    "size": {
      "width": "200/784"
    },
    "bounds": {
      "width": "146/200",
      "alignment": "left"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "lButtonForegroundStyle",
      "lButtonUpForegroundStyle",
      "lButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "lButtonUppercasedStateForegroundStyle",
      "lButtonUpForegroundStyle",
      "lButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "lButtonUppercasedStateForegroundStyle",
      "lButtonUpForegroundStyle",
      "lButtonDownForegroundStyle"
    ],
    "hintStyle": "lButtonHintStyle",
    [if std.objectHas($, "lButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "lButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "l"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "L"
    },
    [if std.objectHas(swipe_up, "l") then "swipeUpAction"]: swipe_up.l.action,
    [if std.objectHas(swipe_down, "l") then "swipeDownAction"]: swipe_down.l.action,
    },
  "lButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG45"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG45"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "lButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG19"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG19"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  
  "lButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "lButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "lButtonSwipeUpHintForegroundStyle"
  },
  
  "shiftButton": {
    "size": {
      "width": "200/784"
    },
    "backgroundStyle": "shiftButtonBackgroundStyle",
    "foregroundStyle": "shiftButtonForegroundStyle",
    "uppercasedStateForegroundStyle": "shiftButtonUppercasedForegroundStyle",
    "capsLockedStateForegroundStyle": "shiftButtonCapsLockedForegroundStyle",
    "action": "shift",
    [if std.objectHas($, "shiftButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "shiftButtonHoldSymbolsStyle",
  },
  "shiftButtonBackgroundStyle": {
    "animation": "alphabeticBackgroundAnimation",
    "normalImage": {
      "file": "anjian26",
      "image": "IMG27"
    },
    "highlightImage": {
      "file": "anjian26ax",
      "image": "IMG27"
    }
  },
  "shiftButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "more",
      "image": "IMG1"
    },
    "highlightImage": {
      "file": "more2",
      "image": "IMG1"
    },
    "targetScale": 0.7
  },
  "shiftButtonUppercasedForegroundStyle": {
    "normalImage": {
      "file": "more",
      "image": "IMG7"
    },
    "highlightImage": {
      "file": "more2",
      "image": "IMG7"
    },
    "targetScale": 0.7
  },
  "shiftButtonCapsLockedForegroundStyle": {
    "normalImage": {
      "file": "more",
      "image": "IMG8"
    },
    "highlightImage": {
      "file": "more2",
      "image": "IMG8"
    },
    "targetScale": 0.7
  },
  "zButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "zButtonForegroundStyle",
      "zButtonUpForegroundStyle",
      "zButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "zButtonUppercasedStateForegroundStyle",
      "zButtonUpForegroundStyle",
      "zButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "zButtonUppercasedStateForegroundStyle",
      "zButtonUpForegroundStyle",
      "zButtonDownForegroundStyle"
    ],
    "hintStyle": "zButtonHintStyle",
    [if std.objectHas($, "zButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "zButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "z"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "Z"
    },
    [if std.objectHas(swipe_up, "z") then "swipeUpAction"]: swipe_up.z.action,
    [if std.objectHas(swipe_down, "z") then "swipeDownAction"]: swipe_down.z.action,
  },
  "zButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG46"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG46"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "zButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG20"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG20"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  "zButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "zButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "zButtonSwipeUpHintForegroundStyle"
  },
  
  "xButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "xButtonForegroundStyle",
      "xButtonUpForegroundStyle",
      "xButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "xButtonUppercasedStateForegroundStyle",
      "xButtonUpForegroundStyle",
      "xButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "xButtonUppercasedStateForegroundStyle",
      "xButtonUpForegroundStyle",
      "xButtonDownForegroundStyle"
    ],
    "hintStyle": "xButtonHintStyle",
    [if std.objectHas($, "xButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "xButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "x"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "X"
    },
    [if std.objectHas(swipe_up, "x") then "swipeUpAction"]: swipe_up.x.action,
    [if std.objectHas(swipe_down, "x") then "swipeDownAction"]: swipe_down.x.action,
    },
  "xButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG47"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG47"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "xButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG21"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG21"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  "xButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "xButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "xButtonSwipeUpHintForegroundStyle"
  },
  
  "cButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "cButtonForegroundStyle",
      "cButtonUpForegroundStyle",
      "cButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "cButtonUppercasedStateForegroundStyle",
      "cButtonUpForegroundStyle",
      "cButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "cButtonUppercasedStateForegroundStyle",
      "cButtonUpForegroundStyle",
      "cButtonDownForegroundStyle"
    ],
    "hintStyle": "cButtonHintStyle",
    [if std.objectHas($, "cButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "cButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "c"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "C"
    },
    [if std.objectHas(swipe_up, "c") then "swipeUpAction"]: swipe_up.c.action,
    [if std.objectHas(swipe_down, "c") then "swipeDownAction"]: swipe_down.c.action,
    },
  "cButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG48"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG48"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "cButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG22"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG22"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  "cButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "cButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "cButtonSwipeUpHintForegroundStyle"
  },
  
  "vButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "vButtonForegroundStyle",
      "vButtonUpForegroundStyle",
      "vButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "vButtonUppercasedStateForegroundStyle",
      "vButtonUpForegroundStyle",
      "vButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "vButtonUppercasedStateForegroundStyle",
      "vButtonUpForegroundStyle",
      "vButtonDownForegroundStyle"
    ],
    "hintStyle": "vButtonHintStyle",
    [if std.objectHas($, "vButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "vButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "v"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "V"
    },
    [if std.objectHas(swipe_up, "v") then "swipeUpAction"]: swipe_up.v.action,
    [if std.objectHas(swipe_down, "v") then "swipeDownAction"]: swipe_down.v.action
    },
  "vButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG49"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG49"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "vButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG23"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG23"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  "vButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "vButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "vButtonSwipeUpHintForegroundStyle"
  },
  
  "bButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "bButtonForegroundStyle",
      "bButtonUpForegroundStyle",
      "bButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "bButtonUppercasedStateForegroundStyle",
      "bButtonUpForegroundStyle",
      "bButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "bButtonUppercasedStateForegroundStyle",
      "bButtonUpForegroundStyle",
      "bButtonDownForegroundStyle"
    ],
    "hintStyle": "bButtonHintStyle",
    [if std.objectHas($, "bButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "bButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "b"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "B"
    },
    [if std.objectHas(swipe_up, "b") then "swipeUpAction"]: swipe_up.v.action,
    [if std.objectHas(swipe_down, "b") then "swipeDownAction"]: swipe_down.v.action,
    },
  "bButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG50"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG50"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "bButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG24"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG24"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },

  "bButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "bButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "bButtonSwipeUpHintForegroundStyle"
  },
  
  "nButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "nButtonForegroundStyle",
      "nButtonUpForegroundStyle",
      "nButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "nButtonUppercasedStateForegroundStyle",
      "nButtonUpForegroundStyle",
      "nButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "nButtonUppercasedStateForegroundStyle",
      "nButtonUpForegroundStyle",
      "nButtonDownForegroundStyle"
    ],
    "hintStyle": "nButtonHintStyle",
    [if std.objectHas($, "nButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "nButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "n"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "N"
    },
    [if std.objectHas(swipe_up, "n") then "swipeUpAction"]: swipe_up.n.action,
    [if std.objectHas(swipe_down, "n") then "swipeDownAction"]: swipe_down.n.action,
    },
  "nButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG51"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG51"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "nButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG25"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG25"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  "nButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "nButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "nButtonSwipeUpHintForegroundStyle"
  },
  
  "mButton": {
    "size": {
      "width": "146/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "mButtonForegroundStyle",
      "mButtonUpForegroundStyle",
      "mButtonDownForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "mButtonUppercasedStateForegroundStyle",
      "mButtonUpForegroundStyle",
      "mButtonDownForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "mButtonUppercasedStateForegroundStyle",
      "mButtonUpForegroundStyle",
      "mButtonDownForegroundStyle"
    ],
    "hintStyle": "mButtonHintStyle",
    [if std.objectHas($, "mButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "mButtonHoldSymbolsStyle",
    "action": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "m"
    },
    "uppercasedStateAction": {
      [if std.objectHas(others, "英文键盘方案") then "character" else "symbol"]: "M"
    },
    [if std.objectHas(swipe_up, "m") then "swipeUpAction"]: swipe_up.m.action,
    [if std.objectHas(swipe_down, "m") then "swipeDownAction"]: swipe_down.m.action,
  },
  "mButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "letter",
      "image": "IMG52"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG52"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  "mButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "letter",
      "image": "IMG26"
    },
    "highlightImage": {
      "file": "letter2",
      "image": "IMG26"
    },
    "targetScale": center["26键中文前景缩放"],
    "center": center["26键中文前景偏移"]
  },
  
  "mButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "foregroundStyle": "mButtonHintForegroundStyle",
    "swipeUpForegroundStyle": "mButtonSwipeUpHintForegroundStyle"
  },
  
  "backspaceButton": {
    "size": {
      "width": "200/784"
    },
    "backgroundStyle": "backspaceButtonBackgroundStyle",
    "foregroundStyle": "backspaceButtonForegroundStyle",
    "action": "backspace",
    [if std.objectHas(swipe_up, "backspace") then "swipeUpAction"]: swipe_up.backspace.action,
    [if std.objectHas(swipe_down, "backspace") then "swipeDownAction"]: swipe_down.backspace.action,
    "repeatAction": "backspace",
    "swipeLeftAction": {
      "shortcutCommand": "#重输"
    }
  },
  "backspaceButtonBackgroundStyle": {
    "animation": "alphabeticBackgroundAnimation",
    "normalImage": {
      "file": "anjian26",
      "image": "IMG28"
    },
    "highlightImage": {
      "file": "anjian26ax",
      "image": "IMG28"
    }
  },
  "backspaceButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "more",
      "image": "IMG2"
    },
    "highlightImage": {
      "file": "more2",
      "image": "IMG2"
    },
    "targetScale": 0.7
  },
  "symbolButton": {
    "size": {
      "width": "173/784"
    },
    "backgroundStyle": "symbolButtonBackgroundStyle",
    "foregroundStyle": [
      "symbolButtonForegroundStyle"
    ],
    "action": {
      "keyboardType": "symbolic"
  },
    [if std.objectHas($, "symbolButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "symbolButtonHoldSymbolsStyle",
    [if std.objectHas(swipe_up, "symbol") then "swipeUpAction"]: swipe_up.symbol.action,
    [if std.objectHas(swipe_down, "symbol") then "swipeDownAction"]: swipe_down.symbol.action,
  },
  "symbolButtonBackgroundStyle": {
    "animation": "alphabeticBackgroundAnimation",
    "normalImage": {
      "file": "anjian26",
      "image": "IMG29"
    },
    "highlightImage": {
      "file": "anjian26ax",
      "image": "IMG29"
    }
  },
  "symbolButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "more",
      "image": "IMG3"
    },
    "highlightImage": {
      "file": "more2",
      "image": "IMG3"
    },
    "targetScale": 0.6
  },
  "123Button": {
    "size": {
      "width": "173/784"
    },
    "backgroundStyle": "123ButtonBackgroundStyle",
    "foregroundStyle": "123ButtonForegroundStyle",
    "action": {
      "keyboardType": "numeric"
    },
    [if std.objectHas(swipe_up, "123") then "swipeUpAction"]: swipe_up["123"]["action"],
    [if std.objectHas(swipe_down, "123") then "swipeDownAction"]: swipe_down["123"]["action"],
    [if std.objectHas($, "123ButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "123ButtonHoldSymbolsStyle",
  },
  "123ButtonBackgroundStyle": {
    "animation": "alphabeticBackgroundAnimation",
    "normalImage": {
      "file": "anjian26",
      "image": "IMG30"
    },
    "highlightImage": {
      "file": "anjian26ax",
      "image": "IMG30"
    }
  },
  "123ButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "more",
      "image": "IMG9"
    },
    "highlightImage": {
      "file": "more2",
      "image": "IMG9"
    },
    "targetScale": 0.8
  },
  "spaceButton": {
    "size": {
      "width": "438/784"
    },
    "backgroundStyle": "spaceButtonBackgroundStyle",
    "foregroundStyle": "spaceButtonForegroundStyle",
    "action": "space",
    "swipeUpAction": {
      "keyboardType": "pinyin"
    }
  },
  "spaceButtonBackgroundStyle": {
    "animation": "alphabeticBackgroundAnimation",
    "normalImage": {
      "file": "anjian26",
      "image": "IMG32"
    },
    "highlightImage": {
      "file": "anjian26ax",
      "image": "IMG32"
    }
  },
  "spaceButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "more",
      "image": "IMG20"
    },
    "highlightImage": {
      "file": "more2",
      "image": "IMG20"
    },
    "targetScale": 0.6
  },
  "spaceRightButton": {
    "size": {
      "width": "173/784"
    },
    "backgroundStyle": "alphabeticBackgroundStyle",
    "foregroundStyle": [
      "spaceRightButtonForegroundStyle"
    ],
    "uppercasedStateForegroundStyle": [
      "spaceRightButtonUppercasedStateForegroundStyle"
    ],
    "capsLockedStateForegroundStyle": [
      "spaceRightButtonUppercasedStateForegroundStyle"
    ],
    "hintStyle": "spaceRightButtonHintStyle",
    [if std.objectHas($, "spaceRightButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "spaceRightButtonHoldSymbolsStyle",
    "action": {
      "symbol": "."
    },
    "swipeUpAction": {
      "symbol": ","
    }
  },
  "spaceRightButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "more",
      "image": "IMG17"
    },
    "highlightImage": {
      "file": "more2",
      "image": "IMG17"
    },
    "targetScale": 0.6,
    "center": center["26键中文前景偏移"]
  },
  "spaceRightButtonUppercasedStateForegroundStyle": {
    "normalImage": {
      "file": "more",
      "image": "IMG15"
    },
    "highlightImage": {
      "file": "more2",
      "image": "IMG15"
    },
    "targetScale": 0.6,
    "center": center["26键中文前景偏移"]
  },
  "spaceRightButtonHintStyle": {
    "backgroundStyle": "alphabeticHintBackgroundStyle",
    "targetScale": 0.6,
    "offset": {
      "x": 0,
      "y": 4
    }
  },
  "enterButton": {
    "size": {
      "width": "173/784"
    },
    "backgroundStyle": "enterButtonBackgroundStyle",
    "foregroundStyle": "enterButtonForegroundStyle",
    "action": "enter",
    [if std.objectHas(swipe_up, "enter") then "swipeUpAction"]: swipe_up.enter.action,
    [if std.objectHas(swipe_down, "enter") then "swipeDownAction"]: swipe_down.enter.action,
    [if std.objectHas($, "enterButtonHoldSymbolsStyle") then "holdSymbolsStyle"]: "enterButtonHoldSymbolsStyle",
  },
  "enterButtonBackgroundStyle": {
    "animation": "alphabeticBackgroundAnimation",
    "normalImage": {
      "file": "anjian26",
      "image": "IMG35"
    },
    "highlightImage": {
      "file": "anjian26ax",
      "image": "IMG35"
    }
  },
  "enterButtonForegroundStyle": {
    "animation": "ButtonForegroundAnimation",
    "normalImage": {
      "file": "more",
      "image": "IMG25"
    },
    "highlightImage": {
      "file": "more2",
      "image": "IMG25"
    },
    "targetScale": 0.6
  },
  "alphabeticBackgroundStyle": {
    "animation": "alphabeticBackgroundAnimation",
    "normalImage": {
      "file": "anjian26",
      "image": "IMG1"
    },
    "highlightImage": {
      "file": "anjian26ax",
      "image": "IMG1"
    }
  },
  "systemButtonBackgroundStyle": {
    "animation": "alphabeticBackgroundAnimation",
    "normalImage": {
      "file": "anjian123",
      "image": "IMG16"
    },
    "highlightImage": {
      "file": "anjian123ax",
      "image": "IMG16"
    }
  },
  "alphabeticBackgroundAnimation": [
    {
      "type": "bounds",
      "duration": 60,
      "repeatCount": 1,
      "fromScale": 1,
      "toScale": 0.87
    },
    {
      "type": "bounds",
      "duration": 80,
      "repeatCount": 1,
      "fromScale": 0.87,
      "toScale": 1
    }
  ],
  "ButtonForegroundAnimation": [
    {
      "type": "bounds",
      "duration": 60,
      "repeatCount": 1,
      "fromScale": 1,
      "toScale": 0.82
    },
    {
      "type": "bounds",
      "duration": 80,
      "repeatCount": 1,
      "fromScale": 0.82,
      "toScale": 1
    }
  ],
  "alphabeticHintBackgroundStyle": {
    "normalImage": {
      "file": "hint",
      "image": "IMG3"
    },
    "targetScale": {
      "x": 1.2,
      "y": 1.2
    }
  },
  "alphabeticHintSymbolsBackgroundStyle": {
    "normalImage": {
      "file": "hint",
      "image": "IMG1"
    },
    "targetScale": {
      "y": 1.2
    }
  },
  "alphabeticHintSymbolsSelectedStyle": {
    "normalImage": {
      "file": "hint",
      "image": "IMG2"
    },
    "targetScale": {
      "x": 0.8,
      "y": 0.75
    },
    "offset": {
      "x": 0,
      "y": 0
    }
  }
}
