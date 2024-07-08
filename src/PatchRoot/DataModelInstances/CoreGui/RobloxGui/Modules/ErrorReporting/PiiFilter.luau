local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = v3.strictInterface({
    eraseTimeout = v3.number, 
    testHarness = v3.optional(v3.strictInterface({
        players = v3.union(v3.instanceOf("Players"), v3.interface({
            GetPlayers = v3.callback, 
            GetPlayerByUserId = v3.callback, 
            PlayerAdded = v3.RBXScriptSignal, 
            PlayerRemoving = v3.RBXScriptSignal
        })), 
        wait = v3.callback
    }))
});
local v5 = {};
v5.__index = v5;
v5.new = function(v6)
    assert(v4(v6));
    return (setmetatable({
        _eraseTimeout = v6.eraseTimeout, 
        _trackedPii = {}, 
        _playerCounter = 1, 
        _disambiguationIdentifiers = {}, 
        _waitFn = if v6.testHarness == nil then wait else v6.testHarness.wait, 
        _players = if v6.testHarness == nil then l_Players_0 else v6.testHarness.players
    }, v5));
end;
v5._addPlayerToEraseMap = function(v7, v8)
    local v9 = v7._disambiguationIdentifiers[v8.UserId];
    if v9 == nil then
        v9 = v7._playerCounter;
        v7._disambiguationIdentifiers[v8.UserId] = v7._playerCounter;
        v7._playerCounter = v7._playerCounter + 1;
    end;
    v7._trackedPii[tostring(v8.UserId)] = string.format("UserId(%d)", v9);
    v7._trackedPii[tostring(v8.Name)] = string.format("UserName(%d)", v9);
    v7._trackedPii[tostring(v8.DisplayName)] = string.format("DisplayName(%d)", v9);
end;
v5._removePlayerFromEraseMap = function(v10, v11)
    v10._trackedPii[tostring(v11.UserId)] = nil;
    v10._trackedPii[tostring(v11.Name)] = nil;
    v10._trackedPii[tostring(v11.DisplayName)] = nil;
end;
v5.startTracking = function(v12)
    for _, v14 in ipairs(v12._players:GetPlayers()) do
        v12:_addPlayerToEraseMap(v14);
    end;
    v12._playerAddedConnection = v12._players.PlayerAdded:Connect(function(v15)
        v12:_addPlayerToEraseMap(v15);
    end);
    v12._playerRemovingConnection = v12._players.PlayerRemoving:Connect(function(v16)
        v12._waitFn(v12._eraseTimeout);
        if v12._players:GetPlayerByUserId(v16.UserId) == nil then
            v12:_removePlayerFromEraseMap(v16);
        end;
    end);
end;
v5.stopTracking = function(v17)
    v17._playerAddedConnection:Disconnect();
    v17._playerRemovingConnection:Disconnect();
end;
v5.cleanPii = function(v18, v19)
    for v20, v21 in pairs(v18._trackedPii) do
        v19 = string.gsub(v19, v20, v21);
    end;
    return v19;
end;
return v5;
