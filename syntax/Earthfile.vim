" Vim syntax file
" Language: Earthfile
" Maintainer: Thomas Hobson <git@hexf.me>
" Latest Revision: 04 October 2020
" Source: https://docs.earthly.dev/earthfile

if exists("b:current_syntax")
  finish
endif

" Comments
" # <comment> (EOL)
syn region earthfileComment start="#" end="\n"

" Escapes
" \n
syn match earthfileEscape '\\.'
" \(EOL)
syn match earthfileEscape '\\$'

" Strings
" "<string>"
syn region earthfileString start="\"" skip=+\\"+ end = "\""
" '<string>'
syn region earthfileString start="'" end = "'"

" Variables
" $<varname>
syn match earthfileVariable '\\$\(\w\-\)\+'
" ${<varname>}
syn region earthfileVariable start="${" end = "}"

" Operators
" && >> << | ; > <
syn match earthfileOperatorShell '&&\|>>\|<<\|;\|>\||'
" =
syn match earthfileOperatorAssign '='
" --...
syn match earthfileOperatorFlag '\s\-\+\(\w\|\-\)\+'

" Target
" debian:
syn match earthfileTargetLabel '^\zs\s*[a-z0-9\-]\+\ze\:'
syn match earthfileTargetReference '\(\w\|_\|\-\|/\|:\|+\|\.\)*\s' contained nextgroup=earthfileKeyword

" Keywords
syn keyword earthlyConditional IF ELSE END
hi def link earthlyConditional Conditional

syn match earthfileKeyword '^\s*ADD\s*\|^\s*ARG\s*\|^\s*BUILD\s*\|^\s*CACHE\s*\|^\s*CMD\s*\|^\s*COMMAND\s*\|^\s*COPY\s*\|^\s*DO\s*\|^\s*DOCKER LOAD\s*\|^\s*DOCKER PULL\s*\|^\s*ENTRYPOINT\s*\|^\s*ENV\s*\|^\s*EXPOSE\s*\|^\s*FROM DOCKERFILE\s*\|^\s*GIT CLONE\s*\|^\s*HEALTHCHECK\s*CMD\|^\s*HEALTHCHECK\s*NONE\|^\s*HOST\s*\|^\s*IMPORT\s*\|^\s*LABEL\s*\|^\s*LOCALLY\s*\|^\s*ONBUILD\s*\|^\s*PIPELINE\s*\|^\s*PROJECT\s*\|^\s*RUN\s*\|^\s*SAVE ARTIFACT\s*\|^\s*SAVE IMAGE\s*\|^\s*SHELL\s*\|^\s*STOPSIGNAL\s*\|^\s*TRIGGER\s*\|^\s*USER\s*\|^\s*VERSION\s*\|^\s*VOLUME\s*\|^\s*WITH DOCKER\s*\|^\s*WORKDIR'
syn match earthfileKeyword '^\s*FROM\s*' nextgroup=earthfileBaseImage
syn match earthfileBaseImage '\S\+' contained


syn match earthfileKeyword '^\s*SAVE ARTIFACT\s*' nextgroup=earthfileTargetReference

syn match earthfileKeyword '\s*AS LOCAL' contained

" Highlights
hi def link earthfileKeyword Keyword

hi def link earthfileOperatorShell Operator
hi def link earthfileOperatorAssign Operator
hi def link earthfileOperatorFlag Special

hi def link earthfileBaseImage Constant

hi def link earthfileTargetLabel Statement
hi def link earthfileTargetReference Constant

hi def link earthfileComment Comment
hi def link earthfileEscape SpecialChar
hi def link earthfileString String
hi def link earthfileVariable Identifier

let b:current_syntax = "earthfile"
