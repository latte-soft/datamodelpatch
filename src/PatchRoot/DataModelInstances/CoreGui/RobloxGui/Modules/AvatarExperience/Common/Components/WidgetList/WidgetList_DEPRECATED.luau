local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Promise);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.Packages.tutils);
local l_FlatList_0 = require(l_CorePackages_0.Packages.VirtualizedList).FlatList;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useScreenSize;
local v12 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v12.Core.Style.useStyle;
local l_GridMetrics_0 = v12.App.Grid.GridMetrics;
local v15 = require(l_Modules_0.LuaApp.Components.EndOfScroll);
local v16 = require(l_Modules_0.LuaApp.Components.SignalConnection);
local v17 = require(l_Modules_0.LuaApp.Components.LoadingBarWithTheme);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local v21 = require(l_Modules_0.AvatarExperience.Common.Enum.CatalogCategories);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.ResultsHeader);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.OrganicContentRow);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.CatalogGridWidget);
local v28 = require(l_Modules_0.AvatarExperience.Common.Hooks.useLocalWidgets);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useTallTileIXPEnabled);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectFilterCount);
local v31 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v33 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableWidgetDividerProps);
local v34 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagHideSubtitleFromWidgetSeeAll);
local v35 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagExtendWidgetAnalyticsWithWidgetItemIds);
local v36 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v37 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardTallEnabled);
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFStringAXTallTilesThumbnailSize);
local v39 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
local v40 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v41 = require(l_Modules_0.AvatarExperience.Flags.ItemTileSizeIXPTest);
local v42 = {
    WINDOW_SIZE = game:DefineFastInt("WidgetListWindowSize", 21), 
    INITIAL_NUM_TO_RENDER = 8, 
    MAX_TO_RENDER_PER_BATCH = 1, 
    UPDATE_CELLS_BATCHING_PERIOD = 30, 
    SCROLL_EVENT_THROTTLE = 0, 
    ON_END_REACHED_THRESHOLD = 4
};
local function v192(v43)
    local v44 = v2.useRef(false);
    local v45 = v43.gridRef or v2.useRef(nil);
    local v46 = v2.useRef(nil);
    local v47 = v3.useRefCache();
    local v48, v49 = v2.useState(0);
    local v50, v51 = v2.useState(false);
    local v52, v53 = v2.useState(false);
    local v54 = l_usePrevious_0(v48);
    local v55, v56 = v2.useBinding(1);
    local v57, v58 = v2.useBinding(Vector2.new(1, 1));
    local v60 = l_useSelector_0(function(v59)
        return v59.SearchesParameters[v43.searchUuid];
    end);
    local v61 = l_useSelector_0(v32.selectSortAndFiltersKey);
    local v62 = v60 and v60.searchKeyword ~= nil;
    local v65 = l_useSelector_0(function(v63)
        local v64 = if not v62 then v63.AvatarExperience.Common.Widgets.WidgetInfo else v63.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[v31.getQueryStringForSearchWidgets(v60)];
        if not v64 then
            return {};
        else
            return v64.Details;
        end;
    end);
    local v66 = l_useSelector_0(v30);
    local v67 = l_useNavigation_0();
    local v68 = l_useStyle_0();
    local l_Theme_0 = v68.Theme;
    local l_Font_0 = v68.Font;
    local v71 = v29(v43.selectedCategoryIndex) and v62 ~= true;
    local v75 = if not v36() then nil else v2.useMemo(function()
        if not (v43.isSmallCatalogItemTileIXP ~= true) or v43.isLargeCatalogItemTileIXP == true then
            local v72 = nil;
            if v43.selectedCategoryIndex then
                local v73 = v22()[v43.selectedCategoryIndex];
                v72 = v73 and v73.NavigationKey;
            end;
            local v74 = false;
            if v72 ~= v21.AllAnimations then
                v74 = v72 ~= v21.Characters;
            end;
            return v74;
        else
            return false;
        end;
    end, {
        v43.selectedCategoryIndex, 
        v43.isSmallCatalogItemTileIXP, 
        v43.isLargeCatalogItemTileIXP
    });
    local v76 = if not v36() then nil else l_useScreenSize_0();
    local v89 = if not v36() then nil else v2.useCallback(function(v77, v78)
        local function _(v79, v80)
            local v81 = l_GridMetrics_0.getMediumMetrics(v79, v80).itemsPerRow + 2;
            return {
                itemsPerRow = v81, 
                itemWidth = math.floor((v79 - (v81 - 1) * v80) / v81), 
                widgetsPerRow = v81
            };
        end;
        local function v87(v83, v84)
            local v85 = l_GridMetrics_0.getMediumMetrics(v83, v84);
            local v86 = v85.itemsPerRow or 0;
            if v76 ~= nil and v76.X <= v18.MobileScreenXBreakpoint then
                v86 = v86 * 2;
            end;
            return {
                itemsPerRow = v85.itemsPerRow, 
                itemWidth = v85.itemWidth, 
                widgetsPerRow = v86
            };
        end;
        if v75 then
            if v43.isSmallCatalogItemTileIXP == true then
                local v88 = l_GridMetrics_0.getMediumMetrics(v77, v78).itemsPerRow + 2;
                return {
                    itemsPerRow = v88, 
                    itemWidth = math.floor((v77 - (v88 - 1) * v78) / v88), 
                    widgetsPerRow = v88
                };
            elseif v43.isSmallCatalogItemTileIXP == false then
                return (v87(v77, v78));
            end;
        end;
        return l_GridMetrics_0.getSmallMetrics(v77, v78);
    end, {
        v43.isSmallCatalogItemTileIXP, 
        v43.isSmallCatalogItemTileIXP, 
        v75, 
        v76
    });
    local v91 = v2.useCallback(function(v90)
        return (math.floor(((v90 - 30) + 10) / math.max(1, (if not not v36() and v89 ~= nil then v89(math.max(v90 - 30, 0), 10) else l_GridMetrics_0.getSmallMetrics(math.max(v90 - 30, 0), 10)).itemWidth + 10)));
    end, if not v36() then nil else {
        v89
    });
    local v92 = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize;
    local v93 = if not v71 then v18.ItemTileType.CatalogItemTile else v18.ItemTileType.TallCatalogItemTile;
    local v94 = if not v36() then v19.GridItemHeightGetter(v93, v92) else v19.GridItemHeightGetter(v93, v92, v75);
    local v95 = if not not v36() and v89 ~= nil then v89(math.max(v48 - 30, 0), 10) else l_GridMetrics_0.getSmallMetrics(math.max(v48 - 30, 0), 10);
    local l_itemWidth_0 = v95.itemWidth;
    local v97 = {
        X = l_itemWidth_0, 
        Y = v94(l_itemWidth_0)
    };
    local v98 = v91(v48);
    local v99 = if not not v36() and v75 then v95.widgetsPerRow else v98;
    local v100 = v34() and v43.focusedWidget;
    local function v103()
        local v101 = "FlatList";
        local v102 = not not v60 and v60.categoryInfo or {};
        if not v43.fromSearch then
            if not (v5.isEmpty(v102) or not v102.Name) then
                v101 = v101 .. "." .. v102.Name;
            end;
        else
            v101 = v101 .. "." .. v43.searchUuid;
        end;
        if v61 then
            v101 = v101 .. "." .. v61;
        end;
        if v98 > 0 then
            v101 = v101 .. "." .. v98;
        end;
        if v43.focusedWidget then
            v101 = ("%*.%*"):format(v101, v43.focusedWidget);
        end;
        return v101;
    end;
    local v105 = v2.useCallback(function()
        if v46.current ~= nil then
            local v104 = v46.current:getNativeScrollRef();
            if v104 ~= nil then
                return v104._nativeRef;
            end;
        end;
        return nil;
    end);
    local v108 = v2.useCallback(function()
        local v106 = v105();
        if v106 then
            assert(v106, "");
            local l_current_0 = v106.current;
            if l_current_0 then
                l_current_0:ScrollToTop();
            end;
            return ;
        else
            return ;
        end;
    end);
    local v112 = v2.useCallback(function()
        local v109 = v105();
        if v109 then
            assert(v109, "");
            local l_current_1 = v109.current;
            local v111 = 0;
            if l_current_1 then
                v111 = l_current_1.CanvasPosition.Y;
            end;
            if v43.recordCurrentScrollingFrameYPosition then
                v43.recordCurrentScrollingFrameYPosition(v111);
            end;
            return ;
        else
            return ;
        end;
    end);
    local v116 = v2.useCallback(function(v113)
        task.defer(function()
            if v113 <= v18.ScrollYPositionDetectableEpsilon then
                return ;
            else
                local v114 = v105();
                if v114 then
                    assert(v114, "");
                    local l_current_2 = v114.current;
                    if l_current_2 then
                        l_current_2.CanvasPosition = Vector2.new(0, v113);
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end;
        end);
    end);
    local function v117()
        if not v43.createEndOfScrollElement then
            if not v52 then
                return nil;
            else
                return v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 56)
                }, {
                    LoadingBar = v2.createElement(v17)
                });
            end;
        else
            return v2.createElement(v15, {
                backToTopCallback = v108
            });
        end;
    end;
    local v121 = v2.useCallback(function()
        local v118 = v105();
        if v118 then
            assert(v118, "");
            local l_current_3 = v118.current;
            local v120 = nil;
            if l_current_3 then
                v120 = l_current_3.CanvasPosition.Y;
            end;
            if v43.onScroll then
                v43.onScroll(v120);
            end;
            return ;
        else
            return ;
        end;
    end);
    local v123 = v2.useCallback(function()
        if not v43.focusedWidget then
            local l_loadMore_0 = v43.loadMore;
            if l_loadMore_0 then
                assert(l_loadMore_0, "");
                v53(true);
                l_loadMore_0():andThen(function()
                    if v44.current then
                        v53(false);
                    end;
                end, function()
                    if v44.current then
                        v53(false);
                    end;
                end);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end, {
        v43.loadMore
    });
    local v126 = v2.useCallback(function()
        return v4.new(function(_, _)
            if v123 then
                v123();
            end;
        end);
    end, {
        v123
    });
    local v127 = v103();
    local v132 = v2.useCallback(function(v128)
        local v129 = {};
        if not (not v128 or not v128.content) then
            for _, v131 in v128.content, nil, nil do
                if v131.id then
                    table.insert(v129, v131.id);
                end;
            end;
        end;
        if v98 < #v129 then
            v129 = table.move(v129, 1, v98, 1, {});
        end;
        return v129;
    end, {
        v98
    });
    local v184 = v2.useMemo(function()
        local v133 = v43.entries or {};
        if not v43.entries then
            for v134 = 1, v43.numItemsExpected do
                v133[v134] = {};
            end;
        end;
        local v135 = {};
        local v136 = math.ceil(v6.fieldCount(v133) / v98);
        for v137 = 1, v136 do
            v135[v137] = {};
        end;
        local v138 = {};
        for v139, v140 in v133, nil, nil do
            local v141 = v135[math.ceil(v139 / v98)];
            if v141 then
                table.insert(v141, v140);
            end;
            if not (not v140.id or not v140.type) then
                table.insert(v138, v140.type .. v140.id);
            end;
        end;
        local v142 = not not v60 and v60.categoryInfo or {};
        local v143 = not v5.isEmpty(v142) and v142.ShowWidgets or v62;
        if v66 > 0 then
            v143 = false;
        end;
        if not ((not v39() or not v43.enableSearchResultsCategories) or not v62) then
            v143 = v5.isEmpty(v142) or v142.ShowWidgets;
        end;
        local v144 = {};
        local v145 = 1;
        local v146 = 1;
        local v147 = 1;
        local v148 = v28(v43.searchUuid, v43.showingEntries, if not not v39() and v43.enableSearchResultsCategories then v43.fromSearch else nil);
        local function _()
            local v149 = v148[v146];
            v146 = v146 + 1;
            return v149;
        end;
        local function _()
            while not ((not v143 or not v65) or not v65[tostring(v147)]) do
                v147 = v147 + 1;
            end;
        end;
        local function v159(v152)
            local v153 = {};
            local v154 = v6.fieldCount(v144);
            for _, v156 in v152, nil, nil do
                local v157 = v65[tostring(v156)];
                if not (not (not v43.focusedWidget or v157.id == v43.focusedWidget) or v156 > v136 and v43.hasMoreRows) then
                    local v158 = v154 + #v153;
                    if v158 < v156 then
                        v156 = v158 + 1;
                    end;
                    table.insert(v153, {
                        rowNum = v156, 
                        widgetInfo = v157
                    });
                end;
            end;
            return v153;
        end;
        local v160 = v148[v146];
        v146 = v146 + 1;
        local l_v160_0 = v160;
        for v162, v163 in v135, nil, nil do
            if not v43.focusedWidget then
                while l_v160_0 and l_v160_0.row == v145 do
                    local l_component_0 = l_v160_0.component;
                    local l_v147_0 = v147;
                    local v166 = v47[l_v147_0 - 1];
                    if l_v147_0 <= 1 then
                        v166 = nil;
                    end;
                    while not ((not v143 or not v65) or not v65[tostring(v147)]) do
                        v147 = v147 + 1;
                    end;
                    do
                        local l_v166_0 = v166;
                        v144[v145] = function()
                            return v2.createElement(l_component_0, {
                                searchUuid = v43.searchUuid, 
                                fromSearch = v43.fromSearch, 
                                itemsPerRow = v99, 
                                itemDetailsPeekViewRefs = v43.itemDetailsPeekViewRefs, 
                                gridRef = v43.gridRef, 
                                scrollingFrameRef = v105(), 
                                requestImpressionsSignal = v43.requestImpressionsSignal, 
                                onFocusGained = v43.onFocusGained, 
                                NextSelectionRight = v43.NextSelectionRight, 
                                NextSelectionUp = l_v166_0, 
                                NextSelectionDown = v47[l_v147_0 + 1], 
                                ref = v47[l_v147_0], 
                                rowIndex = l_v147_0, 
                                gamepadNavigationColumn = v55, 
                                setGamepadNavigationColumn = v56, 
                                gamepadNavigationFocusPos = v57, 
                                setGamepadNavigationFocusPos = v58, 
                                itemSize = v97, 
                                getItemMetrics = if not v36() then nil else v89, 
                                hideItemNames = (not not v36() and v75) and true or nil
                            });
                        end;
                        v145 = v145 + 1;
                        v147 = v147 + 1;
                        local v168 = v148[v146];
                        v146 = v146 + 1;
                        l_v160_0 = v168;
                    end;
                end;
                while not ((not v143 or not v65) or not v65[tostring(v147)]) do
                    v147 = v147 + 1;
                end;
                local l_v147_1 = v147;
                v144[v145] = function()
                    return v2.createElement(v26, {
                        searchUuid = v43.searchUuid, 
                        entryRowIndex = v162, 
                        row = v163, 
                        itemsPerRow = v98, 
                        itemSize = v97, 
                        fromSearch = v43.fromSearch, 
                        itemDetailsPeekViewRefs = v43.itemDetailsPeekViewRefs, 
                        gridRef = v45, 
                        onFocusGained = v43.onFocusGained, 
                        gamepadNavigationColumn = v55, 
                        setGamepadNavigationColumn = v56, 
                        gamepadNavigationFocusPos = v57, 
                        setGamepadNavigationFocusPos = v58, 
                        NextSelectionUp = v47[l_v147_1 - 1], 
                        NextSelectionDown = v47[l_v147_1 + 1], 
                        ref = v47[l_v147_1], 
                        hideItemNames = (not not v36() and v75) and true or nil, 
                        thumbnailAspectRatio = if not not v37() and v71 then v18.ItemTileTallAspectRatio else nil, 
                        thumbnailScaleType = if not not v37() and v71 then Enum.ScaleType.Crop else nil, 
                        thumbnailSize = if not not v37() and v71 then v38() else nil
                    });
                end;
                v145 = v145 + 1;
                v147 = v147 + 1;
            else
                break;
            end;
        end;
        if not (not v143 or not v65) then
            v160 = {};
            for v170, _ in v65, nil, nil do
                table.insert(v160, (tonumber(v170)));
            end;
            table.sort(v160);
            if not v33 then
                for _, v173 in v160, nil, nil do
                    local v174 = v65[tostring(v173)];
                    if v43.focusedWidget and v174.id ~= v43.focusedWidget then
                        --[[ close >= 21 ]]
                    else
                        do
                            local l_v173_0 = v173;
                            if not (l_v173_0 > v136 and v43.hasMoreRows) then
                                local v176 = v6.fieldCount(v144);
                                if v176 < l_v173_0 then
                                    l_v173_0 = v176 + 1;
                                end;
                                table.insert(v144, l_v173_0, function()
                                    return v2.createElement(v27, {
                                        widgetRow = l_v173_0, 
                                        widgetInfo = v174, 
                                        itemsPerRow = v98, 
                                        rowHeight = v97.Y, 
                                        itemSize = v97, 
                                        ref = v47[l_v173_0], 
                                        NextSelectionUp = v47[l_v173_0 - 1], 
                                        NextSelectionDown = v47[l_v173_0 + 1], 
                                        widgetAnalyticsInfo = {
                                            requestId = if not v174 then nil else v174.requestId, 
                                            widgetPosition = l_v173_0, 
                                            widgetId = if not v174 then nil else v174.id, 
                                            widgetType = if not v174 then nil else v174.type, 
                                            widgetAbsPosition = (l_v173_0 - 1) * v98, 
                                            query = if not v60 then nil else v60.searchKeyword, 
                                            organicResultIds = v138, 
                                            widgetItemIds = if not v35() then nil else v132(v174)
                                        }, 
                                        widgetFocused = v43.focusedWidget and v174.id == v43.focusedWidget, 
                                        requestWidgetAcquireFocus = function()
                                            if v43.onWidgetFocusAcquired then
                                                v43.onWidgetFocusAcquired(v174);
                                            end;
                                        end, 
                                        requestWidgetReleaseFocus = function()
                                            if v43.onWidgetFocusReleased then
                                                v43.onWidgetFocusReleased();
                                            end;
                                        end, 
                                        itemDetailsPeekViewRefs = v43.itemDetailsPeekViewRefs, 
                                        gridRef = v45, 
                                        gamepadNavigationFocusPos = v57, 
                                        setGamepadNavigationFocusPos = v58
                                    });
                                end);
                            end;
                        end;
                    end;
                end;
            else
                local v177 = v159(v160);
                for v178, v179 in v177, nil, nil do
                    local l_rowNum_0 = v179.rowNum;
                    local l_widgetInfo_0 = v179.widgetInfo;
                    local v182 = false;
                    if v178 < #v177 then
                        v182 = v177[v178 + 1].rowNum ~= l_rowNum_0 + 1;
                    end;
                    local v183 = false;
                    if v178 == #v177 then
                        v183 = l_rowNum_0 < #v144;
                    end;
                    table.insert(v144, l_rowNum_0, function()
                        return v2.createElement(v27, {
                            widgetRow = l_rowNum_0, 
                            widgetInfo = l_widgetInfo_0, 
                            itemsPerRow = v99, 
                            getItemMetrics = if not v36() then nil else v89, 
                            hideItemNames = (not not v36() and v75) and true or nil, 
                            rowHeight = v97.Y, 
                            itemSize = v97, 
                            ref = v47[l_rowNum_0], 
                            NextSelectionUp = v47[l_rowNum_0 - 1], 
                            NextSelectionDown = v47[l_rowNum_0 + 1], 
                            widgetAnalyticsInfo = {
                                requestId = if not l_widgetInfo_0 then nil else l_widgetInfo_0.requestId, 
                                widgetPosition = l_rowNum_0, 
                                widgetId = if not l_widgetInfo_0 then nil else l_widgetInfo_0.id, 
                                widgetType = if not l_widgetInfo_0 then nil else l_widgetInfo_0.type, 
                                widgetAbsPosition = (l_rowNum_0 - 1) * v98, 
                                query = if not v60 then nil else v60.searchKeyword, 
                                organicResultIds = v138, 
                                widgetItemIds = if not v35() then nil else v132(l_widgetInfo_0)
                            }, 
                            widgetFocused = v43.focusedWidget and l_widgetInfo_0.id == v43.focusedWidget, 
                            requestWidgetAcquireFocus = function()
                                if v43.onWidgetFocusAcquired then
                                    v43.onWidgetFocusAcquired(l_widgetInfo_0);
                                end;
                            end, 
                            requestWidgetReleaseFocus = function()
                                if v43.onWidgetFocusReleased then
                                    v43.onWidgetFocusReleased();
                                end;
                            end, 
                            itemDetailsPeekViewRefs = v43.itemDetailsPeekViewRefs, 
                            gridRef = v45, 
                            gamepadNavigationFocusPos = v57, 
                            setGamepadNavigationFocusPos = v58, 
                            includeTopDivider = l_rowNum_0 > 1, 
                            includeBottomDivider = v182 or v183
                        });
                    end);
                end;
            end;
        end;
        if v43.fromSearch then
            table.insert(v144, 1, function()
                if v43.showingEntries then
                    return v2.createElement(v2.Fragment, nil, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left
                        }), 
                        ResultsHeader = if not v100 then v2.createElement(v23, {
                            searchUuid = v43.searchUuid
                        }) else nil, 
                        ManualPaddingFrame = v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 11), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 2
                        })
                    });
                else
                    return nil;
                end;
            end);
        end;
        if v43.topPanelHeight then
            table.insert(v144, 1, function()
                return v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v43.topPanelHeight)
                });
            end);
        end;
        if v43.bottomBarHeight then
            table.insert(v144, function()
                return v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v43.bottomBarHeight)
                });
            end);
        end;
        return v144;
    end, {
        v43.searchUuid, 
        v98, 
        v97, 
        v43.entries, 
        v43.fromSearch, 
        v43.showingEntries, 
        v67, 
        v127, 
        v43.focusedWidget, 
        if not v39() then nil else v43.enableSearchResultsCategories
    });
    local v186 = v2.useCallback(function(v185)
        if not (not v44.current or not v50) then
            v49(v185.AbsoluteSize.X);
        end;
    end, {
        v50
    });
    local v188 = v2.useCallback(function(v187)
        if v187:IsDescendantOf(game) and (not v50 or v48 ~= v187.AbsoluteSize.X) then
            v49(v187.AbsoluteSize.X);
            v51(true);
        end;
    end, {
        v50, 
        v48
    });
    v2.useEffect(function()
        local l_current_4 = v45.current;
        if not (not (l_current_4 and l_current_4.AbsoluteSize.X ~= 0) or not l_current_4:IsDescendantOf(game)) then
            v51(true);
            v49(l_current_4.AbsoluteSize.X);
        end;
        v44.current = true;
    end, {});
    v2.useEffect(function()
        if not (not v43.onNumItemsPerRowChanged or not v54) then
            local v190 = v91(v48);
            if v190 ~= v91(v54) then
                v43.onNumItemsPerRowChanged(v190);
            end;
        end;
    end, {
        v48, 
        v54, 
        v43.onNumItemsPerRowChanged
    });
    return v2.createElement(v3.Focusable.Frame, {
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ClipsDescendants = true, 
        [v2.Change.AbsoluteSize] = v186, 
        [v2.Event.AncestryChanged] = v188, 
        ref = v45, 
        defaultChild = if not v43.showingEntries then nil else v47[1], 
        restorePreviousChildFocus = v43.restorePreviousChildFocus, 
        NextSelectionRight = v43.NextSelectionRight, 
        NextSelectionUp = v43.NextSelectionUp
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 10), 
            PaddingLeft = UDim.new(0, 15), 
            PaddingRight = UDim.new(0, 15), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        ScrollToYPosSignal = v2.createElement(v16, {
            signal = v43.scrollToYPosSignal, 
            callback = v116
        }), 
        RecordCurrentScrollingFrameYPositionSignal = v2.createElement(v16, {
            signal = v43.recordCurrentScrollingFrameYPositionSignal, 
            callback = v112
        }), 
        [v127] = v2.createElement(l_FlatList_0, {
            data = v184, 
            renderItem = function(v191)
                return v191.item();
            end, 
            windowSize = v42.WINDOW_SIZE, 
            initialNumToRender = v42.INITIAL_NUM_TO_RENDER, 
            maxToRenderPerBatch = v42.MAX_TO_RENDER_PER_BATCH, 
            updateCellsBatchingPeriod = v42.UPDATE_CELLS_BATCHING_PERIOD, 
            scrollEventThrottle = v42.SCROLL_EVENT_THROTTLE, 
            overrideAutomaticCanvasSize = true, 
            UNSTABLE_forceSiblingLayoutUpdate = true, 
            ref = v46, 
            contentContainerStyle = {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, 
            style = {
                Selectable = false, 
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                LayoutOrder = 2, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ClipsDescendants = false
            }, 
            onScroll = v121, 
            onEndReachedThreshold = v42.ON_END_REACHED_THRESHOLD, 
            onEndReached = v126, 
            showDefaultLoadingIndicators = true, 
            ListFooterComponent = v117(), 
            scrollEnabled = v43.scrollingEnabled
        })
    });
end;
if v36() then
    v192 = v40.connectTestVariables({
        isLargeCatalogItemTileIXP = v41.IsLargeCatalogItemTileForUser, 
        isSmallCatalogItemTileIXP = v41.IsSmallCatalogItemTileForUser
    })(v192);
end;
return v192;
