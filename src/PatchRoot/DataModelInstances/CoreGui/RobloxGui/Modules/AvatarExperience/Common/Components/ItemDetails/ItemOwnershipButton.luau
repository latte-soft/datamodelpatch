local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSellPageData);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances);
local v12 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v4.Core.Control.Interactable;
local l_ControlState_0 = v4.Core.Control.Enum.ControlState;
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v23 = {
    [l_ControlState_0.Default] = "BackgroundUIDefault", 
    [l_ControlState_0.Hover] = "BackgroundOnHover", 
    [l_ControlState_0.Pressed] = "BackgroundOnPress"
};
local v24 = {
    onActivated = function()
    end
};
return (v2.forwardRef(function(v25, v26)
    v25 = v3.Dictionary.join(v24, v25);
    local v27 = l_useStyle_0();
    local v28 = l_useDispatch_0();
    local v29 = nil;
    v29 = if not v22() then v25.collectibleItemId else if v25.isLimitedCollectible then v25.collectibleItemId else nil;
    local v37 = l_useSelector_0(function(v30)
        if not v29 then
            local v31 = v30.AvatarExperience.Catalog.Sell.AvailableToSellAssets[v25.itemId];
            local v32 = v30.AvatarExperience.Catalog.Sell.CurrentlySellingAssets[v25.itemId];
            if v31 and v32 then
                return #v31 + #v32;
            else
                return nil;
            end;
        else
            local v33 = v30.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v29];
            if v33 then
                local v34 = 0;
                for _, _ in v33, nil, nil do
                    v34 = v34 + 1;
                end;
                return v34;
            else
                return nil;
            end;
        end;
    end);
    local v39 = l_useSelector_0(function(v38)
        return v38.LocalUserId;
    end);
    local v40, v41 = v2.useState(l_ControlState_0.Initialize);
    local v44 = v2.useCallback(function(_, v43)
        v41(v43);
    end);
    local v45 = v12(v13);
    v2.useEffect(function()
        if v45 then
            if not v29 then
                v28(v10(v45, v25.itemId, v39));
                return ;
            else
                v28(v11(v45, v29, v39));
                return ;
            end;
        else
            return ;
        end;
    end, {
        v25.itemId, 
        v39, 
        v29
    });
    local v46 = v27.Theme[v23[v40] or v23[l_ControlState_0.Default]];
    return v2.createElement(l_Focusable_0[l_Interactable_0], {
        Size = v25.size, 
        AutomaticSize = v25.automaticSize, 
        BackgroundColor3 = v46.Color, 
        BackgroundTransparency = v46.Transparency, 
        BorderSizePixel = 0, 
        AutoButtonColor = false, 
        LayoutOrder = v25.layoutOrder, 
        onStateChanged = v44, 
        ref = if not v21() then nil else v26, 
        SelectionImageObject = if not v21() then nil else l_useSelectionCursor_0(l_CursorKind_0.RoundedRect), 
        NextSelectionUp = if not v21() then nil else v25.NextSelectionUp, 
        NextSelectionDown = if not v21() then nil else v25.NextSelectionDown, 
        NextSelectionLeft = if not v21() then nil else v25.NextSelectionLeft, 
        NextSelectionRight = if not v21() then nil else v25.NextSelectionRight, 
        [v2.Event.Activated] = v25.onActivated
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 14), 
            PaddingRight = UDim.new(0, 14), 
            PaddingTop = UDim.new(0, 14), 
            PaddingBottom = UDim.new(0, 14)
        }), 
        ItemOwnedLabelContainer = v2.createElement("Frame", {
            Size = UDim2.fromScale(0, 1), 
            BorderSizePixel = 0
        }, {
            Layout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 6), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            OwnedIcon = v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(16, 16), 
                Image = l_Images_0["icons/status/item/owned"], 
                ImageColor3 = v27.Theme.IconEmphasis.Color, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }), 
            ItemOwnedLabel = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = l_useLocalization_0({
                    itemOwned = {
                        "Feature.Catalog.Label.ItemOwnedCount"; 
                        itemCount = v37 or 0
                    }
                }).itemOwned, 
                Font = v27.Font.Body.Font, 
                TextSize = v27.Font.BaseSize * v27.Font.Body.RelativeSize, 
                TextColor3 = v27.Theme.TextDefault.Color, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            })
        }), 
        ItemCountLabelContainer = v2.createElement("Frame", {
            Size = UDim2.fromScale(0, 1), 
            Position = UDim2.fromScale(1, 0), 
            BorderSizePixel = 0
        }, {
            Layout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 6), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            ArrowIcon = v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(16, 16), 
                Image = l_Images_0["icons/navigation/pushRight_small"], 
                ImageColor3 = v27.Theme.IconEmphasis.Color, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            })
        })
    });
end));
