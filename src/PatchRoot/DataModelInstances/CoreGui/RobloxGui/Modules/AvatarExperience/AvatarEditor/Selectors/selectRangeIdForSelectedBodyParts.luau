local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
return function(v4)
    local l_AvatarExperience_0 = v4.AvatarExperience;
    local l_bodyPartForSkinColoringIds_0 = v2.BodyPartButtonData[l_AvatarExperience_0.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex].bodyPartForSkinColoringIds;
    if not (l_bodyPartForSkinColoringIds_0 ~= nil) or #l_bodyPartForSkinColoringIds_0 == 0 then
        return nil;
    else
        local v7 = v1.getRangeIdSharedByBodyParts(l_bodyPartForSkinColoringIds_0, l_AvatarExperience_0.AvatarEditor.Character.BodyPartRangeIds);
        if v7 == nil then
            return nil;
        elseif v1.getColor3SharedByBodyParts(l_bodyPartForSkinColoringIds_0, l_AvatarExperience_0.AvatarEditor.Character.BodyColor3s) == nil then
            return nil;
        else
            return v7;
        end;
    end;
end;
