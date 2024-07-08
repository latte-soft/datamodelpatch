local l_AssetService_0 = game:GetService("AssetService");
local l_AvatarCreationService_0 = game:GetService("AvatarCreationService");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local l_Parent_0 = script.Parent;
local v4 = require(l_Parent_0.Thunks.OpenPublishAssetPrompt);
local v5 = require(l_Parent_0.Thunks.OpenPublishAvatarPrompt);
local v6 = require(l_Parent_0.Thunks.OpenResultModal);
local v7 = require(l_Parent_0.Actions.SetHumanoidModel);
local v8 = require(l_Parent_0.Actions.OpenValidationErrorModal);
local v9 = game:DefineFastFlag("InExperiencePublishDeserializeAsset", false);
local v10 = game:DefineFastFlag("NewInExperienceSerializationFix", false);
local v11 = require(script.Parent.FFlagPublishAvatarPromptEnabled);
local l_game_EngineFeature_0 = game:GetEngineFeature("PromptImportAnimationClipFromVideoAsyncEnabled");
return function(v13)
    local v14 = {};
    table.insert(v14, l_ExperienceAuthService_0.OpenAuthPrompt:Connect(function(v15, v16, v17)
        local v18 = l_game_EngineFeature_0 and v17.isVideoToAnimationFlow;
        if not (not (#v16 == 1 and v16[1] == Enum.ExperienceAuthScope.CreatorAssetsCreate) or v18) then
            if not v10 then
                if not game:GetEngineFeature("AssetServiceDeserializeInstance") or not v9 then
                    if not v11 or not v17.outfitToPublish then
                        v13:dispatch(v4(v17.instanceToPublish, v17.assetType, v15, v16));
                    else
                        v13:dispatch(v5(l_AssetService_0:DeserializeInstance(v17.outfitToPublish), v15, v16));
                        return ;
                    end;
                elseif not v11 or not v17.outfitToPublish then
                    v13:dispatch(v4(l_AssetService_0:DeserializeInstance(v17.serializedInstance), v17.assetType, v15, v16));
                    return ;
                else
                    v13:dispatch(v5(l_AssetService_0:DeserializeInstance(v17.outfitToPublish), v15, v16));
                    return ;
                end;
            elseif not v17.instanceToPublish then
                if not v17.serializedInstance then
                    if not (not v11 or not v17.outfitToPublish) then
                        v13:dispatch(v5(nil, v15, v16));
                        return ;
                    end;
                else
                    v13:dispatch(v4(l_AssetService_0:DeserializeInstance(v17.serializedInstance), v17.assetType, v15, v16));
                    return ;
                end;
            else
                v13:dispatch(v4(v17.instanceToPublish, v17.assetType, v15, v16));
                return ;
            end;
        end;
    end));
    table.insert(v14, l_AssetService_0.OpenPublishResultModal:Connect(function(v19)
        v13:dispatch(v6(v19));
    end));
    local function v20()
        return l_AvatarCreationService_0.UgcValidationSuccess and l_AvatarCreationService_0.UgcValidationFailure;
    end;
    if pcall(v20) then
        table.insert(v14, l_AvatarCreationService_0.UgcValidationSuccess:Connect(function(v21, v22)
            local v23 = v13:getState();
            if v23 and v23.promptRequest.promptInfo.guid == v21 then
                v13:dispatch(v7((l_AssetService_0:DeserializeInstance(v22))));
            end;
        end));
    end;
    if pcall(v20) then
        table.insert(v14, l_AvatarCreationService_0.UgcValidationFailure:Connect(function(v24, v25)
            local v26 = v13:getState();
            if v26 and v26.promptRequest.promptInfo.guid == v24 then
                v13:dispatch(v8(v25));
            end;
        end));
    end;
    return v14;
end;
