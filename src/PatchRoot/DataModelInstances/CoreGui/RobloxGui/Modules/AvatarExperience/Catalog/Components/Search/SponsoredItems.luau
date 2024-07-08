local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_useSelectedTheme_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useSelectedTheme;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v11 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local l_IconWithTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).IconWithTooltip;
local l_TooltipOrientation_0 = v6.App.Dialog.Enum.TooltipOrientation;
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.SponsoredItemsImpressionsTracker);
local v18 = require(l_Modules_0.AvatarExperience.Flags.SponsoredItemsIXPTest);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectSponsoredItems);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableSponsoredTooltipForAvatarCatalog);
return function(v23)
    local l_LayoutOrder_0 = v23.LayoutOrder;
    local l_numItemsPerRow_0 = v23.numItemsPerRow;
    local v26 = l_useStyle_0();
    local v27 = l_useSelectedTheme_0() == "dark";
    local v28 = v10({
        sponsored = "Feature.GamePage.Label.Sponsored", 
        sponsoredDisclosure = if not v22() then nil else "Feature.GamePage.Label.SponsoredDisclosure"
    });
    local v29 = l_useSelector_0(v19);
    local v30 = l_numItemsPerRow_0 * ((v11.useTestVariables(v18.Row) or 1) - 1);
    local v31 = v3.useMemo(function()
        if v29 and l_numItemsPerRow_0 > 0 then
            return v5.List.getRange(v29, 1, l_numItemsPerRow_0);
        else
            return nil;
        end;
    end, {
        v29, 
        l_numItemsPerRow_0
    });
    local l_Font_0 = v26.Font;
    local l_Font_1 = l_Font_0.Body.Font;
    local v34 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v35 = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize;
    local l_CatalogItemTile_0 = v14.ItemTileType.CatalogItemTile;
    local v37 = v15.GridItemHeightGetter(l_CatalogItemTile_0, v35);
    if v21() then
        v37 = v15.GridItemHeightGetter(l_CatalogItemTile_0, v35, v23.hideItemName);
    end;
    local l_Theme_0 = v26.Theme;
    local v39 = if not v27 then l_Theme_0.BackgroundContrast else l_Theme_0.BackgroundMuted;
    return v3.createElement(v4.Focusable.Frame, {
        Size = UDim2.new(1, 30, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = v39.Transparency, 
        BackgroundColor3 = v39.Color, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        onFocusGained = v23.moveFocusToColumn
    }, {
        ImpressionsTracker = v3.createElement(v17, {
            visibleItems = v31 or {}, 
            scrollingFrameRef = v23.scrollingFrameRef, 
            sponsoredGridRef = v23.sponsoredGridRef, 
            requestImpressionsSignal = v23.requestImpressionsSignal, 
            indexOffset = v30
        }), 
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 15), 
            PaddingRight = UDim.new(0, 15), 
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12)
        }), 
        UIListLayout = v3.createElement("UIListLayout", {
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        SponsoredLabel = if not v22() then v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = l_Font_1, 
            Text = v28.sponsored, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextWrapped = true, 
            TextSize = v34, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = l_Theme_0.TextMuted.Color, 
            LayoutOrder = 1
        }) else v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1
        }, {
            SponsoredUIListLayout = v3.createElement("UIListLayout", {
                Padding = UDim.new(0, v26.Tokens.Global.Size_50), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            SponsoredTitle = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                Text = v28.sponsored, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextWrapped = true, 
                TextSize = v34, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                LayoutOrder = 1
            }), 
            SponsoredTooltip = v3.createElement(l_IconWithTooltip_0, {
                tooltipOrientation = l_TooltipOrientation_0.Right, 
                onActivateTooltip = v23.onActivateTooltipCallback, 
                anchorPoint = Vector2.new(1, 0), 
                layoutOrder = 2, 
                hoverText = v28.sponsoredDisclosure, 
                triggerPointName = "SponsoredTooltip", 
                supportTenFootUi = true, 
                supportVR = true
            })
        }), 
        GridView = v3.createElement(v16, {
            getItemHeight = v37, 
            items = v31, 
            totalNumItems = if not not v31 and #v31 > 0 then #v31 else l_numItemsPerRow_0, 
            renderItem = v23.renderItem, 
            LayoutOrder = 2, 
            NextSelectionRight = v23.NextSelectionRight, 
            NextSelectionUp = v23.NextSelectionUp, 
            NextSelectionDown = v23.NextSelectionDown, 
            ref = v23.sponsoredGridRef, 
            restorePreviousChildFocus = true, 
            onFocusGained = v23.onFocusGained, 
            getItemMetrics = if not v21() then nil else v23.getItemMetrics
        })
    });
end;
