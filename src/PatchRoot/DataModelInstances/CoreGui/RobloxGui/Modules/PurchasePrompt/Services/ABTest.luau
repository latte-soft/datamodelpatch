local _ = script.Parent.Parent;
local v1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules").Common.IXPServiceWrapper);
return {
    new = function()
        local v2 = {};
        setmetatable(v2, {
            __tostring = function()
                return "Service(ABTest)";
            end
        });
        v2.getLayerData = function(v3)
            return v1:GetLayerData(v3);
        end;
        v2.logUserLayerExposure = function(v4)
            v1:LogUserLayerExposure(v4);
        end;
        return v2;
    end
};
