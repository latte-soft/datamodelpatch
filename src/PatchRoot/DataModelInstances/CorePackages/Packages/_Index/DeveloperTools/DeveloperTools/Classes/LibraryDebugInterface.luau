local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Classes.BindableEventBridge);
local v2 = require(l_Parent_0.Classes.DebugInterface);
local v3 = require(l_Parent_0.Services);
return (v2:extend("LibraryDebuggerInterface", function(v4, v5)
    local v6 = nil;
    pcall(function()
        local v7 = v3.getCoreGui();
        if v7:IsA("BasePlayerGui") then
            v6 = v7;
        end;
    end);
    pcall(function()
        v6 = game:GetService("ReplicatedStorage");
    end);
    if not v6 then
        v6 = Instance.new("Folder");
    end;
    local v8 = v2.new("Library", v4, {
        (v1.new(v6))
    });
    v8:setGuiOptions(v5 or {
        rootInstance = game:GetService("ReplicatedStorage")
    });
    return v8;
end));
