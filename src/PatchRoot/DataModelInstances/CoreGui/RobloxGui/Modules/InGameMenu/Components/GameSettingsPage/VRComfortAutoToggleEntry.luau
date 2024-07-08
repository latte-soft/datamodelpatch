local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v2 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Utility.ExternalEventConnection);
local v7 = require(script.Parent.ToggleEntry);
local v8 = require(l_Parent_0.Utility.SendAnalytics);
local v9 = require(l_Parent_0.Resources.Constants);
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("VRComfortSetting");
local v11 = l_Roact_0.PureComponent:extend("VRComfortAutoToggleEntry");
v11.validateProps = l_t_0.strictInterface({
    customValueKey = l_t_0.string, 
    derivedValueKey = l_t_0.string, 
    labelKey = l_t_0.string, 
    LayoutOrder = l_t_0.integer, 
    checkedValue = l_t_0.optional(l_t_0.any)
});
v11.defaultProps = {
    checkedValue = true
};
v11.init = function(v12, v13)
    v12.derivedValueChangeEvent = l_UserGameSettings_0:GetPropertyChangedSignal(v13.derivedValueKey);
    v12:setState({
        checked = l_UserGameSettings_0[v13.derivedValueKey] == v13.checkedValue, 
        vrComfortSetting = l_UserGameSettings_0.VRComfortSetting
    });
    v12.onExternalChange = function()
        v12:setState({
            checked = l_UserGameSettings_0[v13.derivedValueKey] == v13.checkedValue
        });
    end;
    v12.onToggled = function()
        if v12.state.vrComfortSetting == Enum.VRComfortSetting.Custom then
            if not (l_UserGameSettings_0[v13.customValueKey] == v13.checkedValue) then
                l_UserGameSettings_0[v13.customValueKey] = v13.checkedValue;
            else
                l_UserGameSettings_0[v13.customValueKey] = not v13.checkedValue;
            end;
            v8(v9.AnalyticsSettingsChangeName, nil, {}, true);
        end;
    end;
end;
v11.render = function(v14)
    local l_props_0 = v14.props;
    return l_Roact_0.createFragment({
        Toggle = l_Roact_0.createElement(v7, {
            checked = v14.state.checked, 
            labelKey = l_props_0.labelKey, 
            LayoutOrder = l_props_0.LayoutOrder, 
            onToggled = v14.onToggled, 
            isDisabled = v14.state.vrComfortSetting ~= Enum.VRComfortSetting.Custom
        }), 
        DerivedValueListener = l_Roact_0.createElement(v6, {
            event = v14.derivedValueChangeEvent, 
            callback = v14.onExternalChange
        }), 
        VRComfortSettingListener = l_Roact_0.createElement(v6, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = function()
                v14:setState({
                    vrComfortSetting = l_UserGameSettings_0.VRComfortSetting
                });
            end
        })
    });
end;
return v11;
