local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColor3s);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRangeIdToBodyPartsToSliderAndColor3Values);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
return function(v8, v9, v10, v11)
    return function(v12)
        local v13 = v12:getState();
        local l_AvatarEditor_0 = v13.AvatarExperience.AvatarEditor;
        local l_bodyPartForSkinColoringIds_0 = v2.BodyPartButtonData[l_AvatarEditor_0.BodyColorPickerSettings.selectedBodyPartIndex].bodyPartForSkinColoringIds;
        local v16 = v1.getUserId(v13);
        local l_BodyColor3s_0 = l_AvatarEditor_0.Character.BodyColor3s;
        local l_BodyPartRangeIds_0 = l_AvatarEditor_0.Character.BodyPartRangeIds;
        local v19 = {};
        local v20 = {};
        if l_bodyPartForSkinColoringIds_0 and #l_bodyPartForSkinColoringIds_0 > 0 then
            v19 = table.clone(l_BodyColor3s_0);
            v20 = table.clone(l_BodyPartRangeIds_0);
            for _, v22 in l_bodyPartForSkinColoringIds_0, nil, nil do
                v19[v22] = v8;
                v20[v22] = v9;
            end;
        else
            for _, v24 in v2.allBodyPartForSkinColoringIds, nil, nil do
                v19[v24] = v8;
                v20[v24] = v9;
            end;
        end;
        v12:dispatch(v5(v19));
        v12:dispatch(v4(v20));
        for _, v26 in l_bodyPartForSkinColoringIds_0, nil, nil do
            v12:dispatch(v6(v9, v26, v10, v8));
        end;
        v11.selectedBodyColorRangeWithId(v9, v16);
        v12:dispatch(v7(v11.setBodyColor3s, v19));
    end;
end;
