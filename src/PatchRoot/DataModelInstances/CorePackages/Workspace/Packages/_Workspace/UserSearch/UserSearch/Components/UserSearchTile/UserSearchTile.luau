local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local l_PlayerTile_0 = v4.App.Tile.PlayerTile;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_Enums_0 = require(l_Parent_0.LuaSocialLibrariesDeps).NetworkingFriends.Enums;
local v8 = nil;
v8 = if not require(l_Parent_0.SharedFlags).GetFFlagEnableAppCommonInputHooks() then require(l_Parent_0.ReactFocusNavigation).useLastInputMode else require(l_Parent_0.FocusNavigationUtils).useLastInputMode;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v11 = require(script.Parent.useContextualInfo);
local v12 = require(script.Parent.useSearchTileButtons);
local v13 = require(script.Parent.useProfileNames);
local v14 = require(script.Parent.useRelationshipSelector);
local v15 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local _ = require(l_Parent_0.GraphQLServer);
local l_FFlagEnableFriendsLandingControllerBar_0 = require(l_Parent_0.SharedFlags).FFlagEnableFriendsLandingControllerBar;
local function _(v19)
    return string.format("rbxthumb://type=Avatar&id=%s&w=720&h=720", (tostring(v19)));
end;
return function(v21)
    local l_user_0 = v21.user;
    local v23 = l_useStyle_0();
    local v24 = l_useDispatch_0();
    local v25 = v14(l_user_0.id);
    local v26 = if not l_FFlagEnableFriendsLandingControllerBar_0 then nil else v8();
    local v27, v28 = v11({
        userId = l_user_0.id, 
        previousUsernames = l_user_0.previousUsernames, 
        searchKeyword = v21.searchParameters.searchKeyword, 
        profileInsight = v21.profileInsight
    });
    local function v31(v29, v30)
        if v21.fireAnalyticsEvent then
            v21.fireAnalyticsEvent(v29, v3.Dictionary.join({
                playerId = l_user_0.id, 
                tilePos = v21.index, 
                contextualInfoType = v28
            }, v30 or {}));
        end;
    end;
    local function v32()
        if l_FFlagEnableFriendsLandingControllerBar_0 and v26 == "Focus" then
            v24(l_SetCentralOverlay_0("PlayerContextualMenu", {
                subjectUserId = l_user_0.id, 
                robloxFriendshipStatus = v25.status, 
                friendshipOriginSourceType = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue()
            }));
        else
            v21.luaAppNavigation.navigateToUserInfo({
                userId = l_user_0.id, 
                index = v21.index, 
                hasEmphasis = v21.hasEmphasis, 
                contextualInfoType = v28, 
                contextualInfoDisplay = v27
            });
        end;
        if v31 then
            v31(v15.PlayerTileClick, {
                hasEmphasis = v21.hasEmphasis
            });
        end;
    end;
    local v33 = v12({
        userId = l_user_0.id, 
        index = v21.index, 
        contextualInfoType = v28
    }, v21.luaAppNetworkingRequests, v31);
    local v34 = not not v27 and {
        text = v27.text, 
        fontStyle = v23.Font.CaptionBody, 
        icon = v27.icon
    } or nil;
    local v35 = v13({
        userId = l_user_0.id
    });
    return v2.createElement(l_PlayerTile_0, {
        tileSize = v21.size, 
        title = v35 and v35.combinedName, 
        subtitle = v35 and v35.username, 
        thumbnail = string.format("rbxthumb://type=Avatar&id=%s&w=720&h=720", (tostring(l_user_0.id))), 
        onActivated = v32, 
        buttons = if not not l_FFlagEnableFriendsLandingControllerBar_0 and v26 == "Focus" then nil else v33, 
        relevancyInfo = v34, 
        Selectable = not not l_FFlagEnableFriendsLandingControllerBar_0 or nil
    });
end;
