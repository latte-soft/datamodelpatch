local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Boolean_0 = require(l_Parent_1.LuauPolyfill).Boolean;
local _ = require(l_Parent_0.Types);
local v4 = require(l_Parent_1.ChalkLua);
local v5 = string.char(27) .. "%[%d+;?5?;?%d*m";
local v6 = {
    [v4.red.close] = "</>", 
    [v4.green.close] = "</>", 
    [v4.cyan.close] = "</>", 
    [v4.gray.close] = "</>", 
    [v4.white.close] = "</>", 
    [v4.yellow.close] = "</>", 
    [v4.bgRed.close] = "</>", 
    [v4.bgGreen.close] = "</>", 
    [v4.bgYellow.close] = "</>", 
    [v4.inverse.close] = "</>", 
    [v4.dim.close] = "</>", 
    [v4.bold.close] = "</>", 
    [v4.reset.open] = "</>", 
    [v4.reset.close] = "</>", 
    [v4.red.open] = "<red>", 
    [v4.green.open] = "<green>", 
    [v4.cyan.open] = "<cyan>", 
    [v4.gray.open] = "<gray>", 
    [v4.white.open] = "<white>", 
    [v4.yellow.open] = "<yellow>", 
    [v4.bgRed.open] = "<bgRed>", 
    [v4.bgGreen.open] = "<bgGreen>", 
    [v4.bgYellow.open] = "<bgYellow>", 
    [v4.inverse.open] = "<inverse>", 
    [v4.dim.open] = "<dim>", 
    [v4.bold.open] = "<bold>"
};
return {
    test = function(v7)
        local v8 = false;
        if typeof(v7) == "string" then
            v8 = l_Boolean_0.toJSBoolean(v7:match(v5));
        end;
        return v8;
    end, 
    serialize = function(v9, v10, v11, v12, v13, v14)
        return v14(v9:gsub(v5, function(v15)
            if not v6[v15] then
                return "";
            else
                return v6[v15];
            end;
        end), v10, v11, v12, v13);
    end, 
    ansiRegex = v5, 
    toHumanReadableAnsi = function(v16)
        return v16:gsub(v5, function(v17)
            if not v6[v17] then
                return "";
            else
                return v6[v17];
            end;
        end);
    end
};
