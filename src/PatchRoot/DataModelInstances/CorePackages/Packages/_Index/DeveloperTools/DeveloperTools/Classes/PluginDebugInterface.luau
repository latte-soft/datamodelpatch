local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Classes.BindableEventBridge);
local v2 = require(l_Parent_0.Classes.DebugInterface);
local v3 = require(l_Parent_0.Services);
return (v2:extend("PluginDebugInterface", function(v4, _, v6)
    local v7 = v2.new("Plugin", v4, {
        (v1.new(v3.getStudioService()))
    });
    if not v6 then
        spawn(function()
            local v8 = v3.getRobloxPluginGuiService():WaitForChild(v4, 10);
            if v8 then
                v7:setGuiOptions({
                    rootInstance = v8
                });
            end;
        end);
        return v7;
    else
        v7:setGuiOptions({
            rootInstance = v6
        });
        return v7;
    end;
end));
