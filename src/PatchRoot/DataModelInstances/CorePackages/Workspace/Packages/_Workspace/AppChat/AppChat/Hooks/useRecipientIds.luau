local l_useSelector_0 = require(script:FindFirstAncestor("AppChat").Parent.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v1)
    local v3 = l_useSelector_0(function(v2)
        return (tonumber(v2.LocalUserId));
    end);
    local v4 = not not v1 and v1.participants or {};
    local v5 = {};
    for _, v7 in v4, nil, nil do
        local v8 = tonumber(v7);
        if v8 and v8 ~= v3 then
            table.insert(v5, v8);
        end;
    end;
    return v5;
end;
