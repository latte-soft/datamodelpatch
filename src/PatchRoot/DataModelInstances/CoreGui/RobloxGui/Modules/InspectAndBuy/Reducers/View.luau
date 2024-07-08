local v0 = require(game:GetService("CorePackages").Rodux);
local l_Parent_0 = script.Parent.Parent;
return v0.createReducer(require(l_Parent_0.Constants).View.Wide, {
    [require(l_Parent_0.Actions.SetView).name] = function(_, v3)
        return v3.view;
    end
});
