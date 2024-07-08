local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(script.Parent.Parent.Models.CollectibleInstance);
return require(l_CorePackages_0.Rodux).makeActionCreator(script.Name, function(v2, v3)
    return {
        collectibleItemId = v2, 
        collectibleItemInstances = v3
    };
end);
