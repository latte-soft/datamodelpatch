local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({
    name = "", 
    description = ""
}, {
    [require(script.Parent.Parent.Actions.SetPlaceInfo).name] = function(_, v3)
        return {
            name = v3.name, 
            description = v3.description
        };
    end
});
