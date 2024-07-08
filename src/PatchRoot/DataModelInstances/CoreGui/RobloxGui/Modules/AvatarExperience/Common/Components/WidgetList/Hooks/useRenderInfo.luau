local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Packages.tutils);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v7 = require(l_Modules_0.AvatarExperience.Common.Util.getIterator);
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.OrganicContentRow);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.CatalogGridWidget);
local v12 = require(l_Modules_0.AvatarExperience.Common.Hooks.useLocalWidgets);
local v13 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarRoute);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectFilterCount);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Types);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Components.WidgetListResultsHeader);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Components.WidgetListSpacer);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getOrganicResultIdsFromEntries);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getEntriesAsRows);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getWidgetItemIdsFromWidgetInfo);
local v22 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableWidgetDividerProps);
local v23 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagHideSubtitleFromWidgetSeeAll);
local v24 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagExtendWidgetAnalyticsWithWidgetItemIds);
local v25 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v26 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardTallEnabled);
local v27 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
local v28 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXWidgetsByContext);
local function v41(v29, v30, v31, v32, v33, v34)
    local v35 = {};
    local v36 = v4.fieldCount(v30);
    for _, v38 in v29, nil, nil do
        local v39 = v31[tostring(v38)];
        if not (not (not v32 or v39.id == v32) or v38 > v33 and v34) then
            local v40 = v36 + #v35;
            if v40 < v38 then
                v38 = v40 + 1;
            end;
            table.insert(v35, {
                rowNum = v38, 
                widgetInfo = v39
            });
        end;
    end;
    return v35;
end;
local function v43(v42)
    return v42.SearchesParameters;
end;
local function v45(v44)
    return v44.AvatarExperience.Catalog.Categories.category;
end;
local function v47(v46)
    return v46.AvatarExperience.Catalog.Categories.subcategory;
end;
return function(v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73)
    local v74, v75 = v2.useBinding(1);
    local v76, v77 = v2.useBinding(Vector2.new(1, 1));
    local v78 = nil;
    if v28() then
        local v79 = v13();
        local v80 = l_useSelector_0(v45);
        local v81 = l_useSelector_0(v47);
        if v80 then
            v78 = v15.getContextForWidgets(v79.current.name, v80, v81);
        end;
    end;
    local v82 = l_useSelector_0(v43)[v51];
    local v83 = v82 and v82.searchKeyword ~= nil;
    local v86 = l_useSelector_0((v2.useCallback(function(v84)
        local v85 = if not v83 then if v28() and v78 then v84.AvatarExperience.Common.Widgets.ContextWidgetInfo[v78] else v84.AvatarExperience.Common.Widgets.WidgetInfo else v84.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[v15.getQueryStringForSearchWidgets(v82)];
        if not v85 then
            return {};
        else
            return v85.Details;
        end;
    end, {
        v82, 
        v83
    })));
    local v87 = l_useSelector_0(v14);
    local v88 = v12(v51, v53, if not not v27() and v73 then v55 else nil);
    return (v2.useMemo(function()
        local v89 = {};
        for _ = 1, v54 do
            table.insert(v89, {});
        end;
        local v91 = v52 or v89;
        local v92 = math.ceil(v4.fieldCount(v91) / v49);
        local v93 = v20(v91, v92, v49);
        local v94 = v19(v91);
        local v95 = not not v82 and v82.categoryInfo or {};
        local v96 = not v3.isEmpty(v95) and v95.ShowWidgets or v83;
        if not ((not v28() or not v78) or v83) then
            v96 = true;
        end;
        if v87 > 0 then
            v96 = false;
        end;
        if not ((not v27() or not v73) or not v83) then
            v96 = v3.isEmpty(v95) or v95.ShowWidgets;
        end;
        local v97 = {};
        local v98 = 1;
        local v99 = 1;
        local v100 = v7(v88);
        local function _()
            while not ((not v96 or not v86) or not v86[tostring(v99)]) do
                v99 = v99 + 1;
            end;
        end;
        local v102 = v100.getNext();
        if not v58 then
            for v103, v104 in v93, nil, nil do
                while v102 and v102.row == v98 do
                    local l_component_0 = v102.component;
                    local l_v99_0 = v99;
                    local v107 = v63[l_v99_0 - 1];
                    if l_v99_0 <= 1 then
                        v107 = nil;
                    end;
                    while not ((not v96 or not v86) or not v86[tostring(v99)]) do
                        v99 = v99 + 1;
                    end;
                    do
                        local l_v107_0 = v107;
                        v97[v98] = {
                            key = "localWidget_" .. l_v99_0, 
                            render = function()
                                return v2.createElement(l_component_0, {
                                    searchUuid = v51, 
                                    fromSearch = v55, 
                                    itemsPerRow = v50, 
                                    itemDetailsPeekViewRefs = v62, 
                                    gridRef = v64, 
                                    scrollingFrameRef = v67(), 
                                    requestImpressionsSignal = v66, 
                                    onFocusGained = v65, 
                                    NextSelectionUp = l_v107_0, 
                                    NextSelectionDown = v63[l_v99_0 + 1], 
                                    ref = v63[l_v99_0], 
                                    rowIndex = l_v99_0, 
                                    gamepadNavigationColumn = v74, 
                                    setGamepadNavigationColumn = v75, 
                                    gamepadNavigationFocusPos = v76, 
                                    setGamepadNavigationFocusPos = v77, 
                                    itemSize = v48, 
                                    getItemMetrics = if not v25() then nil else v68, 
                                    hideItemNames = (not not v25() and v69) and true or nil
                                });
                            end
                        };
                        v98 = v98 + 1;
                        v99 = v99 + 1;
                        v102 = v100.getNext();
                    end;
                end;
                while not ((not v96 or not v86) or not v86[tostring(v99)]) do
                    v99 = v99 + 1;
                end;
                local l_v99_1 = v99;
                v97[v98] = {
                    key = "organicContentRow_" .. l_v99_1, 
                    render = function()
                        return v2.createElement(v10, {
                            searchUuid = v51, 
                            entryRowIndex = v103, 
                            row = v104, 
                            itemsPerRow = v49, 
                            itemSize = v48, 
                            fromSearch = v55, 
                            itemDetailsPeekViewRefs = v62, 
                            gridRef = v64, 
                            onFocusGained = v65, 
                            gamepadNavigationColumn = v74, 
                            setGamepadNavigationColumn = v75, 
                            gamepadNavigationFocusPos = v76, 
                            setGamepadNavigationFocusPos = v77, 
                            NextSelectionUp = v63[l_v99_1 - 1], 
                            NextSelectionDown = v63[l_v99_1 + 1], 
                            ref = v63[l_v99_1], 
                            hideItemNames = (not not v25() and v69) and true or nil, 
                            thumbnailAspectRatio = if not not v26() and v83 ~= true then v70 else nil, 
                            thumbnailScaleType = if not not v26() and v83 ~= true then v71 else nil, 
                            thumbnailSize = if not not v26() and v83 ~= true then v72 else nil
                        });
                    end
                };
                v98 = v98 + 1;
                v99 = v99 + 1;
            end;
        end;
        if not (not v96 or not v86) then
            local v110 = {};
            for v111, _ in v86, nil, nil do
                table.insert(v110, (tonumber(v111)));
            end;
            table.sort(v110);
            if not v22 then
                for _, v114 in v110, nil, nil do
                    local v115 = v86[tostring(v114)];
                    if v58 and v115.id ~= v58 then
                        --[[ close >= 19 ]]
                    else
                        do
                            local l_v114_0 = v114;
                            if not (l_v114_0 > v92 and v61) then
                                local v117 = v4.fieldCount(v97);
                                if v117 < l_v114_0 then
                                    l_v114_0 = v117 + 1;
                                end;
                                table.insert(v97, l_v114_0, {
                                    key = "widget_" .. l_v114_0, 
                                    render = function()
                                        return v2.createElement(v11, {
                                            widgetRow = l_v114_0, 
                                            widgetInfo = v115, 
                                            itemsPerRow = v49, 
                                            rowHeight = v48.Y, 
                                            itemSize = v48, 
                                            ref = v63[l_v114_0], 
                                            NextSelectionUp = v63[l_v114_0 - 1], 
                                            NextSelectionDown = v63[l_v114_0 + 1], 
                                            widgetAnalyticsInfo = {
                                                requestId = if not v115 then nil else v115.requestId, 
                                                widgetPosition = l_v114_0, 
                                                widgetId = if not v115 then nil else v115.id, 
                                                widgetType = if not v115 then nil else v115.type, 
                                                widgetAbsPosition = (l_v114_0 - 1) * v49, 
                                                query = if not v82 then nil else v82.searchKeyword, 
                                                organicResultIds = v94, 
                                                widgetItemIds = if not v24() then nil else v21(v115, v49)
                                            }, 
                                            widgetFocused = v58 and v115.id == v58, 
                                            requestWidgetAcquireFocus = function()
                                                if v59 then
                                                    v59(v115);
                                                end;
                                            end, 
                                            requestWidgetReleaseFocus = v60, 
                                            itemDetailsPeekViewRefs = v62, 
                                            gridRef = v64, 
                                            gamepadNavigationFocusPos = v76, 
                                            setGamepadNavigationFocusPos = v77
                                        });
                                    end
                                });
                            end;
                        end;
                    end;
                end;
            else
                local v118 = v41(v110, v97, v86, v58, v92, v61);
                for v119, v120 in v118, nil, nil do
                    local l_rowNum_0 = v120.rowNum;
                    local l_widgetInfo_0 = v120.widgetInfo;
                    local v123 = false;
                    if v119 < #v118 then
                        v123 = v118[v119 + 1].rowNum ~= l_rowNum_0 + 1;
                    end;
                    local v124 = false;
                    if v119 == #v118 then
                        v124 = l_rowNum_0 < #v97;
                    end;
                    table.insert(v97, l_rowNum_0, {
                        key = "widget_" .. l_rowNum_0, 
                        render = function()
                            return v2.createElement(v11, {
                                widgetRow = l_rowNum_0, 
                                widgetInfo = l_widgetInfo_0, 
                                itemsPerRow = v50, 
                                getItemMetrics = if not v25() then nil else v68, 
                                hideItemNames = (not not v25() and v69) and true or nil, 
                                rowHeight = v48.Y, 
                                itemSize = v48, 
                                ref = v63[l_rowNum_0], 
                                NextSelectionUp = v63[l_rowNum_0 - 1], 
                                NextSelectionDown = v63[l_rowNum_0 + 1], 
                                widgetAnalyticsInfo = {
                                    requestId = if not l_widgetInfo_0 then nil else l_widgetInfo_0.requestId, 
                                    widgetPosition = l_rowNum_0, 
                                    widgetId = if not l_widgetInfo_0 then nil else l_widgetInfo_0.id, 
                                    widgetType = if not l_widgetInfo_0 then nil else l_widgetInfo_0.type, 
                                    widgetAbsPosition = (l_rowNum_0 - 1) * v49, 
                                    query = if not v82 then nil else v82.searchKeyword, 
                                    organicResultIds = v94, 
                                    widgetItemIds = if not v24() then nil else v21(l_widgetInfo_0, v49)
                                }, 
                                widgetFocused = v58 and l_widgetInfo_0.id == v58, 
                                requestWidgetAcquireFocus = function()
                                    if v59 then
                                        v59(l_widgetInfo_0);
                                    end;
                                end, 
                                requestWidgetReleaseFocus = v60, 
                                itemDetailsPeekViewRefs = v62, 
                                gridRef = v64, 
                                gamepadNavigationFocusPos = v76, 
                                setGamepadNavigationFocusPos = v77, 
                                includeTopDivider = l_rowNum_0 > 1, 
                                includeBottomDivider = v123 or v124
                            });
                        end
                    });
                end;
            end;
        end;
        if not (not v55 or not v53) then
            local v125 = v23() and v58 ~= nil;
            table.insert(v97, 1, {
                key = "header", 
                render = function()
                    return v2.createElement(v17, {
                        searchUuid = v51, 
                        hideResultsHeader = v125
                    });
                end
            });
        end;
        if v56 then
            table.insert(v97, 1, {
                key = "topSpacer", 
                render = function()
                    return v2.createElement(v18, {
                        height = v56
                    });
                end
            });
        end;
        if v57 then
            table.insert(v97, {
                key = "bottomSpacer", 
                render = function()
                    return v2.createElement(v18, {
                        height = v57
                    });
                end
            });
        end;
        return v97;
    end, {
        v48, 
        v49, 
        v50, 
        v51, 
        v52, 
        v53, 
        v54, 
        v55, 
        v56, 
        v57, 
        v58, 
        v59, 
        v60, 
        v61, 
        v62, 
        v63, 
        v64, 
        v65, 
        v66, 
        v67, 
        v68, 
        v69, 
        v86, 
        v82, 
        v83, 
        v70, 
        v71, 
        v72, 
        if not v27() then nil else v73
    }));
end;
