command! -bang PyScrap exec '<mods> ' . (<bang>0 ? 'edit' : 'split') . ' ' . getcwd() . '/scrap/scratch_'. strftime("%Y-%m-%d-%H%M"). '.py'
