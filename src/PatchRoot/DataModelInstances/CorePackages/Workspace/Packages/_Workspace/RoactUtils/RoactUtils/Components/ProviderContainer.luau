local v0 = require(script:FindFirstAncestor("RoactUtils").Parent.React);
return function(v1)
    local v2 = v1.providers or {};
    local v3 = {
        PageWrapper = v0.createElement("Folder", {}, v1.children)
    };
    for v4 = #v2, 1, -1 do
        local v5 = v2[v4];
        v3 = {
            ProviderChildren = v0.createElement(v5.class, v5.props, v3)
        };
    end;
    return v0.createElement("Folder", nil, v3);
end;
