local v0 = require(script:FindFirstAncestor("RoduxFriends").Parent.llama);
local v1 = require(script.Parent.addUser);
local v2 = require(script.Parent.removeUser);
difference = function(v3, v4)
    local v5 = {};
    for _, v7 in pairs(v3) do
        v5[v7] = true;
    end;
    for _, v9 in pairs(v4) do
        v5[v9] = nil;
    end;
    local v10 = {};
    local v11 = 0;
    for _, v13 in pairs(v3) do
        if v5[v13] then
            v11 = v11 + 1;
            v10[v11] = v13;
        end;
    end;
    return v10;
end;
return function(v14, v15)
    local v16 = tostring(v15.namedIds.users);
    local v17 = v14[v16] or {};
    local v19 = v0.List.map(v0.Dictionary.values(v15.responseBody.data), function(v18)
        return (tostring(v18.id));
    end);
    local v20 = difference(v19, v17);
    local v21 = difference(v17, v19);
    for _, v23 in pairs(v20) do
        v14 = v0.Dictionary.join(v14, {
            [v16] = v1(v14[v16], v23), 
            [v23] = v1(v14[v23], v16)
        });
    end;
    for _, v25 in pairs(v21) do
        v14 = v0.Dictionary.join(v14, {
            [v16] = v2(v14[v16], v25), 
            [v25] = v2(v14[v25], v16)
        });
    end;
    for v26, v27 in pairs(v14) do
        if v0.isEmpty(v27) then
            v14[v26] = nil;
        end;
    end;
    return v14;
end;
