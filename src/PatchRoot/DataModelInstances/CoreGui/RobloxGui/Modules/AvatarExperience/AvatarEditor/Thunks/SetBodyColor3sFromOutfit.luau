local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColor3s);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRangeIdToBodyPartsToSliderAndColor3Values);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
return function(v6, v7)
    return function(v8)
        local v9 = {};
        for v10, v11 in pairs(v6) do
            local v12, v13 = v5.findRangeAndSliderValueForColor3(v11, v7);
            v4(v12, v10, v13, v11);
            v9[v10] = v12;
        end;
        v8:dispatch(v3(v6));
        v8:dispatch(v2(v9));
    end;
end;
