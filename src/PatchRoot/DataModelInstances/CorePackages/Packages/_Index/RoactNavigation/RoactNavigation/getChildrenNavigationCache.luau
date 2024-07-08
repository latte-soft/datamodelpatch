return function(v0)
    if v0 then
        if not v0._childrenNavigation then
            v0._childrenNavigation = {};
        end;
        local l__childrenNavigation_0 = v0._childrenNavigation;
        local v2 = {};
        local v3 = v0.state.routes or {};
        for _, v5 in v3, nil, nil do
            v2[v5.key] = true;
        end;
        if not v0.state.isTransitioning then
            for v6, _ in l__childrenNavigation_0, nil, nil do
                if not v2[v6] then
                    l__childrenNavigation_0[v6] = nil;
                end;
            end;
        end;
        return v0._childrenNavigation;
    else
        return {};
    end;
end;
