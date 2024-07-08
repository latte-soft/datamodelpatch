local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local l_Cryo_0 = v1.Cryo;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_UserProfiles_0 = v1.UserProfiles;
local l_useSelector_0 = v1.useSelector;
local l_useDispatch_0 = v1.useDispatch;
local l_useNavigation_0 = v1.useNavigation;
local l_NetworkingUsers_0 = v1.NetworkingUsers;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local l_useUserProfilesFetch_0 = l_UserProfiles_0.Hooks.useUserProfilesFetch;
local l_userProfilesAllNamesByUserIds_0 = l_UserProfiles_0.Queries.userProfilesAllNamesByUserIds;
local v14 = require(l_Parent_0.Common.ProfileScreens);
local l_useUserExperiment_0 = v1.useUserExperiment;
local l_AppUserLayers_0 = v1.AppUserLayers;
local v17 = require(script.Parent.ProfileUserDetailsNames);
local v18 = require(script.Parent.ProfileUserDetailsNamesLoading);
local v19 = require(l_Parent_0.Flags.FFlagShowDisplayNameTooltip);
local v20 = require(l_Parent_0.Flags.FFlagDisplayNameTooltipIXPEnabled);
local function v21()
end;
return function(v22)
    local l_profileUserId_0 = v22.profileUserId;
    local v24 = l_React_0.useRef(false);
    local function v26(v25)
        v24.current = v25;
    end;
    local v27 = l_useNavigation_0();
    local v28 = l_useUserProfilesFetch_0({
        userIds = {
            l_profileUserId_0
        }, 
        query = l_userProfilesAllNamesByUserIds_0
    });
    local v29 = nil;
    if v20 then
        v29 = l_useUserExperiment_0({
            l_AppUserLayers_0.SocialSelfProfileViewLayer
        }, function(v30)
            return (v30[l_AppUserLayers_0.SocialSelfProfileViewLayer] or {}).dn_tooltip_enabled;
        end);
    end;
    if not (not v19 and not v20) then
        local v31 = l_useDispatch_0();
        local l_v31_0 = v31 --[[ copy: 7 -> 17 ]];
        local function _(v33)
            return l_v31_0(l_NetworkingUsers_0.GetDisplayNameValidation.API(l_profileUserId_0, v33));
        end;
        l_React_0.useEffect(function()
            if not (not v19 and not v29 or not v22.isLocalUser) then
                l_v31_0(l_NetworkingUsers_0.GetDisplayNameValidation.API(l_profileUserId_0, "sampleName")):andThen(function(_)
                    v24.current = true;
                end):catch(function(_)
                    v24.current = false;
                end);
            end;
        end, {
            v22.isLocalUser
        });
    end;
    local v38 = l_useSelector_0(function(v37)
        return {
            hasVerifiedBadge = l_getDeepValue_0(v37, string.format("Profile.AdditionalUserFields.%s.hasVerifiedBadge", l_profileUserId_0)) or false, 
            hasPremiumMembership = l_getDeepValue_0(v37, string.format("Profile.PremiumMembershipStatus.%s", l_profileUserId_0)) or false, 
            friendshipStatus = l_getDeepValue_0(v37, string.format("Profile.FriendshipStatus.%s", l_profileUserId_0)) or Enum.FriendStatus.Unknown
        };
    end);
    if not v28.loading and not v28.error then
        local v39 = l_UserProfiles_0.Selectors.getUsernameFromId(v28.data, v22.profileUserId);
        local v40 = l_UserProfiles_0.Selectors.getCombinedNameFromId(v28.data, v22.profileUserId);
        local v41 = if v19 or v29 then l_UserProfiles_0.Selectors.getDisplayNameFromId(v28.data, v22.profileUserId) else nil;
        local l_names_0 = l_UserProfiles_0.Selectors.getUserProfileFromId(v28.data, v22.profileUserId).names;
        local l_alias_0 = l_names_0.alias;
        local l_contactName_0 = l_names_0.contactName;
        local function v45()
            if not v24.current then
                v27.navigate(v14.EditDisplayNameErrorModal);
                return ;
            else
                v27.navigate(v14.EditDisplayNameModal, {
                    showToast = v21, 
                    setDisplayNameAvailable = v26, 
                    displayName = v41
                });
                return ;
            end;
        end;
        local v46 = nil;
        if not v19 and (not v20 or not v29) then
            local v47 = true;
            if l_alias_0 == "" then
                v47 = l_contactName_0 ~= "";
            end;
            v46 = v47;
        elseif not v22.isLocalUser then
            local v48 = true;
            if l_alias_0 == "" then
                v48 = l_contactName_0 ~= "";
            end;
            v46 = v48;
        else
            local v49 = false;
            if v41 ~= "" then
                v49 = v41 ~= v39;
            end;
            v46 = v49;
        end;
        return l_Roact_0.createElement(v17, l_Cryo_0.Dictionary.join(v22, v38, {
            primaryName = v40, 
            username = v39, 
            isLocalUser = v22.isLocalUser, 
            isOverwrittenName = v46, 
            navigateToEditDisplayNameModal = if v19 or v29 then v45 else nil
        }));
    else
        return l_Roact_0.createElement(v18);
    end;
end;
