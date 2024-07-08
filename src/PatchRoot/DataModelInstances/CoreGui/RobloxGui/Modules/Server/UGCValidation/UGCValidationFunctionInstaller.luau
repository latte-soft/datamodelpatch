local l_AssetService_0 = game:GetService("AssetService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v3 = require(l_CorePackages_0.UGCValidation);
local v4 = game:DefineFastFlag("MoveUGCValidationFunctionFeature", false) and game:GetEngineFeature("MoveUGCValidationFromAssetService");
local l_game_EngineFeature_0 = game:GetEngineFeature("EngineUGCValidateEditableMeshAndImage");
local l_game_EngineFeature_1 = game:GetEngineFeature("EngineUGCValidationCallbackResultStrings");
local function v26(v7)
    local l_instances_0 = v7.instances;
    local l_assetType_0 = v7.assetType;
    local l_isServer_0 = v7.isServer;
    local l_fullBodyData_0 = v7.fullBodyData;
    local l_allowUnreviewedAssets_0 = v7.allowUnreviewedAssets;
    local l_restrictedUserIds_0 = v7.restrictedUserIds;
    local l_token_0 = v7.token;
    local l_universeId_0 = v7.universeId;
    local v16 = {
        skipSnapshot = true
    };
    local v17 = nil;
    local v18 = nil;
    if not v4 then
        local v19, v20 = v3.validate(l_instances_0, l_assetType_0, l_isServer_0, l_allowUnreviewedAssets_0, l_restrictedUserIds_0, l_token_0);
        v17 = v19;
        v18 = v20;
    elseif not l_fullBodyData_0 then
        local v21, v22 = v3.validate(l_instances_0, l_assetType_0, l_isServer_0, l_allowUnreviewedAssets_0, l_restrictedUserIds_0, l_token_0, l_universeId_0, l_game_EngineFeature_0, v16);
        v17 = v21;
        v18 = v22;
    else
        local v23, v24 = v3.validateFullBody(l_fullBodyData_0, l_isServer_0, l_game_EngineFeature_0);
        v17 = v23;
        v18 = v24;
    end;
    if v17 then
        if not l_game_EngineFeature_1 then
            return true, "Success";
        else
            return true, {
                "Success"
            };
        end;
    elseif not l_game_EngineFeature_1 then
        local v25 = "";
        if v18 then
            v25 = table.concat(v18, "\n");
        end;
        return false, v25;
    else
        return false, v18;
    end;
end;
return function()
    if not v4 then
        l_AssetService_0:RegisterUGCValidationFunction(v26);
        return ;
    else
        l_UGCValidationService_0:RegisterUGCValidationFunction(v26);
        return ;
    end;
end;
