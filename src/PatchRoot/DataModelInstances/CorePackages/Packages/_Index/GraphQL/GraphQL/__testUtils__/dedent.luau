local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_String_0 = v0.String;
dedent = function(v3, ...)
    local v4 = {
        ...
    };
    local v5 = "";
    if not l_Array_0.isArray(v3) then
        v5 = v3;
    else
        for v6 = 1, #v3 do
            v5 = v5 .. v3[v6];
            if v6 <= #v4 then
                v5 = v5 .. v4[v6];
            end;
        end;
    end;
    local v7 = removeTrailingSpacesAndTabs(removeLeadingNewLines(v5));
    local v8 = "";
    for v9 = 1, string.len(v7) do
        local v10 = string.sub(v7, v9, v9);
        if not (v10 ~= " ") or v10 == "\t" then
            v8 = v8 .. v10;
        else
            break;
        end;
    end;
    return removeCommonIndent(v7, v8);
end;
removeLeadingNewLines = function(v11)
    local v12 = l_String_0.findOr(v11, {
        "\n*"
    });
    if v12 ~= nil and v12.index == 1 then
        v11 = string.sub(v11, string.len(v12.match) + 1);
    end;
    return v11;
end;
removeTrailingSpacesAndTabs = function(v13)
    local v14 = nil;
    local v15 = nil;
    local v16 = 1;
    while true do
        v14 = l_String_0.findOr(v13, {
            " +", 
            "\t+"
        }, v16);
        if v14 ~= nil then
            v15 = if v15 ~= nil and v15.index + string.len(v15.match) == v14.index then {
                index = v15.index, 
                match = v15.match .. v14.match
            } else v14;
            v16 = v14.index + string.len(v14.match);
        end;
        if not (v14 ~= nil and string.len(v13) >= v16) then
            break;
        end;
    end;
    if v15 ~= nil and v15.index + string.len(v15.match) == string.len(v13) + 1 then
        return (string.sub(v13, 1, v15.index - 1));
    else
        return v13;
    end;
end;
removeCommonIndent = function(v17, v18)
    return (string.gsub(string.gsub(v17, v18, "", 1), "\n" .. v18, "\n"));
end;
return {
    dedent = dedent
};
