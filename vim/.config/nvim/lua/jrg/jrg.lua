return {
    -- Define a generic filter function
    filter = function (original_table, predicate_function)
        local filtered_table = {}
        local index = 1

        -- Iterate through the original table using pairs or ipairs
        for key, value in pairs(original_table) do
            -- If the value satisfies the condition, add it to the new table
            if predicate_function(value, key) then
                filtered_table[index] = value
                index = index + 1
            end
        end

        return filtered_table
    end,
    map = function(tbl)
        for _, value in pairs(tbl) do
                vim.keymap.set(value[1], value[2], value[3], value[4])
        end
    end,
    bootstrap = function()
        local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        if not vim.loop.fs_stat(lazypath) then
            vim.fn.system({
                "git", "clone", "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", lazypath
            })
        end
        vim.opt.rtp:prepend(lazypath)
    end,
}
