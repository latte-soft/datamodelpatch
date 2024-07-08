local v0 = require(script.Parent.Parent.Services.PlatformInterface);
local l_jest_0 = require(game:GetService("CorePackages").JestGlobals).jest;
return {
    new = function()
        local v2 = v0.new();
        local v3 = {};
        local v4 = {};
        for v5, _ in pairs(v2) do
            local v7, v8 = l_jest_0.fn();
            v3[v5] = v8;
            v4[v5] = v7;
        end;
        setmetatable(v3, {
            __tostring = function()
                return "Service(MockPlatformInterface)";
            end
        });
        return {
            spies = v4, 
            mockService = v3
        };
    end
};
