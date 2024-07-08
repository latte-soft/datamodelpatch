local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v5 = require(l_Modules_0.Common.Signal);
local v6 = {};
v6.__index = v6;
local v7 = require(l_Modules_0.LuaApp.Flags.FFlagUseImprovedGameProtocolMessages);
v6.onLaunched = function(v8, v9)
    local _ = "";
    return v8.subscribe(if not v7 then l_MessageBus_0.getMessageId("Game", "launch") else l_MessageBus_0.getMessageId("Game", "launchSuccess"), v9);
end;
v6.onLeft = function(v11, v12)
    return v11.subscribe(l_MessageBus_0.getMessageId("Game", "onGameLeave"), v12);
end;
v6.new = function()
    local v13 = {
        signalTable = {}, 
        subscriber = l_MessageBus_0.Subscriber.new()
    };
    v13.subscribe = function(v14, v15)
        assert(type(v15) == "function", "Expected callback to be a function");
        local v16 = v13.signalTable[v14];
        if v16 == nil then
            v16 = v5.new();
            v13.signalTable[v14] = v16;
            v13.subscriber:subscribe({
                mid = v14
            }, function(v17)
                v16:fire(v17);
            end);
        end;
        return v16:connect(v15);
    end;
    setmetatable(v13, v6);
    return v13;
end;
return v6;
