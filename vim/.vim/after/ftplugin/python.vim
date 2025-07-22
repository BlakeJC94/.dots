setl fo+=r
" compiler pytest

let g:python3_host_prog = expand('~/.asdf/shims/python')

if !exists('*Switch')
function! Switch() abort
    let current_file = expand('%:p')
    let filename = expand('%:t:r')

    " Check if we're in a test file
    if current_file =~ '/tests/'
        " We're in a test file, jump to source
        if filename =~ '^test_'
            " Remove test_ prefix
            let source_filename = substitute(filename, '^test_', '', '') . '.py'
        else
            " Assume it's a test file without test_ prefix
            let source_filename = filename . '.py'
        endif

        " Find the project root by looking for tests directory
        let tests_dir = substitute(current_file, '/tests/.*', '/tests/', '')
        let project_root = substitute(tests_dir, '/tests/$', '', '')

        " Get the relative path within tests directory
        let relative_path = substitute(current_file, '.*\/tests\/', '', '')
        let relative_dir = fnamemodify(relative_path, ':h')

        " Try to find the source file in common package locations
        let possible_paths = []

        " Look for directories that might be packages (not tests, not common non-package dirs)
        for item in glob(project_root . '/*', 0, 1)
            if isdirectory(item) && fnamemodify(item, ':t') !~ '^\(tests\|docs\|\..*\|__pycache__\)$'
                if relative_dir == '.'
                    call add(possible_paths, item . '/' . source_filename)
                else
                    call add(possible_paths, item . '/' . relative_dir . '/' . source_filename)
                endif
            endif
        endfor

        " Find the first existing file
        let target = ''
        for path in possible_paths
            if filereadable(path)
                let target = path
                break
            endif
        endfor

        " If no existing file found, use the first possible path
        if target == '' && len(possible_paths) > 0
            let target = possible_paths[0]
        endif
    else
        " We're in a source file, jump to test
        let test_filename = 'test_' . filename . '.py'

        " Find project root by looking for common indicators
        let current_dir = expand('%:p:h')
        let project_root = current_dir

        " Walk up to find project root (look for tests directory or git root)
        while project_root != '/' && project_root != ''
            if isdirectory(project_root . '/tests') || isdirectory(project_root . '/.git')
                break
            endif
            let project_root = fnamemodify(project_root, ':h')
        endwhile

        " Get relative path from package to current file
        let package_dirs = []
        for item in glob(project_root . '/*', 0, 1)
            if isdirectory(item) && fnamemodify(item, ':t') !~ '^\(tests\|docs\|\..*\|__pycache__\)$'
                if current_file =~ '^' . escape(item, '/\')
                    let relative_path = substitute(current_file, '^' . escape(item, '/\') . '/', '', '')
                    let relative_dir = fnamemodify(relative_path, ':h')
                    break
                endif
            endif
        endfor

        " Construct test file path
        if exists('relative_dir') && relative_dir != '.'
            let target = project_root . '/tests/' . relative_dir . '/' . test_filename
        else
            let target = project_root . '/tests/' . test_filename
        endif
    endif

    if target == ''
        echoerr 'Could not determine target file path'
        return
    endif

    if filereadable(target)
        execute 'edit' fnameescape(target)
    else
        execute 'edit' fnameescape(target)
        echo 'Created new file: ' . target
    endif
endfunction
endif

command! Switch call Switch()
nnoremap <Leader>j :call Switch()<CR>

" Requires pytest-compiler and vim-dispatch
if has_key(get(g:, 'plugs', {}), 'vim-dispatch') == 0 && has_key(get(g:, 'plugs', {}), 'pytest-vim-compiler') == 0
  command! Pytest :Make -k %:p:t:r<CR>
  cnoreabbrev <expr> pytest (getcmdtype() ==# ':' && getcmdline() ==# 'pytest') ? 'Pytest' : 'pytest'
endif
