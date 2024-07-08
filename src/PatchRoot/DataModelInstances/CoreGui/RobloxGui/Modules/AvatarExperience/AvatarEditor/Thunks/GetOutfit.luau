local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Logging);
local v5 = require(l_CorePackages_0.Packages.Promise);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOutfitInfo);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Models.OutfitInfo);
local v9 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v10 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v11 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromOutfitDetails);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.ReceivedBundleInfoForTryOn);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.HandleTryOnFailure);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.UpdateSortOrderDueToLCBundleLoaded);
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientAvatarUsesColor3sForBodyParts");
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagUseAESGetOutfitDetailsInApp);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v19 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v20 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local function _(v22)
    return v9.OutfitInfoKey .. tostring(v22);
end;
local function _(v24, v25)
    local v26 = v24.AvatarExperience.Common.AssetInfos[v25];
    if not v26 or not v26.receivedFromOutfitDetails then
        return false;
    else
        return true;
    end;
end;
return function(v28, v29, v30, v31)
    v3.isType(v28, "function", "GetOutfit thunk expects networkImpl to be a function");
    v3.isType(v29, "string", "GetOutfit thunk expects outfitId to be a string");
    if not v17() then
        return (l_PerformFetch_0.Single(v9.OutfitInfoKey .. tostring(v29), function(v32)
            local v33 = v32:getState();
            if not v33.AvatarExperience.AvatarEditor.OutfitInfos[v29] then
                return v6.GetOutfit(v28, v29):andThen(function(v34)
                    local v35 = v34 and v34.responseBody;
                    if v35 then
                        local v36 = {};
                        local l_assets_0 = v35.assets;
                        local v38 = {};
                        if l_assets_0 then
                            for _, v40 in l_assets_0, nil, nil do
                                local v41 = tostring(v40.assetType.id);
                                local v42 = tostring(v40.id);
                                v36[v41] = v36[v41] or {};
                                table.insert(v36[v41], v42);
                                local v43 = v33.AvatarExperience.Common.AssetInfos[v42];
                                if not (not not v43 and (v43.receivedFromOutfitDetails and true or false)) then
                                    v38[#v38 + 1] = v40;
                                end;
                            end;
                        end;
                        if #v38 > 0 then
                            v32:dispatch(v12(v38));
                        end;
                        v32:dispatch(v7((v8.fromWebApi(v29, v30, v35, v33.AvatarExperience.AvatarEditor.ExtendedBodyColors))));
                        if v31 then
                            v32:dispatch(v13(v31));
                            v32:dispatch(v15(v31));
                        end;
                    end;
                end, function(_)
                    v4.warn("GetOutfit thunk failed to fetch Outfit details for id " .. v29);
                    if v31 then
                        v32:dispatch(v14(v31));
                    end;
                end);
            else
                return v5.resolve();
            end;
        end));
    else
        return v11.convertAvatarEditorServiceThunk("GetOutfit", function(v45, v46)
            return l_PerformFetch_0.Single(v9.OutfitInfoKey .. tostring(v29), function(v47)
                local v48 = v47:getState();
                if not v48.AvatarExperience.AvatarEditor.OutfitInfos[v29] then
                    return v5.new(function(v49, v50)
                        local l_status_0, l_result_0 = pcall(function()
                            return v46:GetOutfitDetails(tonumber(v29) or 0);
                        end);
                        if not l_status_0 then
                            if v21() then
                                v19(v20.Counter.AvatarEditorServiceErrors.GetOutfitDetails);
                            end;
                            v4.warn("AvatarEditorService failure in GetOutfitDetails for id " .. v29);
                            v50({
                                HttpError = Enum.HttpError.OK
                            });
                            return ;
                        else
                            local v53 = v10.tableToCamelCaseKeys(l_result_0);
                            if v53 then
                                if not l_game_EngineFeature_0 then
                                    local v54 = {};
                                    for v55, v56 in v53.bodyColors, nil, nil do
                                        v54[v55 .. "Id"] = BrickColor.new(v56).Number;
                                    end;
                                    v53.bodyColors = v54;
                                else
                                    v53.bodyColor3s = {};
                                    for v57, v58 in v53.bodyColors, nil, nil do
                                        v53.bodyColor3s[v57 .. "3"] = v58:ToHex();
                                    end;
                                    v53.bodyColors = nil;
                                end;
                                local v59 = {};
                                local l_assets_1 = v53.assets;
                                local v61 = {};
                                if l_assets_1 then
                                    for _, v63 in l_assets_1, nil, nil do
                                        local v64 = tostring(v63.assetType.id);
                                        local v65 = tostring(v63.id);
                                        v59[v64] = v59[v64] or {};
                                        table.insert(v59[v64], v65);
                                        local v66 = v48.AvatarExperience.Common.AssetInfos[v65];
                                        if not (not not v66 and (v66.receivedFromOutfitDetails and true or false)) then
                                            v61[#v61 + 1] = v63;
                                        end;
                                    end;
                                end;
                                if #v61 > 0 then
                                    v47:dispatch(v12(v61));
                                end;
                                v47:dispatch(v7((v8.fromWebApi(v29, v30, v53, v48.AvatarExperience.AvatarEditor.ExtendedBodyColors))));
                                if v31 then
                                    v47:dispatch(v13(v31));
                                    v47:dispatch(v15(v31));
                                end;
                            end;
                            v49(l_result_0);
                            return ;
                        end;
                    end);
                else
                    return v5.resolve();
                end;
            end)(v45);
        end);
    end;
end;
