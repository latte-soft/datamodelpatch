local _ = require(script.Parent.Parent.Parent.LuauPolyfill);
local function v1(...)
    error("Not implemented. Dependencies used upstream aren't implemented");
end;
return {
    default = function(v2)
        local v3 = {};
        for _, v5 in ipairs(v2.supportedCommands) do
            v3[v5] = function(v6, ...)
                v1(v6, v5, ...);
            end;
        end;
        return v3;
    end
};
