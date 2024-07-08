local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Classes.PluginEventBridge);
local v2 = require(l_Parent_0.Classes.DebugInterface);
return (v2:extend("StandalonePluginDebugInterface", function(v3, v4, v5)
    local v6 = v2.new("StandalonePlugin", v3, {
        (v1.new(v4))
    });
    v6:setGuiOptions(v5);
    return v6;
end));
