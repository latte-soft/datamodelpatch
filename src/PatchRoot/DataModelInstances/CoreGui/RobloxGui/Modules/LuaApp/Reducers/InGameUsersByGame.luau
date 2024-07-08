local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Immutable);
local l_ConvertUniverseIdToString_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).ConvertUniverseIdToString;
local l_ReceivedUserPresence_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Actions.ReceivedUserPresence;
local v5 = require(l_Modules_0.LuaApp.Models.User);
return function(v6, v7)
    v6 = v6 or {};
    local function _(v8, v9)
        if v9 then
            local v10 = v6[tostring(v9)];
            if v10 then
                v6 = v2.Set(v6, tostring(v9), v2.RemoveFromDictionary(v10, v8));
            end;
        end;
    end;
    local function v14(v12, v13)
        v6 = v2.JoinDictionaries(v6, {
            [v13] = v2.JoinDictionaries(v6[v13] or {}, {
                [v12] = v12
            })
        });
    end;
    if v7.type == l_ReceivedUserPresence_0.name then
        local v15 = tostring(v7.userId);
        local v16 = tostring(v7.previousUniverseId);
        if v7.presence == v5.PresenceType.IN_GAME then
            local v17 = l_ConvertUniverseIdToString_0(v7.universeId);
            if not (not (v16 and v17 ~= v16) or not v16) then
                local v18 = v6[tostring(v16)];
                if v18 then
                    v6 = v2.Set(v6, tostring(v16), v2.RemoveFromDictionary(v18, v15));
                end;
            end;
            v14(v15, v17);
        elseif v16 then
            local v19 = v6[tostring(v16)];
            if v19 then
                v6 = v2.Set(v6, tostring(v16), v2.RemoveFromDictionary(v19, v15));
            end;
        end;
    end;
    return v6;
end;
