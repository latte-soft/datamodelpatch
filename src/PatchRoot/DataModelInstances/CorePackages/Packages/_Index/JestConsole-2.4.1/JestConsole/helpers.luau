local l_Parent_0 = script.Parent;
local l_inspect_0 = require(l_Parent_0.Parent.LuauPolyfill).util.inspect;
local _ = require(l_Parent_0.types);
concatRestArgs = function(v3)
    local v4 = "";
    if #v3 > 0 then
        v4 = " " .. table.concat(v3, " ");
    end;
    return v4;
end;
getFormattedValue = function(v5, v6)
    if type(v5) == "string" then
        return v5;
    else
        return (l_inspect_0(v5, v6));
    end;
end;
format = function(...)
    return formatter(nil, ...);
end;
formatWithOptions = function(v7, v8, ...)
    return formatter(v7, v8, ...);
end;
formatter = function(v9, v10, ...)
    local v11 = {
        ...
    };
    local v12 = {};
    local v13 = {};
    if type(v10) == "string" then
        local _, v15 = v10:gsub("%%[sdj%%]", "");
        for v16, v17 in pairs(v11) do
            local v18 = getFormattedValue(v17, v9);
            if v16 <= v15 then
                table.insert(v12, v18);
            else
                table.insert(v13, v18);
            end;
        end;
    else
        v10 = l_inspect_0(v10, v9);
        for _, v20 in pairs(v11) do
            table.insert(v13, getFormattedValue(v20, v9));
        end;
    end;
    return string.format(v10, table.unpack(v12)) .. concatRestArgs(v13);
end;
return {
    format = format, 
    formatWithOptions = formatWithOptions, 
    concatRestArgs = concatRestArgs
};
