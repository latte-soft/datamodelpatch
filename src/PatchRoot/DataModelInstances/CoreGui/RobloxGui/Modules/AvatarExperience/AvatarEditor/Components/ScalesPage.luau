local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.UIBlox);
local l_RoactFitComponents_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_withStyle_0 = v6.Style.withStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyTypeRadar);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodySizeRadar);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.HeadSlider);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarTypeSwitch);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v17 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local v18 = v3.PureComponent:extend("ScalesPage");
v18.init = function(v19)
    local v20, v21 = v3.createBinding(UDim2.new(0, 0, 1, 0));
    v19.canvasSizeBinding = v20;
    v19.updateCanvasSizeBinding = v21;
    v19.onContentSizeChanged = function(v22)
        v19.updateCanvasSizeBinding(UDim2.new(0, 0, 0, v22.AbsoluteContentSize.Y + 20));
    end;
    v19.bodyTypeRadarRef = v3.createRef();
    v19.bodySizeRadarRef = v3.createRef();
    v19.headSizeSliderRef = v3.createRef();
    v19.avatarTypeSwitchRef = v3.createRef();
end;
v18.render = function(v23)
    local v24 = v23.props.adaptiveScrolling or {};
    local v25 = not v24 and true or v24.scrollingEnabled;
    return l_withStyle_0(function(v26)
        return l_withLocalization_0({
            headSize = "Feature.Avatar.Label.HeadSize", 
            r6R15 = "Feature.Avatar.Label.R6R15"
        })(function(v27)
            local l_lockNavigationCallback_0 = v23.props.lockNavigationCallback;
            local l_unlockNavigationCallback_0 = v23.props.unlockNavigationCallback;
            local l_enableNavigation_0 = v23.props.enableNavigation;
            local v31 = v23.props.avatarType == v16.AvatarType.R6;
            local l_Font_0 = v26.Font;
            local l_Theme_0 = v26.Theme;
            local l_Font_1 = l_Font_0.Header2.Font;
            local v35 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
            return v3.createElement(l_Focusable_0.ScrollingFrame, {
                CanvasSize = v23.canvasSizeBinding, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ScrollingEnabled = l_enableNavigation_0 and v25, 
                defaultChild = not not v31 and v23.avatarTypeSwitchRef or v23.bodyTypeRadarRef, 
                NextSelectionLeft = v23.props.NextSelectionLeft, 
                NextSelectionRight = v23.props.NextSelectionRight, 
                NextSelectionUp = v23.props.NextSelectionUp, 
                NextSelectionDown = v23.props.NextSelectionDown, 
                [v3.Ref] = v23.props.forwardRef, 
                [v3.Change.CanvasPosition] = v24.onCanvasPositionChanged
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 20), 
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    Padding = UDim.new(0, 10), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    [v3.Change.AbsoluteContentSize] = v23.onContentSizeChanged
                }), 
                BodyTypeWrapper = v3.createElement(l_Focusable_0[v11], {
                    lockNavigationCallback = v23.props.lockNavigationCallback, 
                    unlockNavigationCallback = v23.props.unlockNavigationCallback, 
                    enableNavigation = v23.props.enableNavigation, 
                    layoutOrder = 1, 
                    isDisabled = v31, 
                    [v3.Ref] = v23.bodyTypeRadarRef, 
                    NextSelectionDown = v23.bodySizeRadarRef
                }), 
                BodySizeWrapper = v3.createElement(l_Focusable_0[v12], {
                    lockNavigationCallback = v23.props.lockNavigationCallback, 
                    unlockNavigationCallback = v23.props.unlockNavigationCallback, 
                    enableNavigation = v23.props.enableNavigation, 
                    layoutOrder = 2, 
                    isDisabled = v31, 
                    [v3.Ref] = v23.bodySizeRadarRef, 
                    NextSelectionUp = v23.bodyTypeRadarRef, 
                    NextSelectionDown = v23.headSizeSliderRef
                }), 
                HeadSizeWrapper = v3.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    contentPadding = UDim.new(0, 11), 
                    margin = l_RoactFitComponents_0.Rect.quad(0, 0, 24, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }, {
                    HeadSizeLabel = v3.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, v35), 
                        BackgroundTransparency = 1, 
                        Text = v27.headSize, 
                        TextSize = v35, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextTransparency = l_Theme_0.TextDefault.TextTransparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1, 
                        Font = l_Font_1
                    }), 
                    HeadSize = v3.createElement(l_Focusable_0[v13], {
                        LayoutOrder = 2, 
                        lockNavigationCallback = l_lockNavigationCallback_0, 
                        unlockNavigationCallback = l_unlockNavigationCallback_0, 
                        isDisabled = v31, 
                        [v3.Ref] = v23.headSizeSliderRef, 
                        NextSelectionUp = v23.bodySizeRadarRef, 
                        NextSelectionDown = v23.avatarTypeSwitchRef
                    })
                }), 
                R6R15Wrapper = v3.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    contentPadding = UDim.new(0, 11), 
                    margin = l_RoactFitComponents_0.Rect.quad(0, 0, 24, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4
                }, {
                    R6R15Label = v3.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, v35), 
                        BackgroundTransparency = 1, 
                        Text = v27.r6R15, 
                        TextSize = v35, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextTransparency = l_Theme_0.TextDefault.TextTransparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1, 
                        Font = l_Font_1
                    }), 
                    AvatarTypeSwitch = v3.createElement(l_Focusable_0[v14], {
                        LayoutOrder = 2, 
                        [v3.Ref] = v23.avatarTypeSwitchRef, 
                        NextSelectionUp = not v31 and v23.headSizeSliderRef or nil
                    })
                })
            });
        end);
    end);
end;
v18 = v17((v5.connect(function(v36, _)
    return {
        avatarType = v36.AvatarExperience.AvatarEditor.Character.AvatarType
    };
end)(v18)));
return v3.forwardRef(function(v38, v39)
    return v3.createElement(v18, v2.Dictionary.join(v38, {
        forwardRef = v39
    }));
end);
