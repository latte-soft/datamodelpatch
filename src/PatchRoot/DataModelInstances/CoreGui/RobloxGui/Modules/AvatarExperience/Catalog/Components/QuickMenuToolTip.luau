local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v8 = require(l_CorePackages_0.UIBlox);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v10 = require(l_CorePackages_0.AvatarExperienceDeps);
local v11 = require(l_CorePackages_0.Packages.t);
local l_withSelectionCursorProvider_0 = v8.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v8.App.SelectionImage.CursorKind;
local l_RoactFitComponents_0 = v10.RoactFitComponents;
local l_FitFrameOnAxis_0 = l_RoactFitComponents_0.FitFrameOnAxis;
local l_IconSize_0 = v8.App.Constant.IconSize;
local l_ImageSetButton_0 = v8.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v8.Style.withStyle;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v22 = {
    left = 4, 
    right = 0, 
    top = 0, 
    bottom = 0
};
local v23 = v3.PureComponent:extend("QuickMenuToolTip");
v23.validateProps = v11.strictInterface({
    forwardRef = v11.optional(v11.table), 
    NextSelectionRight = v11.optional(v11.table), 
    navigation = v11.table
});
v23.makeOnOverlayClosed = function(_, v25)
    return function()
        v21("QuickMenuToolTip");
        v25.captureFocus();
    end;
end;
v23.openQuickMenu = function(v26, v27)
    v26.props.navigation.navigate(v20.AvatarExperienceQuickMenu, {
        onOverlayClosed = v26:makeOnOverlayClosed(v27)
    });
end;
v23.render = function(v28)
    return l_withLocalization_0({
        quickMenu = "Feature.Catalog.Heading.QuickMenu"
    })(function(v29)
        return l_withStyle_0(function(v30)
            local l_Font_0 = v30.Font;
            local l_Theme_0 = v30.Theme;
            local l_Font_1 = l_Font_0.Header1.Font;
            local v34 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
            return l_withSelectionCursorProvider_0(function(v35)
                return v5.withFocusController(function(v36)
                    local function v37()
                        v28:openQuickMenu(v36);
                    end;
                    return v3.createElement(l_Focusable_0[l_FitFrameOnAxis_0], {
                        axis = l_FitFrameOnAxis_0.Axis.Horizontal, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        BackgroundTransparency = 1, 
                        minimumSize = UDim2.new(0, 0, 0, 36), 
                        margin = v22, 
                        LayoutOrder = 1, 
                        [v3.Ref] = v28.props.forwardRef, 
                        NextSelectionRight = v28.props.NextSelectionRight, 
                        SelectionImageObject = v35(l_CursorKind_0.RoundedRectNoInset), 
                        inputBindings = {
                            OpenQuickMenu = v5.Input.onBegin(Enum.KeyCode.ButtonA, v37)
                        }
                    }, {
                        QuickMenuText = v3.createElement(l_FitTextLabel_0, {
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Size = UDim2.fromOffset(l_IconSize_0.Regular, l_IconSize_0.Regular), 
                            BackgroundTransparency = 1, 
                            Text = v29.quickMenu, 
                            Font = l_Font_1, 
                            TextSize = v34, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            LayoutOrder = 1
                        }), 
                        QuickMenuIcon = v3.createElement(l_ImageSetButton_0, {
                            Size = UDim2.fromOffset(l_IconSize_0.Regular, l_IconSize_0.Regular), 
                            BackgroundTransparency = 1, 
                            Image = "rbxasset://textures/ui/Controls/DesignSystem/ButtonStart.png", 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                            LayoutOrder = 2, 
                            Selectable = false, 
                            [v3.Event.Activated] = v37
                        })
                    });
                end);
            end);
        end);
    end);
end;
v23 = l_withNavigation_0(v23);
return v3.forwardRef(function(v38, v39)
    return v3.createElement(v23, v4.Dictionary.join(v38, {
        forwardRef = v39
    }));
end);
