local v0 = require(game:GetService("CorePackages").Rodux);
local l_Parent_0 = script.Parent.Parent;
return v0.createReducer(require(l_Parent_0.Constants).Layout.Large, {
    [require(l_Parent_0.Actions.SetLayout).name] = function(_, v3)
        return v3.layout;
    end
});
