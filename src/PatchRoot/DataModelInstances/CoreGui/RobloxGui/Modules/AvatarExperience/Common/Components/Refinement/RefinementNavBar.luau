local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.RoactNavigation);
local v7 = require(l_CorePackages_0.UIBlox);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Focusable_0 = v5.Focusable;
local l_IconButton_0 = v7.App.Button.IconButton;
local l_Images_0 = v7.App.ImageSet.Images;
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_withNavigationFocus_0 = v6.withNavigationFocus;
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_IconSize_0 = v7.App.Constant.IconSize;
local v18 = l_Images_0["icons/menu/clothing/accessories_on"];
local v19 = l_Images_0["icons/menu/clothing/accessories_off"];
local v20 = l_Images_0["icons/menu/clothing/clothing_off"];
local v21 = l_Images_0["icons/menu/clothing/clothing_on"];
local function v23(v22)
    return v22.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
end;
local function v25(v24)
    return v24.TopBar.topBarHeight;
end;
local v37 = l_withNavigationFocus_0((v15(function(v26)
    local v27 = v3.useRef(nil);
    local v28 = v3.useRef(nil);
    local l_Theme_0 = l_useStyle_0().Theme;
    local v30 = v3.useCallback(function()
        v26.navigation.navigate(v14.AccessoryAdjustment);
    end);
    local v31 = v3.useCallback(function()
        v26.navigation.navigate(v14.LayeredClothingSort);
    end);
    local v32 = l_useSelector_0(v23);
    local v33 = l_useSelector_0(v25);
    local v34 = not v32 and 88 or 24;
    local v35 = v26.avatarRoute.opaque.name == v14.AccessoryAdjustment;
    local v36 = v26.avatarRoute.opaque.name == v14.LayeredClothingSort;
    return v3.createElement(l_Focusable_0.Frame, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0, v34, 0, v33 + 4), 
        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
        ZIndex = 2, 
        [v4.Ref] = v26.defaultChildRef, 
        defaultChild = v27, 
        NextSelectionUp = v26.NextSelectionUp, 
        NextSelectionRight = v26.NextSelectionRight
    }, {
        Corner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UIListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 16)
        }), 
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 8), 
            PaddingBottom = UDim.new(0, 8), 
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8)
        }), 
        LCSort = v3.createElement(l_IconButton_0, {
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            icon = if not v36 then v21 else v20, 
            iconColor3 = if not v36 then l_Theme_0.IconDefault.Color else l_Theme_0.IconEmphasis.Color, 
            iconTransparency = if not v36 then l_Theme_0.IconDefault.Transparency else l_Theme_0.IconEmphasis.Transparency, 
            layoutOrder = 1, 
            iconSize = l_IconSize_0.Medium, 
            onActivated = v31, 
            showBackground = true, 
            buttonRef = v27, 
            NextSelectionDown = v28
        }), 
        AccessoryAdjustment = v3.createElement(l_IconButton_0, {
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            layoutOrder = 2, 
            showBackground = true, 
            icon = if not v35 then v19 else v18, 
            iconSize = l_IconSize_0.Medium, 
            iconColor3 = if not v35 then l_Theme_0.IconDefault.Color else l_Theme_0.IconEmphasis.Color, 
            iconTransparency = if not v35 then l_Theme_0.IconDefault.Transparency else l_Theme_0.IconEmphasis.Transparency, 
            onActivated = v30, 
            buttonRef = v28, 
            NextSelectionUp = v27
        })
    });
end)));
return v3.forwardRef(function(v38, v39)
    return v3.createElement(v37, v2.Dictionary.join(v38, {
        defaultChildRef = v39
    }));
end);
