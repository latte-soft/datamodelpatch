local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_SystemSlider_0 = v6.App.Slider.SystemSlider;
local v14 = v3.PureComponent:extend("HeadSlider");
v14.init = function(v15)
    v15.moveListen = nil;
    v15.endListen = nil;
    v15.scaleRef = v3.createRef();
end;
v14.render = function(v16)
    local l_avatarType_0 = v16.props.avatarType;
    local l_head_0 = v16.props.head;
    local l_headScaleRules_0 = v16.props.headScaleRules;
    return v3.createElement(l_SystemSlider_0, {
        layoutOrder = v16.props.LayoutOrder, 
        min = l_headScaleRules_0.min, 
        max = l_headScaleRules_0.max, 
        stepInterval = l_headScaleRules_0.increment, 
        value = l_head_0, 
        onValueChanged = function(v20)
            v16.props.setScales({
                head = v20
            });
        end, 
        onDragStart = v16.props.lockNavigationCallback, 
        onDragEnd = v16.props.unlockNavigationCallback, 
        isDisabled = l_avatarType_0 == v8.AvatarType.R6, 
        NextSelectionUp = v16.props.NextSelectionUp, 
        NextSelectionDown = v16.props.NextSelectionDown, 
        [v3.Ref] = v16.props.forwardRef
    });
end;
v14 = v4.connect(function(v21, _)
    return {
        avatarType = v21.AvatarExperience.AvatarEditor.Character.AvatarType, 
        head = v21.AvatarExperience.AvatarEditor.Character.AvatarScales.head, 
        headScaleRules = v21.AvatarExperience.AvatarEditor.AvatarSettings[v8.AvatarSettings.scalesRules].head
    };
end, function(v23)
    return {
        setScales = function(v24)
            v23(v9(v24));
        end, 
        sendAnalytics = function(v25, v26)
            v23(v10(v25, v26));
        end, 
        setCurrentToastMessage = function(v27)
            v23(v12(v27));
        end
    };
end)((l_RoactServices_0.connect({
    analytics = v7
})(v14)));
return v3.forwardRef(function(v28, v29)
    return v3.createElement(v14, v2.Dictionary.join(v28, {
        forwardRef = v29
    }));
end);
