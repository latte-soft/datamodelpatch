local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRecommendedItemsV2);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromAvatarEditorRecommendedItemsV2);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBundleInfoFromAvatarEditorRecommendedItemsV2);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function _(v13)
    return v10.RecommendedItemsKey .. tostring(v13);
end;
return function(v15, v16, v17)
    return function(v18)
        v4.isType(v15, "function", "GetRecommendedItems thunk expects networkImpl");
        v4.isTypeOrNil(v16, "string", "GetRecommendedItems thunk expects assetTypeIdString");
        v4.isType(v17, "string", "GetRecommendedItems thunk expects recommendationsType");
        if v17 and v17 ~= v11.RecommendationsType.None then
            local l_v16_0 = v16;
            local l_v16_1 = v16;
            local v21 = true;
            if v17 ~= v11.RecommendationsType.Asset then
                l_v16_0 = v17;
                v21 = false;
                if v17 == v11.RecommendationsType.BodyParts then
                    l_v16_1 = v10.BundleTypeIdStrings.BodyParts;
                elseif v17 == v11.RecommendationsType.AvatarAnimations then
                    l_v16_1 = v10.BundleTypeIdStrings.Animations;
                elseif v17 == v11.RecommendationsType.Shoes then
                    l_v16_1 = v10.BundleTypeIdStrings.Shoes;
                elseif v17 == v11.RecommendationsType.DynamicHeads then
                    l_v16_1 = v10.BundleTypeIdStrings.DynamicHead;
                end;
            end;
            return l_PerformFetch_0.Single(v10.RecommendedItemsKey .. tostring(l_v16_0), function(v22)
                return v9.GetRecommendations(v15, l_v16_1, v21):andThen(function(v23)
                    local v24 = (v23 and v23.responseBody) and v23.responseBody.data;
                    if not v24 then
                        v2.warn("Response from GetRecommendations with recommendationId of " .. tostring(l_v16_1) .. " is malformed");
                        return v3.reject({
                            HttpError = Enum.HttpError.OK
                        });
                    else
                        if not v21 then
                            v22:dispatch(v8(v24));
                        else
                            v22:dispatch(v7(v24, v16));
                        end;
                        v22:dispatch(v6(v24, l_v16_0));
                        return v3.resolve(v24);
                    end;
                end);
            end)(v18);
        else
            return nil;
        end;
    end;
end;
