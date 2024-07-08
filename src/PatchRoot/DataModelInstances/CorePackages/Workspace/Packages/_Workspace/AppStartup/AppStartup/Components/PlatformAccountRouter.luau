local l_Parent_0 = script:FindFirstAncestor("AppStartup").Parent;
local v1 = require(script.Parent.Parent.navigateWithPlatformAccount);
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
return function(_)
    local v8 = l_useNavigation_0();
    v2.useEffect(function()
        if v8 then
            if not l_ThirdPartyUserService_0 or l_ThirdPartyUserService_0:HaveActiveUser() then
                v1(l_getAppFeaturePolicies_0().getUseSingleSignOn(), v8.replace);
            else
                v8.replace(l_AppPage_0.EngagementScreenContainer);
                return ;
            end;
        end;
    end, {
        v8
    });
    return nil;
end;
