highlight clear
if exists('syntax_on')
  syntax reset
endif
set background=dark
let g:colors_name = 'mono'

let s:base00 = '#111313'
let s:base01 = '#181b1b'
let s:base02 = '#222626'
let s:base03 = '#5a6464'
let s:base04 = '#858f8f'
let s:base05 = '#c2c9c9'
let s:base06 = '#dfe5e5'
let s:base07 = '#f2f6f6'
let s:base08 = '#d47a72'
let s:base09 = '#dfe5e5'
let s:base0A = '#dfe5e5'
let s:base0B = '#8dbab7'
let s:base0C = '#8dbab7'
let s:base0D = '#01a59e'
let s:base0E = '#f2f6f6'
let s:base0F = '#858f8f'
let s:overlay = '#2d3232'
let s:selection = '#0f2f2d'
let s:warn = '#cfb57c'

let g:terminal_ansi_colors = [
      \ s:base01,
      \ s:base08,
      \ s:base0B,
      \ s:warn,
      \ s:base0D,
      \ s:base06,
      \ s:base0B,
      \ s:base05,
      \ s:base03,
      \ s:base08,
      \ s:base0B,
      \ s:warn,
      \ s:base0D,
      \ s:base06,
      \ s:base0B,
      \ s:base07,
      \ ]

function! s:hi(group, fg, bg, ...) abort
  let l:attr = get(a:, 1, 'NONE')
  let l:sp = get(a:, 2, 'NONE')
  execute 'highlight' a:group
        \ 'guifg=' . (empty(a:fg) ? 'NONE' : a:fg)
        \ 'guibg=' . (empty(a:bg) ? 'NONE' : a:bg)
        \ 'gui=' . l:attr
        \ 'guisp=' . l:sp
        \ 'cterm=' . l:attr
endfunction

function! s:link(group, target) abort
  execute 'highlight clear' a:group
  execute 'highlight! link' a:group a:target
endfunction

call s:hi('Normal', s:base05, s:base00)
call s:hi('Cursor', s:base00, s:base06)
call s:hi('lCursor', s:base00, s:base06)
call s:hi('CursorLine', '', s:base01)
call s:hi('CursorColumn', '', s:base01)
call s:hi('ColorColumn', '', s:base01)
call s:hi('LineNr', s:overlay, s:base00)
call s:hi('LineNrAbove', s:overlay, s:base00)
call s:hi('LineNrBelow', s:overlay, s:base00)
call s:hi('CursorLineNr', s:base04, s:base00)
call s:hi('SignColumn', s:base03, s:base00)
call s:hi('FoldColumn', s:base03, s:base00)
call s:hi('Folded', s:base03, s:base01)
call s:hi('Visual', '', s:selection)
call s:hi('VisualNOS', '', s:selection)
call s:hi('MatchParen', s:base07, s:base02, 'bold')
call s:hi('Search', s:base07, s:selection)
call s:hi('IncSearch', s:base00, s:base0D, 'bold')
call s:link('CurSearch', 'IncSearch')
call s:hi('QuickFixLine', '', s:selection)
call s:hi('NonText', s:base03, '')
call s:hi('SpecialKey', s:base03, '')
call s:hi('EndOfBuffer', s:base00, '')
call s:hi('Conceal', s:base0D, '')
call s:hi('Directory', s:base0D, '')
call s:hi('Title', s:base07, '', 'bold')
call s:hi('StatusLine', s:base04, s:base01)
call s:hi('StatusLineNC', s:base03, s:base01)
call s:hi('StatusLineTerm', s:base04, s:base01)
call s:hi('StatusLineTermNC', s:base03, s:base01)
call s:hi('VertSplit', s:overlay, s:base00)
call s:hi('TabLine', s:base04, s:base00)
call s:hi('TabLineFill', s:base04, s:base00)
call s:hi('TabLineSel', s:base06, s:base01)
call s:hi('Pmenu', s:base05, s:base01)
call s:hi('PmenuSel', s:base07, s:base02)
call s:hi('PmenuSbar', '', s:base01)
call s:hi('PmenuThumb', '', s:base03)
call s:hi('WildMenu', s:base07, s:base02)
call s:hi('ModeMsg', s:base04, '')
call s:hi('MoreMsg', s:base0B, '')
call s:hi('Question', s:base0D, '')
call s:hi('ErrorMsg', s:base08, '')
call s:hi('WarningMsg', s:warn, '')
call s:hi('SpellBad', '', '', 'undercurl', s:base08)
call s:hi('SpellCap', '', '', 'undercurl', s:base0D)
call s:hi('SpellLocal', '', '', 'undercurl', s:base0C)
call s:hi('SpellRare', '', '', 'undercurl', s:base0E)

call s:hi('Comment', s:base03, '')
call s:hi('Constant', s:base06, '')
call s:hi('String', s:base0B, '')
call s:hi('Character', s:base0B, '')
call s:hi('Number', s:base06, '')
call s:hi('Boolean', s:base06, '')
call s:hi('Float', s:base06, '')
call s:hi('Identifier', s:base05, '')
call s:hi('Function', s:base0D, '')
call s:hi('Statement', s:base07, '', 'bold')
call s:hi('Conditional', s:base07, '', 'bold')
call s:hi('Repeat', s:base07, '', 'bold')
call s:hi('Label', s:base07, '', 'bold')
call s:hi('Operator', s:base04, '')
call s:hi('Keyword', s:base07, '', 'bold')
call s:hi('Exception', s:base07, '', 'bold')
call s:hi('PreProc', s:base04, '')
call s:hi('Include', s:base07, '', 'bold')
call s:hi('Define', s:base07, '', 'bold')
call s:hi('Macro', s:base0D, '')
call s:hi('PreCondit', s:base04, '')
call s:hi('Type', s:base06, '')
call s:hi('StorageClass', s:base07, '', 'bold')
call s:hi('Structure', s:base07, '', 'bold')
call s:hi('Typedef', s:base07, '', 'bold')
call s:hi('Special', s:base06, '')
call s:hi('SpecialChar', s:base06, '')
call s:hi('Tag', s:base06, '')
call s:hi('Delimiter', s:base04, '')
call s:hi('SpecialComment', s:base03, '')
call s:hi('Debug', s:base03, '')
call s:hi('Underlined', s:base05, '', 'underline')
call s:hi('Ignore', s:base03, '')
call s:hi('Error', s:base08, '')
call s:hi('Todo', s:warn, '', 'bold')

call s:hi('Namespace', s:base06, '')

call s:hi('DiffAdd', s:base0B, s:base01)
call s:hi('DiffChange', s:warn, s:base01)
call s:hi('DiffDelete', s:base08, s:base01)
call s:hi('DiffText', s:base0D, s:base02)
call s:hi('diffAdded', s:base0B, '')
call s:hi('diffChanged', s:warn, '')
call s:hi('diffRemoved', s:base08, '')
call s:link('diffFile', 'Title')
call s:link('diffLine', 'Comment')

call s:hi('LspErrorText', s:base08, s:base00)
call s:hi('LspWarningText', s:warn, s:base00)
call s:hi('LspInformationText', s:base0D, s:base00)
call s:hi('LspHintText', s:base03, s:base00)
call s:hi('LspErrorVirtualText', s:base08, '')
call s:hi('LspWarningVirtualText', s:warn, '')
call s:link('LspInformationVirtualText', 'Comment')
call s:link('LspHintVirtualText', 'Comment')
call s:hi('LspErrorHighlight', '', '', 'underline', s:base08)
call s:hi('LspWarningHighlight', '', '', 'underline', s:warn)
call s:hi('LspInformationHighlight', '', '', 'underline', s:base0D)
call s:hi('LspHintHighlight', '', '', 'underline', s:base03)
call s:hi('lspReference', '', s:base02)
call s:hi('lspInlayHintsType', s:base03, '')
call s:hi('lspInlayHintsParameter', s:base03, '')

call s:hi('markdownH1', s:base07, '', 'bold')
call s:link('markdownH2', 'markdownH1')
call s:link('markdownH3', 'markdownH1')
call s:link('markdownH4', 'markdownH1')
call s:link('markdownH5', 'markdownH1')
call s:link('markdownH6', 'markdownH1')
call s:link('markdownHeadingDelimiter', 'markdownH1')
call s:hi('markdownListMarker', s:base04, '')
call s:link('markdownOrderedListMarker', 'markdownListMarker')
call s:hi('markdownBold', s:base07, '', 'bold')
call s:hi('markdownItalic', s:base06, '')
call s:hi('markdownLinkText', s:base05, '')
call s:hi('markdownUrl', s:base04, '', 'underline')
call s:hi('markdownBlockquote', s:base04, '')
call s:link('markdownCode', 'String')
call s:link('markdownCodeBlock', 'String')
call s:link('markdownCodeDelimiter', 'String')

call s:link('rustIdentifier', 'Type')
call s:link('rustEnumVariant', 'Type')
call s:link('rustSelf', 'Identifier')
call s:link('rustSigil', 'Operator')
call s:link('rustLifetime', 'Label')
call s:link('rustMacroVariable', 'Identifier')
call s:link('rustAssert', 'Macro')
call s:link('rustPanic', 'Macro')
call s:link('rustDerive', 'Delimiter')
call s:link('rustModPath', 'Namespace')
call s:link('rustTypeName', 'Type')
call s:link('rustConstName', 'Constant')
call s:link('rustConstructor', 'Function')
call s:link('rustAttribute', 'Delimiter')
call s:link('rustAttributeName', 'Macro')

call s:link('nixInteger', 'Number')
call s:link('nixBuiltin', 'Identifier')
call s:link('nixSimpleBuiltin', 'Function')
call s:link('nixNamespacedBuiltin', 'Function')
call s:link('nixInterpolation', 'Identifier')
call s:link('nixInterpolationParam', 'Identifier')
call s:link('nixStringDelimiter', 'String')
call s:link('nixPath', 'String')
call s:link('nixHomePath', 'String')
call s:link('nixSearchPath', 'String')
call s:link('nixURI', 'String')

call s:link('typescriptBraces', 'Delimiter')
call s:link('typescriptParens', 'Delimiter')
call s:link('typescriptEndColons', 'Delimiter')
call s:link('typescriptTemplateSB', 'Delimiter')
call s:link('typescriptIdentifier', 'Identifier')
call s:link('typescriptDestructureVariable', 'Identifier')
call s:link('typescriptFuncCallArg', 'Identifier')
call s:link('typescriptArrowFuncArg', 'Identifier')
call s:link('typescriptParamImpl', 'Identifier')
call s:link('typescriptCall', 'Identifier')
call s:link('typescriptFuncType', 'Identifier')
call s:link('typescriptMember', 'Identifier')
call s:link('typescriptObjectLabel', 'Identifier')
call s:link('typescriptDestructureLabel', 'Identifier')
call s:link('typescriptArrowFunc', 'Operator')
call s:link('typescriptFuncTypeArrow', 'Operator')
call s:link('typescriptOptionalMark', 'Operator')
call s:link('typescriptInterfaceName', 'Type')
call s:link('typescriptTypeReference', 'Type')
call s:link('typescriptAliasDeclaration', 'Type')
call s:link('typescriptTypeParameter', 'Type')
call s:link('typescriptClassName', 'Type')
call s:link('typescriptClassHeritage', 'Type')
call s:link('typescriptBOM', 'Type')
call s:link('typescriptGlobal', 'Type')
call s:link('typescriptDecorator', 'PreProc')
call s:link('typescriptCastKeyword', 'Keyword')
call s:link('typescriptEnumKeyword', 'Keyword')
call s:link('typescriptUsing', 'Keyword')
call s:link('typescriptConstructorType', 'Keyword')
call s:link('typescriptMappedIn', 'Keyword')
call s:link('typescriptAbstract', 'Keyword')
call s:link('tsxTag', 'Delimiter')
call s:link('tsxCloseTag', 'Delimiter')
call s:link('tsxIntrinsicTagName', 'Identifier')
call s:link('tsxAttrib', 'PreProc')

call s:link('scalaCapitalWord', 'Type')
call s:link('scalaInstanceDeclaration', 'Type')
call s:link('scalaCaseFollowing', 'Type')
call s:link('scalaTypeTypePostDeclaration', 'Type')
call s:link('scalaOperator', 'Operator')
call s:link('scalaKeywordModifier', 'Keyword')
call s:link('scalaSpecial', 'Keyword')
call s:link('scalaSquareBracketsBrackets', 'Delimiter')

call s:link('elixirAlias', 'Namespace')
call s:link('elixirModuleDeclaration', 'Namespace')
call s:link('elixirAtom', 'String')
call s:link('elixirStringDelimiter', 'String')

call s:hi('GitGutterAdd', s:base0B, s:base00)
call s:hi('GitGutterChange', s:warn, s:base00)
call s:hi('GitGutterDelete', s:base08, s:base00)
call s:hi('GitGutterChangeDelete', s:warn, s:base00)

call s:link('NERDTreeDir', 'Directory')
call s:link('NERDTreeDirSlash', 'Directory')
call s:link('NERDTreeOpenable', 'Comment')
call s:link('NERDTreeClosable', 'Comment')
call s:link('NERDTreeCWD', 'Keyword')
call s:link('NERDTreeExecFile', 'String')

call s:hi('WhichKey', s:base0D, '')
call s:hi('WhichKeySeperator', s:base03, '')
call s:hi('WhichKeyGroup', s:base0E, '')
call s:hi('WhichKeyDesc', s:base05, '')
call s:hi('WhichKeyFloating', s:base05, s:base01)

delfunction s:hi
delfunction s:link
