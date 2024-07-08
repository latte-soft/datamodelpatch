local v0 = require(game:GetService("CorePackages").Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
local v2 = require(l_Actions_0.AddPlayer);
local v3 = require(l_Actions_0.RemovePlayer);
local v4 = require(l_Actions_0.SetPlayerLeaderstat);
local function v9(v5, v6, v7)
    local v8 = nil;
    if (v6 ~= nil and v7 ~= nil) and v7[v5.UserId] ~= nil then
        v8 = v7[v5.UserId][v6];
    end;
    return {
        name = v5.DisplayName:upper(), 
        stat = not not v8 and tonumber(v8) or v8
    };
end;
return function(v10, v11, v12)
    local v13 = not not v12.gameStats[1] and v12.gameStats[1].name or nil;
    if not v10 or v13 ~= v10.primaryStat then
        local v14 = {};
        for _, v16 in pairs(v12.players) do
            v14[v16] = v9(v16, v13, v12.playerStats);
        end;
        return {
            primaryStat = v13, 
            keys = v14
        };
    elseif not (v11.type ~= v2.name) or v11.type == v4.name then
        return {
            primaryStat = v13, 
            keys = v0.Dictionary.join(v10.keys, {
                [v11.player] = v9(v11.player, v13, v12.playerStats)
            })
        };
    elseif v11.type == v3.name then
        return {
            primaryStat = v13, 
            keys = v0.Dictionary.join(v10.keys, {
                [v11.player] = v0.None
            })
        };
    else
        return v10;
    end;
end;
