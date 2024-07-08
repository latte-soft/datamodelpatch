local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local _ = require(l_CorePackages_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).User.getUserAvatarImage;
local v5 = require(l_CorePackages_0.Workspace.Packages.FriendsCarousel);
local v6 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_convertLuaAppUserToSocialUser_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Utils.convertLuaAppUserToSocialUser;
local v8 = require(l_Modules_0.LuaApp.Models.User);
local v9 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForPeopleList);
local v10 = require(l_Modules_0.Profile.Analytics.EntryPoints);
local v11 = require(l_Modules_0.LuaApp.Components.GridHome.Tiles.Friends.BaseUserTile);
local v12 = require(l_Modules_0.LuaApp.Thunks.NavigateToUserInfo);
local v13 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v14 = require(l_Modules_0.Profile.Flags.ProfileIXPTest);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_Packages_0 = l_CorePackages_0.Workspace.Packages;
local _ = require(l_Packages_0.React);
local v18 = require(l_Packages_0.UserProfiles);
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowVerifiedBadgeFriendsCarousel);
return v6.connectUserLayer({
    v13.SocialProfileLayer
}, function(v20, _)
    return {
        luaProfileEnabled = v14.experimentOrRolloutEnabled(v20)
    };
end)((v3.connect(function(v22, v23)
    local v24 = v22.Users[v23.userId];
    if not v24 then
        return {};
    else
        return {
            userInfo = v24, 
            isOnline = v24.presence ~= v8.PresenceType.OFFLINE, 
            isVerified = if not v19() then nil else v24.hasVerifiedBadge
        };
    end;
end, function(v25)
    return {
        openContextualMenu = function(v26, v27, v28, v29, v30)
            v25(v9({
                user = v26, 
                positionIndex = v27, 
                absolutePosition = v27, 
                onOpen = v28, 
                onClose = v29, 
                anchorSpaceSize = v30.AbsoluteSize, 
                anchorSpacePosition = v30.AbsolutePosition, 
                source = "HomepageFriendsCarousel"
            }));
        end, 
        openProfilePeekView = function(v31, v32)
            v32.contextualMenuProps.user = l_convertLuaAppUserToSocialUser_0(v32.contextualMenuProps.user);
            v32.entryPoint = v10.HomePageFriendsCarousel;
            v25(v12(v31, v32));
        end
    };
end)(function(v33)
    local l_index_0 = v33.index;
    local l_userInfo_0 = v33.userInfo;
    local v36 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v33.userId);
    local l_isOnline_0 = v33.isOnline;
    local l_isVerified_0 = v33.isVerified;
    local l_openContextualMenu_0 = v33.openContextualMenu;
    local l_onMenuOpen_0 = v33.onMenuOpen;
    local l_onMenuClose_0 = v33.onMenuClose;
    local v42 = l_userInfo_0.presence == v8.PresenceType.IN_GAME;
    local v43 = v18.Hooks.useUserProfilesFetch({
        userIds = {
            v33.userId
        }, 
        query = v18.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    return v2.createElement(v11, {
        thumbnail = v36, 
        isOnline = l_isOnline_0, 
        isVerified = l_isVerified_0, 
        text = if not v43.data then nil else v18.Selectors.getCombinedNameFromId(v43.data, v33.userId), 
        metaDataText = if not v42 then nil else l_userInfo_0.lastLocation, 
        shouldShimmerName = v43.loading or v43.error, 
        onActivated = function(v44)
            if not v33.luaProfileEnabled then
                if not (not l_userInfo_0 or not v44) then
                    l_openContextualMenu_0(l_userInfo_0, l_index_0, l_onMenuOpen_0, l_onMenuClose_0, v44);
                end;
                return ;
            else
                v33.openProfilePeekView(v33.userId, {
                    userInGame = function()
                        return v42;
                    end, 
                    openJoinable = true, 
                    profilePeekViewProps = {
                        resetPeekView = true, 
                        absolutePosition = l_index_0, 
                        isHomePageCarousel = true, 
                        source = v5.Constants.HomepageFriendsCarouselSourceName, 
                        recommendationRank = l_userInfo_0.rank, 
                        recommendationContextType = if not l_userInfo_0.contextType then nil else l_userInfo_0.contextType.rawValue(), 
                        isRecommendation = not not l_userInfo_0.contextType or false, 
                        mutualFriendsCount = not not l_userInfo_0.mutualFriendsList and #l_userInfo_0.mutualFriendsList or 0, 
                        recommendationSessionId = v33.recommendationSessionId
                    }, 
                    contextualMenuProps = {
                        user = l_userInfo_0, 
                        absolutePosition = l_index_0, 
                        positionIndex = l_index_0, 
                        anchorSpaceSize = v44.AbsoluteSize, 
                        anchorSpacePosition = v44.AbsolutePosition, 
                        onOpen = l_onMenuOpen_0, 
                        onClose = l_onMenuClose_0, 
                        source = v5.Constants.HomepageFriendsCarouselSourceName
                    }
                });
                return ;
            end;
        end
    });
end)));
