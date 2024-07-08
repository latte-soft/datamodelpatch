local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Rodux_0 = v0.Rodux;
local l_Cryo_0 = v0.Cryo;
local l_Parent_0 = script.Parent.Parent;
return l_Rodux_0.createReducer({
    closingApp = false, 
    menuIconTooltipOpen = false
}, {
    [require(l_Parent_0.Actions.OpenNativeClosePrompt).name] = function(v4, _)
        return l_Cryo_0.Dictionary.join(v4, {
            closingApp = true
        });
    end, 
    [require(l_Parent_0.Actions.CloseNativeClosePrompt).name] = function(v6, _)
        return l_Cryo_0.Dictionary.join(v6, {
            closingApp = false
        });
    end, 
    [require(l_Parent_0.Actions.SetMenuIconTooltipOpen).name] = function(v8, v9)
        return l_Cryo_0.Dictionary.join(v8, {
            menuIconTooltipOpen = v9.menuIconTooltipOpen
        });
    end
});
