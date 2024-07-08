local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local l_FitFrameVertical_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical;
local l_withStyle_0 = v4.Style.withStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodySizeSlider);
local v11 = l_Images_0["icons/menu/body_tall"];
local v12 = l_Images_0["icons/menu/body_thin"];
local v13 = l_Images_0["icons/menu/body_heavy"];
local v14 = l_Images_0["icons/menu/body_short"];
local v15 = v3.PureComponent:extend("BodySizeRadar");
v15.render = function(v16)
    return l_withStyle_0(function(v17)
        return l_withLocalization_0({
            bodySize = "Feature.Avatar.Label.BodySize"
        })(function(v18)
            local l_lockNavigationCallback_0 = v16.props.lockNavigationCallback;
            local l_unlockNavigationCallback_0 = v16.props.unlockNavigationCallback;
            local l_LayoutOrder_0 = v16.props.LayoutOrder;
            local l_isDisabled_0 = v16.props.isDisabled;
            local l_Font_0 = v17.Font;
            local l_Theme_0 = v17.Theme;
            local l_Font_1 = l_Font_0.Header2.Font;
            local v26 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
            return v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 24), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_LayoutOrder_0
            }, {
                BodySizeLabel = v3.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, v26), 
                    BackgroundTransparency = 1, 
                    Text = v18.bodySize, 
                    TextSize = v26, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.TextTransparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1, 
                    Font = l_Font_1
                }), 
                BodySizeContainer = v3.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    contentPadding = UDim.new(0, 8), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    TallIcon = v3.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        LayoutOrder = 1, 
                        Size = UDim2.new(0, 36, 0, 36), 
                        BackgroundTransparency = 1, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = if not l_isDisabled_0 then l_Theme_0.IconEmphasis.Transparency else 0.5, 
                        Image = v11
                    }), 
                    Wrapper = v3.createElement(l_FitFrameVertical_0, {
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }, {
                        ThinIcon = v3.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            LayoutOrder = 1, 
                            Size = UDim2.new(0, 36, 0, 36), 
                            BackgroundTransparency = 1, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = if not l_isDisabled_0 then l_Theme_0.IconEmphasis.Transparency else 0.5, 
                            Image = v12
                        }), 
                        BodySize = v3.createElement(v10, {
                            LayoutOrder = 2, 
                            lockNavigationCallback = l_lockNavigationCallback_0, 
                            unlockNavigationCallback = l_unlockNavigationCallback_0, 
                            isDisabled = l_isDisabled_0, 
                            NextSelectionLeft = v16.props.NextSelectionLeft, 
                            NextSelectionRight = v16.props.NextSelectionRight, 
                            NextSelectionUp = v16.props.NextSelectionUp, 
                            NextSelectionDown = v16.props.NextSelectionDown, 
                            [v3.Ref] = v16.props.forwardRef
                        }), 
                        HeavyIcon = v3.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            LayoutOrder = 3, 
                            Size = UDim2.new(0, 36, 0, 36), 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = if not l_isDisabled_0 then l_Theme_0.IconEmphasis.Transparency else 0.5, 
                            BackgroundTransparency = 1, 
                            Image = v13
                        })
                    }), 
                    ShortIcon = v3.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        LayoutOrder = 3, 
                        Size = UDim2.new(0, 36, 0, 36), 
                        BackgroundTransparency = 1, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = if not l_isDisabled_0 then l_Theme_0.IconEmphasis.Transparency else 0.5, 
                        Image = v14
                    })
                })
            });
        end);
    end);
end;
return v3.forwardRef(function(v27, v28)
    return v3.createElement(v15, v2.Dictionary.join(v27, {
        forwardRef = v28
    }));
end);
