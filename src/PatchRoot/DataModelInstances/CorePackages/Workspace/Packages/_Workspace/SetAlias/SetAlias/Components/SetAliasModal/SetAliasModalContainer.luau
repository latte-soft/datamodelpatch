local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(script.Parent.SetAliasModal);
local v3 = require(l_Parent_0.Common.Constants);
local v4 = require(l_Parent_0.Analytics);
local l_EventNames_0 = v4.EventNames;
local l_useAnalytics_0 = v4.useAnalytics;
local l_React_0 = v1.React;
local l_NetworkingAliases_0 = v1.NetworkingAliases;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_useDispatch_0 = v1.Hooks.useDispatch;
local l_useEffectOnMount_0 = v1.Hooks.useEffectOnMount;
local l_useUserProfilesFetch_0 = v1.UserProfiles.Hooks.useUserProfilesFetch;
local l_userProfilesAllNamesByUserIds_0 = v1.UserProfiles.Queries.userProfilesAllNamesByUserIds;
local l_UplevelAliasIXP_0 = v1.UserProfiles.Flags.UplevelAliasIXP;
local l_writeNamesQuery_0 = v1.UserProfiles.Mutations.writeNamesQuery;
local v17 = {
    Moderated = "Moderated", 
    Success = "Success"
};
return function(v18)
    local v19 = l_useDispatch_0();
    local v20 = v18.navigation.getParam(v3.PROFILE_USER_ID);
    local v21, v22 = l_React_0.useState(false);
    local v23 = not not l_UplevelAliasIXP_0.isSetupEnabled() and l_UplevelAliasIXP_0.useIsExperimentEnabled();
    local v24 = if not v23 then nil else l_useUserProfilesFetch_0({
        userIds = {
            v20
        }, 
        query = l_userProfilesAllNamesByUserIds_0
    });
    local v25 = if not v23 then nil else l_useAnalytics_0();
    local v27 = l_useSelector_0(function(v26)
        return v26.ScreenSize;
    end);
    local v28 = if not v23 then nil else (if not v23 then nil else l_getDeepValue_0(v24, "data.userProfiles") or {})[1] or {};
    local v30 = if not v23 then l_useSelector_0(function(v29)
        return l_getDeepValue_0(v29, string.format("SetAlias.Aliases.byUserId.%s", v20));
    end) else l_getDeepValue_0(v28, "names.alias");
    local v31 = if not v23 then nil else l_getDeepValue_0(v28, "names.displayName");
    l_useEffectOnMount_0(function()
        if not (not v23 or not v25) then
            v25.fireAnalyticsEvent(l_EventNames_0.CustomizeNameModalOpened);
        end;
    end);
    return l_React_0.createElement(v2, {
        screenSize = v27, 
        alias = v30, 
        displayName = v31, 
        cancelOnActivated = function()
            v18.navigation.pop();
        end, 
        saveOnActivated = function(v32)
            return v19(l_NetworkingAliases_0.SetUserTag.API(v20, v32)):andThen(function(v33)
                if v23 then
                    if l_getDeepValue_0(v33, "responseBody.status") == v17.Moderated then
                        v22(true);
                        if v25 then
                            v25.fireAnalyticsEvent(l_EventNames_0.CustomizeNameSaveAttemptInvalidInput, {
                                alias = v32
                            });
                        end;
                        return ;
                    else
                        if v25 then
                            v25.fireAnalyticsEvent(l_EventNames_0.CustomizeNameSaved, {
                                alias = v32
                            });
                        end;
                        l_writeNamesQuery_0({
                            client = v24.client, 
                            query = l_userProfilesAllNamesByUserIds_0, 
                            userId = v20, 
                            names = {
                                alias = v32, 
                                contactName = l_getDeepValue_0(v28, "names.contactName"), 
                                displayName = l_getDeepValue_0(v28, "names.displayName"), 
                                username = l_getDeepValue_0(v28, "names.username")
                            }
                        });
                    end;
                end;
                v18.navigation.pop();
            end);
        end, 
        uplevelAliasEnabled = v23, 
        hasSaveAliasError = if not v23 then nil else v21, 
        onTextChanged = if not v23 then nil else function()
            if not (not v23 or not v21) then
                v22(false);
            end;
        end
    });
end;
