local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRangeIdToBodyPartsToSliderAndColor3Values);
return function(v5)
    return function(v6)
        local l_DefaultBodyColorRanges_0 = v6:getState().AvatarExperience.AvatarEditor.DefaultBodyColorRanges;
        assert(l_DefaultBodyColorRanges_0 ~= nil, "defaultBodyColorRanges is nil");
        local v8 = {};
        local v9 = {};
        for v10, v11 in v5, nil, nil do
            local v12, v13 = v1.findRangeAndSliderValueForColor3(v11, l_DefaultBodyColorRanges_0);
            v8[v10] = v12;
            v9[v10] = v13;
        end;
        v6:dispatch(v3(v8));
        for v14, v15 in v9, nil, nil do
            v6:dispatch(v4(v8[v14], v14, v15, v5[v14]));
        end;
    end;
end;
