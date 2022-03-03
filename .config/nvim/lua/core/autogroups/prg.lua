PRG = {
    name='set_prgs',
    cmds={
        "FileType c set formatprg=clang-format",
        -- "FileType python set formatprg=yapf",
        "FileType Markdown set makeprg=pandoc\\ %:p\\ -o\\ %:p:h/out.pdf"
    }
}

return PRG
