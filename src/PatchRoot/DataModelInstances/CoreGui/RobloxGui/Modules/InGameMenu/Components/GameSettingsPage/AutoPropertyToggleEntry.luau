local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Utility.ExternalEventConnection);
local v5 = require(script.Parent.ToggleEntry);
local v6 = require(l_Parent_0.Utility.SendAnalytics);
local v7 = require(l_Parent_0.Resources.Constants);
local v8 = l_Roact_0.PureComponent:extend("AutoPropertyToggleEntry");
v8.validateProps = l_t_0.strictInterface({
    instance = l_t_0.Instance, 
    valueKey = l_t_0.string, 
    lockedToOff = l_t_0.optional(l_t_0.boolean), 
    onValue = l_t_0.optional(l_t_0.any), 
    offValue = l_t_0.optional(l_t_0.any), 
    labelKey = l_t_0.string, 
    LayoutOrder = l_t_0.integer, 
    subtextEnabled = l_t_0.optional(l_t_0.boolean), 
    subtextKey = l_t_0.optional(l_t_0.string)
});
v8.defaultProps = {
    onValue = true, 
    offValue = false, 
    lockedToOff = false, 
    subtextEnabled = false, 
    subtextKey = ""
};
v8.init = function(v9, v10)
    local v11 = v10.instance[v10.valueKey];
    v9.changeEvent = v10.instance:GetPropertyChangedSignal(v10.valueKey);
    v9:setState({
        checked = not v10.lockedToOff and v11 == v10.onValue
    });
    v9.onExternalChange = function()
        v9:setState({
            checked = v10.instance[v10.valueKey] == v10.onValue
        });
    end;
    v9.onToggled = function()
        if not v9.props.lockedToOff then
            if not (v10.instance[v10.valueKey] == v10.onValue) then
                v10.instance[v10.valueKey] = v10.onValue;
            else
                v10.instance[v10.valueKey] = v10.offValue;
            end;
            v6(v7.AnalyticsSettingsChangeName, nil, {}, true);
            return ;
        else
            return ;
        end;
    end;
end;
v8.render = function(v12)
    local l_props_0 = v12.props;
    return l_Roact_0.createFragment({
        Toggle = l_Roact_0.createElement(v5, {
            checked = v12.state.checked, 
            lockedToOff = l_props_0.lockedToOff, 
            labelKey = l_props_0.labelKey, 
            LayoutOrder = l_props_0.LayoutOrder, 
            onToggled = v12.onToggled, 
            subtextEnabled = l_props_0.subtextEnabled, 
            subtextKey = l_props_0.subtextKey
        }), 
        Listener = l_Roact_0.createElement(v4, {
            event = v12.changeEvent, 
            callback = v12.onExternalChange
        })
    });
end;
return v8;
