local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local v1 = require(l_script_FirstAncestor_0.ServiceWrappers.PlatformServiceOrStub);
local v2 = require(l_script_FirstAncestor_0.ServiceWrappers.ThirdPartyUserServiceOrStub);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local v8 = require(l_script_FirstAncestor_0.Hooks.CrossPlay.useCrossPlayApi);
local v9 = require(script.Parent.getFFlagCrossPlayRearrangement);
return function()
    local v10 = v8();
    local v11 = l_useDispatch_0();
    local v13 = l_useSelector_0(function(v12)
        return {
            authenticationStatus = v12.AuthenticationStatus.status, 
            preloading = v12.Startup.Preloading
        };
    end);
    local v14, v15 = v4.useState(false);
    local l_authenticationStatus_0 = v13.authenticationStatus;
    local l_preloading_0 = v13.preloading;
    local v18 = l_authenticationStatus_0 == l_LoginStatus_0.LOGGED_IN;
    v4.useEffect(function()
        if v18 == v14 then
            return ;
        else
            if not v18 or not l_preloading_0 then
                if not v18 then
                    v10.reset();
                end;
            else
                v10.fetch();
            end;
            v15(v18);
            return ;
        end;
    end, {
        v10, 
        v18, 
        v14, 
        l_preloading_0
    });
    local v19 = {
        v11
    };
    if v9() then
        v19 = {
            v11, 
            v10
        };
    end;
    v4.useEffect(function()
        local v20 = v2.ActiveUserSignedOut:connect(function()
            v10.reset();
        end);
        local v21 = v1.OnLeaveConstrained:connect(function()
            v10.fetch();
        end);
        return function()
            v20:disconnect();
            v21:disconnect();
        end;
    end, v19);
end;
