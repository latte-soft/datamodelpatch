local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local v1 = require(script.Parent.EditDisplayNameModal);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UserProfiles);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_writeNamesQuery_0 = v4.Mutations.writeNamesQuery;
local v7 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({});
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_getDeepValue_0 = v7.Dictionary.getDeepValue;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v12 = require(l_script_FirstAncestor_0.Networking.UsersNetworking);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v15 = require(l_script_FirstAncestor_0.Flags.EditProfileIXP);
local v16 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v16.EventNames;
local l_useAnalytics_0 = v16.useAnalytics;
local l_FFlagRealNamesInDisplayNameExperimentEnabled_0 = require(l_Parent_0.SharedFlags).FFlagRealNamesInDisplayNameExperimentEnabled;
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixLogging);
local v21 = game:DefineFastFlag("UpdateDisplayNameModalCopy", false);
local v22 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
return function(v23)
    local v24 = l_useDispatch_0();
    local v25 = l_useScreenSize_0();
    local v26 = v23.navigation.getParam("showToast");
    local v27 = v23.navigation.getParam("setDisplayNameAvailable");
    local v28 = nil;
    v28 = if not v20 then if v15.useIsExperimentEnabled() then l_useAnalytics_0() else nil else l_useAnalytics_0();
    l_useEffectOnMount_0(function()
        if not (not v20 and not v28) then
            v28.fireAnalyticsEvent(l_EventNames_0.DisplayNameModalLoaded);
        end;
    end);
    local v29 = nil;
    local v30 = nil;
    if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then
        v30 = l_useLocalization_0({
            DisplayNameModalCaption = v14.DisplayNameModalCaption, 
            EditDisplayName = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v14.EditDisplayName else nil, 
            Toast = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v14.DisplayNameUpdated else nil
        });
    else
        v29 = v22();
    end;
    local v31 = l_useLocalUserId_0();
    local v32 = v23.navigation.getParam("displayName");
    local v33 = nil;
    local v34 = v4.Hooks.useUserProfilesFetch({
        userIds = {
            v31
        }, 
        query = v4.Queries.userProfilesAllNamesByUserIds
    });
    if v34.data then
        v33 = v4.Selectors.getUserProfileFromId(v34.data, v31);
    end;
    return v3.createElement(v1, {
        screenSize = v25, 
        title = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v30.EditDisplayName else v29.displayNameEditMessage, 
        description = if not v21 then if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v29.displayNameModalCaption else v30.DisplayNameModalCaption else if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v29.displayNameCaption else v30.DisplayNameCaption, 
        initialText = v32, 
        localUserId = v31, 
        cancelOnActivated = function()
            v23.navigation.goBack();
        end, 
        saveOnActivated = function(v35)
            return v24(v12.SetDisplayName.API(v31, v35)):andThen(function(_)
                l_writeNamesQuery_0({
                    client = v34.client, 
                    query = v4.Queries.userProfilesAllNamesByUserIds, 
                    userId = v31, 
                    names = {
                        alias = l_getDeepValue_0(v33, "names.alias"), 
                        contactName = l_getDeepValue_0(v33, "names.contactName"), 
                        displayName = v35, 
                        username = l_getDeepValue_0(v33, "names.username")
                    }
                });
                if not (not v20 and not v28) then
                    v28.fireAnalyticsEvent(l_EventNames_0.DisplayNameSaved, {
                        displayName = v35
                    });
                end;
                v23.navigation.goBack();
                v26(if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v30.Toast else v29.displayNameUpdatedMessage);
                v27(false);
            end);
        end, 
        validateDisplayName = function(v37)
            return v24(v12.GetDisplayNameValidation.API(v31, v37));
        end
    });
end;
