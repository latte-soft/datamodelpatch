local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_List_0 = require(l_Parent_0.llama).List;
return function(v3, v4)
    local v5 = {};
    v4 = string.lower(v4);
    if string.sub(v4, 1, 1) == "@" then
        local v6 = string.sub(v4, 2);
        v5 = l_Dictionary_0.values(l_Dictionary_0.filter(v3.byUsername, function(_, v8)
            return string.find(v8, "^" .. v6) ~= nil;
        end));
    else
        local l_v4_0 = v4;
        for _, v13 in pairs((l_Dictionary_0.filter(v3.byDisplayName, function(_, v11)
            return string.find(v11, "^" .. l_v4_0) ~= nil;
        end))) do
            for _, v15 in ipairs(v13) do
                table.insert(v5, v15);
            end;
        end;
    end;
    return l_List_0.map(v5, function(v16)
        return v3.byUserId[tostring(v16)];
    end);
end;
