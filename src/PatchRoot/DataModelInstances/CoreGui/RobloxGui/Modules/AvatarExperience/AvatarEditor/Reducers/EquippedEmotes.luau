local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Rodux);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetSelectedEmoteSlot);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset);
local v9 = {
    slotInfo = {}, 
    selectedSlot = 1
};
local function v15(v10)
    local v11 = {};
    for _, v13 in v10, nil, nil do
        local l_position_0 = v13.position;
        v11[l_position_0] = {
            assetId = tostring(v13.assetId), 
            position = l_position_0
        };
    end;
    return v11;
end;
local function _(v16, v17, v18)
    return v3.Dictionary.join(v16, {
        [v17] = v18
    });
end;
local function _(v20, v21)
    return v3.Dictionary.join(v20, {
        [v21] = v3.None
    });
end;
return v4.createReducer(v9, {
    [v6.name] = function(v23, v24)
        return v3.Dictionary.join(v23, {
            slotInfo = v15(v24.avatarData.emotes or {})
        });
    end, 
    [v8.name] = function(v25, v26)
        if v26.assetTypeId ~= v5.AssetTypeIdStrings.EmoteAnimation then
            return v25;
        else
            local v27 = v25.slotInfo[v25.selectedSlot];
            local v28 = {
                assetId = v26.assetId, 
                position = v25.selectedSlot
            };
            local _ = nil;
            return v3.Dictionary.join(v25, {
                slotInfo = if not v27 or v27.assetId ~= v28.assetId then v3.Dictionary.join(v25.slotInfo, {
                    [v25.selectedSlot] = v28
                }) else v3.Dictionary.join(v25.slotInfo, {
                    [v25.selectedSlot] = v3.None
                })
            });
        end;
    end, 
    [v7.name] = function(v30, v31)
        return v3.Dictionary.join(v30, {
            selectedSlot = v31.selectedSlot
        });
    end
});
