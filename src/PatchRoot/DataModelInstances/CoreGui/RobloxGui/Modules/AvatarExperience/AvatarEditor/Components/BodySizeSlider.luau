local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.TwoAxisSlider);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_withStyle_0 = v5.Style.withStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local v14 = Vector2.new(224, 224);
local v15 = l_Images_0["component_assets/circle_17"];
local v16 = v3.PureComponent:extend("BodySizeSlider");
v16.init = function(v17)
    local l_forwardRef_0 = v17.props.forwardRef;
    v17.mapPositionToScales = function(v19)
        local l_widthRules_0 = v17.props.widthRules;
        local v21 = math.clamp(v19.X * (l_widthRules_0.max - l_widthRules_0.min) + l_widthRules_0.min, l_widthRules_0.min, l_widthRules_0.max);
        local l_heightRules_0 = v17.props.heightRules;
        return v21, (math.clamp((1 - v19.Y) * (l_heightRules_0.max - l_heightRules_0.min) + l_heightRules_0.min, l_heightRules_0.min, l_heightRules_0.max));
    end;
    v17.mapScalesToPosition = function(v23, v24)
        local l_widthRules_1 = v17.props.widthRules;
        local v26 = (v23 - l_widthRules_1.min) / (l_widthRules_1.max - l_widthRules_1.min);
        local l_heightRules_1 = v17.props.heightRules;
        return Vector2.new(v26, 1 - (v24 - l_heightRules_1.min) / (l_heightRules_1.max - l_heightRules_1.min));
    end;
    v17.setScales = function(v28, v29)
        v17.props.setScales({
            width = v28, 
            height = v29
        });
    end;
    v17.getBackgroundAbsolutePosition = function()
        local v30 = l_forwardRef_0:getValue();
        if not v30 then
            return nil;
        else
            return v30.AbsolutePosition;
        end;
    end;
    v17.getBackgroundAbsoluteSize = function()
        local v31 = l_forwardRef_0:getValue();
        if not v31 then
            return nil;
        else
            return v31.AbsoluteSize;
        end;
    end;
end;
v16.render = function(v32)
    local l_width_0 = v32.props.width;
    local l_height_0 = v32.props.height;
    local l_widthRules_2 = v32.props.widthRules;
    local l_heightRules_2 = v32.props.heightRules;
    local l_LayoutOrder_0 = v32.props.LayoutOrder;
    local l_lockNavigationCallback_0 = v32.props.lockNavigationCallback;
    local l_unlockNavigationCallback_0 = v32.props.unlockNavigationCallback;
    local l_isDisabled_0 = v32.props.isDisabled;
    local l_forwardRef_1 = v32.props.forwardRef;
    return l_withStyle_0(function(v42)
        local l_Theme_0 = v42.Theme;
        return v3.createElement(l_ImageSetLabel_0, {
            Image = v15, 
            Size = UDim2.new(0, v14.X, 0, v14.Y), 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            ImageTransparency = if not l_isDisabled_0 then l_Theme_0.BackgroundUIDefault.Transparency else 0.5, 
            LayoutOrder = l_LayoutOrder_0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(9, 9, 9, 9), 
            ZIndex = 2, 
            [v3.Ref] = l_forwardRef_1
        }, {
            TwoAxisSlider = v3.createElement(v9, {
                mapPositionToScales = v32.mapPositionToScales, 
                mapScalesToPosition = v32.mapScalesToPosition, 
                setScales = v32.setScales, 
                xScaleRules = l_widthRules_2, 
                yScaleRules = l_heightRules_2, 
                xScale = l_width_0, 
                yScale = l_height_0, 
                getBackgroundAbsolutePosition = v32.getBackgroundAbsolutePosition, 
                getBackgroundAbsoluteSize = v32.getBackgroundAbsoluteSize, 
                isDisabled = l_isDisabled_0, 
                onDragStart = l_lockNavigationCallback_0, 
                onDragEnd = l_unlockNavigationCallback_0
            })
        });
    end);
end;
v16 = v4.connect(function(v44, _)
    local l_AvatarScales_0 = v44.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local v47 = v44.AvatarExperience.AvatarEditor.AvatarSettings[v7.AvatarSettings.scalesRules];
    return {
        height = l_AvatarScales_0.height, 
        width = l_AvatarScales_0.width, 
        heightRules = v47.height, 
        widthRules = v47.width, 
        avatarType = v44.AvatarExperience.AvatarEditor.Character.AvatarType
    };
end, function(v48)
    return {
        setScales = function(v49)
            v48(v8(v49));
        end
    };
end)(v16);
return v3.forwardRef(function(v50, v51)
    return v3.createElement(v16, v6.Dictionary.join(v50, {
        forwardRef = v51
    }));
end);
