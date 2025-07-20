function! Switch() abort
    let current_file = expand('%:p')
    let plugin_dir = '/plugin/'
    let autoload_dir = '/autoload/'

    if current_file =~ plugin_dir
        let target = substitute(current_file, plugin_dir, autoload_dir, '')
    elseif current_file =~ autoload_dir
        let target = substitute(current_file, autoload_dir, plugin_dir, '')
    else
        echoerr 'Not in a plugin/ or autoload/ file'
        return
    endif

    if filereadable(target)
        execute 'edit' fnameescape(target)
    else
        execute 'edit' fnameescape(target)
        echo 'Created new file: ' . target
    endif
endfunction

command! Switch call Switch()

