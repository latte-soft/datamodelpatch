local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateToUserInfo);
local v8 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToAddFriendsPage);
local v9 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.utils.useNavigateFromAddFriends);
local l_useContactImporterConfiguration_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Utils.useContactImporterConfiguration;
local l_UniversalAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v13 = require(l_Modules_0.LuaApp.Constants);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v16 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v17 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v18 = require(l_CorePackages_0.LuaSocialLibrariesDeps);
local l_getDeepValue_0 = v18.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_llama_0 = v18.llama;
local v21 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local l_getFFlagPYMKAddFriendsEntry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagPYMKAddFriendsEntry;
local v23 = require(l_Modules_0.Personalization.Flags.getFFlagPYMKShowAddFriendsButton_DEV);
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v13.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v13.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local _ = require(l_Modules_0.LuaApp.Components.PYMKCarousel.api).PYMKCarouselComponent;
local l_PYMKCarouselEntryPoint_0 = require(l_Modules_0.LuaApp.Components.PYMKCarousel.api).PYMKCarouselEntryPoint;
local v29 = {
    renderFriendRecommendationCarousel = function(v28)
        return v2.createElement(l_PYMKCarouselEntryPoint_0, v28);
    end
};
local v50 = l_RoactServices_0.connect({
    roactAnalytics = v15, 
    eventIngestService = v16
})(function(v30)
    local v31 = v4.Dictionary.join(v29, v30);
    local v33 = l_useSelector_0(function(v32)
        return v32.FormFactor;
    end);
    local v35 = l_useSelector_0(function(v34)
        return l_getDeepValue_0(v34, string.format("OmniRecommendations.%s.recommendationsId", v13.OmniRecommendationsPageType.PAGE_TYPE_HOME)) or {};
    end);
    local v36 = l_useDispatch_0();
    local function v39(v37, v38)
        v36(v7(v37, {
            profilePeekViewProps = v4.Dictionary.join({
                resetPeekView = true
            }, v38 or {})
        }));
    end;
    local v40 = v9({
        policyIsEnabled = v31.isContactImporterPolicyEnabled
    });
    local function v42(v41)
        if not v41 then
            v36(v8());
            return ;
        else
            v40();
            return ;
        end;
    end;
    local l_shouldShowContactImporterModal_0 = l_useContactImporterConfiguration_0({
        policyIsEnabled = v31.isContactImporterPolicyEnabled
    }).shouldShowContactImporterModal;
    local function v45(v44)
        v36(v17({
            toastMessage = v44
        }));
    end;
    local v46 = if v33 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
    local v47 = v31.topicLayoutData or {};
    local v48 = true;
    if v47[v21.TopicLayoutDataKeys.PYMKFindFriendsEnabled] ~= "true" then
        v48 = true;
        if v47[v21.TopicLayoutDataKeys.PYMKFindFriendsEnabled] ~= true then
            v48 = v23();
        end;
    end;
    local v49 = true;
    if v47[v21.TopicLayoutDataKeys.PYMKSeeAllEnabled] ~= "true" then
        v49 = true;
        if v47[v21.TopicLayoutDataKeys.PYMKSeeAllEnabled] ~= true then
            v49 = v23();
        end;
    end;
    return v2.createElement("Frame", {
        key = v35, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        FriendRecommendationCarouselFeedItem = v31.renderFriendRecommendationCarousel({
            findFriendsTileEnabled = v48, 
            seeAllTileEnabled = v49, 
            carouselTitle = v31.carouselTitle, 
            openProfilePeekView = v39, 
            sideMargin = v46, 
            showToast = v45, 
            roactAnalytics = l_llama_0.None, 
            diagService = v31.roactAnalytics.Diag, 
            shouldShowContactImporterBadge = if not l_getFFlagPYMKAddFriendsEntry_0() then nil else l_shouldShowContactImporterModal_0, 
            goToAddFriendsPage = not l_getFFlagPYMKAddFriendsEntry_0() and function()
            end or v42, 
            eventIngestService = v31.eventIngestService
        })
    });
end);
if l_getFFlagPYMKAddFriendsEntry_0() then
    v50 = l_UniversalAppPolicy_0.connect(function(v51)
        return {
            isContactImporterPolicyEnabled = v51.getContactImporterEnabled()
        };
    end)(v50);
end;
return v50;
