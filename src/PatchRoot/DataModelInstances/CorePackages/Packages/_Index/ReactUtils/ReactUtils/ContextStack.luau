local v0 = require(script:FindFirstAncestor("ReactUtils").Parent.React);
return function(v1)
    local l_children_0 = v1.children;
    for v3 = #v1.providers, 1, -1 do
        l_children_0 = v0.cloneElement(v1.providers[v3], nil, l_children_0);
    end;
    return l_children_0;
end;
