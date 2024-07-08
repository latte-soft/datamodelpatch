local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v6.App.Button.Enum.StandardButtonSize;
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.WidgetTile);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchHydratedWidgetContent);
local v24 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v26 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveWidgetInfo);
local v27 = game:DefineFastInt("WidgetsNumItemsToHydrate", 30);
local v28 = require(l_Modules_0.AvatarExperience.Flags.GetAXWidgetSeeAllButton);
local v29 = require(l_Modules_0.AvatarExperience.Flags.GetAXWidgetOnePreviewRow);
local v30 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableExperienceWidgets);
local v31 = game:DefineFastFlag("FixWidgetHydrationEmptyTile", false);
local v32 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRemoveEmptyHydratedWidgets);
local v33 = game:DefineFastFlag("AXRemoveExtraSeeAllTiles", false);
local v34 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagExtendWidgetAnalyticsWithWidgetItemIds);
local v35 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarWidgetData);
local v36 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXWidgetItemsPerRowLowerBound);
local v37 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagSupportLooksTileFooter);
return function(v39)
    local v40 = v4.useRefCache();
    local v41 = v4.useFocusController();
    local v42 = l_useStyle_0();
    local l_Font_0 = v42.Font;
    local l_Theme_0 = v42.Theme;
    local v45 = l_useDesignTokens_0();
    local v46 = l_useDispatch_0();
    local v47 = v7(v16);
    local v48 = v7(v25);
    local v49 = (v39.widgetAnalyticsInfo and v39.widgetAnalyticsInfo.organicResultIds) and #v39.widgetAnalyticsInfo.organicResultIds > 0;
    v3.useEffect(function()
        if v49 then
            v48.widgetInteractionV2(v39.widgetAnalyticsInfo, v24.ActionType.IMPRESSION);
        end;
    end, {
        v49
    });
    local v50, v51 = v3.useState(Vector2.new());
    local l_gridRef_0 = v39.gridRef;
    local l_itemDetailsPeekViewRefs_0 = v39.itemDetailsPeekViewRefs;
    local v55 = l_useSelector_0(function(v54)
        return v54.AvatarExperience.Common.Widgets.HydratedWidgetData;
    end);
    local v57 = l_useSelector_0(function(v56)
        return v56.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    end);
    local l_itemsPerRow_0 = v39.itemsPerRow;
    local l_widgetInfo_0 = v39.widgetInfo;
    if not ((not (v57 and l_widgetInfo_0.type ~= v24.Types.SearchToLooksWidget) or not (not v30() and true or l_widgetInfo_0.type ~= v24.Types.InExperienceShopWidget)) or v29()) then
        l_itemsPerRow_0 = l_itemsPerRow_0 + v39.itemsPerRow;
    end;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    if v28() then
        v62 = (not not v57 and l_widgetInfo_0.type ~= v24.Types.SearchToLooksWidget) and 2 or 1;
        if v29() then
            v62 = 1;
        end;
        local v63, v64 = v3.useState(v62);
        v60 = v63;
        v61 = v64;
        v3.useEffect(function()
            v61(v62);
        end, {
            v57
        });
        l_itemsPerRow_0 = if not v33 then v60 * v39.itemsPerRow else math.min(v60 * v39.itemsPerRow, v27);
        v3.useEffect(function()
            v61(if not v39.widgetFocused then v62 else math.ceil(v27 / v39.itemsPerRow));
        end, {
            v39.widgetFocused
        });
    end;
    local v68 = v3.useMemo(function()
        local v65 = {};
        if not ((not l_widgetInfo_0 or not l_widgetInfo_0.content) or v5.isEmpty(l_widgetInfo_0.content)) then
            if v27 > 0 then
                for v66 = 1, v27 do
                    local v67 = l_widgetInfo_0.content[v66];
                    if v67 then
                        assert(v55, "");
                        if not (v55[v67.type] and v55[v67.type][tostring(v67.id)]) then
                            table.insert(v65, v67);
                        end;
                    end;
                end;
                return v65;
            else
                table.move(l_widgetInfo_0.content, 1, if v27 > 0 then v27 else l_itemsPerRow_0 * 3, 1, v65);
            end;
        end;
        return v65;
    end, if not v28() then {} else {
        v60
    });
    local v69 = if not v28() then {} else {
        v60
    };
    if v31 then
        table.insert(v69, v55);
    end;
    if v36() then
        table.insert(v69, l_itemsPerRow_0);
    end;
    local v75 = v3.useMemo(function()
        local v70 = {};
        local v71 = 0;
        local v72 = 0;
        if l_widgetInfo_0.content then
            assert(l_widgetInfo_0.content, "");
            while (v71 < l_itemsPerRow_0 and v72 < l_itemsPerRow_0 * 3) and v72 < #l_widgetInfo_0.content do
                local v73 = l_widgetInfo_0.content[v72 + 1];
                local v74 = nil;
                assert(v55, "");
                v74 = v55[v73.type] and v55[v73.type][tostring(v73.id)];
                if not (v74 and v74.failedToHydrate) then
                    table.insert(v70, v73);
                    v71 = v71 + 1;
                end;
                v72 = v72 + 1;
            end;
            return v70;
        else
            return v70;
        end;
    end, v69);
    if v32() then
        v3.useEffect(function()
            if #v75 == 0 then
                v46(v26(v39.widgetInfo.id));
            end;
        end, {
            v75
        });
    end;
    local v79 = v3.useMemo(function()
        local v76 = {};
        for _, v78 in v75, nil, nil do
            table.insert(v76, v78.id);
        end;
        return v76;
    end, {
        v75
    });
    local v80 = l_useLocalization_0({
        titleText = if not not l_widgetInfo_0 and l_widgetInfo_0.template then l_widgetInfo_0.template.title else nil, 
        descText = if not not l_widgetInfo_0 and l_widgetInfo_0.template then l_widgetInfo_0.template.description else nil, 
        seeAllButtonText = "Feature.Catalog.ActionSeeAll"
    });
    local function v85()
        local v81 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
        local v82 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        local v83 = ((v28() and l_widgetInfo_0) and l_widgetInfo_0.template) and l_widgetInfo_0.template.seeAllButton;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            TitleDescriptionFrame = v3.createElement("Frame", {
                Size = if not v83 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0 - (v50.X + v45.Global.Space_150), 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 5)
                }), 
                Title = if not v80.titleText then nil else v3.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    Text = v80.titleText, 
                    Font = l_Font_0.Header1.Font, 
                    TextSize = v81, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 1
                }, {
                    UISizeConstraint = if not v83 then nil else v3.createElement("UISizeConstraint", {
                        MinSize = Vector2.new(0, v50.Y)
                    })
                }), 
                Description = if not v80.descText then nil else v3.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    Text = v80.descText, 
                    Font = l_Font_0.Body.Font, 
                    TextSize = v82, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 1
                })
            }), 
            SeeAll = if not v83 then nil else v3.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                anchorPoint = Vector2.new(1, 0), 
                position = UDim2.fromScale(1, 0), 
                text = v80.seeAllButtonText, 
                fitContent = true, 
                standardSize = l_StandardButtonSize_0.XSmall, 
                onActivated = function()
                    if v39.requestWidgetAcquireFocus then
                        v39.requestWidgetAcquireFocus();
                    end;
                end, 
                [v3.Change.AbsoluteSize] = function(v84)
                    v51(v84.AbsoluteSize);
                end
            })
        });
    end;
    local v86 = {
        widgetRow = v39.widgetRow, 
        widgetId = v39.widgetInfo.id
    };
    local l_type_0 = l_widgetInfo_0.type;
    local v90 = v3.useCallback(function(v88, v89)
        v86 = v5.Dictionary.join(v39.widgetAnalyticsInfo, {
            itemPosition = v89, 
            itemId = v88.id, 
            itemType = v88.type, 
            widgetItemIds = if not v34() then v79 else nil
        });
        return v3.createElement(v22, {
            size = UDim2.fromOffset(v39.itemSize.X, v39.itemSize.Y), 
            tileContentType = if not v35() then nil else l_type_0, 
            contentType = v88.type, 
            contentId = v88.id, 
            index = v89, 
            itemsPerRow = v39.itemsPerRow, 
            analyticsItemCountPerPage = l_itemsPerRow_0, 
            widgetAnalyticsInfo = v86, 
            refCache = v40, 
            resultsListRef = l_gridRef_0, 
            itemDetailsPeekViewRefs = l_itemDetailsPeekViewRefs_0, 
            hideItemName = if not v37() then nil else v39.hideItemName, 
            widgetFocused = if not v38() then nil else v39.widgetFocused, 
            onFocusGained = function()
                if v39.gamepadNavigationFocusPos:getValue().Y == v39.widgetRow then
                    v39.setGamepadNavigationFocusPos(Vector2.new(v89, v39.widgetRow));
                end;
            end
        });
    end);
    local function v96()
        local v91 = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize;
        local l_CatalogItemTile_0 = v18.ItemTileType.CatalogItemTile;
        if not (not v38() or not v39.widgetInfo) and (not (v39.widgetInfo.type ~= v24.Types.SearchToAvatarLooksWidget) or v39.widgetInfo.type == v24.Types.SearchToCommunityLooksWidget) then
            l_CatalogItemTile_0 = v18.ItemTileType.LookItemTile;
        end;
        local v93 = not not v37() and v39.hideItemName;
        return v3.createElement(v4.Focusable.Frame, {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            onFocusGained = function()
                v39.setGamepadNavigationFocusPos(Vector2.new(v39.gamepadNavigationFocusPos:getValue().X, v39.widgetRow));
                local l_X_0 = v39.gamepadNavigationFocusPos:getValue().X;
                local _ = nil;
                v41.moveFocusTo(if not l_X_0 then v40[1] else v40[math.min(l_X_0, v39.itemsPerRow)]);
            end
        }, {
            GridView = v3.createElement(v21, {
                getItemHeight = if not v38() then v19.GridItemHeightGetter(l_CatalogItemTile_0, v91, v93) else v19.GridItemHeightGetter(l_CatalogItemTile_0, v91, v93, if not v38() then nil else v39.widgetInfo.type), 
                items = v75, 
                totalNumItems = l_itemsPerRow_0, 
                renderItem = v90, 
                getItemMetrics = if not v37() then nil else v39.getItemMetrics
            })
        });
    end;
    v3.useEffect(function()
        if v27 > 0 and #v68 == 0 then
            return ;
        else
            v46(v23(v47, v68, l_widgetInfo_0.id));
            return ;
        end;
    end, if not v28() then {} else {
        v60
    });
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v39.LayoutOrder
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 12)
        }), 
        TopContent = if not not v28() and v39.widgetFocused then nil else v85(), 
        ItemGroup = v96()
    });
end;
