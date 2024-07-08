local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactNavigation);
local l_JavascriptHybrid_0 = require(l_script_FirstAncestor_0.Common.Constants).JavascriptHybrid;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v7 = require(l_Parent_0.UserProfiles);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v11 = require(l_script_FirstAncestor_0.Flags.EditProfileIXP);
local v12 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v12.EventNames;
local l_useAnalytics_0 = v12.useAnalytics;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixLogging);
return v4.withNavigation(function(v16)
    local v17 = v7.Hooks.useUserProfilesFetch({
        userIds = {
            (l_useLocalUserId_0())
        }, 
        query = v7.Queries.userProfilesAllNamesByUserIds
    });
    local v18 = l_useLocalization_0({
        updated = v10.UsernameUpdated
    });
    local v19 = nil;
    v19 = if not v15 then if v11.useIsExperimentEnabled() then l_useAnalytics_0() else nil else l_useAnalytics_0();
    local function _(v20)
        if (not (v20.moduleID == l_JavascriptHybrid_0.Module.Navigation and v20.functionName == l_JavascriptHybrid_0.Function.navigateToFeature) or not v20.params) or not v20.params.params then
            return nil;
        else
            return v20.params.params.feature;
        end;
    end;
    local function _(v22)
        return if ((v22.moduleID == l_JavascriptHybrid_0.Module.Navigation and v22.functionName == l_JavascriptHybrid_0.Function.navigateToFeature) and v22.params) and v22.params.params then v22.params.params.feature else nil == l_JavascriptHybrid_0.Feature.CloseUpdateUsernameModal;
    end;
    local function _(v24)
        return if ((v24.moduleID == l_JavascriptHybrid_0.Module.Navigation and v24.functionName == l_JavascriptHybrid_0.Function.navigateToFeature) and v24.params) and v24.params.params then v24.params.params.feature else nil == l_JavascriptHybrid_0.Feature.UpdateUsernameModalSuccess;
    end;
    local function _()
        v17.refetch();
        if not (not v15 and not v19) then
            v19.fireAnalyticsEvent(l_EventNames_0.UsernameSaved);
        end;
    end;
    return v3.createElement(v16.BrowserWrapperComponent, {
        isVisible = true, 
        webViewVisible = true, 
        modal = false, 
        url = l_UrlBuilder_0.static.settings.account() .. "?changeusername", 
        isGenericWebview = true, 
        javaScriptCallback = function(v27)
            local v28 = l_HttpService_0:JSONDecode(v27);
            if not (if ((v28.moduleID == l_JavascriptHybrid_0.Module.Navigation and v28.functionName == l_JavascriptHybrid_0.Function.navigateToFeature) and v28.params) and v28.params.params then v28.params.params.feature else nil == l_JavascriptHybrid_0.Feature.UpdateUsernameModalSuccess) then
                if if ((v28.moduleID == l_JavascriptHybrid_0.Module.Navigation and v28.functionName == l_JavascriptHybrid_0.Function.navigateToFeature) and v28.params) and v28.params.params then v28.params.params.feature else nil == l_JavascriptHybrid_0.Feature.CloseUpdateUsernameModal then
                    v16.navigation.goBack();
                end;
                return ;
            else
                v17.refetch();
                if not (not v15 and not v19) then
                    v19.fireAnalyticsEvent(l_EventNames_0.UsernameSaved);
                end;
                v16.navigation.goBack();
                v16.showToast(v18.updated);
                return ;
            end;
        end
    });
end);
