local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.tutils);
local v4 = require(l_Modules_0.LuaApp.mutedError);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_AssetTypeIdStringToHumanoidDescriptionProp_0 = v5.AssetTypeIdStringToHumanoidDescriptionProp;
local l_HumanoidDescriptionScaleToName_0 = v5.HumanoidDescriptionScaleToName;
local l_HumanoidDescriptionBodyColorIdToName_0 = v5.HumanoidDescriptionBodyColorIdToName;
local l_BodyPartForSkinColoringIdToHumanoidDescription_0 = v5.BodyPartForSkinColoringIdToHumanoidDescription;
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientAvatarUsesColor3sForBodyParts");
local v11 = {};
local v12 = v2.interface({
    id = v2.number, 
    assets = v2.table, 
    bodyColors = v2.table, 
    scale = v2.table
});
local v13 = v2.interface({
    id = v2.number, 
    assets = v2.table, 
    bodyColor3s = v2.table, 
    scale = v2.table
});
v11.new = function()
    return {};
end;
v11.fromOutfitDetailsWebApi = function(v14)
    local v15 = v11.new();
    if not l_game_EngineFeature_0 then
        if not v12(v14) then
            v4(string.format("the responseBody of Avatar endpoint, /v1/outfits/{outfitId}/details, did not have expected sets of data: %s", v3.toString(v14)));
        end;
    elseif not v13(v14) then
        v4(string.format("the responseBody of Avatar endpoint, /v3/outfits/{outfitId}/details, did not have expected sets of data: %s", v3.toString(v14)));
    end;
    local l_id_0 = v14.id;
    local v17 = v14.assets or {};
    local v18 = v14.scale or {};
    for _, v20 in pairs(v17) do
        local v21 = v20.assetType and v20.assetType.id;
        local v22 = tostring(v20.id);
        local v23 = l_AssetTypeIdStringToHumanoidDescriptionProp_0[tostring(v21)];
        if not v2.string(v23) then
            v4(string.format("Avatar's /%s/outfits/%s/details returned an assetTypeId that was not recognized: %s", not l_game_EngineFeature_0 and "v1" or "v3", l_id_0, v3.toString(v20)));
        else
            v15[v23] = v22;
        end;
    end;
    if not l_game_EngineFeature_0 then
        local v24 = v14.bodyColors or {};
        for v25, v26 in pairs(v24) do
            local l_Color_0 = BrickColor.new(v26).Color;
            local v28 = l_HumanoidDescriptionBodyColorIdToName_0[tostring(v25)];
            if not v2.string(v28) then
                v4(string.format("Avatar's /v1/outfits/%s/details returned a bodyColorId that was not recognized: bodyColorId: %s, bodyColor: %s", l_id_0, v25, v26));
            else
                v15[v28] = l_Color_0;
            end;
        end;
    else
        local v29 = v14.bodyColor3s or {};
        for v30, v31 in pairs(v29) do
            local v32 = l_BodyPartForSkinColoringIdToHumanoidDescription_0[tostring(v30)];
            if not v2.string(v32) then
                v4(string.format("Avatar's /v3/outfits/%s/details returned a BodyPartForSkinColoringId that was not recognized: bodyPartForSkinColoringId = %s, bodyColor3AsHex = %s", l_id_0, v30, v31));
            else
                local l_status_0, l_result_0 = pcall(function()
                    return Color3.fromHex(v31);
                end);
                if not l_status_0 then
                    v4(string.format("Avatar's /v3/outfits/%s/details returned a bodyColor3 with bad hash value: bodyPartForSkinColoringId = %s, bodyColor3AsHex = %s", l_id_0, v30, v31));
                else
                    v15[v32] = l_result_0;
                end;
            end;
        end;
    end;
    for v35, v36 in pairs(v18) do
        local v37 = l_HumanoidDescriptionScaleToName_0[tostring(v35)];
        if not v2.string(v37) then
            v4(string.format("Avatar's /%s/outfits/%s/details returned a scaleType that was not recognized: scaleType: %s, scale: %s", not l_game_EngineFeature_0 and "v1" or "v3", l_id_0, v35, v36));
        else
            v15[v37] = v36;
        end;
    end;
    return v15;
end;
v11.createHumanoidDescription = function(v38)
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    for v40, v41 in pairs(v38) do
        l_HumanoidDescription_0[v40] = v41;
    end;
    return l_HumanoidDescription_0;
end;
return v11;
