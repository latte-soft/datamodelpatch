local l_Signal_0 = require(script:FindFirstAncestor("AppStartup").Parent.AppCommonLib).Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {
        changed = l_Signal_0.new(), 
        isInteractive = false
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.setInteractive = function(v3)
    if not v3.isInteractive then
        v3.isInteractive = true;
        v3.changed:fire();
        return ;
    else
        return ;
    end;
end;
v1.default = v1.new();
return v1;
