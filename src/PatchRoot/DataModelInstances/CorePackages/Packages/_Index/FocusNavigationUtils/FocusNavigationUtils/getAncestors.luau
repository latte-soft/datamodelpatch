return function(v0)
    local v1 = {
        v0
    };
    local l_v0_0 = v0;
    while l_v0_0.Parent do
        table.insert(v1, l_v0_0.Parent);
        l_v0_0 = l_v0_0.Parent;
    end;
    return v1;
end;
