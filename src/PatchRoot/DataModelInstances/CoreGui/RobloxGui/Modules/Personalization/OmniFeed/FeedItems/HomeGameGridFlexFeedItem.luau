local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Constants);
local v4 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v10 = require(l_Modules_0.LuaApp.mutedError);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_Modules_0.LuaApp.Components.Games.HomeGameGrid);
local v14 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local v15 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetFeedItemRowData);
local v16 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearFeedItemRowData);
local v17 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetGameGridFlexFeedItemInput);
local v18 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearGameGridFlexFeedItemBounds);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v20 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendationsMetadata);
local v21 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local l_useResponsiveLayout_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Layout.Responsive.useResponsiveLayout;
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local v24 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v25 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v26 = require(l_CorePackages_0.Workspace.Packages.GameTile);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v3.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v3.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local l_FFlagLuaAppPlayButtonStyle_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonStyle;
local l_getFFlagLuaAppSingleHoveredGridTile_0 = v26.Flags.getFFlagLuaAppSingleHoveredGridTile;
local v33 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppConsoleSupportRFY);
local v34 = require(l_Modules_0.Personalization.Flags.FFlagOmniItemsRowDataEnabled);
local v35 = game:DefineFastInt("GameGridFlexFeedItemTileNumPerFeed", 30);
local v36 = game:DefineFastFlag("GameGridFlexFeedItemNoCompatibility", false);
local v37 = game:DefineFastInt("GameGridMetaFetchMaxCompatibility", 300);
return function(v38)
    local v39 = nil;
    local v40 = nil;
    local v41 = nil;
    local v42 = nil;
    local v43 = "Narrow";
    if v38.topicLayoutData then
        v41 = v38.topicLayoutData[v24.TopicLayoutDataKeys.ComponentType];
        if v41 then
            if v41 == v24.ComponentTypeDataKeys.EventTile then
                v43 = "Event";
            elseif v41 == v24.ComponentTypeDataKeys.GridTile then
                v43 = "Wide";
            end;
            local v44 = true;
            if v43 ~= "Wide" then
                v44 = v43 == "Event";
            end;
            v39 = v44;
        end;
        v40 = v38.topicLayoutData[v24.TopicLayoutDataKeys.PlayerCountStyle];
        if l_FFlagLuaAppPlayButtonStyle_0 then
            v42 = v38.topicLayoutData[v24.TopicLayoutDataKeys.PlayButtonStyle];
        end;
    end;
    local v45 = nil;
    if v38.topicLayoutData then
        local v46 = v38.topicLayoutData[v24.TopicLayoutDataKeys.IsSponsoredFooterAllowed];
        local v47 = false;
        if v46 ~= nil then
            v47 = v46 == "true";
        end;
        v45 = v47;
    end;
    local l_appPage_0 = v38[v14.key].appPage;
    assert(l_appPage_0 == v12.Home);
    local l_topicId_0 = v38.topicId;
    local v50 = if not v34 then nil else v38[v14.key].feedItemPosition;
    local l_sortIndex_0 = v38.sortIndex;
    local v52 = v38.topicName or "";
    local l_numberOfRows_0 = v38.numberOfRows;
    local v54, v55 = v2.useState(1);
    local v57 = v25(function(v56)
        return v56.useGridPageLayout();
    end);
    local _ = nil;
    if v33 then
        v57 = v57 and not (l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot);
    end;
    if v57 then
        local _ = nil;
        local v60 = l_useResponsiveLayout_0("columns", if v43 == "Event" then l_LayoutConfig_0.Kind.Experiences.EventTile else if v43 == "Wide" then l_LayoutConfig_0.Kind.Experiences.GridTile else l_LayoutConfig_0.Kind.Experiences.WithFooter) or 1;
        local l_v60_0 = v60 --[[ copy: 18 -> 28 ]];
        v2.useEffect(function()
            v55(l_v60_0);
        end, l_dependencyArray_0(v60));
    end;
    local v62 = v2.useRef(false);
    local v63 = v4(l_RoactAnalyticsCommonGameEvents_0);
    local v64 = v4(v7);
    local v66 = l_useSelector_0(function(v65)
        return v65.FormFactor;
    end);
    local v68 = l_useSelector_0(function(v67)
        return v67.Personalization.TopicContents;
    end);
    local v71 = l_useSelector_0(function(v69)
        local v70 = v69.OmniRecommendations[l_appPage_0];
        if not v70 then
            return {};
        else
            return v70.sorts;
        end;
    end);
    local v75 = l_useSelector_0(function(v72)
        local l_GameGridFlexFeedItemBounds_0 = v72.Personalization.GameGridFlexFeedItemBounds;
        local v74 = not not l_GameGridFlexFeedItemBounds_0[l_topicId_0] and l_GameGridFlexFeedItemBounds_0[l_topicId_0].flexItemsBounds or nil;
        if not v74 then
            return nil;
        else
            return v74[l_sortIndex_0];
        end;
    end);
    local v76 = l_useDispatch_0();
    v2.useEffect(function()
        local _ = nil;
        v76(v17(l_topicId_0, l_sortIndex_0, if not not l_numberOfRows_0 and l_numberOfRows_0 > 0 then v54 * l_numberOfRows_0 else math.floor(v35 / v54) * v54));
        return function()
            v76(v18(l_topicId_0, l_sortIndex_0));
        end;
    end, l_dependencyArray_0(l_topicId_0, l_sortIndex_0, v54, l_numberOfRows_0));
    local v86 = v2.useMemo(function()
        local v78 = nil;
        if l_topicId_0 then
            v78 = not not v68 and v68[l_topicId_0] or nil;
        end;
        local v79 = not not v78 and v78.entries or {};
        if v36 then
            if not (not v78 or not v78.hasMoreRows) then
                v10("Infinite SortlessGrid should have full topic entries in every feed");
            end;
        elseif not v62.current then
            local v80 = 0;
            for _, v82 in ipairs(v71) do
                if v82.topicId == l_topicId_0 then
                    v80 = v80 + 1;
                end;
            end;
            if v80 <= 1 then
                v62.current = true;
                v76(v21(v20(v64, l_appPage_0, l_sortIndex_0, v37)));
                return v79;
            end;
        else
            return v79;
        end;
        local v83 = {};
        local v84 = not not v75 and v75.firstIndex or nil;
        if v84 ~= nil then
            local v85 = v84 + (not not v75 and v75.numberOfTiles or 0);
            while v84 <= #v79 and v84 < v85 do
                table.insert(v83, v79[v84]);
                v84 = v84 + 1;
            end;
        end;
        return v83;
    end, l_dependencyArray_0(l_topicId_0, v68, v71, v75));
    local v87 = nil;
    if v34 then
        v87 = l_useSelector_0(function(v88)
            local v89 = v88.Personalization.OmniItemsRowData[l_appPage_0] or {};
            if not v50 then
                return nil;
            else
                return v89[v50];
            end;
        end);
        v2.useEffect(function()
            v76(v15(l_appPage_0, v50, (math.ceil(#v86 / v54))));
            return function()
                v76(v16(l_appPage_0, v50));
            end;
        end, l_dependencyArray_0(l_appPage_0, v86, v50, v54, not not v87 and v87.feedItem or nil));
    end;
    local v91 = v2.useMemo(function()
        local v90 = nil;
        if l_topicId_0 then
            v90 = not not v68 and v68[l_topicId_0] or nil;
        end;
        return not not v90 and v90.updatedTimestamp or nil;
    end, l_dependencyArray_0(l_topicId_0, v68));
    if #v86 > 0 then
        return v2.createElement(v13, {
            externalPadding = if v66 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0, 
            analytics = v63, 
            gameGridTitle = v52, 
            friendFooterEnabled = true, 
            sortIndex = l_sortIndex_0, 
            itemRowData = v87, 
            topicId = l_topicId_0, 
            gameGridContents = v86, 
            scrollViewPositionChangedSignal = v38[v14.key].scrollViewPositionChangedSignal, 
            onItemsPerRowChanged = function(v92)
                v55(v92);
            end, 
            dataUpdatedTimestamp = v91, 
            useGridTiles = v39, 
            playerCountStyle = v40, 
            isSponsoredFooterAllowed = v45, 
            componentType = v41, 
            gameTileLayoutType = if not l_getFFlagLuaAppSingleHoveredGridTile_0() then nil else v43, 
            playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v42
        });
    else
        return nil;
    end;
end;
