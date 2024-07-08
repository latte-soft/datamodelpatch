local l_Parent_0 = script.Parent.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_Parent_0.Constants);
return function()
    local v3 = {};
    for _, v5 in l_CoreGui_0:GetChildren() do
        if not (not v5:IsA("LayerCollector") or not v5.Enabled) and v5.Name ~= v2.OverlayName then
            v5.Enabled = false;
            table.insert(v3, v5);
        end;
    end;
    return function()
        for _, v7 in v3, nil, nil do
            v7.Enabled = true;
        end;
    end;
end;
