_G._configs.true_zen_off = function()
    local modes = {"ataraxis", "minimalist", "narrow", "focus"}
    for _, mode in pairs(modes) do
        require("true-zen." .. mode).off()
    end
end

return {
    config = function() require("true-zen").setup({}) end
}
