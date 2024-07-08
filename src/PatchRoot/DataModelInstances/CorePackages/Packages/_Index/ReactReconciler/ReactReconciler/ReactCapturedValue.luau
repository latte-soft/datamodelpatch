local _ = require(script.Parent.ReactInternalTypes);
local l_getStackByFiberInDevAndProd_0 = require(script.Parent.ReactFiberComponentStack).getStackByFiberInDevAndProd;
return {
    createCapturedValue = function(v2, v3)
        return {
            value = v2, 
            source = v3, 
            stack = l_getStackByFiberInDevAndProd_0(v3)
        };
    end
};
