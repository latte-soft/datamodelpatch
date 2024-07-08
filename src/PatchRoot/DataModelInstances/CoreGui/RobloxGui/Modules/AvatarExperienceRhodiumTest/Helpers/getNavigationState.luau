local function v5(v0)
    local v1 = {};
    for v2 = 1, #v0 do
        local v3 = {};
        for v4 = 1, v2 do
            table.insert(v3, v0[v4]);
        end;
        table.insert(v1, v3);
    end;
    return v1;
end;
return function(...)
    local v6 = {};
    for _, v8 in {
        ...
    }, nil, nil do
        table.insert(v6, {
            name = v8
        });
    end;
    return {
        history = v5(v6), 
        lockNavigationActions = false, 
        backNavigationDisableCounter = 0
    };
end;
