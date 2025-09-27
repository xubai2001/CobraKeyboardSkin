{
  /*
  说明:
    长按没有区分中英文，这里pinyin会作用到中英键盘上
    pinyin9为中文九键(不是九键的皮肤就不用管)的长按数据
    number为数字九键的长按数据

  */
  pinyin: {
    q: {
      selectedIndex: 0,  // 默认选中的索引，具体见仓皮肤文档
      list: [
        { action: { symbol: 'q' }, label: { text: 'q' } },  // action同仓皮肤定义，label可选text/systemImageName, 具体见仓皮肤文档
        { action: { symbol: '1' }, label: { text: '1' } },
        { action: { symbol: 'Q' }, label: { text: 'Q' } },
      ],
    },
    w: {
      selectedIndex: 1,
      list: [
        { action: { symbol: 'w' }, label: { text: 'w' } },
        { action: { symbol: '2' }, label: { text: '2' } },
        { action: { symbol: 'W' }, label: { text: 'W' } },
      ],
    },
    e: {
      selectedIndex: 1,
      list: [
        { action: { symbol: 'e' }, label: { text: 'e' } },
        { action: { symbol: '3' }, label: { text: '3' } },
        { action: { symbol: 'E' }, label: { text: 'E' } },
      ],
    },
    r: {
      selectedIndex: 1,
      list: [
        { action: { symbol: 'r' }, label: { text: 'r' } },
        { action: { symbol: '4' }, label: { text: '4' } },
        { action: { symbol: 'R' }, label: { text: 'R' } },
      ],
    },
    t: {
      selectedIndex: 1,
      list: [
        { action: { symbol: 't' }, label: { text: 't' } },
        { action: { symbol: '5' }, label: { text: '5' } },
        { action: { symbol: 'T' }, label: { text: 'T' } },
      ],
    },
    y: {
      selectedIndex: 1,
      list: [
        { action: { symbol: 'y' }, label: { text: 'y' } },
        { action: { symbol: '6' }, label: { text: '6' } },
        { action: { symbol: 'Y' }, label: { text: 'Y' } },
      ],
    },
    u: {
      selectedIndex: 1,
      list: [
        { action: { symbol: 'u' }, label: { text: 'u' } },
        { action: { symbol: '7' }, label: { text: '7' } },
        { action: { symbol: 'U' }, label: { text: 'U' } },
      ],
    },
    i: {
      selectedIndex: 1,
      list: [
        { action: { symbol: 'i' }, label: { text: 'i' } },
        { action: { symbol: '8' }, label: { text: '8' } },
        { action: { symbol: 'I' }, label: { text: 'I' } },
      ],
    },
    o: {
      selectedIndex: 1,
      list: [
        { action: { symbol: 'o' }, label: { text: 'o' } },
        { action: { symbol: '9' }, label: { text: '9' } },
        { action: { symbol: 'O' }, label: { text: 'O' } },
      ],
    },
    p: {
      selectedIndex: 2,
      list: [
        { action: { symbol: 'p' }, label: { text: 'p' } },
        { action: { symbol: '0' }, label: { text: '0' } },
        { action: { symbol: 'P' }, label: { text: 'P' } },
      ],
    },
    // "g": {
    //     "selectedIndex": 1,
    //     "list": [
    //         {"action": { "symbol": "p" }, "label": { "text": "p" }},
    //         {"action": { "symbol": "0" }, "label": { "text": "0" }},
    //         {"action": { "symbol": "P" }, "label": { "text": "P" }}
    //     ]
    // },
    j: {
      selectedIndex: 1,
      list: [
        { action: { openURL: '#pasteboardContent' }, label: { systemImageName: 'link' }, fontSize: 14 },
        { action: { runTranslateScript: '谷歌中英互译' }, label: { systemImageName: 'translate' }, fontSize: 14 },
        { action: { runScript: 'DeepSeek' }, label: { systemImageName: 'message.fill' }, fontSize: 14 },
        { action: { runScript: 'Unicode' }, label: { text: 'U编' }, fontSize: 14 },
      ],
    },
    h: {
      selectedIndex: 1,
      list: [
        { action: { symbol: 'https://' }, label: { text: 'https' }, fontSize: 14 },
        { action: { symbol: 'http://' }, label: { text: 'http' }, fontSize: 14 },
      ],
    },
    d: {
      selectedIndex: 1,
      list: [
        { action: { sendKeys: '/date' }, label: { text: '日期' }, fontSize: 14 },
        { action: { sendKeys: '/fsj' }, label: { text: '时间' }, fontSize: 14 },
        { action: { sendKeys: '/fjq' }, label: { text: '节气' }, fontSize: 14 },
      ],
    },
    m: {
      selectedIndex: 1,
      list: [
        { action: { sendKeys: '/sjh' }, label: { text: '手机' }, fontSize: 14 },
        { action: { sendKeys: '/mail' }, label: { text: '邮箱' }, fontSize: 14 },
      ],
    },
    '123': {
      selectedIndex: 1,
      size: { width: 40, height: 53 },
      list: [
        { action: { symbol: '+' }, label: { text: '+' } },
        { action: { symbol: '-' }, label: { text: '-' } },
        { action: { symbol: '=' }, label: { text: '=' } },
        { action: { symbol: '×' }, label: { text: '×' } },
        { action: { symbol: '÷' }, label: { text: '÷' } },
        { action: { symbol: '√' }, label: { text: '√' } },
      ],
    },
    enter: {
      size: { width: 50, height: 53 },
      selectedIndex: 0,
      list: [
        { action: { shortcut: '#换行' }, label: { text: '换行' }, fontSize: 16 },
      ],
    },
    symbol: {
      selectedIndex: 0,
      list: [
        { action: 'nextKeyboard', label: { systemImageName: 'globe' } },
      ],
    },
    // 其他可用字段名:
    // 除上方已经出现的剩下26字母,
    // "backspace"(不推荐),
    // "symbol": 切到符号键盘的按键
    // "shift": 切到shift键盘的按键
    // "spaceRight": 空格右侧的按键,
  },

  pinyin9: {
    number1: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '一' }, label: { text: '一' }, fontSize: 17 },
        { action: { symbol: '壹' }, label: { text: '壹' }, fontSize: 17 },
        { action: { symbol: '➀' }, label: { text: '➀' } },
      ],
    },
  },
  number: {
    number1: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '一' }, label: { text: '一' }, fontSize: 17 },
        { action: { symbol: '壹' }, label: { text: '壹' }, fontSize: 17 },
        { action: { symbol: '➀' }, label: { text: '➀' } },
      ],
    },
    number2: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '二' }, label: { text: '二' }, fontSize: 17 },
        { action: { symbol: '贰' }, label: { text: '贰' }, fontSize: 17 },
        { action: { symbol: '➁' }, label: { text: '➁' } },
      ],
    },
    number3: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '三' }, label: { text: '三' }, fontSize: 17 },
        { action: { symbol: '叁' }, label: { text: '叁' }, fontSize: 17 },
        { action: { symbol: '➂' }, label: { text: '➂' } },
      ],
    },
    number4: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '四' }, label: { text: '四' }, fontSize: 17 },
        { action: { symbol: '肆' }, label: { text: '肆' }, fontSize: 17 },
        { action: { symbol: '➃' }, label: { text: '➃' } },
      ],
    },
    number5: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '五' }, label: { text: '五' }, fontSize: 17 },
        { action: { symbol: '伍' }, label: { text: '伍' }, fontSize: 17 },
        { action: { symbol: '➄' }, label: { text: '➄' } },
      ],
    },
    number6: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '六' }, label: { text: '六' }, fontSize: 17 },
        { action: { symbol: '陆' }, label: { text: '陆' }, fontSize: 17 },
        { action: { symbol: '➅' }, label: { text: '➅' } },
      ],
    },
    number7: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '七' }, label: { text: '七' }, fontSize: 17 },
        { action: { symbol: '柒' }, label: { text: '柒' }, fontSize: 17 },
        { action: { symbol: '➆' }, label: { text: '➆' } },
      ],
    },
    number8: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '八' }, label: { text: '八' }, fontSize: 17 },
        { action: { symbol: '捌' }, label: { text: '捌' }, fontSize: 17 },
        { action: { symbol: '➇' }, label: { text: '➇' } },
      ],
    },
    number9: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '九' }, label: { text: '九' }, fontSize: 17 },
        { action: { symbol: '玖' }, label: { text: '玖' }, fontSize: 17 },
        { action: { symbol: '➈' }, label: { text: '➈' } },
      ],
    },
    number0: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '零' }, label: { text: '零' }, fontSize: 17 },
        { action: { symbol: '〇' }, label: { text: '〇' }, fontSize: 17 },
        { action: { symbol: '➉' }, label: { text: '➉' } },
      ],
    },
    // 其他可用字段名:
    // 除上方已经出现的剩下数字0-9,
    // 其他按键同上
  },
}
