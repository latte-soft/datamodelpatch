local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v1 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local v4 = {
    l_UserGameSettings_0:GetPropertyChangedSignal("GamepadCameraSensitivity"), 
    l_UserGameSettings_0:GetPropertyChangedSignal("MouseSensitivity"), 
    l_UserGameSettings_0:GetPropertyChangedSignal("MouseSensitivityFirstPerson"), 
    l_UserGameSettings_0:GetPropertyChangedSignal("MouseSensitivityThirdPerson")
};
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Utility.ExternalEventConnection);
local v7 = require(script.Parent.SliderEntry);
local v8 = require(l_Parent_0.Utility.SendAnalytics);
local v9 = require(l_Parent_0.Resources.Constants);
local _ = function(v10)
    local _ = nil;
    return (math.clamp(if v10 <= 5 then 0.198 * v10 + 0.01 else 0.6 * v10 - 2, 0, 10));
end;
local _ = function(v13)
    local _ = nil;
    return (math.clamp(math.floor(if v13 <= 1 then (v13 - 0.01) / 0.198 else (v13 + 2) / 0.6 / 0.01 + 0.5) * 0.01, 0, 10));
end;
local v16 = l_Roact_0.PureComponent:extend("CameraSensitivityEntry");
v16.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isMenuOpen = l_t_0.optional(l_t_0.boolean)
});
v16.init = function(v17)
    v17.onSensitivityChanged = function()
        v17:setState({
            engineSensitivity = l_UserGameSettings_0.MouseSensitivityFirstPerson.X
        });
    end;
    v17.onSensitivityChanged();
end;
v16.render = function(v18)
    local v19 = {};
    local l_createElement_0 = l_Roact_0.createElement;
    local l_v7_0 = v7;
    local v22 = {
        LayoutOrder = v18.props.LayoutOrder, 
        labelKey = "CoreScripts.InGameMenu.GameSettings.CameraSensitivity"
    };
    local l_engineSensitivity_0 = v18.state.engineSensitivity;
    local _ = nil;
    v22.value = math.clamp(math.floor(if l_engineSensitivity_0 <= 1 then (l_engineSensitivity_0 - 0.01) / 0.198 else (l_engineSensitivity_0 + 2) / 0.6 / 0.01 + 0.5) * 0.01, 0, 10);
    v22.min = 0;
    v22.max = 10;
    v22.stepInterval = 1;
    v22.keyboardInputStepInterval = 0.01;
    v22.valueChanged = function(v25)
        local v26 = nil;
        local v27 = math.clamp(if v25 <= 5 then 0.198 * v25 + 0.01 else 0.6 * v25 - 2, 0, 10);
        v26 = Vector2.new(v27, v27);
        l_UserGameSettings_0.MouseSensitivityFirstPerson = v26;
        l_UserGameSettings_0.MouseSensitivityThirdPerson = v26;
        v8(v9.AnalyticsSettingsChangeName, nil, {}, true);
    end;
    v22.canCaptureFocus = v18.props.canCaptureFocus;
    v22.isMenuOpen = v18.props.isMenuOpen;
    v19.CameraSensitivityMouseSlider = l_createElement_0(l_v7_0, v22);
    for _, v29 in ipairs(v4) do
        v19[tostring(v29) .. "CameraSensitivityControlConnection"] = l_Roact_0.createElement(v6, {
            event = v29, 
            callback = v18.onSensitivityChanged
        });
    end;
    return l_Roact_0.createFragment(v19);
end;
return v16;
