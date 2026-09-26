highlight clear
if exists('syntax_on')
  syntax reset
endif
set background=dark
let g:colors_name = 'base16_default_dark_plain'

let s:base00 = '#111111'
let s:base01 = '#282828'
let s:base02 = '#383838'
let s:base03 = '#585858'
let s:base04 = '#b8b8b8'
let s:base05 = '#d8d8d8'
let s:base06 = '#e8e8e8'
let s:base07 = '#f8f8f8'
let s:base08 = '#ab4642'
let s:base09 = '#dc9656'
let s:base0A = '#f7ca88'
let s:base0B = '#a1b56c'
let s:base0C = '#86c1b9'
let s:base0D = '#7cafc2'
let s:base0E = '#ba8baf'
let s:base0F = '#a16946'

let g:terminal_ansi_colors = [
      \ s:base00,
      \ s:base08,
      \ s:base0B,
      \ s:base0A,
      \ s:base0D,
      \ s:base0E,
      \ s:base0C,
      \ s:base05,
      \ s:base03,
      \ s:base09,
      \ s:base01,
      \ s:base02,
      \ s:base04,
      \ s:base06,
      \ s:base0F,
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
call s:hi('Cursor', s:base00, s:base05)
call s:hi('lCursor', s:base00, s:base05)
call s:hi('CursorLine', '', s:base01)
call s:hi('CursorColumn', '', s:base01)
call s:hi('ColorColumn', '', s:base01)
call s:hi('LineNr', s:base03, s:base01)
call s:hi('LineNrAbove', s:base03, s:base01)
call s:hi('LineNrBelow', s:base03, s:base01)
call s:hi('CursorLineNr', s:base04, s:base01, 'bold')
call s:hi('SignColumn', s:base03, s:base01)
call s:hi('FoldColumn', s:base03, s:base01)
call s:hi('Folded', s:base03, s:base01)
call s:hi('Visual', '', s:base02)
call s:hi('VisualNOS', '', s:base02)
call s:hi('MatchParen', s:base0A, '', 'underline')
call s:hi('Search', s:base01, s:base0A)
call s:hi('IncSearch', s:base01, s:base09)
call s:hi('QuickFixLine', '', s:base02)
call s:hi('NonText', s:base03, '')
call s:hi('SpecialKey', s:base03, '')
call s:hi('EndOfBuffer', s:base00, '')
call s:hi('Conceal', s:base0D, '')
call s:hi('Directory', s:base0D, '')
call s:hi('Title', s:base0D, '', 'bold')
call s:hi('StatusLine', s:base04, s:base01)
call s:hi('StatusLineNC', s:base03, s:base01)
call s:hi('StatusLineTerm', s:base04, s:base01)
call s:hi('StatusLineTermNC', s:base03, s:base01)
call s:hi('VertSplit', s:base01, s:base01)
call s:hi('TabLine', s:base04, s:base00)
call s:hi('TabLineFill', s:base04, s:base00)
call s:hi('TabLineSel', s:base06, s:base01)
call s:hi('Pmenu', s:base05, s:base01)
call s:hi('PmenuSel', s:base01, s:base04)
call s:hi('PmenuSbar', '', s:base01)
call s:hi('PmenuThumb', '', s:base03)
call s:hi('WildMenu', s:base01, s:base04)
call s:hi('ModeMsg', s:base04, '')
call s:hi('MoreMsg', s:base0B, '')
call s:hi('Question', s:base0D, '')
call s:hi('ErrorMsg', s:base08, '')
call s:hi('WarningMsg', s:base09, '')
call s:hi('SpellBad', '', '', 'undercurl', s:base08)
call s:hi('SpellCap', '', '', 'undercurl', s:base0D)
call s:hi('SpellLocal', '', '', 'undercurl', s:base0C)
call s:hi('SpellRare', '', '', 'undercurl', s:base0E)

call s:hi('Comment', s:base03, '')
call s:hi('Constant', s:base09, '')
call s:hi('String', s:base0B, '')
call s:hi('Character', s:base0B, '')
call s:hi('Number', s:base09, '')
call s:hi('Boolean', s:base09, '')
call s:hi('Float', s:base09, '')
call s:hi('Identifier', s:base05, '')
call s:hi('Function', s:base0D, '')
call s:hi('Statement', s:base0E, '')
call s:hi('Conditional', s:base0E, '')
call s:hi('Repeat', s:base0E, '')
call s:hi('Label', s:base0E, '')
call s:hi('Operator', s:base05, '')
call s:hi('Keyword', s:base0E, '')
call s:hi('Exception', s:base0E, '')
call s:hi('PreProc', s:base09, '')
call s:hi('Include', s:base0E, '')
call s:hi('Define', s:base0E, '')
call s:hi('Macro', s:base0D, '')
call s:hi('PreCondit', s:base09, '')
call s:hi('Type', s:base0A, '')
call s:hi('StorageClass', s:base0E, '')
call s:hi('Structure', s:base0E, '')
call s:hi('Typedef', s:base0E, '')
call s:hi('Special', s:base0C, '')
call s:hi('SpecialChar', s:base0C, '')
call s:hi('Tag', s:base08, '')
call s:hi('Delimiter', s:base05, '')
call s:hi('SpecialComment', s:base03, '')
call s:hi('Debug', s:base03, '')
call s:hi('Underlined', s:base09, '', 'underline')
call s:hi('Ignore', s:base03, '')
call s:hi('Error', s:base08, '')
call s:hi('Todo', s:base0A, '', 'bold')

call s:hi('Namespace', s:base0E, '')

call s:hi('DiffAdd', s:base0B, s:base01)
call s:hi('DiffChange', s:base09, s:base01)
call s:hi('DiffDelete', s:base08, s:base01)
call s:hi('DiffText', s:base0D, s:base02)
call s:hi('diffAdded', s:base0B, '')
call s:hi('diffChanged', s:base09, '')
call s:hi('diffRemoved', s:base08, '')
call s:link('diffFile', 'Title')
call s:link('diffLine', 'Comment')

call s:hi('LspErrorText', s:base08, s:base01)
call s:hi('LspWarningText', s:base09, s:base01)
call s:hi('LspInformationText', s:base0D, s:base01)
call s:hi('LspHintText', s:base03, s:base01)
call s:hi('LspErrorVirtualText', s:base08, '')
call s:hi('LspWarningVirtualText', s:base09, '')
call s:hi('LspInformationVirtualText', s:base0D, '')
call s:hi('LspHintVirtualText', s:base03, '')
call s:hi('LspErrorHighlight', '', '', 'underline', s:base08)
call s:hi('LspWarningHighlight', '', '', 'underline', s:base09)
call s:hi('LspInformationHighlight', '', '', 'underline', s:base0D)
call s:hi('LspHintHighlight', '', '', 'underline', s:base03)
call s:hi('lspReference', '', s:base02)
call s:hi('lspInlayHintsType', s:base03, '')
call s:hi('lspInlayHintsParameter', s:base03, '')

call s:hi('markdownH1', s:base0D, '')
call s:link('markdownH2', 'markdownH1')
call s:link('markdownH3', 'markdownH1')
call s:link('markdownH4', 'markdownH1')
call s:link('markdownH5', 'markdownH1')
call s:link('markdownH6', 'markdownH1')
call s:link('markdownHeadingDelimiter', 'markdownH1')
call s:hi('markdownListMarker', s:base08, '')
call s:link('markdownOrderedListMarker', 'markdownListMarker')
call s:hi('markdownBold', s:base0A, '', 'bold')
call s:hi('markdownItalic', s:base0E, '')
call s:hi('markdownLinkText', s:base08, '')
call s:hi('markdownUrl', s:base09, '', 'underline')
call s:hi('markdownBlockquote', s:base0C, '')
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

call s:hi('GitGutterAdd', s:base0B, s:base01)
call s:hi('GitGutterChange', s:base09, s:base01)
call s:hi('GitGutterDelete', s:base08, s:base01)
call s:hi('GitGutterChangeDelete', s:base09, s:base01)

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
