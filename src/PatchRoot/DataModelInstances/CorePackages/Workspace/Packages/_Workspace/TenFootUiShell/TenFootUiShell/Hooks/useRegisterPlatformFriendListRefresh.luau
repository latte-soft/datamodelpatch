local v0 = nil;
local v1 = nil;
pcall(function()
    v0 = game:GetService("PlatformService");
end);
pcall(function()
    v1 = game:GetService("AppLifecycleService");
end);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local _ = require(l_Parent_0.AppCommonLib);
local l_TenFootUiContext_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiContext;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v10 = require(l_script_FirstAncestor_0.Networking.networkRequests.platformFriendListRefresh);
local function _(v11, v12, v13)
    return function()
        v10(v11, v12, v13);
    end;
end;
return function()
    local v15 = v4.useContext(l_TenFootUiContext_0);
    assert(v15, "TenFootUiContext must be configured before useRegisterPlatformFriendListRefresh");
    local v16 = v15.useRoactService(v15.RoactAnalytics);
    local v17 = v15.useRoactService(v15.RoactNetworking);
    local v18 = l_useDispatch_0();
    local v20 = l_useSelector_0(function(v19)
        return {
            authenticationStatus = v19.AuthenticationStatus.status
        };
    end).authenticationStatus == l_LoginStatus_0.LOGGED_IN;
    local v21, v22 = v4.useState(false);
    v4.useEffect(function()
        if v20 == v21 then
            return ;
        else
            if v20 then
                local l_v18_0 = v18;
                local l_v17_0 = v17;
                local l_v16_0 = v16;
                local function v26()
                    v10(l_v18_0, l_v17_0, l_v16_0);
                end;
                if not v0 then
                    if v1 then
                        v1:RegisterCallback(Enum.AppLifecycleState.Active, v26, true, false);
                    end;
                else
                    v0.OnLeaveConstrained:connect(v26);
                end;
            end;
            v22(v20);
            return ;
        end;
    end, {
        v20, 
        v21
    });
end;
