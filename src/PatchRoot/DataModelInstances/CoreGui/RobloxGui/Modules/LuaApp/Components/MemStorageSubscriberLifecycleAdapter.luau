local v0 = require(game:GetService("CorePackages").Roact);
return function(v1)
    local l_receiverComponents_0 = v1.receiverComponents;
    local v3 = {};
    for v4, v5 in ipairs(l_receiverComponents_0) do
        v3[v4] = v0.createElement(v5, {});
    end;
    return v0.createElement("Folder", {}, v3);
end;
