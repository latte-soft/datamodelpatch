local l_Parent_0 = script:FindFirstAncestor("TenFootUiEngagementScreen").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.TenFootUiCommon);
local v3 = require(l_Parent_0.AppStartup);
local l_TenFootUiContext_0 = v2.TenFootUiContext;
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local l_navigateWithPlatformAccount_0 = v3.navigateWithPlatformAccount;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v9 = game:DefineFastFlag("EngagementScreenContinueEvent", false);
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
return function(v11)
    local l_useSingleSignOn_0 = v11.useSingleSignOn;
    local l_allowPlatformAccountSwitching_0 = v11.allowPlatformAccountSwitching;
    local v14 = l_useNavigation_0();
    local v15 = v1.useContext(l_TenFootUiContext_0);
    local v16 = l_useRoactService_0(l_AppLogging_0);
    local v17 = nil;
    if l_allowPlatformAccountSwitching_0 then
        v17 = function()
            if l_ThirdPartyUserService_0 then
                l_ThirdPartyUserService_0:ShowAccountPicker();
            end;
        end;
    end;
    return {
        onContinue = not v15 and function()
        end or function()
            if not (not v9 or not game:GetEngineFeature("EngagementScreenContinueEvent")) then
                v16:logEventOnce("engagement_screen_did_continue");
            end;
            if l_ThirdPartyUserService_0 then
                l_ThirdPartyUserService_0:RegisterActiveUser(Enum.UserInputType.Gamepad1);
            end;
            l_navigateWithPlatformAccount_0(l_useSingleSignOn_0, v14.replace);
        end, 
        onSwitchAccounts = v17
    };
end;
