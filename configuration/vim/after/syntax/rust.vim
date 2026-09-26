syntax match rustTypeName display "\<\u\w*\>"
syntax match rustConstName display "\<\u[A-Z0-9_]\+\>"
syntax match rustConstructor display "\%(\%(\<impl\|\<for\|->\)\s\+\)\@<!\<\u\w*\ze\s*[({]"

syntax match rustAttributeName display "\%(#!\?\[\)\@<=\h\w*" contained containedin=rustAttribute
syntax clear rustDerive
syntax region rustDerive matchgroup=rustAttributeName start="\<derive\>" end="\ze)" contained contains=rustDeriveTrait,rustTypeName
