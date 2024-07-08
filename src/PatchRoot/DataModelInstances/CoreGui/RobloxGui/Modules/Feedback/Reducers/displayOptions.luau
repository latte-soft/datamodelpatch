local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
return v1.createReducer({
    inputType = nil, 
    screenSize = Vector2.new(0, 0)
}, {
    [require(script.Parent.Parent.Actions.SetScreenSize).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            screenSize = v4.screenSize
        });
    end
});
