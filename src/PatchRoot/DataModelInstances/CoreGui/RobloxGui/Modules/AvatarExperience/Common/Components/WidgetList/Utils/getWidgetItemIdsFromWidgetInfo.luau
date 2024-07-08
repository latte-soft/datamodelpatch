local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types);
return function(v1, v2)
    local v3 = {};
    if not (not v1 or not v1.content) then
        for _, v5 in v1.content, nil, nil do
            if v5.id then
                table.insert(v3, v5.id);
            end;
        end;
    end;
    if v2 < #v3 then
        v3 = table.move(v3, 1, v2, 1, {});
    end;
    return v3;
end;
