local l_Shell_0 = game:GetService("CoreGui").RobloxGui.Modules:FindFirstChild("Shell");
local l_SafeAsyncRodux_0 = require(l_Shell_0:FindFirstChild("SafeAsyncRodux"));
local v2 = nil;
pcall(function()
    v2 = game:GetService("PlatformService");
end);
local v3 = require(l_Shell_0.Actions.FetchPrivilegeSettings);
local v4 = require(l_Shell_0.Actions.SetPrivilegeSettings);
local v5 = {
    USER_CREATED_CONTENT = 247, 
    MULTIPLAYER_SESSIONS = 254
};
local v12 = l_SafeAsyncRodux_0({
    asyncFunc = function(_)
        local v7 = {};
        if not pcall(function()
            local v8 = v2:BeginCheckXboxPrivilege(v5.MULTIPLAYER_SESSIONS);
            local v9 = v2:BeginCheckXboxPrivilege(v5.USER_CREATED_CONTENT);
            v7.Multiplayer = {
                hasPrivilege = v8.CanJoinGame, 
                status = v8.PrivilegeCheckResult
            };
            v7.SharedContent = {
                hasPrivilege = v9.CanJoinGame, 
                status = v9.PrivilegeCheckResult
            };
        end) then
            v7.Multiplayer = {
                hasPrivilege = false, 
                status = "Error"
            };
            v7.SharedContent = {
                hasPrivilege = false, 
                status = "Error"
            };
        end;
        v7.timestamp = tick();
        return v7;
    end, 
    callback = function(v10, v11)
        v10:dispatch(v4(v11));
    end, 
    userRelated = true
});
return function()
    return function(v13)
        v13:dispatch(v3());
        spawn(function()
            v12(v13);
        end);
    end;
end;
