local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_RoactRodux_0 = v1.RoactRodux;
local l_RoactAppExperiment_0 = v1.RoactAppExperiment;
local l_AppUserLayers_0 = v1.AppUserLayers;
local l_SetAlias_0 = v1.SetAlias;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local l_InvisibleMode_0 = v1.InvisibleMode;
local v10 = require(l_Parent_0.Common.ProfileScreens);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v12 = require(l_Parent_0.ProfileContext);
local v13 = require(l_Parent_0.Utils.isLocalUser);
local v14 = require(script.Parent.ProfileUserDetails);
local l_InvisibleModeIXP_0 = l_InvisibleMode_0.Flags.InvisibleModeIXP;
local l_UplevelAliasIXP_0 = v1.UserProfiles.Flags.UplevelAliasIXP;
local l_FFlagInvisibleModeSetupEnabled_0 = l_InvisibleMode_0.Flags.FFlagInvisibleModeSetupEnabled;
local l_FFlagInvisibleModeExperimentEnabled_0 = l_InvisibleMode_0.Flags.FFlagInvisibleModeExperimentEnabled;
local v19 = require(l_Parent_0.Flags.FFlagShowDisplayNameTooltip);
local v20 = require(l_Parent_0.Flags.FFlagDisplayNameTooltipIXPEnabled);
local v21 = l_Roact_0.PureComponent:extend("ProfileUserDetailsContainer");
local function v32(v22, v23)
    local v24 = v23.profileUserId or "";
    local v25 = l_getDeepValue_0(v22, string.format("Profile.Users.byUserId.%s.displayName", v24));
    local v26 = l_getDeepValue_0(v22, string.format("Profile.Users.byUserId.%s.username", v24));
    local v27 = l_getDeepValue_0(v22, string.format("Profile.AdditionalUserFields.%s.isDeleted", v24));
    local v28 = l_getDeepValue_0(v22, string.format("Profile.PremiumMembershipStatus.%s", v24));
    local v29 = l_getDeepValue_0(v22, string.format("Profile.FriendshipStatus.%s", v24));
    local v30 = l_getDeepValue_0(v22, string.format("SetAlias.Aliases.byUserId.%s", v24));
    local _ = false;
    return {
        friendshipStatus = v29 or Enum.FriendStatus.Unknown, 
        displayName = v25 or "", 
        username = v26 or "", 
        hasPremiumMembership = v28 or false, 
        isUserDeleted = v27 or false, 
        hasVerifiedBadge = l_getDeepValue_0(v22, string.format("Profile.AdditionalUserFields.%s.hasVerifiedBadge", v24)) or false, 
        alias = if not not v30 and string.len(v30) ~= 0 then v30 else nil
    };
end;
v21.init = function(v33)
    local l_props_0 = v33.props;
    v33.aliasActivated = function()
        l_props_0.navigation.navigate(v10.SetAliasModal, {
            profileUserId = l_props_0.profileUserId, 
            origin = l_SetAlias_0.Analytics.EntryPoints.ProfileCardName
        });
    end;
    v33.showToast = function(v35, v36, v37)
        l_props_0.navigation.navigate(v10.GenericToast, {
            toastProps = {
                toastContent = {
                    toastTitle = v35, 
                    toastSubtitle = v36, 
                    hideIcon = v37
                }
            }
        });
    end;
end;
v21.render = function(v38)
    local l_props_1 = v38.props;
    return l_Roact_0.createElement(v14, {
        isLocalUser = l_props_1.isLocalUser, 
        displayName = l_props_1.displayName, 
        alias = l_props_1.alias, 
        hasPremiumMembership = l_props_1.hasPremiumMembership, 
        hasVerifiedBadge = l_props_1.hasVerifiedBadge, 
        layoutOrder = l_props_1.layoutOrder, 
        zIndex = l_props_1.zIndex, 
        username = l_props_1.username, 
        friendshipStatus = l_props_1.friendshipStatus, 
        profileUserId = l_props_1.profileUserId, 
        isUserDeleted = l_props_1.isUserDeleted, 
        padding = l_props_1.padding, 
        aliasActivated = v38.aliasActivated, 
        showToast = v38.showToast, 
        contextualInfoType = l_props_1.contextualInfoType, 
        uplevelAliasEnabled = l_props_1.uplevelAliasEnabled, 
        invisibleModeEnabled = l_props_1.invisibleModeEnabled, 
        mutualFriendsListEnabled = l_props_1.mutualFriendsListEnabled
    });
end;
return {
    Container = l_RoactAppExperiment_0.connectUserLayer({
        l_AppUserLayers_0.SocialProfilePeekViewLayer, 
        l_AppUserLayers_0.SocialFriendsLayer, 
        l_InvisibleModeIXP_0.ExperimentLayer
    }, function(v40, _)
        return {
            uplevelAliasEnabled = if not l_UplevelAliasIXP_0.isSetupEnabled() then nil else l_UplevelAliasIXP_0.isExperimentEnabled(v40), 
            invisibleModeEnabled = if not l_FFlagInvisibleModeExperimentEnabled_0 then nil else l_InvisibleModeIXP_0.isExperimentEnabled(v40), 
            mutualFriendsListEnabled = (v40[l_AppUserLayers_0.SocialProfilePeekViewLayer] or {}).mutualFriendsListEnabled
        };
    end)((v12.connect(function(v42)
        return {
            contextualInfoType = v42.navigationParams and v42.navigationParams.contextualInfoType, 
            isLocalUser = if (l_FFlagInvisibleModeSetupEnabled_0 or v19) or v20 then v13(v42) else nil
        };
    end)((l_RoactRodux_0.connect(v32, nil)(v21))))), 
    mapStateToProps = v32
};
