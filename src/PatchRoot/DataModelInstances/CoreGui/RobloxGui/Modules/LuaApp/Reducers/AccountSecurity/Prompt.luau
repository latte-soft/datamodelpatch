local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
return require(l_Modules_0.Common.Rodux).createReducer({
    isGeneric = nil, 
    promptType = nil, 
    metadata = nil, 
    lastUpdatedPromptTypeAt = nil, 
    accountPinUnlockedUntil = nil
}, {
    [require(l_Modules_0.LuaApp.Actions.AccountSecurity.UpdateAccountPinUnlockTimeout).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            accountPinUnlockedUntil = v4.accountPinUnlockedUntil or v2.None
        });
    end, 
    [require(l_Modules_0.LuaApp.Actions.AccountSecurity.UpdatePromptType).name] = function(v5, v6)
        local v7 = v2.Dictionary.join(v5, {
            isGeneric = v6.isGeneric or v2.None, 
            promptType = v6.promptType or v2.None, 
            metadata = v6.metadata or v2.None
        });
        if v5.promptType ~= v6.promptType then
            v7 = v2.Dictionary.join(v7, {
                lastUpdatedPromptTypeAt = v6.lastUpdatedPromptTypeAt
            });
        end;
        return v7;
    end
});
