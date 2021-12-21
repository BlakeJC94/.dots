M = {}

map = require("utils").map

M.test_func= function()
    map('c', '<Down>',  [[wildmenumode() ? "\<Right>" : "\<Down>"]], {silent = false, expr = true})
    map('c', '<Up>',    [[wildmenumode() ? "\<Left>"  : "\<Up>"]], {silent = false, expr = true})
    map('c', '<Right>', [[wildmenumode() ? "\<Down>"  : "\<Right>"]], {silent = false, expr = true})
    map('c', '<Left>',  [[wildmenumode() ? "\<Up>"    : "\<Left>"]], {silent = false, expr = true})
end

return M
