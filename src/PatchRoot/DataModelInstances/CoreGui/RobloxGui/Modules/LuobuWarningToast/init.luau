local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(script.LuobuWarningToastComponent);
local v4 = {};
v4.__index = v4;
v4.new = function()
    local v5 = setmetatable({}, v4);
    v5.element = v2.createElement(v3);
    v5.root = v2.mount(v5.element, l_CoreGui_0, "LuobuWarningToast");
    task.delay(10, function()
        v2.unmount(v5.root);
    end);
    return v5;
end;
return v4.new();
