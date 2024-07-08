local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetButton_0 = v5.Core.ImageSet.ImageSetButton;
local l_Focusable_0 = v6.Focusable;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_withNavigationFocus_0 = require(l_CorePackages_0.RoactNavigation).withNavigationFocus;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_IconSize_0 = v5.App.Constant.IconSize;
local v17 = {
    [v12.AvatarEditor] = true, 
    [v12.Catalog] = true, 
    [v12.CatalogSearch] = true
};
local v18 = l_Images_0["icons/actions/adjust"];
local function _(v19)
    local l_isUIFullView_0 = v19.isUIFullView;
    local l_isSceneFullView_0 = v19.isSceneFullView;
    local l_name_0 = v19.avatarRoute.opaque.name;
    local v23 = false;
    if v17[l_name_0] ~= nil then
        v23 = v19.isFocused;
    end;
    return (v23 and not l_isUIFullView_0) and not l_isSceneFullView_0;
end;
local v37 = l_withNavigationFocus_0((v13(function(v25)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v27 = v3.useRef(nil);
    local l_forwardRef_0 = v25.forwardRef;
    local v29 = v3.useCallback(function()
        v25.navigation.navigate(v12.AvatarRefinement);
    end);
    local l_createElement_0 = v3.createElement;
    local l_Frame_0 = l_Focusable_0.Frame;
    local v32 = {
        Size = UDim2.fromOffset(44, 44)
    };
    local l_isUIFullView_1 = v25.isUIFullView;
    local l_isSceneFullView_1 = v25.isSceneFullView;
    local l_name_1 = v25.avatarRoute.opaque.name;
    local v36 = false;
    if v17[l_name_1] ~= nil then
        v36 = v25.isFocused;
    end;
    v32.Visible = (v36 and not l_isUIFullView_1) and not l_isSceneFullView_1;
    v32.BackgroundColor3 = l_Theme_0.BackgroundMuted.Color;
    v32.BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency;
    v32.LayoutOrder = v25.layoutOrder;
    v32[v4.Ref] = l_forwardRef_0;
    v32.defaultChild = v27;
    return l_createElement_0(l_Frame_0, v32, {
        Corner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Image = v3.createElement(l_Focusable_0[l_ImageSetButton_0], {
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(l_IconSize_0.Regular, l_IconSize_0.Regular), 
            BackgroundTransparency = 1, 
            Image = v18, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            ImageTransparency = 0, 
            ZIndex = 2, 
            [v3.Event.Activated] = v29, 
            [v4.Ref] = v27, 
            NextSelectionLeft = v25.NextSelectionLeft, 
            SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect)
        })
    });
end)));
return v4.forwardRef(function(v38, v39)
    return v4.createElement(v37, v2.Dictionary.join(v38, {
        forwardRef = v39
    }));
end);
