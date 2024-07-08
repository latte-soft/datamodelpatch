local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_memoize_0 = v7.memoize;
local l_Signal_0 = v7.Signal;
local v10 = require(l_CorePackages_0.tutils);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_TenFootUiGridCarouselHeader_0 = require(l_CorePackages_0.Workspace.Packages.TenFootUiSharedComponents).TenFootUiGridCarouselHeader;
local l_GridContainer_DEPRECATED_0 = v5.Core.Layout.Grid.GridContainer_DEPRECATED;
local l_ResponsiveCarousel_0 = v5.App.Container.Carousel.ResponsiveCarousel;
local l_RetrievalStatus_0 = v5.App.Loading.Enum.RetrievalStatus;
local l_LoadingStateContainer_0 = v5.App.Container.LoadingStateContainer;
local l_validateProps_0 = l_ResponsiveCarousel_0.validateProps;
local l_useResponsiveLayout_0 = v5.Core.Layout.Responsive.useResponsiveLayout;
local v22 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v23 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local v25 = require(script.Parent.RecommendedGridRowSettings);
local v26 = require(script.Parent.Connectors.RecommendedExperienceConnector);
local v27 = require(l_Modules_0.Personalization.Games.GameSortImpressionsDetector);
local v28 = require(l_Modules_0.Personalization.Games.SendGameImpressions);
local v29 = require(l_Modules_0.LuaApp.AppPage);
local v30 = require(script.Parent.Flags.FFlagFixTenFootUiExperienceGridPadding);
local v31 = require(script.Parent.Flags.FFlagEDPRecommendedExperienceGridHeightFix10ft);
local l_GetUIBloxEnableFontNameMapping_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetUIBloxEnableFontNameMapping;
local l_GetFFlagTenFootUiSupportSortHeaderTooltip_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiSupportSortHeaderTooltip;
local v34 = v3.PureComponent:extend("RecommendedExperienceGrid");
v34.validateProps = v4.strictInterface({
    universeId = v4.string, 
    gridInfo = l_validateProps_0, 
    dataStatus = l_RetrievalStatus_0.isEnumValue, 
    eventIngest = v4.table, 
    appAnalytics = v4.table, 
    responsiveConfig = if not v30 then nil else v4.table, 
    carouselPadding = if not v30 then nil else v4.strictInterface({
        PaddingBottom = v4.optional(v4.UDim), 
        PaddingLeft = v4.optional(v4.UDim), 
        PaddingRight = v4.optional(v4.UDim)
    }), 
    isTenFootUiCarousel = if not v30 then nil else v4.boolean, 
    headerHeight = if not v30 then nil else v4.optional(v4.number), 
    headerPadding = if not v30 then nil else v4.optional(v4.number)
});
v34.init = function(v35)
    v35.getShowRecommendedExperiences = l_memoize_0(function(v36, v37)
        if v36 == l_RetrievalStatus_0.Done and (not (v37 ~= nil) or v10.fieldCount(v37) == 0) then
            return false;
        else
            return true;
        end;
    end);
    v35.parentRef = v3.createRef();
    v35.gridViewChangedSignal = l_Signal_0.new();
    v35.impressionsTagGuid = l_HttpService_0:GenerateGUID();
    v35.sendGameImpressions = function(v38)
        local l_data_0 = v35.props.gridInfo.data;
        if l_data_0 == nil then
            return ;
        else
            v28.sendFromGameDetails(v35.props.eventIngest, v35.props.appAnalytics, v38, l_data_0, v35.props.universeId);
            return ;
        end;
    end;
    v35.headerTextComponent = function(v40)
        return v3.createElement(l_TenFootUiGridCarouselHeader_0, {
            text = v35.props.gridInfo.headerText or "", 
            margin = v40.margin
        });
    end;
end;
v34.renderContent = function(v41)
    local l_gridInfo_0 = v41.props.gridInfo;
    local v43 = v41.getShowRecommendedExperiences(v41.props.dataStatus, l_gridInfo_0.data);
    local v44 = if not v30 then v25.Config else v41.props.responsiveConfig;
    local v45 = if not v30 then {
        PaddingBottom = UDim.new(0, 26), 
        PaddingLeft = UDim.new(0, 24), 
        PaddingRight = UDim.new(0, 24)
    } else v41.props.carouselPadding;
    local v46 = if not v30 then l_gridInfo_0.headerText else if v41.props.isTenFootUiCarousel then v41.headerTextComponent else l_gridInfo_0.headerText;
    local v47 = "GameDetails_" .. tostring(v41.props.universeId) .. tostring(v41.impressionsTagGuid);
    if v43 then
        return v3.createElement("Frame", {
            Size = if not l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 0, 0), 
            AutomaticSize = if not l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then nil else Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            [v3.Ref] = v41.parentRef, 
            [v3.Change.AbsoluteSize] = function()
                v41.gridViewChangedSignal:fire();
            end, 
            [v3.Change.AbsolutePosition] = function()
                v41.gridViewChangedSignal:fire();
            end
        }, {
            GridContainer = v3.createElement(l_GridContainer_DEPRECATED_0, {
                config = v44
            }, {
                UIPadding = v3.createElement("UIPadding", v45), 
                GridCarouselSection = v3.createElement(l_ResponsiveCarousel_0, {
                    headerHeight = if not v30 then nil else v41.props.headerHeight, 
                    headerPadding = if not v30 then nil else v41.props.headerPadding, 
                    headerText = v46, 
                    layoutOrder = 1, 
                    kind = l_gridInfo_0.kind, 
                    scrollable = false, 
                    relativeHeight = l_gridInfo_0.relativeHeight, 
                    data = l_gridInfo_0.data, 
                    getItem = l_gridInfo_0.getItem, 
                    getItemCount = l_gridInfo_0.getItemCount, 
                    renderItem = function(v48)
                        return l_gridInfo_0.renderItem(v48, v47);
                    end, 
                    keyExtractor = l_gridInfo_0.keyExtractor, 
                    getCellColumns = l_gridInfo_0.getCellColumns, 
                    getCellOrder = l_gridInfo_0.getCellOrder
                }), 
                GameSortImpressionsDetector = v3.createElement(v27, {
                    parentRef = v41.parentRef, 
                    pageContext = {
                        v29.GameDetail, 
                        v29.ExperienceDetail
                    }, 
                    impressionsTag = v47, 
                    scrollViewPositionChangedSignal = v41.gridViewChangedSignal, 
                    sendGameImpressions = v41.sendGameImpressions
                })
            })
        });
    else
        return nil;
    end;
end;
v34.render = function(v49)
    return v3.createElement(l_LoadingStateContainer_0, {
        dataStatus = v49.props.dataStatus, 
        renderOnFailed = function()
            return nil;
        end, 
        renderOnLoaded = function()
            return v49:renderContent();
        end
    });
end;
v34 = v26.connect(function(v50)
    return {
        universeId = v50.universeId
    };
end, function(v51, _)
    return {
        gridInfo = v51.gridInfo
    };
end)((l_RoactServices_0.connect({
    eventIngest = v22, 
    appAnalytics = v23
})(v34)));
local function v56(v53)
    local v54 = l_useDesignTokens_0();
    local v55 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    return v3.createElement(v34, v6.Dictionary.join(v53, {
        responsiveConfig = if not v55 then v25.Config else {
            columns = l_useResponsiveLayout_0("columns", l_LayoutConfig_0.Kind.Experiences.Default) or 1, 
            margin = l_useResponsiveLayout_0("margin", l_LayoutConfig_0.Kind.Experiences.Default) or 0, 
            gutter = l_useResponsiveLayout_0("gutter", l_LayoutConfig_0.Kind.Experiences.Default) or 0
        }, 
        carouselPadding = if not v55 then {
            PaddingBottom = UDim.new(0, 26), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24)
        } else {}, 
        isTenFootUiCarousel = v55, 
        headerHeight = if not v55 then nil else if not not l_GetUIBloxEnableFontNameMapping_0() and v31 then v54.Global.Size_600 else v54.Global.Size_500, 
        headerPadding = if not v55 then nil else v54.Global.Space_0
    }));
end;
if not v30 then
    return v34;
else
    return v56;
end;
