local saga = require 'lspsaga'

local lspsaga_opt = {
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
}

saga.init_lsp_saga(lspsaga_opt)
