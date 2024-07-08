local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local v6 = require(l_Modules_0.AvatarExperience.Common.Hooks.useSendCounter);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v8 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.ItemGroupWidget);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.EntryButtonWidget);
local v11 = require(l_Modules_0.AvatarExperience.Common.Context.WidgetInfoContext);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsEnums);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCounterLooksWidgetHome);
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagFixLooksWidgetBottomPadding);
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetAXWidgetSeeAllButton);
local v19 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableWidgetDividerProps);
local v20 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableWidgetSeeAllTracking);
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagSupportLooksTileFooter);
local v23 = {
    [v8.Templates.ItemGroup] = {
        component = v9, 
        includeDividers = true
    }, 
    [v8.Templates.Button] = {
        component = v10, 
        includeDividers = false
    }
};
return (v3.forwardRef(function(v24, v25)
    local l_widgetRow_0 = v24.widgetRow;
    local l_widgetInfo_0 = v24.widgetInfo;
    local v28 = if not v16() then nil else v6();
    local v29 = if not v21() then nil else v14(v13);
    if ((not l_widgetInfo_0 or not l_widgetInfo_0.template) or not l_widgetInfo_0.template.type) or v23[l_widgetInfo_0.template.type] == nil then
        return nil;
    else
        if v28 then
            v3.useEffect(function()
                if not ((not v24.widgetInfo or not v24.widgetInfo.id) or not string.find(v24.widgetInfo.id, "PopularLooksWidget")) then
                    v28(v12.Counter.PopularLooksWidgetHomeView);
                end;
            end, {
                v24.widgetInfo
            });
        end;
        assert(l_widgetInfo_0.template, "");
        local v30 = v23[l_widgetInfo_0.template.type];
        local l_component_0 = v30.component;
        local l_includeDividers_0 = v30.includeDividers;
        local v33 = l_useStyle_0();
        local l_Color_0 = v33.Theme.Divider.Color;
        local l_Transparency_0 = v33.Theme.Divider.Transparency;
        local v36 = v3.useMemo(function()
            return {
                widgetRow = v24.widgetRow, 
                widgetId = if not v24.widgetInfo then nil else v24.widgetInfo.id
            };
        end, {
            v24.widgetRow, 
            v24.widgetInfo
        });
        local v37 = if not v19 then l_includeDividers_0 else v24.includeTopDivider;
        local v38 = if not v19 then l_includeDividers_0 else v24.includeBottomDivider;
        local v39 = ((v17() and v24.widgetInfo) and v24.widgetInfo.id) and string.find(v24.widgetInfo.id, "LooksWidget");
        return v3.createElement(v4.Focusable.Frame, {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            ref = v25, 
            NextSelectionUp = v24.NextSelectionUp, 
            NextSelectionDown = v24.NextSelectionDown
        }, {
            WidgetInfoProvider = v3.createElement(v11.Provider, {
                value = v36
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                TopFrame = if not not v37 and l_widgetRow_0 ~= 1 then v3.createElement("Frame", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 24)
                }, {
                    TopDivider = v3.createElement("Frame", {
                        BackgroundTransparency = l_Transparency_0, 
                        BackgroundColor3 = l_Color_0, 
                        Size = UDim2.new(1, 0, 0, 2), 
                        BorderSizePixel = 0
                    })
                }) else nil, 
                WidgetContent = v3.createElement(l_component_0, {
                    LayoutOrder = 2, 
                    widgetInfo = v24.widgetInfo, 
                    itemsPerRow = v24.itemsPerRow, 
                    rowHeight = v24.rowHeight, 
                    widgetRow = l_widgetRow_0, 
                    widgetAnalyticsInfo = v24.widgetAnalyticsInfo, 
                    getItemMetrics = if not v20() then nil else v24.getItemMetrics, 
                    hideItemName = if not v20() then nil else v24.hideItemNames, 
                    widgetFocused = if v18() or v22() then v24.widgetFocused else nil, 
                    requestWidgetAcquireFocus = if not v18() then nil else if not v21() then v24.requestWidgetAcquireFocus else if not v21() then nil else v3.useCallback(function()
                        if v24.requestWidgetAcquireFocus then
                            v29.widgetInteractionV2(v24.widgetAnalyticsInfo, v15.ActionType.SEE_ALL);
                            v24.requestWidgetAcquireFocus();
                        end;
                    end, {
                        v24.requestWidgetAcquireFocus
                    }), 
                    requestWidgetReleaseFocus = if not v18() then nil else v24.requestWidgetReleaseFocus, 
                    itemDetailsPeekViewRefs = v24.itemDetailsPeekViewRefs, 
                    gridRef = v24.gridRef, 
                    gamepadNavigationFocusPos = v24.gamepadNavigationFocusPos, 
                    setGamepadNavigationFocusPos = v24.setGamepadNavigationFocusPos, 
                    itemSize = v24.itemSize
                }), 
                BottomPaddingBetweenDivider = v39 and v3.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 24)
                }), 
                BottomFrame = v3.createElement("Frame", {
                    LayoutOrder = not v39 and 3 or 4, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 24)
                }, {
                    BottomDivider = if not v38 then nil else v3.createElement("Frame", {
                        BackgroundTransparency = l_Transparency_0, 
                        BackgroundColor3 = l_Color_0, 
                        Size = UDim2.new(1, 0, 0, 2), 
                        BorderSizePixel = 0
                    })
                })
            })
        });
    end;
end));
