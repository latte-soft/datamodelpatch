local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_UniversalAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v6 = require(script.Parent.FriendsCarouselWrapper);
local v7 = require(script.Parent.mapDispatchToProps);
local l_utils_0 = script.Parent.Parent.utils;
local v9 = require(l_utils_0.useNavigateFromAddFriends);
local v10 = require(l_utils_0.useShowNewAddFriendsUIVariant);
local l_useContactImporterConfiguration_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Utils.useContactImporterConfiguration;
local v12 = require(l_Modules_0.LuaApp.Hooks.useSocialOnboardingButtonsUniversalWrapper);
local l_Sources_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_FFlagFriendsCarouselInjectSocialBtn_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFriendsCarouselInjectSocialBtn;
return v3.connect(function(_)
    return {};
end, v7)((l_UniversalAppPolicy_0.connect(function(v17)
    return {
        isContactImporterPolicyEnabled = v17.getContactImporterEnabled()
    };
end)(function(v18)
    local v19 = l_useNavigation_0();
    local v20 = v9({
        policyIsEnabled = v18.isContactImporterPolicyEnabled
    });
    local l_shouldShowContactImporterModal_0 = l_useContactImporterConfiguration_0({
        policyIsEnabled = v18.isContactImporterPolicyEnabled
    }).shouldShowContactImporterModal;
    local v22 = v10();
    local v23 = nil;
    local v24 = nil;
    if l_FFlagFriendsCarouselInjectSocialBtn_0 then
        local v25, v26 = v12({
            entryPoint = l_Sources_0.HomePageFriendsCarousel
        });
        v23 = v25;
        v24 = v26;
    end;
    return v2.createElement(v6, {
        navigation = v19, 
        showContactImporter = l_shouldShowContactImporterModal_0, 
        navigateFromAddFriends = v20, 
        showNewAddFriendsUIVariant = v22, 
        showRecommendations = not l_isSubjectToDesktopPolicies_0(), 
        carousel = v18.carousel, 
        carouselProps = v18.carouselProps, 
        onSuccessfulRender = v18.onSuccessfulRender, 
        openProfilePeekView = v18.openProfilePeekView, 
        openPlayerContextualMenu = v18.openPlayerContextualMenu, 
        showToast = v18.showToast, 
        socialOnboardingBtns = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then nil else v23, 
        addFriendsBtn = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then nil else v24
    });
end)));
