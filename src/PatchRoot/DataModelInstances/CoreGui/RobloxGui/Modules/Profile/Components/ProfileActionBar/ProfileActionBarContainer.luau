local l_Parent_0 = script.Parent.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Parent_0.dependencies);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_compose_0 = v2.SocialLibraries.RoduxTools.compose;
local v7 = require(l_Parent_0.ProfileContext);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v9 = require(l_Parent_0.Common.ProfileScreens);
local v10 = require(l_Parent_0.Utils.isLocalUser);
local v11 = require(script.Parent.ProfileActionBar);
local v12 = require(script.Parent.profileActionBarMapStateToProps);
local v13 = require(l_Parent_0.Analytics);
local v14 = require(l_Parent_0.Common.ProfileTypes);
local l_Contexts_0 = v2.SocialLuaAnalytics.Analytics.Enums.Contexts;
local l_FFlagEditProfileSetupNewExperimentFlow_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).Flags.FFlagEditProfileSetupNewExperimentFlow;
local l_UniversalAppPolicy_0 = v2.UniversalAppPolicy;
local l_GetFFlagDisableEditProfileForVR_0 = v2.GetFFlagDisableEditProfileForVR;
local v19 = require(script.Parent.ProfileActionBarMapDispatchToProps);
local v20 = l_Roact_0.PureComponent:extend("ProfileActionBarContainer");
v20.init = function(v21)
    v21:setState({
        isMoreMenuOpen = false
    });
    v21.openPurchaseExperienceModal = function(v22)
        v21.props.navigation.navigate(v9.PurchaseExperienceModal, v22);
    end;
    v21.openUnableToJoinExperienceModal = function(v23)
        v21.props.navigation.navigate(v9.UnableToJoinExperienceModal, v23);
    end;
    v21.openContextualMenu = function()
        local l_props_0 = v21.props;
        l_props_0.analytics:buttonClick(v13.Enums.ButtonClickEvents.ContextualMenu);
        v21:setState({
            isMoreMenuOpen = true
        });
        l_props_0.navigation.navigate(v9.ContextualMenu, {
            onCloseContextualMenu = function()
                v21:setState({
                    isMoreMenuOpen = false
                });
            end
        });
    end;
    v21.shareProfileQRCode = function()
        return v21.props.navigateToLuaAppPages[v9.ProfileQRCodePage]({
            source = l_Contexts_0.ProfileCard, 
            distanceFromTop = l_UserInputService_0.StatusBarSize.Y
        });
    end;
    v21.openEditProfilePage = function()
        return v21.props.navigation.navigate(v9.EditProfilePage, {
            profileScreens = v9, 
            navigateToEditUsername = v21.props.navigateDownToEditUsername, 
            navigateDownToPurchaseRobux = v21.props.navigateDownToPurchaseRobux
        });
    end;
end;
v20.render = function(v25)
    local l_props_1 = v25.props;
    return l_Roact_0.createElement(v11, {
        isLocalUser = if not l_FFlagEditProfileSetupNewExperimentFlow_0 then nil else l_props_1.isLocalUser, 
        actionBarLoadingStatus = l_props_1.actionBarLoadingStatus, 
        showMorePageEnabled = (not l_props_1.isLocalUser and not l_props_1.isDeleted) and l_props_1.profileType ~= v14.FromContacts, 
        showProfileQRCode = l_props_1.isLocalUser, 
        onClickWithToast = l_props_1.onClickWithToast, 
        openMoreMenu = v25.openContextualMenu, 
        shareProfileQRCode = v25.shareProfileQRCode, 
        openEditProfilePage = v25.openEditProfilePage, 
        isMoreMenuOpen = v25.state.isMoreMenuOpen, 
        openPurchaseExperienceModal = v25.openPurchaseExperienceModal, 
        innerPaddingSize = l_props_1.innerPaddingSize, 
        openUnableToJoinExperienceModal = v25.openUnableToJoinExperienceModal, 
        disableWebViewSupport = l_props_1.disableWebViewSupport
    });
end;
if l_GetFFlagDisableEditProfileForVR_0() then
    v20 = l_UniversalAppPolicy_0.connect(function(v27)
        return {
            disableWebViewSupport = if not l_GetFFlagDisableEditProfileForVR_0() then nil else not v27.getWebViewSupport()
        };
    end)(v20);
end;
return l_compose_0(v7.connect(function(v28)
    return {
        profileUserId = v28.profileUserId, 
        isLocalUser = v10(v28), 
        profileType = v28.profileType, 
        navigateToLuaAppPages = v28.navigateToLuaAppPages
    };
end), l_RoactRodux_0.connect(v12, v19), v13.connect(function(v29)
    return {
        analytics = v29
    };
end))(v20);
