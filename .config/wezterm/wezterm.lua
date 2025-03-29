local wezterm = require 'wezterm';


return {
  -- color_scheme = "Gruvbox Dark",

  -- 将标签栏放置在窗口底部
  tab_bar_at_bottom = true,

  -- 隐藏仅有一个标签时的标签栏
  hide_tab_bar_if_only_one_tab = true,

  -- 自定义标签栏的外观
  colors = {
    tab_bar = {
      -- 未激活的标签背景色
      background = "#1c1c1c",

      -- 激活的标签
      active_tab = {
        bg_color = "#6272a4",  -- 背景色
        fg_color = "#f8f8f2",  -- 前景色
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },

      -- 未激活的标签
      inactive_tab = {
        bg_color = "#44475a",  -- 背景色
        fg_color = "#f8f8f2",  -- 前景色
      },

      -- 鼠标悬停在标签上的样式
      inactive_tab_hover = {
        bg_color = "#6272a4",  -- 背景色
        fg_color = "#f8f8f2",  -- 前景色
      },

      -- 新建标签的样式
      new_tab = {
        bg_color = "#282a36",  -- 背景色
        fg_color = "#f8f8f2",  -- 前景色
      },

      -- 分隔符颜色
      inactive_tab_edge = "#282a36",
    },
  },

  -- 自定义标签栏的文本内容
  tab_and_split_indices_are_zero_based = true,
  use_fancy_tab_bar = false,
  tab_max_width = 30,
  tab_bar_style = {
    -- 定义新建标签的样式
    new_tab = wezterm.format {
      { Background = { Color = "#282a36" } },
      { Foreground = { Color = "#f8f8f2" } },
      { Text = " + " },
    },
    new_tab_hover = wezterm.format {
      { Background = { Color = "#6272a4" } },
      { Foreground = { Color = "#f8f8f2" } },
      { Text = " + " },
    },
  },

  -- 关闭按钮的实现
  -- tab_close_button = " × ",
  -- inactive_tab_hover = wezterm.format {
  --   { Background = { Color = "#6272a4" } },
  --   { Foreground = { Color = "#f8f8f2" } },
  --   { Text = "  " },
  --   { Foreground = { Color = "#ff5555" } },
  --   { Text = "×" },
  -- },
  
  -- active_tab_hover = wezterm.format {
  --   { Background = { Color = "#6272a4" } },
  --   { Foreground = { Color = "#f8f8f2" } },
  --   { Text = "  " },
  --   { Foreground = { Color = "#ff5555" } },
  --   { Text = "×" },
  -- },

  -- 在标签中显示当前路径和活动窗口的标题
  window_frame = {
    active_titlebar_bg = "#282a36",
    inactive_titlebar_bg = "#44475a",
  },
}
