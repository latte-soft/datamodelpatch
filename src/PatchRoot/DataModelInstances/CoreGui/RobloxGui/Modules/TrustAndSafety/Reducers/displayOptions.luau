local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Parent_0 = script.Parent.Parent;
return v1.createReducer({
    inputType = nil, 
    screenSize = Vector2.new(0, 0), 
    visible = true
}, {
    [require(l_Parent_0.Actions.SetScreenSize).name] = function(v4, v5)
        return v2.Dictionary.join(v4, {
            screenSize = v5.screenSize
        });
    end, 
    [require(l_Parent_0.Actions.Hide).name] = function(v6)
        return v2.Dictionary.join(v6, {
            visible = false
        });
    end, 
    [require(l_Parent_0.Actions.Show).name] = function(v7)
        return v2.Dictionary.join(v7, {
            visible = true
        });
    end
});
