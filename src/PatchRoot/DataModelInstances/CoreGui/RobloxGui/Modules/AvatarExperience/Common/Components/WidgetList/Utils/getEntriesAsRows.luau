local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.WidgetList.Types);
return function(v1, v2, v3)
    local v4 = {};
    for v5 = 1, v2 do
        v4[v5] = {};
    end;
    for v6, v7 in v1, nil, nil do
        local v8 = v4[math.ceil(v6 / v3)];
        if v8 then
            table.insert(v8, v7);
        end;
    end;
    return v4;
end;
