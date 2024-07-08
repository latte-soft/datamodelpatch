local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Packages.React);
local l_PillGroup_0 = require(l_CorePackages_0.UIBlox).App.Control.PillGroup;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v7 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCatalogTopics);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useSelectedTopics);
local v11 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectCatalogCategoryIndex);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectCatalogSubcategoryIndex);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout);
local v17 = require(l_Modules_0.AvatarExperience.Common.Hooks.useNavigationFocusCallbacks);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.NavigateToSearch);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useSearchParameters);
local v22 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v23 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.topics");
local v24 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixTopicNoResultsShimmer);
local v25 = game:DefineFastInt("AXTopicsNumInitialItems", 10);
local function v30(v26, v27)
    for _, v29 in v26, nil, nil do
        if not v3.List.find(v27, v29) then
            return v29;
        end;
    end;
    return nil;
end;
local v34 = l_memoize_0(function(v31)
    return v3.List.filterMap(v31, function(v32, v33)
        if v25 < v33 then
            return nil;
        else
            return {
                targetId = tonumber(v32.id) or 0, 
                itemType = v32.type
            };
        end;
    end);
end);
local function v59(v35)
    local v36 = v34(v35.items or {});
    local l_searchKeyword_0 = v35.searchKeyword;
    local v38, v39 = v10();
    local v40, v41 = v9(v38, v36, l_searchKeyword_0);
    local v42 = v11(v6);
    local v43 = v11(v7);
    local v44 = l_useSelector_0(v13);
    local v45 = l_useSelector_0(v14);
    local function v51(v46)
        local l_v40_0 = v40;
        local l_v38_0 = v38;
        if #v38 < #v46 then
            local v49 = v46[#v46];
            v42.selectTopic(v49, v3.List.find(v40, v49) or 0, v44, v45, nil, l_v40_0, l_v38_0);
            return ;
        elseif #v46 == #v38 - 1 then
            local v50 = v30(v38, v46);
            if not v50 then
                v23:warning("sendTopicsChangedAnalyticsEvent, removedTopic not found: {} -> {}", v38, v46);
                return ;
            else
                v42.deselectTopic(v50, v3.List.find(v40, v50) or 0, v44, v45, nil, l_v40_0, l_v38_0);
                return ;
            end;
        elseif #v46 == 0 then
            v42.clearAllTopics(v38, v44, v45, nil, l_v40_0);
            return ;
        else
            v23:warning("sendTopicsChangedAnalyticsEvent, invalid change: {} -> {}", v38, v46);
            return ;
        end;
    end;
    local v52 = l_useDispatch_0();
    local v53 = l_useNavigation_0();
    local v54 = v21();
    local function v56(v55)
        v51(v55);
        if not v35.searchKeyword then
            v39(v55);
        else
            v54 = v54 or {};
            assert(v54, "");
            v39(v55);
            v52(v20(v53, v54));
        end;
        v52(v22(v43, v53.state.routeName));
    end;
    v17({
        onDidFocus = v4.useCallback(function()
            local v57 = not not v35.frameRef and v35.frameRef.current or nil;
            local v58 = not not v57 and v57:FindFirstChildWhichIsA("ScrollingFrame", true) or nil;
            if v58 then
                v58.Visible = not v58.Visible;
                v58.Visible = not v58.Visible;
            end;
        end, {
            v35.frameRef
        })
    });
    return v4.createElement(v16, {
        height = v8.PillBarHeight, 
        layoutOrder = v35.layoutOrder, 
        showFilterButton = true, 
        layoutRef = v35.frameRef, 
        NextSelectionUp = v35.NextSelectionUp, 
        NextSelectionDown = v35.NextSelectionDown
    }, {
        Topics = v4.createElement(l_PillGroup_0, {
            layoutOrder = 2, 
            pills = v40, 
            selectedPills = v38, 
            isLoading = v41, 
            onSelectionChanged = v56, 
            leftPadding = 0
        })
    });
end;
if v24() then
    v59 = v4.memo(v59);
end;
return v59;
