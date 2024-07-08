local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.NavOverlayContainer);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v8 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.with10ftUIPadding);
local v11 = require(l_CorePackages_0.UIBlox);
local l_HeaderBar_0 = v11.App.Bar.HeaderBar;
local l_withStyle_0 = v11.Style.withStyle;
local l_Images_0 = v11.App.ImageSet.Images;
local v15 = l_Images_0["component_assets/circle_17"];
local v16 = v3.PureComponent:extend("NavOverlayPageContainer");
v16.validateProps = v5.strictInterface({
    headerBarProps = v5.strictInterface({
        title = v5.string, 
        renderLeft = v5.optional(v5.callback), 
        renderRight = v5.optional(v5.callback)
    }), 
    onDismiss = v5.callback, 
    ZIndex = v5.optional(v5.integer), 
    focusController = v5.table, 
    [v3.Children] = v5.table, 
    globalGuiInset = v5.strictInterface({
        left = v5.integer, 
        top = v5.integer, 
        right = v5.integer, 
        bottom = v5.integer
    }), 
    isPortrait = v5.boolean, 
    statusBarHeight = v5.number, 
    designTokens = v5.any
});
v16.renderWithProviders = function(v17, v18)
    local l_Theme_0 = v18.Theme;
    local l_globalGuiInset_0 = v17.props.globalGuiInset;
    local l_BackgroundDefault_0 = l_Theme_0.BackgroundDefault;
    local v22 = {};
    if not v17.props.isPortrait then
        l_BackgroundDefault_0 = l_Theme_0.BackgroundMuted;
        local l_ImageRectSize_0 = v15.ImageRectSize;
        local l_ImageRectOffset_0 = v15.ImageRectOffset;
        local l_X_0 = l_ImageRectSize_0.X;
        local v26 = l_X_0 / 2;
        v22 = {
            BackgroundTransparency = 1, 
            Image = v15.Image, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceScale = 1 / l_Images_0.ImagesResolutionScale, 
            SliceCenter = Rect.new(v26 - 1, v26 - 1, v26 + 1, v26), 
            ImageRectSize = Vector2.new(l_X_0, v26), 
            ImageRectOffset = l_ImageRectOffset_0, 
            ImageTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            ImageColor3 = l_Theme_0.BackgroundDefault.Color
        };
    end;
    local v27 = l_globalGuiInset_0.bottom > 0;
    local l_statusBarHeight_0 = v17.props.statusBarHeight;
    local l_designTokens_0 = v17.props.designTokens;
    return v3.createElement("TextButton", {
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        Text = "", 
        AutoButtonColor = false, 
        [v3.Event.Activated] = v17.props.onDismiss
    }, {
        GamepadFocusHandlerForPage = v3.createElement(v7, {
            focusController = v17.props.focusController, 
            captureFocusOnMount = true
        }), 
        NavOverlayContainer = v3.createElement(v6, {}, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            StatusBarBackground = v3.createElement("TextButton", {
                BackgroundColor3 = l_BackgroundDefault_0.Color, 
                BackgroundTransparency = not not v17.props.isPortrait and l_BackgroundDefault_0.Transparency or 1, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, l_statusBarHeight_0), 
                Text = "", 
                BorderSizePixel = 0, 
                AutoButtonColor = false
            }), 
            HeaderBarBackground = v3.createElement("TextButton", {
                BackgroundColor3 = l_BackgroundDefault_0.Color, 
                BackgroundTransparency = l_BackgroundDefault_0.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 44), 
                Text = "", 
                AutoButtonColor = false, 
                LayoutOrder = 2
            }, {
                HeaderBar = v3.createElement(l_HeaderBar_0, v2.Dictionary.join(v17.props.headerBarProps, {
                    backgroundTransparency = 1, 
                    barHeight = 44
                }))
            }), 
            ContentsFrame = v3.createElement("ImageButton", v2.Dictionary.join({
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.fromOffset(0, 44), 
                Size = UDim2.new(1, 0, 1, -(44 + l_statusBarHeight_0) + (not l_designTokens_0 and 0 or l_designTokens_0.bottomPadding)), 
                ClipsDescendants = true, 
                AutoButtonColor = false, 
                LayoutOrder = 3
            }, v22), v17.props[v3.Children]), 
            BottomInsetBackground = v27 and v3.createElement("TextButton", {
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, l_globalGuiInset_0.bottom), 
                Text = "", 
                ZIndex = 3, 
                AutoButtonColor = false, 
                LayoutOrder = 4
            })
        })
    });
end;
v16.render = function(v30)
    return l_withStyle_0(function(v31)
        return v30:renderWithProviders(v31);
    end);
end;
return v4.connect(function(v32, _)
    return {
        globalGuiInset = v32.GlobalGuiInset, 
        isPortrait = v8(v32), 
        statusBarHeight = v32.TopBar.statusBarHeight
    };
end, nil)((v10(v16)));
