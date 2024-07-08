local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_MockId_0 = require(l_CorePackages_0.Workspace.Packages.UnitTestHelpers).MockId;
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v6 = require(l_Modules_0.AvatarExperience.Common.Models.AssetMetadata);
local v7 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.AvatarEditor.Reducers.ExtendedBodyColors);
local v9 = require(l_Modules_0.AvatarExperience.Flags.ColorPickerSliderIXPTest);
local v10 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientAvatarUsesColor3sForBodyParts");
local v12 = require(l_CorePackages_0.Cryo);
local v13 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableOutfitAttribution);
local v14 = {
    new = function()
        return {};
    end, 
    MockPantsAssetId = "123", 
    MockHatAssetId = "124"
};
v14.mock = function()
    local v15 = v14.new();
    v15.outfitId = l_MockId_0();
    v15.name = "";
    v15.assets = {
        ["66"] = {
            [v14.MockPantsAssetId] = {
                version = "1", 
                order = 2, 
                type = Enum.AccessoryType.Jacket, 
                isLayered = true
            }
        }, 
        ["8"] = {
            [v14.MockHatAssetId] = {
                version = "1", 
                order = 1, 
                type = Enum.AccessoryType.Hat, 
                isLayered = true
            }
        }
    };
    v15.bodyColors = {
        headColorId = 194, 
        leftArmColorId = 194, 
        leftLegColorId = 194, 
        rightArmColorId = 194, 
        rightLegColorId = 194, 
        torsoColorId = 194
    };
    v15.bodyColor3s = {
        headColor3 = v7.bodyColorToBodyColor3(194), 
        leftArmColor3 = v7.bodyColorToBodyColor3(194), 
        leftLegColor3 = v7.bodyColorToBodyColor3(194), 
        rightArmColor3 = v7.bodyColorToBodyColor3(194), 
        rightLegColor3 = v7.bodyColorToBodyColor3(194), 
        torsoColor3 = v7.bodyColorToBodyColor3(194)
    };
    v15.scales = {
        height = 0, 
        width = 0, 
        head = 0, 
        depth = 0, 
        proportion = 0, 
        bodyType = 0
    };
    v15.avatarType = v3.AvatarType.R15;
    v15.isEditable = true;
    v15.updateCounter = 0;
    v15.outfitType = "Avatar";
    return v15;
end;
v14.mockWithData = function(v16)
    return (v12.Dictionary.join(v14.mock(), v16));
end;
v14.fromWebApi = function(v17, v18, v19, v20)
    local v21 = v14.new();
    v21.containsDynamicHead = false;
    local v22 = {};
    if v19.assets then
        for _, v24 in v19.assets, nil, nil do
            local v25 = tostring(v24.assetType.id);
            local v26 = tostring(v24.id);
            local v27 = v22[v25] or {};
            v27[v26] = v6.fromMetadata(v24.meta, v25);
            v22[v25] = v27;
            if v25 == v4.AssetTypeIdStrings.DynamicHead then
                v21.containsDynamicHead = true;
            end;
        end;
    end;
    v21.outfitId = v17;
    v21.name = v19.name;
    v21.assets = v22;
    if not v10.readTestVariable(v9.EnabledForUser) then
        if not l_game_EngineFeature_0 then
            v21.bodyColors = v19.bodyColors;
        else
            v21.bodyColors = v7.convertBodyColor3HexesToIds(v19.bodyColor3s, v20);
        end;
    elseif not l_game_EngineFeature_0 then
        v21.bodyColor3s = v7.convertBodyColorsToColor3s(v19.bodyColors);
    else
        v21.bodyColor3s = v7.convertBodyColor3HexesToColor3s(v19.bodyColor3s);
    end;
    v21.scales = v19.scale;
    v21.avatarType = v19.playerAvatarType;
    v21.isEditable = v19.isEditable;
    v21.outfitType = v19.outfitType;
    v21.creatingUniverseId = if not not v13 and v19.universeId ~= 0 then tostring(v19.universeId) else nil;
    v21.updateCounter = v18 or 0;
    return v21;
end;
return v14;
