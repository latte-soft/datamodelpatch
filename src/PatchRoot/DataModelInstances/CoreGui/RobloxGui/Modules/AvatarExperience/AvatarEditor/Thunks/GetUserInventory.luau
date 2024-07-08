local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageFinished);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromInventoryFetch);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v10 = require(l_CorePackages_0.Logging);
local v11 = require(l_CorePackages_0.Promise);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v14 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v15 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local function _(v18, v19)
    local v20 = v18.AvatarExperience.Common.AssetInfos[v19];
    if not v20 or not v20.receivedFromInventoryFetch then
        return false;
    else
        return true;
    end;
end;
local function v37(v22, v23, v24, v25, v26, v27)
    local v28 = v23:getState();
    local v29 = v12.tableToCamelCaseKeys((v24:GetCurrentPage()));
    local v30 = {};
    local v31 = {};
    for _, v33 in v29, nil, nil do
        local v34 = tostring(v33.assetId);
        v31[#v31 + 1] = v34;
        local v35 = v28.AvatarExperience.Common.AssetInfos[v34];
        if not (not not v35 and (v35.receivedFromInventoryFetch and true or false)) then
            v30[#v30 + 1] = v33;
        end;
    end;
    if #v30 > 0 then
        v23:dispatch(v7(v30));
    end;
    v23:dispatch(v6(v22, v24.IsFinished));
    v25:storePageObject(v22, v24);
    v23:dispatch(v5(v27 or v22, v31));
    local v36 = nil;
    if v24.IsFinished then
        v36 = v8.ReachedLastPage;
    end;
    v26(v36);
end;
local function v47(v38, v39, v40, v41, v42, v43, v44)
    local l_status_0, l_result_0 = pcall(function()
        v40:AdvanceToNextPageAsync();
    end);
    if not l_status_0 then
        v10.warn("GetUserInventory failure: " .. l_result_0);
        v43();
        return ;
    else
        v37(v38, v39, v40, v41, v42, v44);
        return ;
    end;
end;
local function v61(v48, v49, v50, v51, v52, v53, v54, v55)
    local l_status_1, l_result_1 = pcall(function()
        local v56 = {};
        for _, v58 in v49, nil, nil do
            table.insert(v56, (v12.AssetTypeIdStringToEnumValue(v58)));
        end;
        return v52:GetInventory(v56);
    end);
    if not l_status_1 then
        if v17() then
            v15(v16.Counter.AvatarEditorServiceErrors.GetInventory);
        end;
        v10.warn("GetUserInventory failure: " .. l_result_1);
        v54();
        return ;
    else
        v37(v48, v50, l_result_1, v51, v53, v55);
        return ;
    end;
end;
return function(v62, v63, v64)
    v3.isType(v62, "table", "GetUserInventory thunk expects categoryInfo to be a table");
    return v14.convertPaginatedFetchThunk("GetUserInventory", function(v65, v66, v67)
        local v68, v69 = v13.getSearchUuidAndAssetTypes(v62, v65:getState().AvatarExperience.AvatarEditor.Categories.subButton);
        if v68 then
            v68 = v63 or v68;
            return l_PerformFetch_0.Single(v9.UserInventoryKey .. v68, function(v70)
                local v71 = v66:getPageObject(v68);
                if not v71 or not v71.IsFinished then
                    return v11.new(function(v72, v73)
                        if v71 == nil then
                            v61(v68, v69, v70, v66, v67, v72, v73, v64);
                            return ;
                        else
                            v47(v68, v70, v71, v66, v72, v73, v64);
                            return ;
                        end;
                    end);
                else
                    return v11.resolve(v8.ReachedLastPage);
                end;
            end)(v65);
        else
            return v11.resolve("No SearchUuid");
        end;
    end);
end;
