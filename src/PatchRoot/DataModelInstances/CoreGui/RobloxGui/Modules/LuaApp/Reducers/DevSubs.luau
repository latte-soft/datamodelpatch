local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.SetDevSubs);
local v4 = require(l_Modules_0.LuaApp.Actions.SetDevSub);
return function(v5, v6)
    v5 = v5 or {};
    if v6.type == v3.name then
        return (v2.List.join({}, v6.devSubs));
    else
        if v6.type == v4.name then
            local v7 = {};
            for _, v9 in pairs(v5) do
                if v9.id == v6.devSub.id then
                    table.insert(v7, v6.devSub);
                else
                    table.insert(v7, v9);
                end;
            end;
            v5 = v7;
        end;
        return v5;
    end;
end;
