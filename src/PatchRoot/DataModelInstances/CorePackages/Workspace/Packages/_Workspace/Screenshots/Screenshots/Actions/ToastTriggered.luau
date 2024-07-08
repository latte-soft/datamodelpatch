local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Rodux);
local _ = require(l_Parent_0.Enums.ShotsToastType);
local _ = require(l_Parent_0.Types);
return v1.makeActionCreator(script.Name, function(v4, v5)
    return {
        toastType = v4, 
        toastConfig = v5
    };
end);
