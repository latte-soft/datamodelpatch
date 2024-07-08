local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_CorePackages_0.AvatarExperienceDeps);
local v8 = require(l_CorePackages_0.RoactNavigation);
local v9 = require(l_CorePackages_0.Cryo);
local l_RoactFitComponents_0 = v7.RoactFitComponents;
local l_FitFrameOnAxis_0 = l_RoactFitComponents_0.FitFrameOnAxis;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarType);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local l_withNavigation_0 = v8.withNavigation;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_SpringAnimatedItem_0 = v6.Utility.SpringAnimatedItem;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_withStyle_0 = v6.Style.withStyle;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v31 = l_Images_0["component_assets/circle_29"];
local v32 = l_Images_0["component_assets/circle_25"];
local v33 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v34 = v2.PureComponent:extend("AvatarTypeSwitch");
local function v36(v35)
    v35.Size = UDim2.new(UDim.new(0, l_Text_0.GetTextWidth(v35.Text, v35.Font, v35.TextSize)), (UDim.new(0, v35.TextSize)));
end;
v34.resizeTextLabels = function(v37)
    local l_current_0 = v37.r6Ref.current;
    local l_current_1 = v37.r15Ref.current;
    if l_current_0 and l_current_1 then
        v36(l_current_0);
        v36(l_current_1);
        local v40 = math.max(l_current_0.AbsoluteSize.x, l_current_1.AbsoluteSize.x);
        l_current_0.Size = UDim2.new(0, v40, 0, l_current_0.Size.Y.Offset);
        l_current_1.Size = UDim2.new(0, v40, 0, l_current_1.Size.Y.Offset);
        return ;
    else
        return ;
    end;
end;
v34.makeOnOverlayClosed = function(_, v42)
    return function()
        local v43 = l_wasLastInputGamepad_0();
        v21("AvatarTypeSwitch");
        if v43 then
            v42.captureFocus();
        end;
    end;
end;
v34.init = function(v44)
    v44.r6Ref = v2.createRef();
    v44.r15Ref = v2.createRef();
    local v45, v46 = v2.createBinding(UDim2.fromScale(1, 1));
    v44.sizeBinding = v45;
    v44.updateSizeBinding = v46;
    v44.absoluteSizeChanged = function(v47)
        v44.updateSizeBinding(UDim2.fromOffset(v47.AbsoluteSize.X, v47.AbsoluteSize.Y));
    end;
    v44.toggleAvatarType = function(v48)
        local l_sendAnalytics_0 = v44.props.sendAnalytics;
        local l_analytics_0 = v44.props.analytics;
        local l_setAvatarType_0 = v44.props.setAvatarType;
        local v52 = if v44.props.avatarType == v14.AvatarType.R6 then v14.AvatarType.R15 else v14.AvatarType.R6;
        local v53 = v19.hasWrapLayer(v44.props.currentCharacter);
        if not (v52 == v14.AvatarType.R6) or not v53 then
            l_setAvatarType_0(v52);
            l_sendAnalytics_0(l_analytics_0.toggleAvatarType, v52);
            return ;
        else
            v44.props.navigation.navigate(v20.LayeredClothingR6SwitchPrompt, {
                onOverlayClosed = v44:makeOnOverlayClosed(v48)
            });
            return ;
        end;
    end;
end;
v34.didMount = function(v54)
    v54:resizeTextLabels();
end;
v34.renderWithProviders = function(v55, v56, v57, v58, v59)
    local l_LayoutOrder_0 = v55.props.LayoutOrder;
    local l_Theme_0 = v57.Theme;
    local l_Font_0 = v57.Font;
    local _ = nil;
    return v2.createElement(l_ImageSetLabel_0, {
        Size = v55.sizeBinding, 
        Image = v31, 
        ImageColor3 = l_Theme_0.BackgroundContrast.Color, 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(14, 13, 15, 15), 
        LayoutOrder = l_LayoutOrder_0, 
        NextSelectionLeft = v55.props.NextSelectionLeft, 
        NextSelectionRight = v55.props.NextSelectionRight, 
        NextSelectionUp = v55.props.NextSelectionUp, 
        NextSelectionDown = v55.props.NextSelectionDown, 
        [v2.Ref] = v55.props.forwardRef
    }, {
        AnimatedFrame = v2.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                Size = UDim2.new(0.5, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, 
            animatedValues = {
                positionX = v55.props.avatarType == v14.AvatarType.R15 and 0.5 or 0
            }, 
            mapValuesToProps = function(v64)
                return {
                    Position = UDim2.new(v64.positionX, 0, 0, 0)
                };
            end, 
            springOptions = v33
        }, {
            SwitchImage = v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v32, 
                ImageColor3 = l_Theme_0.UIDefault.Color, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(12, 11, 13, 13)
            })
        }), 
        SwitchButton = v2.createElement(l_Focusable_0.ImageButton, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v2.Event.Activated] = function()
                v55.toggleAvatarType(v59);
            end, 
            SelectionImageObject = v58(l_CursorKind_0.Toggle)
        }), 
        LabelsContainer = v2.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Both, 
            margin = l_RoactFitComponents_0.Rect.square(3), 
            contentPadding = UDim.new(0, 10), 
            FillDirection = Enum.FillDirection.Horizontal, 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            [v2.Change.AbsoluteSize] = v55.absoluteSizeChanged
        }, {
            R6Label = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Font = l_Font_0.Body.Font, 
                Text = v56.r6Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextSize = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize, 
                TextColor3 = if v55.props.avatarType == v14.AvatarType.R6 then l_Theme_0.TextEmphasis.Color else l_Theme_0.TextDefault.Color, 
                LayoutOrder = 1, 
                [v2.Ref] = v55.r6Ref
            }), 
            R15Label = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Font = l_Font_0.Body.Font, 
                Text = v56.r15Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextSize = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize, 
                TextColor3 = if v55.props.avatarType == v14.AvatarType.R15 then l_Theme_0.TextEmphasis.Color else l_Theme_0.TextDefault.Color, 
                LayoutOrder = 2, 
                [v2.Ref] = v55.r15Ref
            })
        })
    });
end;
v34.render = function(v65)
    return l_withLocalization_0({
        r6Text = "Feature.Avatar.Label.R6", 
        r15Text = "Feature.Avatar.Label.R15"
    })(function(v66)
        return l_withStyle_0(function(v67)
            return l_withSelectionCursorProvider_0(function(v68)
                return v3.withFocusController(function(v69)
                    return v65:renderWithProviders(v66, v67, v68, v69);
                end);
            end);
        end);
    end);
end;
v34 = v5.connect(function(v70, _)
    return {
        equippedAssets = v70.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        avatarType = v70.AvatarExperience.AvatarEditor.Character.AvatarType, 
        currentCharacter = v70.AvatarExperience.AvatarScene.Character.CurrentCharacter
    };
end, function(v72)
    return {
        setAvatarType = function(v73)
            v72(v15(v73));
        end, 
        sendAnalytics = function(v74, v75)
            v72(v16(v74, v75));
        end
    };
end)((l_withNavigation_0(l_RoactServices_0.connect({
    analytics = v13
})(v34), nil)));
return v2.forwardRef(function(v76, v77)
    return v2.createElement(v34, v9.Dictionary.join(v76, {
        forwardRef = v77
    }));
end);
