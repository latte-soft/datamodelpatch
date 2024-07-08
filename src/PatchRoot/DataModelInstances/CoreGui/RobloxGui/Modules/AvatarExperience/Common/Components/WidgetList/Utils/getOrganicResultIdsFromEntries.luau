local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.WidgetList.Types);
return function(v1)
    local v2 = {};
    for _, v4 in v1, nil, nil do
        if not (not v4.id or not v4.type) then
            table.insert(v2, v4.type .. v4.id);
        end;
    end;
    return v2;
end;
