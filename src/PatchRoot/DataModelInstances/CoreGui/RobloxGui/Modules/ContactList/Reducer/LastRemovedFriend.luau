local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({
    lastRemovedFriendId = ""
}, {
    [require(script.Parent.Parent.Actions.UpdateLastFriend).name] = function(v2, v3)
        return v1.Dictionary.join(v2, {
            lastRemovedFriendId = tostring(v3.lastRemovedFriendId) .. tostring(DateTime.now())
        });
    end
});
