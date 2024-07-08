local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_FlatList_0 = require(l_CorePackages_0.Packages.VirtualizedList).FlatList;
local l_useScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useScreenSize;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v7 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_GridMetrics_0 = v7.App.Grid.GridMetrics;
local v10 = require(l_Modules_0.LuaApp.Components.EndOfScroll);
local v11 = require(l_Modules_0.LuaApp.Components.LoadingBarWithTheme);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.Enum.CatalogCategories);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Types);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getItemCountForRow);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getItemSize);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useRestoreYPositionOnDefocusEffect);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useRenderInfo);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useTallTileIXPEnabled);
local v23 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v24 = require(l_Modules_0.AvatarExperience.Flags.ItemTileSizeIXPTest);
local v25 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v26 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardTallEnabled);
local v27 = require(l_Modules_0.AvatarExperience.Flags.GetFStringAXTallTilesThumbnailSize);
local v28 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
local v29 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXWidgetItemsPerRowLowerBound);
local l_GetFFlagAXFixScrollToTopBug_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAXFixScrollToTopBug;
local v31 = {
    WINDOW_SIZE = game:DefineFastInt("WidgetListWindowSize", 21), 
    INITIAL_NUM_TO_RENDER = 8, 
    MAX_TO_RENDER_PER_BATCH = 1, 
    UPDATE_CELLS_BATCHING_PERIOD = 30, 
    SCROLL_EVENT_THROTTLE = 0, 
    ON_END_REACHED_THRESHOLD = 4
};
local v32 = {
    BackgroundTransparency = 1, 
    BorderSizePixel = 0
};
local v33 = {
    Selectable = false, 
    BackgroundTransparency = 1, 
    ScrollBarThickness = 0, 
    LayoutOrder = 2, 
    ElasticBehavior = Enum.ElasticBehavior.Always, 
    ClipsDescendants = false
};
local function v35(v34)
    return v34.item.render();
end;
local function v90(v36)
    local v37 = v36.gridRef or v2.useRef(nil);
    local v38 = if not not v28() and v36.enableSearchResultsCategories then v36.flatListRef or v2.useRef(nil) else v2.useRef(nil);
    local v39 = v3.useRefCache();
    local v40, v41 = v2.useState(0);
    local v42 = l_useStyle_0();
    local l_Theme_0 = v42.Theme;
    local v44 = if not v26() then nil else v22(v36.selectedCategoryIndex);
    local v45 = if not v44 then nil else v12.ItemTileTallAspectRatio;
    local v46 = if not v44 then nil else Enum.ScaleType.Crop;
    local v47 = if not v44 then nil else v27();
    local v51 = if not v25() then nil else v2.useMemo(function()
        if not (v36.isSmallCatalogItemTileIXP ~= true) or v36.isLargeCatalogItemTileIXP == true then
            local v48 = nil;
            if v36.selectedCategoryIndex then
                local v49 = v14()[v36.selectedCategoryIndex];
                v48 = v49 and v49.NavigationKey;
            end;
            local v50 = false;
            if v48 ~= v13.AllAnimations then
                v50 = v48 ~= v13.Characters;
            end;
            return v50;
        else
            return false;
        end;
    end, {
        v36.selectedCategoryIndex, 
        v36.isSmallCatalogItemTileIXP, 
        v36.isLargeCatalogItemTileIXP
    });
    local v52 = if not v25() then nil else l_useScreenSize_0();
    local v65 = if not v25() then nil else v2.useCallback(function(v53, v54)
        local function _(v55, v56)
            local v57 = l_GridMetrics_0.getMediumMetrics(v55, v56).itemsPerRow + 2;
            return {
                itemsPerRow = v57, 
                itemWidth = math.floor((v55 - (v57 - 1) * v56) / v57), 
                widgetsPerRow = v57
            };
        end;
        local function v63(v59, v60)
            local v61 = l_GridMetrics_0.getMediumMetrics(v59, v60);
            local v62 = v61.itemsPerRow or 0;
            if v52 ~= nil and v52.X <= v12.MobileScreenXBreakpoint then
                v62 = v62 * 2;
            end;
            return {
                itemsPerRow = v61.itemsPerRow, 
                itemWidth = v61.itemWidth, 
                widgetsPerRow = v62
            };
        end;
        if v51 then
            if v36.isSmallCatalogItemTileIXP == true then
                local v64 = l_GridMetrics_0.getMediumMetrics(v53, v54).itemsPerRow + 2;
                return {
                    itemsPerRow = v64, 
                    itemWidth = math.floor((v53 - (v64 - 1) * v54) / v64), 
                    widgetsPerRow = v64
                };
            elseif v36.isSmallCatalogItemTileIXP == false then
                return (v63(v53, v54));
            end;
        end;
        return l_GridMetrics_0.getSmallMetrics(v53, v54);
    end, {
        v36.isSmallCatalogItemTileIXP, 
        v36.isSmallCatalogItemTileIXP, 
        v51, 
        v52
    });
    local v66 = if not not v25() and v65 ~= nil then v65(math.max(v40 - 30, 0), 10) else l_GridMetrics_0.getSmallMetrics(math.max(v40 - 30, 0), 10);
    local v67 = v18((v40 - 30) + 10, v66.itemWidth + 10);
    if v29() then
        v67 = math.max(v67, 1);
    end;
    local v68 = if not v44 then v19(v42, v51, v66.itemWidth) else v19(v42, v51, v66.itemWidth, if not v44 then v12.ItemTileType.CatalogItemTile else v12.ItemTileType.TallCatalogItemTile);
    local v69 = if not not v25() and v51 then v66.widgetsPerRow else v67;
    local v70, v71 = v2.useState(false);
    local v72 = v2.useCallback(function()
        if not (v36.focusedWidget or not v36.loadMore) then
            v71(true);
            v36.loadMore():andThen(function()
                v71(false);
            end, function()
                v71(false);
            end);
        end;
    end, {
        v36.loadMore, 
        v36.focusedWidget
    });
    local v74 = v2.useCallback(function()
        if v38.current ~= nil then
            local v73 = v38.current:getNativeScrollRef();
            if v73 ~= nil then
                return v73._nativeRef;
            end;
        end;
        return nil;
    end, {});
    local v75 = v2.useCallback(function()
        if v38.current then
            v38.current:scrollToOffset({
                offset = 0, 
                animated = true
            });
        end;
    end, {});
    local v76 = v2.useRef(0);
    local v78 = v2.useCallback(function(...)
        local v77 = v74();
        if not (not v77 or not v77.current) then
            v76.current = v77.current.CanvasPosition.Y;
        end;
        if v36.onWidgetFocusAcquired then
            v36.onWidgetFocusAcquired(...);
        end;
    end, {
        v36.onWidgetFocusAcquired, 
        v74
    });
    v20(v36.searchUuid, v36.focusedWidget, v74, v76);
    local v79, v80 = v2.useState(false);
    if l_GetFFlagAXFixScrollToTopBug_0() then
        local v81 = v74();
        local l_v81_0 = v81 --[[ copy: 29 -> 33 ]];
        v2.useEffect(function()
            local v83 = nil;
            if not (not l_v81_0 or not l_v81_0.current) then
                v83 = l_v81_0.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
                    v80(l_v81_0.current.AbsoluteWindowSize.Y < l_v81_0.current.AbsoluteCanvasSize.Y);
                end);
            end;
            return function()
                if v83 then
                    v83:Disconnect();
                end;
            end;
        end, {
            v81
        });
    end;
    local v84 = if not v36.createEndOfScrollElement then if v70 then v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 56)
    }, {
        LoadingBar = v2.createElement(v11)
    }) else nil else if l_GetFFlagAXFixScrollToTopBug_0() and v79 then v2.createElement(v10, {
        backToTopCallback = v75
    }) else nil;
    local v86 = v2.useCallback(function(v85)
        if v36.onScroll then
            v36.onScroll(v85.CanvasPosition.Y);
        end;
    end, {
        v36.onScroll
    });
    local v87 = v21(v68, v67, v69, v36.searchUuid, v36.entries, v36.showingEntries, v36.numItemsExpected, v36.fromSearch, v36.topPanelHeight, v36.bottomBarHeight, v36.focusedWidget, v78, v36.onWidgetFocusReleased, v36.hasMoreRows, v36.itemDetailsPeekViewRefs, v39, v37, v36.onFocusGained, v36.requestImpressionsSignal, v74, v65, v51, v45, v46, v47, v36.enableSearchResultsCategories);
    local v89 = v2.useCallback(function(v88)
        v41(v88.AbsoluteSize.X);
    end, {});
    v2.useEffect(function()
        if v36.onNumItemsPerRowChanged then
            v36.onNumItemsPerRowChanged(v67);
        end;
    end, {
        v36.onNumItemsPerRowChanged, 
        v67
    });
    return v2.createElement(v3.Focusable.Frame, {
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ClipsDescendants = true, 
        [v2.Change.AbsoluteSize] = v89, 
        ref = v37, 
        defaultChild = if not v36.showingEntries then nil else v39[1], 
        restorePreviousChildFocus = v36.restorePreviousChildFocus, 
        NextSelectionRight = v36.NextSelectionRight, 
        NextSelectionUp = v36.NextSelectionUp
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 10), 
            PaddingLeft = UDim.new(0, 15), 
            PaddingRight = UDim.new(0, 15), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        WidgetFlatList = v2.createElement(l_FlatList_0, {
            data = v87, 
            renderItem = v35, 
            windowSize = v31.WINDOW_SIZE, 
            initialNumToRender = v31.INITIAL_NUM_TO_RENDER, 
            maxToRenderPerBatch = v31.MAX_TO_RENDER_PER_BATCH, 
            updateCellsBatchingPeriod = v31.UPDATE_CELLS_BATCHING_PERIOD, 
            scrollEventThrottle = v31.SCROLL_EVENT_THROTTLE, 
            UNSTABLE_forceSiblingLayoutUpdate = true, 
            ref = v38, 
            contentContainerStyle = v32, 
            style = v33, 
            onScroll = v86, 
            onEndReachedThreshold = v31.ON_END_REACHED_THRESHOLD, 
            onEndReached = v72, 
            showDefaultLoadingIndicators = true, 
            ListFooterComponent = v84, 
            scrollEnabled = v36.scrollingEnabled
        })
    });
end;
if v25() then
    v90 = v23.connectTestVariables({
        isLargeCatalogItemTileIXP = v24.IsLargeCatalogItemTileForUser, 
        isSmallCatalogItemTileIXP = v24.IsSmallCatalogItemTileForUser
    })(v90);
end;
return v90;
