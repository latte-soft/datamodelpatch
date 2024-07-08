local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.AvatarExperienceDeps);
local v5 = require(l_CorePackages_0.Cryo);
local l_RoactFitComponents_0 = v4.RoactFitComponents;
local l_FitFrameOnAxis_0 = l_RoactFitComponents_0.FitFrameOnAxis;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_withStyle_0 = v3.Style.withStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyTypeSlider);
local v14 = l_Images_0["icons/menu/body_female"];
local v15 = l_Images_0["icons/menu/body_male"];
local v16 = l_Images_0["icons/menu/body_neutral"];
local v17 = v2.PureComponent:extend("BodyTypeRadar");
v17.render = function(v18)
    return l_withStyle_0(function(v19)
        return l_withLocalization_0({
            bodyType = "Feature.Avatar.Label.BodyType"
        })(function(v20)
            local l_lockNavigationCallback_0 = v18.props.lockNavigationCallback;
            local l_unlockNavigationCallback_0 = v18.props.unlockNavigationCallback;
            local l_LayoutOrder_0 = v18.props.LayoutOrder;
            local l_isDisabled_0 = v18.props.isDisabled;
            local l_Font_0 = v19.Font;
            local l_Theme_0 = v19.Theme;
            local l_Font_1 = l_Font_0.Header2.Font;
            local v28 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
            return v2.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 36), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_LayoutOrder_0
            }, {
                BodyTypeLabel = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, v28), 
                    BackgroundTransparency = 1, 
                    Text = v20.bodyType, 
                    TextSize = v28, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.TextTransparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1, 
                    Font = l_Font_1
                }), 
                Container = v2.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    UpperRow = v2.createElement(l_FitFrameVertical_0, {
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        RthroWomanIcon = v2.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            Size = UDim2.new(0, 36, 0, 36), 
                            BackgroundTransparency = 1, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = if not l_isDisabled_0 then l_Theme_0.IconEmphasis.Transparency else 0.5, 
                            Image = v14, 
                            LayoutOrder = 1
                        }), 
                        BodyType = v2.createElement(v13, {
                            lockNavigationCallback = l_lockNavigationCallback_0, 
                            unlockNavigationCallback = l_unlockNavigationCallback_0, 
                            LayoutOrder = 2, 
                            isDisabled = l_isDisabled_0, 
                            NextSelectionLeft = v18.props.NextSelectionLeft, 
                            NextSelectionRight = v18.props.NextSelectionRight, 
                            NextSelectionUp = v18.props.NextSelectionUp, 
                            NextSelectionDown = v18.props.NextSelectionDown, 
                            [v2.Ref] = v18.props.forwardRef
                        }), 
                        RthroManIcon = v2.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            Size = UDim2.new(0, 36, 0, 36), 
                            BackgroundTransparency = 1, 
                            Position = UDim2.new(1, -36, 0, 0), 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = if not l_isDisabled_0 then l_Theme_0.IconEmphasis.Transparency else 0.5, 
                            Image = v15, 
                            LayoutOrder = 3
                        })
                    }), 
                    LowerRow = v2.createElement(l_FitFrameOnAxis_0, {
                        axis = l_FitFrameOnAxis_0.Axis.Both, 
                        margin = l_RoactFitComponents_0.Rect.quad(8, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }, {
                        MiniFigIcon = v2.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0), 
                            Size = UDim2.new(0, 36, 0, 36), 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            BackgroundTransparency = 1, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = if not l_isDisabled_0 then l_Theme_0.IconEmphasis.Transparency else 0.5, 
                            Image = v16
                        })
                    })
                })
            });
        end);
    end);
end;
return v2.forwardRef(function(v29, v30)
    return v2.createElement(v17, v5.Dictionary.join(v29, {
        forwardRef = v30
    }));
end);
