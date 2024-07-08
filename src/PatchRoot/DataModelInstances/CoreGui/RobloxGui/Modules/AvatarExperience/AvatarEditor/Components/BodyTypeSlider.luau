local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.TwoAxisSlider);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_withStyle_0 = v6.Style.withStyle;
local v12 = Vector2.new(224, 195);
local v13 = v4.PureComponent:extend("BodyTypeSlider");
v13.init = function(v14)
    local l_forwardRef_0 = v14.props.forwardRef;
    v14.mapPositionToScales = function(v16)
        local l_bodyTypeScaleRules_0 = v14.props.bodyTypeScaleRules;
        local v18 = math.clamp((1 - v16.Y) * (l_bodyTypeScaleRules_0.max - l_bodyTypeScaleRules_0.min) + l_bodyTypeScaleRules_0.min, l_bodyTypeScaleRules_0.min, l_bodyTypeScaleRules_0.max);
        local l_proportionScaleRules_0 = v14.props.proportionScaleRules;
        return math.clamp((1 - (v18 == 0 and 0.5 or (v16.X - 0.5 * v16.Y) / v18)) * (l_proportionScaleRules_0.max - l_proportionScaleRules_0.min) + l_proportionScaleRules_0.min, l_proportionScaleRules_0.min, l_proportionScaleRules_0.max), v18;
    end;
    v14.mapScalesToPosition = function(v20, v21)
        local l_bodyTypeScaleRules_1 = v14.props.bodyTypeScaleRules;
        local v23 = (v21 - l_bodyTypeScaleRules_1.min) / (l_bodyTypeScaleRules_1.max - l_bodyTypeScaleRules_1.min);
        local l_proportionScaleRules_1 = v14.props.proportionScaleRules;
        return Vector2.new((1 - (v20 - l_proportionScaleRules_1.min) / (l_proportionScaleRules_1.max - l_proportionScaleRules_1.min)) * v23 + 0.5 * (1 - v23), 1 - v23);
    end;
    v14.setScales = function(v25, v26)
        v14.props.setScales({
            proportion = v25, 
            bodyType = v26
        });
    end;
    v14.getBackgroundAbsolutePosition = function()
        local v27 = l_forwardRef_0:getValue();
        if not v27 then
            return nil;
        else
            return v27.AbsolutePosition;
        end;
    end;
    v14.getBackgroundAbsoluteSize = function()
        local v28 = l_forwardRef_0:getValue();
        if not v28 then
            return nil;
        else
            return v28.AbsoluteSize;
        end;
    end;
end;
v13.render = function(v29)
    local l_proportion_0 = v29.props.proportion;
    local l_bodyType_0 = v29.props.bodyType;
    local l_proportionScaleRules_2 = v29.props.proportionScaleRules;
    local l_bodyTypeScaleRules_2 = v29.props.bodyTypeScaleRules;
    local l_LayoutOrder_0 = v29.props.LayoutOrder;
    local l_lockNavigationCallback_0 = v29.props.lockNavigationCallback;
    local l_unlockNavigationCallback_0 = v29.props.unlockNavigationCallback;
    local l_forwardRef_1 = v29.props.forwardRef;
    return l_withStyle_0(function(v38)
        local l_Theme_0 = v38.Theme;
        local v40 = v12.X / (v12.X / v12.Y);
        local l_isDisabled_0 = v29.props.isDisabled;
        return v4.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Image = "rbxasset://textures/AvatarEditorImages/Sliders/body-type-slider-background.png", 
            LayoutOrder = l_LayoutOrder_0, 
            Size = UDim2.new(0, v12.X, 0, v40), 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            ImageTransparency = if not l_isDisabled_0 then l_Theme_0.BackgroundUIDefault.Transparency else 0.5, 
            [v4.Ref] = l_forwardRef_1
        }, {
            TwoAxisSlider = v4.createElement(v9, {
                mapPositionToScales = v29.mapPositionToScales, 
                mapScalesToPosition = v29.mapScalesToPosition, 
                setScales = v29.setScales, 
                xScaleRules = l_proportionScaleRules_2, 
                yScaleRules = l_bodyTypeScaleRules_2, 
                xScale = l_proportion_0, 
                yScale = l_bodyType_0, 
                getBackgroundAbsolutePosition = v29.getBackgroundAbsolutePosition, 
                getBackgroundAbsoluteSize = v29.getBackgroundAbsoluteSize, 
                invertDPadX = true, 
                isDisabled = l_isDisabled_0, 
                onDragStart = l_lockNavigationCallback_0, 
                onDragEnd = l_unlockNavigationCallback_0
            })
        });
    end);
end;
v13 = v5.connect(function(v42, _)
    local l_AvatarScales_0 = v42.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local v45 = v42.AvatarExperience.AvatarEditor.AvatarSettings[v7.AvatarSettings.scalesRules];
    return {
        avatarType = v42.AvatarExperience.AvatarEditor.Character.AvatarType, 
        bodyType = l_AvatarScales_0.bodyType, 
        proportion = l_AvatarScales_0.proportion, 
        bodyTypeScaleRules = v45.bodyType, 
        proportionScaleRules = v45.proportion
    };
end, function(v46)
    return {
        setScales = function(v47)
            v46(v8(v47));
        end
    };
end)(v13);
return v4.forwardRef(function(v48, v49)
    return v4.createElement(v13, v3.Dictionary.join(v48, {
        forwardRef = v49
    }));
end);
