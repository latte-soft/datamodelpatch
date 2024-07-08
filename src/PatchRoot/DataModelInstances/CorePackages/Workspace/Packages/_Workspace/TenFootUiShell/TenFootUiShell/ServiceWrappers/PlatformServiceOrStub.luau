local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Signal_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Signal;
local v2 = require(l_script_FirstAncestor_0.Hooks.CrossPlay.Constants);
local v6 = {
    OnLeaveConstrained = l_Signal_0.new(), 
    BeginCheckXboxPrivilege = function(_, _)
        return {
            CanJoinGame = true, 
            PrivilegeCheckResult = v2.PrivilegeCheckResults.NO_ISSUE, 
            Success = true
        };
    end, 
    GetPlatformPartyMembers = function(_)
        return {};
    end
};
local v7 = nil;
pcall(function()
    v7 = game:GetService("PlatformService");
end);
return v7 or v6;
