local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Analytics);
local v3 = require(l_script_FirstAncestor_0.SocialTabContext);
local v4 = require(l_script_FirstAncestor_0.ContextUtils.compose);
local l_llama_0 = v1.llama;
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_withLocalization_0 = v1.withLocalization;
local l_UniversalAppPolicy_0 = v1.UniversalAppPolicy;
local l_SelfViewProfileDiscoverabilityUpsellIXP_0 = v1.SelfViewProfileDiscoverabilityUpsellIXP;
local v11 = require(script.mapStateToProps);
local v12 = require(script.mapDispatchToProps);
local v13 = require(script.Parent.SocialTabPage);
local v14 = require(l_script_FirstAncestor_0.UserCarousel);
local v15 = l_Roact_0.PureComponent:extend("SocialTabContainer");
local l_GetFFlagHideConnectPageWebViewItemsForVR_0 = v1.GetFFlagHideConnectPageWebViewItemsForVR;
v15.defaultProps = {};
v15.init = function(v17)
    v17.localization = {
        socialText = "Feature.SocialTab.Label.Connect", 
        chatsText = "Feature.SocialTab.Label.Chats", 
        groupsText = "Feature.SocialTab.Label.Groups"
    };
end;
v15.didMount = function(v18)
    v18.props.fetchFriendsRequestsCount();
end;
v15.render = function(v19)
    return l_withLocalization_0(v19.localization)(function(v20)
        return v2.with(function(v21)
            return v3.with(function(v22)
                return l_Roact_0.createElement(v13, l_llama_0.Dictionary.join(v19.props, {
                    analytics = v21, 
                    navigateToLuaAppPages = v22.navigateToLuaAppPages, 
                    renderUserCarousel = v14.render, 
                    wideMode = v22.wideMode, 
                    navigatingFromSocialTabEvent = v22.setNavigatingFromSocialTabEvent, 
                    isProfileShareEnabled = not not v22.isProfileShareEnabled or false, 
                    isLuaProfilePageEnabled = v22.isLuaProfilePageEnabled, 
                    luaAddFriendsPageEnabled = not not v22.luaAddFriendsPageEnabled or false, 
                    closeCentralOverlay = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else v22.closeCentralOverlay, 
                    openLearnMoreLink = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else v22.openLearnMoreLink, 
                    showToast = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else v22.showToast, 
                    discoverabilityUpsellOnProfileSelfViewEnabled = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else v22.discoverabilityUpsellOnProfileSelfViewEnabled
                }, v20));
            end);
        end);
    end);
end;
return v4(l_RoactRodux_0.connect(v11, v12), l_UniversalAppPolicy_0.connect(function(v23)
    return {
        enableDisplayNamePolicy = v23.getShowDisplayName(), 
        shouldShowGroupsTilePolicy = v23.getShouldShowGroupsTile(), 
        enableNotificationsPolicy = v23.getChatHeaderNotifications(), 
        disableWebViewSupport = if not l_GetFFlagHideConnectPageWebViewItemsForVR_0() then nil else not v23.getWebViewSupport()
    };
end))(v15);
