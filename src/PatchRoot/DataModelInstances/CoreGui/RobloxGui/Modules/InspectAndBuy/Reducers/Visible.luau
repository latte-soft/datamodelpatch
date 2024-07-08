local v0 = require(game:GetService("CorePackages").Rodux);
local l_Parent_0 = script.Parent.Parent;
return v0.createReducer(true, {
    [require(l_Parent_0.Actions.ShowMenu).name] = function(_, _)
        return true;
    end, 
    [require(l_Parent_0.Actions.HideMenu).name] = function(_, _)
        return false;
    end
});
