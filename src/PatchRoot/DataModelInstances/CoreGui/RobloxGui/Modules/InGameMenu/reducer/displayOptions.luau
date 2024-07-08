local l_Rodux_0 = require(game:GetService("CorePackages").InGameMenuDependencies).Rodux;
local l_Parent_0 = script.Parent.Parent;
return l_Rodux_0.createReducer({
    inspectMenuEnabled = true, 
    inputType = require(l_Parent_0.Resources.Constants).InputType.MouseAndKeyboard
}, {
    [require(l_Parent_0.Actions.SetInspectMenuEnabled).name] = function(v2, v3)
        return {
            inspectMenuEnabled = v3.enabled, 
            inputType = v2.inputType
        };
    end, 
    [require(l_Parent_0.Actions.SetInputType).name] = function(v4, v5)
        return {
            inspectMenuEnabled = v4.inspectMenuEnabled, 
            inputType = v5.inputType
        };
    end
});
