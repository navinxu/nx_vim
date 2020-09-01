"" YCM configurations
    " 触发代码标识符提示的字符数目（与语义提示无关）
    let g:ycm_min__num_of_chars_for_completion=0
    " 最小候选项字数,0 为不限制
    let g:ycm_min_num_identifier_candidate_chars=0
    " 语义候选项的最大数目
    let g:ycm_max_num_candidates = 50
    " 标识符候选项的最大数目
    let g:ycm_max_num_identifier_candidates=10
    " 标识符以及语言触发器自动触发
    " 当设为 0 时，將会关闭自动触发，
    " 此时需要通过快捷键手动触发标识符自动完成
    " 与语义自动完成无关
    " 如果需要关闭语义自动完成，可通过设置
    " g:ycm_min_num_of_chars_for_completion为一个大值，如99
    let g:ycm_auto_trigger = 1
    " 允许 YCM 的白名单
    " 键是文件类型，值是任意的。
    let g:ycm_filetype_whitelist = { '*': 1 }

    " 不允许应用 YCM 的文件类型黑名单
    let g:ycm_filetype_blacklist = {
          \ 'tagbar' : 1,
          \ 'qf' : 1,
          \ 'notes' : 1,
          \ 'markdown' : 1,
          \ 'unite' : 1,
          \ 'text' : 1,
          \ 'pandoc' : 1,
          \ 'infolog' : 1,
          \ 'mail' : 1,
          \ 'minibufexpl' : 1,
          \ 'json' : 1,
          \ 'objcpp' : 1,
          \ 'perl' : 1,
          \ 'typescript' : 1,
          \ 'ts' : 1,
          \ 'javascript' : 1,
          \ 'js' : 1,
          \ 'python' : 1,
          \ 'php' : 1,
          \ 'c' : 1,
          \ 'cpp' : 1,
          \ 'c++' : 1,
          \ 'h' : 1,
          \ 'html' : 1,
          \ 'css' : 1,
          \ 'bash' : 1,
          \ 'sh' : 1
          \}

    " 禁用语义完成，标识符触发器无关
    let g:ycm_filetype_specific_completion_to_disable = {
          \ 'gitcommit': 1
          \}
    " 打开 YCM 的特征显示功能
    " 一旦启用，它会移除所有语法检查插件，
    " 因为有冲突。
    " 默认为1。如果不想使用 Clang 作为语义检查器，
    " 则禁用此选项。
    let g:ycm_show_diagnostics_ui = 1
    " 设置语法检查的错误符号
    " 会覆盖 g:syntastic_error_symbol 的值
    let g:ycm_error_symbol = '>>'
    " 警告符号
    " 会覆盖 g:syntastic_warning_symbol 的值
    let g:ycm_warning_symbol = '>>'
    " 打开/关闭 YcmErrorLine 和 YcmWarningLine 的高亮
    " 会覆盖 g:syntastic_enable_signs 的值
    " 默认值为 1
    let g:ycm_enable_diagnostic_signs = 1
    " 高亮 YCM 的诊断
    " 会覆盖 g:syntastic_enable_highlighting 的值
    let g:ycm_enable_diagnostic_highlighting = 1
    " 启用该选项的话，会当你的游标在有警告/错误的行上，
    " 会显示相关的信息
    " 会覆盖 g:syntastic_echo_current_error 的值
    " 默认值为1
    let g:ycm_echo_current_diagnostic = 1
    " 该选项决定哪些判断（diagnostics）
    " 会被 YCM 渲染。
    " "regex":接收一个 Python 正则，假若匹配到判断，
    " 那么上一层的文件类型会被匹配到，并且不会被渲染。
    """let g:ycm_filter_diagnostics = {
    """ \"java": {
    """ \     "regex": [ ".*taco.*", ... ],
    """ \     "level": "error",
    """ \     ...
    """ \   }
    """ \}

    " 自动弹出 location 列表以显示得到的判断结果数据
    " 默认为0,会覆盖 g:syntastic_always_populate_loc_list。
    " 启用有可能会与其他数据相冲突。
    let g:ycm_always_populate_location_list = 1
    " 有数据到达之时自动打开 location list
    " 默认为 1
    let g:ycm_open_loclist_on_ycm_diags = 1
    " 开启后 YCM 可以在注释中进行自动补全
    " 默认值为0
    let g:ycm_complete_in_comments = 1
    " YCM 在字符串中也可以自动补全
    " 默认值为1
    let g:ycm_complete_in_strings = 1
    " 是否收集字符串和注释中的标识
    " 默认为0，建议保留默认。
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    " 是否收集 tags 文件的标识
    " 默认为0。只支持 ctags 产生的 tags。
    let g:ycm_collect_identifiers_from_tags_files = 1
    " 开启后收集编程语言的关键字
    " 默认为 0
    let g:ycm_seed_identifiers_with_syntax = 1
    " 从 Vim 获取 Vim 相关的数据。
    " 与.ycm_extra_conf.py 文件有关
    " 以下就是默认值。
    let g:ycm_extra_conf_vim_data = []
    " 指定 YCM 客户端所用的 Python 解释器
    " 如果编译时用的是Python3，那么这里的路径应是py3的路径
    let g:ycm_server_python_interpreter = '/usr/bin/python3'
    " YCM 和 ycmd 服务器的日志是否在关机时（会不会是退出Vim 时呢？）删除
    " 默认值为 0。
    let g:ycm_keep_logfiles = 0

    " 设定日志的级别，分别有debug,info,warning,error,critical。
    " 以上按顺序从最详细到最简单。
    " 默认为：info
    let g:ycm_log_level = 'info'

    " 如果编辑的是 C# 源文件，
    " 那么OmniSharp 服务器会启用。
    " 默认为 1
    let g:ycm_auto_start_csharp_server = 0

    " 是否在关闭 Vim 之后自动停止 Omnisharp 的服务
    " 默认为 1
    let g:ycm_auto_stop_csharp_server = 1

    " 指定 OminiSharp 服务端的监听端口
    " 如果该选项值为 0,则随机使用当前
    " 未分配的端口
    let g:ycm_csharp_server_port = 0

    " Csharp，本人表示不懂。
    let g:ycm_csharp_insert_namespace_expr = ''

    " preview 用来呈现语义完成的详细函数信息
    " 默认为0。如果设为1,且 Vim 的 Completeopt 选项
    " 已有 preview，那么该设置无效。
    let g:ycm_add_preview_to_completeopt = 1

    " YCM的previw窗口比较恼人，还是关闭比较好
    set completeopt-=preview

    " 当 YCM 完成函数的提示之后是否自动关闭 preview 窗口
    " 默认为0。与 g:ycm_add_preview_to_completeopt 有关。
    let g:ycm_autoclose_preview_window_after_completion = 0

    " 当用户离开 Vim 的插入（insert）模式之后是否自动关闭 preview 窗口。
    " 当g:ycm_autoclose_preview_window_after_completion 不为默认值或者没有
    " preview 窗口中触发之时该选项无效。
    " 默认值为 0。
    let g:ycm_autoclose_preview_window_after_insertion = 1

    " 此选项控制展示判断（dianostics）的最大数目，
    " 也就是错误或者警告。只对 C 家族的语言有效。 
    " 默认为 30 
    let g:ycm_max_diagnostics_to_display = 20 
    " 绑定快捷键从而选择第一个自动完成选项。 
    " 该快捷键可以无限重复循环选择候选项。 
    " 默认为['<TAB>', '<Down>']。有人用 <Enter>。 
    """ let g:ycm_key_list_select_completion = ['<TAB>', '<Down>'] 
    let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>'] 
    " 选择上一个候选项。 
    " 默认为：['<S-TAB>', '<Up>']，S 指 Shift 键。 
    let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>'] 
    " 让候选项列表消失。 
    " 默认为：['<C-y>'] 
    let g:ycm_key_list_stop_completion = ['<C-y>'] 
    " 使用绑定的快捷键触发激活语义完成列表， 
    " 就是 ., ->, :: 等等语义触发条件。 
    " 默认值为：<C-Space>。 " 若设为空字符串，那么确保没有创建快捷键。
    let g:ycm_key_invoke_completion = '<C-g>'

    " 绑定快捷键展示全部的判断
    " 默认为：<leader>d。
    " 如果为空字串，则表示没有映射快捷键。
    let g:ycm_key_detailed_diagnostics = '<leader>d'

    " 指定一个全局的 .ycm_extra_conf.py 文件，
    " 从而在没有找到此文件时应用。
    " 默认值：''
    let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
    "let g:ycm_global_ycm_extra_conf = '~/.vim/bundles/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
    if &filetype == 'c'
        let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf-c.py'
    elseif &filetype == 'cpp'
        let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf-cpp.py'
    else
        let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
    endif


    " 將该项的值设为 1,则 YCM 会在应用 .ycm_extra_conf.py
    " 之前确认使用哪一个文件。
    " 默认值为：1
    let g:ycm_confirm_extra_conf = 1

    " 此选项包含一个元素为正则模式的列表，
    " 该列表决定是否应用特定的 .ycm_extra_conf.py，
    " 或者將其列入黑名单。
    " 具体用法请查阅 README 文档。
    " 默认值为：[]
    "" let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']
    let g:ycm_extra_conf_globlist = []

    " 是否使用 Vim 此时的工作目录为当前目录，
    " 抑或以当前窗口或缓冲区为当前目录进行相对路径的处理。
    " 默认值为：0，表示否。
    let g:ycm_filepath_completion_use_working_dir = 0

    "
    " re!\S{2,} 表示从第二个字开始提示
    "
    let g:ycm_semantic_triggers =  {
      \   'c' : ['->', '.', 're!\w{1}'],
      \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
      \             're!\[.*\]\s'],
      \   'ocaml' : ['.', '#'],
      \   'cpp,objcpp' : ['->', '.', '::', 're!\w{1}'],
      \   'perl' : ['->'],
      \   'php' : ['->', '::', 're!\w{1}'],
      \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.', 're!\w{1}'],
      \   'ruby' : ['.', '::'],
      \   'lua' : ['.', ':'],
      \   'erlang' : [':'],
      \   'java' : ['.', 're!\w{1}'],
      \ }

    "
    " 指定用于运行 jedi 以及 ycmd 的 Python 解释器
    " 默认值为：''
    let g:ycm_python_binary_path = '/usr/bin/python3'

    let g:ycm_clangd_binary_path = "/usr/bin/clangd"

""" END of YCM configurations
