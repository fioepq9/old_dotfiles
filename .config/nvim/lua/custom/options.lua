local M = {}

-- [`vim.o`]：行为类似于 `:let &{option-name}`
-- [`vim.go`]: 行为类似于 `:let &g:{option-name}`
-- [`vim.bo`]: 适用于 buffer-local 选项，行为类似于 `:let &l:{option-name}`
-- [`vim.wo`]: 适用于 window-local 选项，行为类似于 `:let &l:{option-name}`

-- `vim.opt`: 行为类似于 `:set`
-- `vim.opt_global`: 行为类似于 `:setglobal`
-- `vim.opt_local`: 行为类似于 `:setlocal`

-- [`vim.g`]: 全局变量
-- [`vim.b`]: 缓冲区变量
-- [`vim.w`]: 窗口变量
-- [`vim.t`]: 选项卡变量
-- [`vim.v`]: 预定义变量
-- [`vim.env`]: 环境变量

local setting = {}

-- 编码设置
function setting.encoding()
    vim.opt.encoding = "utf-8"
end

-- 光标设置
function setting.cursor()
    -- 高亮光标所在行
    vim.opt.cursorline = true
end

-- 换行设置
function setting.linebreak()
    vim.opt.linebreak = true
    -- 以下配置只有在 linebreak 为 true 时生效
    vim.opt.breakat = "({ " -- 选择在什么字符上换行
    vim.opt.breakindent = true -- 回绕行保持视觉上的缩进
    vim.opt.breakindentopt = "shift:4" -- 回绕行配置，shift：缩进
end

-- 不可视字符设置
function setting.list()
    vim.opt.list = true
    -- 使用什么字符替换不可视字符
    vim.opt.listchars = "trail:·"
end

-- 鼠标设置
function setting.mouse()
    -- 在普通模式和终端模式、可视模式、插入模式、命令行模式、编辑帮助文件时，所有前面的模式允许使用鼠标
    vim.opt.mouse = "a"
    -- 键盘焦点追随鼠标点击
    vim.opt.mousefocus = true
end

-- 行号设置
function setting.number()
    vim.opt.number = true
    vim.opt.relativenumber = true -- 相对行号
end

-- 滚动设置
function setting.scroll()
    vim.opt.scrolloff = 9 -- 光标上下两侧最少保留的屏幕行数
end

-- 搜索设置
function setting.search()
    -- 高亮上一个搜索模式的所有匹配
    vim.opt.hlsearch = true
    -- 输入搜索命令的过程中，显示目前输入模式的匹配位置
    vim.opt.incsearch = true
    -- 搜索模式里忽略大小写
    vim.opt.ignorecase = true
    -- 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。
    vim.opt.smartcase = true
end

-- tab设置
function setting.tab()
    vim.opt.tabstop = 4 -- 文件里的 <Tab> 代表的空格数。
    vim.opt.softtabstop = 4 -- 执行编辑操作，如插入 <Tab> 或者使用 <BS> 时，把 <Tab> 算作空格的数目。
    vim.opt.shiftwidth = 4 -- 自动缩进每一步使用的空白数目
    vim.opt.shiftround = true -- 缩进取整到 'shiftwidth' 的倍数。应用于 > 和 < 命令。
    vim.opt.smarttab = true -- 打开，行首的 <Tab> 根据 'shiftwidth' 插入空白。'tabstop' 或'softtabstop' 用在别的地方。
end

function M.setup()
    -- ===== encoding =====
    setting.encoding()

    -- ===== cursor =====
    setting.cursor()

    -- ===== linebreak =====
    setting.linebreak()

    -- ===== list =====
    -- setting.list()

    -- ===== mouse =====
    setting.mouse()

    -- ===== number =====
    setting.number()

    -- ===== scroll =====
    setting.scroll()

    -- ===== search =====
    setting.search()

    -- ===== tab =====
    setting.tab()

    -- ===== shell =====
    vim.opt.shell = "nu"
end

M.setup()
