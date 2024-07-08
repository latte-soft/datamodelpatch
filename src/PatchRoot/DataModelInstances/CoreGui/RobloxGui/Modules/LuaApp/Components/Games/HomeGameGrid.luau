local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v8 = require(l_Modules_0.LuaApp.AppPage);
local v9 = require(l_Modules_0.LuaApp.Constants);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v12 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v13 = require(l_Modules_0.LuaApp.Components.Games.GameGrid);
local v14 = require(l_Modules_0.LuaApp.Components.SectionHeader);
local l_GridMetrics_0 = v5.App.Grid.GridMetrics;
local l_withGridConfig_DEPRECATED_0 = v5.Core.Layout.Grid.withGridConfig_DEPRECATED;
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local v18 = require(l_Modules_0.LuaApp.Components.Games.GameGridTable);
local v19 = require(l_Modules_0.Personalization.Games.GameSortImpressionsDetector);
local v20 = require(l_Modules_0.Personalization.Games.SendGameImpressions);
local l_gamePlayIntent_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceAnalytics).Events.gamePlayIntent;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_FFlagLuaAppPlayButtonStyle_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonStyle;
local l_getFFlagLuaAppSingleHoveredGridTile_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).Flags.getFFlagLuaAppSingleHoveredGridTile;
local v27 = game:DefineFastFlag("FixSortlessGridAlignHugeScreen", false);
local v28 = game:DefineFastFlag("LuaAppHomeGameGridReportExperienceLaunched", false);
local v29 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppAddSortPosHomeGridClickEvent);
local v30 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppConsoleSupportRFY);
local v31 = v2.PureComponent:extend("HomeGameGrid");
v31.validateProps = v4.strictInterface({
    friendFooterEnabled = v4.optional(v4.boolean), 
    externalPadding = v4.number, 
    numberOfRows = v4.optional(v4.number), 
    gameGridTitle = v4.optional(v4.string), 
    analytics = v4.table, 
    sortIndex = v4.number, 
    itemRowData = v4.optional(v4.table), 
    topicId = v4.string, 
    scrollViewPositionChangedSignal = v4.table, 
    onItemsPerRowChanged = v4.optional(v4.callback), 
    gameGridContents = v4.table, 
    dataUpdatedTimestamp = v4.optional(v4.number), 
    useGridTiles = v4.optional(v4.boolean), 
    playerCountStyle = v4.optional(v4.string), 
    isSponsoredFooterAllowed = v4.optional(v4.boolean), 
    componentType = v4.optional(v4.string), 
    gameTileLayoutType = if not l_getFFlagLuaAppSingleHoveredGridTile_0() then nil else v4.optional(v4.string), 
    playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v4.optional(v4.string), 
    screenSize = v4.Vector2, 
    useGridPageLayout = v4.optional(v4.boolean), 
    eventIngest = v4.table, 
    appAnalytics = v4.table, 
    horizontalMargin = if not v30 then nil else v4.optional(v4.number), 
    headerFont = if not v30 then nil else v4.optional(v4.enum(Enum.Font)), 
    headerTextSize = if not v30 then nil else v4.optional(v4.number)
});
v31.defaultProps = {
    numberOfRowsToShow = nil, 
    friendFooterEnabled = false
};
v31.init = function(v32)
    v32.containerRef = v2.createRef();
    v32.state = {
        contentSize = Vector2.new(0, 0)
    };
    v32.isMounted = false;
    v32.onAbsoluteContentSizeChanged = function(v33)
        local l_AbsoluteContentSize_0 = v33.AbsoluteContentSize;
        if v32.state.contentSize == l_AbsoluteContentSize_0 then
            return ;
        else
            if l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                v32:setState({
                    contentSize = l_AbsoluteContentSize_0
                });
            end;
            return ;
        end;
    end;
    v32.reportGameDetailOpened = function(v35)
        local l_gameGridContents_0 = v32.props.gameGridContents;
        local l_analytics_0 = v32.props.analytics;
        if l_gameGridContents_0 and v32.isMounted then
            local v38 = l_gameGridContents_0[v35];
            l_analytics_0.reportOpenGameDetailWithId(v38.placeId, v32.props.topicId, nil, if not v29() then nil else v32.props.sortIndex, v35, nil, v38.isSponsored, v38.universeId, v8.Home);
            return ;
        else
            return ;
        end;
    end;
    v32.sendGameImpressions = function(v39, v40)
        v20.sendFromTopicContents(v32.props.eventIngest, v32.props.appAnalytics, v39, v32.props.gameGridContents, v8.Home, v32.props.topicId, v32.props.sortIndex, v32.props.itemRowData, nil, nil, v40, v32.props.useGridTiles, v32.props.componentType);
    end;
    v32.onItemsPerRowChanged = function(v41)
        v32.itemsPerRow = v41;
        if v32.props.onItemsPerRowChanged then
            v32.props.onItemsPerRowChanged(v41);
        end;
    end;
    v32.renderSectionHeader = function(v42)
        if not v32.props.useGridPageLayout then
            return v2.createElement(v14, {
                text = v42, 
                layoutOrder = 1, 
                Font = if not v30 then nil else v32.props.headerFont, 
                TextSize = if not v30 then nil else v32.props.headerTextSize
            });
        else
            return l_withGridConfig_DEPRECATED_0({
                margin = 0, 
                width = -1
            }, if not v32.props.useGridTiles then l_LayoutConfig_0.Kind.Experiences.WithFooter else l_LayoutConfig_0.Kind.Experiences.GridTile)(function(v43)
                if v43.margin > 0 then
                    return v2.createElement("Frame", {
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        HeaderMaxWidth = if not not v27 and v43.width > 0 then v2.createElement("UISizeConstraint", {
                            MaxSize = Vector2.new(v43.width, v9.SECTION_HEADER_HEIGHT)
                        }) else nil, 
                        Padding = v2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v43.margin), 
                            PaddingRight = UDim.new(0, v43.margin)
                        }), 
                        Header = v2.createElement(v14, {
                            text = v42, 
                            Font = if not v30 then nil else v32.props.headerFont, 
                            TextSize = if not v30 then nil else v32.props.headerTextSize
                        })
                    });
                else
                    return v2.createElement(v14, {
                        text = v42, 
                        layoutOrder = 1, 
                        Font = if not v30 then nil else v32.props.headerFont, 
                        TextSize = if not v30 then nil else v32.props.headerTextSize
                    });
                end;
            end);
        end;
    end;
    v32.renderImpressionDetector = function(v44)
        if not v32.props.useGridPageLayout then
            return v2.createElement(v19, {
                parentRef = v32.containerRef, 
                pageContext = v8.Home, 
                impressionsTag = v44, 
                scrollViewPositionChangedSignal = v32.props.scrollViewPositionChangedSignal, 
                sendGameImpressions = function(v45)
                    v32.sendGameImpressions(v45, v32.itemsPerRow);
                end, 
                dataUpdatedTimestamp = v32.props.dataUpdatedTimestamp or nil
            });
        else
            return l_withGridConfig_DEPRECATED_0({
                columns = 1
            }, if not v32.props.useGridTiles then l_LayoutConfig_0.Kind.Experiences.WithFooter else l_LayoutConfig_0.Kind.Experiences.GridTile)(function(v46)
                return v2.createElement(v19, {
                    parentRef = v32.containerRef, 
                    pageContext = v8.Home, 
                    impressionsTag = v44, 
                    scrollViewPositionChangedSignal = v32.props.scrollViewPositionChangedSignal, 
                    sendGameImpressions = function(v47)
                        v32.sendGameImpressions(v47, v46.columns or 1);
                    end, 
                    dataUpdatedTimestamp = v32.props.dataUpdatedTimestamp or nil
                });
            end);
        end;
    end;
    if v28 then
        v32.reportExperienceLaunched = function(v48, v49)
            l_gamePlayIntent_0(v32.props.eventIngest, v9.AnalyticsContext.ExperienceTile, {
                placeId = v48.placeId, 
                rootPlaceId = tonumber(v48.placeId), 
                sortIndex = tostring(v32.props.sortIndex), 
                sortEntryIndex = tostring(v48.index), 
                referralSource = v49
            });
        end;
    end;
end;
v31.didMount = function(v50)
    v50.isMounted = true;
end;
v31.willUnmount = function(v51)
    v51.isMounted = false;
end;
v31.render = function(v52)
    local l_gameGridContents_1 = v52.props.gameGridContents;
    local v54 = v52.props.gameGridTitle or "";
    local l_screenSize_0 = v52.props.screenSize;
    local l_layoutOrder_0 = v52.props.layoutOrder;
    local l_numberOfRowsToShow_0 = v52.props.numberOfRowsToShow;
    local l_friendFooterEnabled_0 = v52.props.friendFooterEnabled;
    local l_externalPadding_0 = v52.props.externalPadding;
    local l_contentSize_0 = v52.state.contentSize;
    local l_getSmallMetrics_0 = l_GridMetrics_0.getSmallMetrics;
    local v62 = "HomeGameGrid_" .. tostring(v52.props.topicId) .. "_" .. tostring(v52.props.sortIndex);
    local v63 = Vector2.new(l_contentSize_0.X, l_screenSize_0.Y);
    local v64 = nil;
    local v65 = nil;
    if v30 then
        v64 = not v52.props.useGridPageLayout or v52.props.horizontalMargin ~= nil;
        v65 = v52.props.horizontalMargin or v52.props.externalPadding;
    end;
    return v2.createElement("Frame", {
        Size = if not v27 then nil else UDim2.fromScale(1, 0), 
        AutomaticSize = if not v27 then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        [v2.Ref] = v52.containerRef
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = if not v27 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v54 ~= "" and UDim.new(0, 12) or nil, 
            [v2.Change.AbsoluteContentSize] = v52.onAbsoluteContentSizeChanged
        }), 
        Padding = if not v30 then if v52.props.useGridPageLayout then nil else v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_externalPadding_0), 
            PaddingRight = UDim.new(0, l_externalPadding_0)
        }) else v64 and v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v65), 
            PaddingRight = UDim.new(0, v65)
        }) or nil, 
        SectionHeader = v52.renderSectionHeader(v54), 
        GameGrid = v2.createElement(if not v52.props.useGridPageLayout then v13 else v18, {
            LayoutOrder = 2, 
            entries = l_gameGridContents_1, 
            reportGameDetailOpened = v52.reportGameDetailOpened, 
            numberOfRowsToShow = l_numberOfRowsToShow_0, 
            windowSize = v63, 
            screenSize = l_screenSize_0, 
            useGridTiles = v52.props.useGridTiles, 
            playerCountStyle = v52.props.playerCountStyle, 
            isSponsoredFooterAllowed = v52.props.isSponsoredFooterAllowed, 
            friendFooterEnabled = l_friendFooterEnabled_0, 
            getItemMetrics = l_getSmallMetrics_0, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            showFriendActivity = true, 
            onItemsPerRowChanged = v52.onItemsPerRowChanged, 
            impressionsTag = v62, 
            launchExperienceEventContext = v9.AnalyticsContext.ExperienceTile, 
            topicId = v52.props.topicId, 
            reportExperienceLaunched = if not v28 then nil else v52.reportExperienceLaunched, 
            gameTileLayoutType = if not l_getFFlagLuaAppSingleHoveredGridTile_0() then nil else v52.props.gameTileLayoutType, 
            playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v52.props.playButtonStyle
        }), 
        GameSortImpressionsDetector = v52.renderImpressionDetector(v62)
    });
end;
v31 = v3.connect(function(v66, _)
    return {
        screenSize = v66.ScreenSize
    };
end)(v31);
if v30 then
    local l_v31_0 = v31;
    v31 = function(v69)
        local v70 = l_useUiModeInfo_0();
        local v71 = l_useDesignTokens_0();
        local l_Header_0 = v71.Semantic.Typography.Header;
        if v70.uiMode == l_UiMode_0.TenFoot then
            return v2.createElement(l_v31_0, (v6.Dictionary.join(v69, {
                horizontalMargin = v71.Global.Space_800, 
                headerFont = l_Header_0.Font, 
                headerTextSize = l_Header_0.FontSize, 
                useGridPageLayout = false
            })));
        else
            return v2.createElement(l_v31_0, v69);
        end;
    end;
end;
return l_RoactServices_0.connect({
    eventIngest = v12, 
    appAnalytics = v7
})((l_RoactAppPolicy_0.connect(function(v73, _)
    return {
        useGridPageLayout = v73.useGridPageLayout()
    };
end)(v31)));
