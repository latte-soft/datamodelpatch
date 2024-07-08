local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_join_0 = require(game:GetService("CorePackages").Cryo).Dictionary.join;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v6 = require(l_script_FirstAncestor_0.LuaApp.Constants);
local v7 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local v8 = require(l_script_FirstAncestor_0.LuaApp.Components.SocialTab.SocialTab);
local v9 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local v10 = require(l_script_FirstAncestor_0.Common.Analytics);
local v11 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateBack);
local l_NavigateDownToNotifications_0 = v9.Thunks.NavigateDownToNotifications;
local l_NavigateDownToPrivacySettings_0 = v9.Thunks.NavigateDownToPrivacySettings;
local l_NavigateDownToReportAbuse_0 = v9.Thunks.NavigateDownToReportAbuse;
local l_NavigateDownToViewUserProfile_0 = v9.Thunks.NavigateDownToViewUserProfile;
local l_NavigateDownToGroups_0 = v9.Thunks.NavigateDownToGroups;
local v17 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownToAddFriends);
local v18 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownToFriendRequests);
local v19 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownToAddFriendsAccountProvider);
local l_NavigateDownToSquadLobby_0 = v9.Thunks.NavigateDownToSquadLobby;
local v21 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenProfilePeekView);
local v22 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenCentralOverlayForPeopleList);
local l_SetTabBarVisibleFromChat_0 = require(l_CorePackages_0.Workspace.Packages.AppTabBarRodux).Thunks.SetTabBarVisibleFromChat;
local _ = require(l_CorePackages_0.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible;
local l_ToggleChatPaused_0 = v7.Actions.ToggleChatPaused;
local l_SetAppLoaded_0 = v7.Actions.SetAppLoaded;
local l_RoactChatAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).LegacyAnalytics.RoactChatAnalytics;
local l_GetUnreadConversationCount_0 = v8.Requests.GetUnreadConversationCount;
local v29 = require(l_script_FirstAncestor_0.LuaApp.Actions.SetCurrentToastMessage);
local v30 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenGameDetails);
local v31 = require(l_script_FirstAncestor_0.LuaApp.Thunks.openGameDetailsPageFromChat);
local v32 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateToUserInfo);
local v33 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenVerifiedBadgeModal);
local v34 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenReportDialog);
local v35 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenCentralOverlayForDiscoverabilityUpsell);
local v36 = require(l_script_FirstAncestor_0.LuaApp.Thunks.CloseCentralOverlay);
local v37 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
local l_SelfViewProfileDiscoverabilityUpsellIXP_0 = require(l_CorePackages_0.Workspace.Packages.DiscoverabilityModal).Flags.SelfViewProfileDiscoverabilityUpsellIXP;
local v39 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownTo3DQRCodePage);
local v40 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenCentralOverlayForPlayerContextualMenu);
local l_GetFFlagLuaAppEnableSquadPage_0 = v5.GetFFlagLuaAppEnableSquadPage;
local l_GetFFlagLuafiedReportEntryPoints_0 = v5.GetFFlagLuafiedReportEntryPoints;
local v43 = require(l_script_FirstAncestor_0.LuaApp.Components.AmpUpsell.OpenAmpWizardContainer);
local l_isAppChatChannelsAPIEnabled_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Flags.isAppChatChannelsAPIEnabled;
return function(v45)
    return {
        fetchChatSettings = not l_isAppChatChannelsAPIEnabled_0() and function()
            v45(function(v46)
                return v45(v8.Requests.GetUserV2FromUserId.API(v46:getState().LocalUserId));
            end);
            return v45(v8.Requests.FetchChatSettings.API()):andThen(function(_)
                l_RoactChatAnalytics_0.new(v10.new(l_RbxAnalyticsService_0), (tostring(l_Players_0.LocalPlayer.UserId))):userLoadedChat();
            end):andThen(function()
                v45(l_SetAppLoaded_0(true));
            end):catch(function(v48)
                warn("SocialTab.Requests.FetchChatSettings with error: ", (tostring(v48)));
            end);
        end or nil, 
        navigateBack = function()
            v45(v11());
        end, 
        navigateDownToNotifications = function(v49)
            v45(l_NavigateDownToNotifications_0(v49));
        end, 
        navigateDownToPrivacySettings = function(v50)
            v45(l_NavigateDownToPrivacySettings_0(v50));
        end, 
        navigateDownToReportAbuse = function(v51, v52, v53)
            v45(l_NavigateDownToReportAbuse_0(v51, v52, v53));
        end, 
        openReportDialog = if not l_GetFFlagLuafiedReportEntryPoints_0() then nil else function(v54, v55)
            v45(v34({
                reportEntryPoint = v6.ReportDialogEntryPoints.Chat, 
                userId = v54, 
                conversationId = v55
            }));
        end, 
        navigateDownToViewUserProfile = function(v56, v57)
            v45(l_NavigateDownToViewUserProfile_0(v56, v57));
        end, 
        navigateDownToAddFriends = function(v58)
            v45(v17(v58));
        end, 
        navigateDownToFriendFinder = function(v59)
            v45(v18(v59));
        end, 
        navigateDownToAddFriendsAccountProvider = function(v60, v61)
            v45(v19(v60, v61));
        end, 
        openProfilePeekView = function(v62, v63)
            v45(v21(v62, v63));
        end, 
        navigateDownToGroups = function(v64)
            v45(l_NavigateDownToGroups_0(v64));
        end, 
        setTabBarVisibleFromChat = function(v65)
            v45(l_SetTabBarVisibleFromChat_0(v65));
        end, 
        toggleChatPaused = function(v66)
            v45(l_ToggleChatPaused_0(v66));
        end, 
        openContextualMenu = function(v67)
            v45(v22(l_join_0(v67, {
                analyticContext = "SocialTab"
            })));
        end, 
        fetchUnreadConversationCount = function()
            v45(l_GetUnreadConversationCount_0.API());
        end, 
        openGameDetailsPeekView = function(v68)
            assert(type(v68) == "string", "Expected universeId to be a string");
            v45(v30(v68));
        end, 
        navigateToGameDetails = function(v69, v70)
            v45(v31(v69, v70));
        end, 
        navigateToUserInfo = function(v71, v72)
            assert(type(v71) == "string", "Expected userId to be a string");
            v45(v32(v71, v72));
        end or nil, 
        openVerifiedBadgeModal = function()
            v45(v33());
        end, 
        openLearnMoreLink = function()
            v45(v37());
        end, 
        openDiscoverabilityModal = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else function(v73)
            v45(v35(v73));
        end, 
        closeCentralOverlay = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else function()
            v45(v36());
        end, 
        showToast = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else function(v74)
            v45(v29({
                toastMessage = v74
            }));
        end, 
        navigateTo3DQRCodePage = function(v75)
            v45(v39(v75));
        end, 
        openAmpWizardContainer = function(v76, v77)
            v45(v43(v76, v77));
        end, 
        navigateDownToSquadLobby = if not l_GetFFlagLuaAppEnableSquadPage_0() then nil else function(v78)
            v45(l_NavigateDownToSquadLobby_0(v78));
        end, 
        openPlayerContextualMenu = function(v79)
            v45(v40(v79));
        end
    };
end;
