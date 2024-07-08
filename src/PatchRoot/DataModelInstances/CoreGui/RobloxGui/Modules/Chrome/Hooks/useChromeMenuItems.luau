local v0 = require(script.Parent.Parent.Service);
local _ = require(script.Parent.Parent.Service.Types);
local v2 = require(script.Parent.useObservableValue);
return function()
    return v2(v0:menuList()) or {};
end;
