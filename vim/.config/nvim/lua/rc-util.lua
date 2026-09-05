local rc_augroup = vim.api.nvim_create_augroup("lua-rc", {})

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
    autocmd = function(what, callback, pattern, group)
        vim.api.nvim_create_autocmd(what, {
            group = group or rc_augroup,
            pattern = pattern or "*",
            callback = callback
        })
    end

}
