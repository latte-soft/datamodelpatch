local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Roact);
local _ = l_CoreGui_0.RobloxGui.Modules;
return function(v3)
    local l_receiverComponents_0 = v3.receiverComponents;
    local l_RobloxEventReceiver_0 = v3.RobloxEventReceiver;
    local v6 = {};
    for v7, v8 in l_receiverComponents_0, nil, nil do
        v6[v7] = v1.createElement(v8, {
            RobloxEventReceiver = l_RobloxEventReceiver_0
        });
    end;
    return v1.createElement("Folder", {}, v6);
end;
