local l_Roact_0 = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact;
return function(v1, v2)
    v2 = v2 or {};
    local v3 = {
        blockLayout = v1
    };
    for v4, v5 in ipairs(v2) do
        v3[v4 .. "-block"] = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v5.size, 
            LayoutOrder = v4
        }, {
            child = v5.element
        });
    end;
    return v3;
end;
