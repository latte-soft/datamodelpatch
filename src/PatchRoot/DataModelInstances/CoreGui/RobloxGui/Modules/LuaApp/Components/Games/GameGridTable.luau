local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_ResponsiveGrid_0 = require(l_CorePackages_0.Packages.UIBlox).App.Container.Grid.ResponsiveGrid;
local v4 = require(l_CorePackages_0.Workspace.Packages.GameTile);
local l_AppGameTile_0 = v4.AppGameTile;
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_OpenGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetail).OpenGameDetails;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v11 = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo);
local l_GetFFlagGridHoverTile_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGridHoverTile;
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagOptScrollingEventing);
local l_FFlagLuaAppRefactorOpenGameDetail_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppRefactorOpenGameDetail;
local l_FFlagLuaAppPlayButtonStyle_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonStyle;
local l_getFFlagLuaAppSingleHoveredGridTile_0 = v4.Flags.getFFlagLuaAppSingleHoveredGridTile;
local function v18(v17)
    if not v17.featured then
        return 1;
    else
        return 2;
    end;
end;
return function(v19)
    local v20 = nil;
    v20 = if not v19.useGridTiles then l_LayoutConfig_0.Kind.Experiences.WithFooter else l_LayoutConfig_0.Kind.Experiences.GridTile;
    local v21 = v19.entries or {};
    local v22 = v19.gameEmphasis or false;
    local v28 = v1.useMemo(function()
        return v2.Array.map(v21, function(v23, v24)
            local l_assign_0 = v2.Object.assign;
            local v26 = {
                index = v24
            };
            local v27 = false;
            if v24 == 1 then
                v27 = v22;
            end;
            v26.featured = v27;
            return l_assign_0(v26, v23);
        end);
    end, {
        v21, 
        v22
    });
    local v29 = nil;
    if l_FFlagLuaAppRefactorOpenGameDetail_0 then
        local v30 = l_useDispatch_0();
        local v31 = l_useNavigation_0();
        local l_v30_0 = v30 --[[ copy: 6 -> 16 ]];
        local l_v31_0 = v31 --[[ copy: 7 -> 17 ]];
        v29 = v1.useCallback(function(v34, v35)
            l_v30_0(l_OpenGameDetails_0(v34, l_v31_0, v35));
        end, {
            v31
        });
    end;
    local v36 = v19.windowSize or Vector2.one;
    local l_source_0 = v19.source;
    local l_referralSource_0 = v19.referralSource;
    local l_hideGameStats_0 = v19.hideGameStats;
    local v40 = not l_GetFFlagGridHoverTile_0() and true or (not (v19.useHoverTile ~= nil) or v19.useHoverTile);
    local l_reportGameDetailOpened_0 = v19.reportGameDetailOpened;
    local l_reportExperienceLaunched_0 = v19.reportExperienceLaunched;
    local v43 = v19.showFriendActivity or false;
    local v46 = v1.useCallback(function(v44, v45)
        if not v44.featured then
            return v1.createElement(l_AppGameTile_0, {
                entry = v44, 
                index = v44.realGameEntryIndex or v44.index, 
                source = l_source_0, 
                reportGameDetailOpened = l_reportGameDetailOpened_0, 
                reportExperienceLaunched = l_reportExperienceLaunched_0, 
                hideGameStats = l_hideGameStats_0, 
                referralSource = l_referralSource_0, 
                rowNum = math.ceil(v44.index / (v45.columns or 1)), 
                showFriendActivity = v43, 
                playerCountStyle = v19.playerCountStyle, 
                isSponsoredFooterAllowed = v19.isSponsoredFooterAllowed, 
                useHoverTile = v40, 
                useGridTile = v19.useGridTiles, 
                friendFooterEnabled = not not v19.useGridTiles or nil, 
                impressionsTag = v19.impressionsTag, 
                launchExperienceEventContext = v19.launchExperienceEventContext, 
                topicId = v19.topicId, 
                gameTileLayoutType = if not l_getFFlagLuaAppSingleHoveredGridTile_0() then nil else v19.gameTileLayoutType, 
                navigateToGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v29, 
                playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v19.playButtonStyle
            });
        else
            return v1.createElement(v11, {
                entry = v44, 
                index = v44.realGameEntryIndex or v44.index, 
                source = l_source_0, 
                reportGameDetailOpened = l_reportGameDetailOpened_0, 
                reportExperienceLaunched = l_reportExperienceLaunched_0, 
                hasBackground = true, 
                hasActionRow = true, 
                isDynamic = true, 
                impressionsTag = v19.impressionsTag, 
                launchExperienceEventContext = v19.launchExperienceEventContext
            });
        end;
    end, {
        l_source_0, 
        l_referralSource_0, 
        l_hideGameStats_0, 
        v43, 
        l_reportGameDetailOpened_0, 
        l_reportExperienceLaunched_0, 
        v19.impressionsTag, 
        v19.launchExperienceEventContext, 
        v19.playerCountStyle, 
        v19.useGridTiles, 
        v19.isSponsoredFooterAllowed, 
        if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v19.playButtonStyle
    });
    local v47 = if not v19.screenSize then v36.Y else v19.screenSize.Y;
    return v1.createElement(l_ResponsiveGrid_0, {
        kind = v20, 
        data = v28, 
        renderItem = v46, 
        layoutOrder = v19.LayoutOrder, 
        getCellColspan = v18, 
        getCellRowspan = v18, 
        absoluteWindowTop = 0, 
        absoluteWindowHeight = v47 + 1 * v47, 
        enableDeferredRefPropEvents = v13()
    });
end;
