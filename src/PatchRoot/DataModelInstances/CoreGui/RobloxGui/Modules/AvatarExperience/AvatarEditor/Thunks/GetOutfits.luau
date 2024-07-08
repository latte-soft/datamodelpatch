local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfit);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageFinished);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v14 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local function _(v17, v18, v19)
    return v17 .. "." .. tostring(v18) .. tostring(v19);
end;
local function v36(v21, v22, v23, v24, v25, v26, v27, v28, v29)
    local v30 = v12.tableToCamelCaseKeys((v25:GetCurrentPage()));
    local v31 = {};
    for _, v33 in v30, nil, nil do
        local v34 = tostring(v33.id);
        v31[#v31 + 1] = v34;
        if v24:getState().AvatarExperience.AvatarEditor.OutfitInfos[v34] == nil then
            v24:dispatch(v6(v21, v34));
        end;
    end;
    local v35 = nil;
    if v25.IsFinished then
        v35 = v10.ReachedLastPage;
        v24:dispatch(v9(v28 or v22, v25.IsFinished));
    end;
    v26:storePageObject(v22 .. "." .. tostring(v23) .. tostring(v29), v25);
    v24:dispatch(v8(v31, v10.OutfitOrAsset.Outfit));
    v24:dispatch(v7(v22, v31));
    v27(v35);
end;
local function v49(v37, v38, v39, v40, v41, v42, v43, v44, v45, v46)
    local l_status_0, l_result_0 = pcall(function()
        v42:AdvanceToNextPageAsync();
    end);
    if not l_status_0 then
        v2.warn("GetOutfits failure: " .. l_result_0);
        v41(l_result_0);
        return ;
    else
        v36(v37, v38, v44, v39, v42, v43, v40, v45, v46);
        return ;
    end;
end;
local function v62(v50, v51, v52, v53, v54, v55, v56, v57, v58, v59)
    local l_status_1, l_result_1 = pcall(function()
        return v57:GetOutfits(v56, v59);
    end);
    if not l_status_1 then
        v2.warn("GetOutfits failure: " .. l_result_1);
        if v16() then
            v14(v15.Counter.AvatarEditorServiceErrors.GetOutfits);
        end;
        v54(l_result_1);
        return ;
    else
        v36(v50, v51, v56, v52, l_result_1, v55, v53, v58, v59);
        return ;
    end;
end;
return function(v63, v64, v65, v66, v67)
    v5.isType(v63, "function", "GetOutfits thunk expects networkImpl to be a function");
    v5.isTypeOrNil(v65, "boolean", "GetOutfits thunk expects onlyEditableOutfits to be a boolean or nil");
    v5.isTypeOrNil(v67, "string", "GetOutfits thunk expects outfitType to be a string or nil");
    local v68 = v66 or v64;
    return v13.convertPaginatedFetchThunk("GetUserOutfits", function(v69, v70, v71)
        return l_PerformFetch_0.Single(v11.OutfitsKey .. v68, function(v72)
            local v73 = nil;
            v73 = if v65 == nil then Enum.OutfitSource.All else if v65 then Enum.OutfitSource.Created else Enum.OutfitSource.Purchased;
            local l_All_0 = Enum.OutfitType.All;
            if v67 == v11.OutfitTypes.Avatar then
                l_All_0 = Enum.OutfitType.Avatar;
            elseif v67 == v11.OutfitTypes.DynamicHead then
                l_All_0 = Enum.OutfitType.DynamicHead;
            end;
            local v75 = v70:getPageObject(v64 .. "." .. tostring(v73) .. tostring(l_All_0));
            if not v75 or not v75.IsFinished then
                return v3.new(function(v76, v77)
                    if v75 ~= nil then
                        v49(v63, v64, v72, v76, v77, v75, v70, v73, v66, l_All_0);
                        return ;
                    else
                        v62(v63, v64, v72, v76, v77, v70, v73, v71, v66, l_All_0);
                        return ;
                    end;
                end);
            else
                return v3.resolve(v10.ReachedLastPage);
            end;
        end)(v69);
    end);
end;
