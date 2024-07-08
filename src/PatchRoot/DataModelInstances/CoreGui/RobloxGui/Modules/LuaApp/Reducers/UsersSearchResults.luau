local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.AddUsersSearchResults);
local v4 = require(l_Modules_0.LuaApp.Actions.RemoveUsersSearchResults);
return function(v5, v6)
    v5 = v5 or {};
    if v6.type == v3.name then
        local v7 = v5[v6.keyword];
        local _ = nil;
        return (v2.Dictionary.join(v5, {
            [v6.keyword] = v2.Dictionary.join({}, {
                nextPageCursor = v6.nextPageCursor or v2.None, 
                entries = if not v7 then v6.entries else v2.List.join(v7.entries, v6.entries)
            })
        }));
    else
        if v6.type == v4.name then
            v5 = v2.Dictionary.join(v5, {
                [v6.keyword] = v2.None
            });
        end;
        return v5;
    end;
end;
