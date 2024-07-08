local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_t_0 = v2.t;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_PlayerTile_0 = l_UIBlox_0.App.Tile.PlayerTile;
local l_withLocalization_0 = v2.withLocalization;
local v9 = require(l_Parent_0.UserProfiles);
local l_getFFlagVerifiedBadgeInFriendsLanding_0 = v2.getFFlagVerifiedBadgeInFriendsLanding;
local v11 = require(l_script_FirstAncestor_0.Friends.userPresenceText);
local v12 = require(l_script_FirstAncestor_0.Friends.userPresenceIcon);
local v13 = require(l_script_FirstAncestor_0.Friends.getCorrectUserPresence);
local l_memoize_0 = v2.memoize;
local v15 = require(script.Parent.createRelevancyInfo);
local v16 = l_Roact_0.PureComponent:extend("FriendTile");
local v17 = require(l_script_FirstAncestor_0.Flags.getFriendsLandingUserProfileApiEnabled);
local function v18()
    return function()
    end;
end;
v16.validateProps = l_t_0.strictInterface({
    user = l_t_0.table, 
    index = l_t_0.number, 
    openPlayerProfile = l_t_0.optional(l_t_0.callback), 
    isLuobu = l_t_0.optional(l_t_0.boolean), 
    pageLoadingTimeReport = l_t_0.optional(l_t_0.callback), 
    buttons = l_t_0.optional(l_t_0.array(l_t_0.strictInterface({
        icon = l_t_0.optional(l_t_0.string), 
        onActivated = l_t_0.optional(l_t_0.callback), 
        isSecondary = l_t_0.optional(l_t_0.boolean), 
        isDisabled = l_t_0.optional(l_t_0.boolean)
    }))), 
    userProfile = l_t_0.optional(l_t_0.table), 
    isPlayerContextualMenuEnabled = l_t_0.optional(l_t_0.boolean), 
    selected = l_t_0.optional(l_t_0.boolean), 
    focusGuiObject = l_t_0.optional(l_t_0.callback)
});
v16.defaultProps = {
    user = {
        username = ""
    }, 
    openPlayerProfile = v18, 
    isLuobu = false, 
    index = 1, 
    buttons = nil, 
    isPlayerContextualMenuEnabled = false
};
v16.init = function(v19)
    v19.state = {
        isFirstRender = true
    };
    v19.makeRelevancyInfo = l_memoize_0(v15);
    v19.playerTileRef = l_Roact_0.createRef();
    v19.openPlayerProfile = not v19.props.isPlayerContextualMenuEnabled and function(v20, v21)
        local l_user_0 = v19.props.user;
        if not v20 or not v21 then
            return v19.props.openPlayerProfile(l_user_0.id, v19.props.index, l_user_0);
        else
            return v19.props.openPlayerProfile(l_user_0.id, v19.props.index, l_user_0, v20, v21);
        end;
    end or function(_, _)
        return v19.props.openPlayerProfile(v19.props.user);
    end;
    v19.openPlayerProfileForRelevancyInfo = function(v25, v26)
        return function()
            return v19.openPlayerProfile(v25, v26);
        end;
    end;
    v19.checkAndSetSelected = function()
        if not (not v19.props.selected or not v19.props.focusGuiObject) then
            local v27 = v19.playerTileRef:getValue();
            if v27 then
                v19.props.focusGuiObject(v27);
            end;
        end;
    end;
end;
v16.didMount = function(v28)
    if v28.props.pageLoadingTimeReport then
        v28.props.pageLoadingTimeReport();
    end;
    v28.checkAndSetSelected();
end;
v16.render = function(v29)
    local l_user_1 = v29.props.user;
    local v31 = v13(l_user_1);
    local v32 = v11[v31];
    local v33 = v12[v31];
    local v34 = nil;
    local v35 = nil;
    local v36 = v29.playerTileRef:getValue();
    if not v36 then
        v29:setState({
            isFirstRender = false
        });
    else
        v34 = v36.AbsoluteSize;
        v35 = v36.AbsolutePosition;
    end;
    return l_withStyle_0(function(v37)
        return l_withLocalization_0({
            presenceText = v32, 
            accountDeletedText = "Feature.Friends.Action.AccountDeleted"
        })(function(v38)
            local v39 = v38.presenceText or nil;
            local l_accountDeletedText_0 = v38.accountDeletedText;
            local v41 = nil;
            local v42 = nil;
            if not (not v17() or not v29.props.userProfile) then
                v41 = v29.props.userProfile.names.combinedName;
                v42 = v9.Formatters.formatUsername(v29.props.userProfile.names.username);
            end;
            local v43 = if not not v17() and v41 then v41 else l_user_1.displayName;
            local v44 = if not not v17() and v42 then v42 else "@" .. l_user_1.username;
            local v45 = if not v17() or v41 then v29.makeRelevancyInfo(l_user_1, v39, v33, v29.openPlayerProfileForRelevancyInfo(v34, v35), v37.Theme, v29.props.index, v29.props.isLuobu, v37.Font, l_accountDeletedText_0, true) else nil;
            return l_Roact_0.createElement(l_PlayerTile_0, {
                tileSize = if not v36 then UDim2.fromScale(1, 1) else UDim2.new(0, v34.X, 0, v34.Y), 
                thumbnail = l_user_1.thumbnail, 
                title = v43, 
                subtitle = v44, 
                hasVerifiedBadge = if not l_getFFlagVerifiedBadgeInFriendsLanding_0() then nil else l_user_1.hasVerifiedBadge, 
                onActivated = v29.openPlayerProfile(v34, v35, v43, v44, v45), 
                forwardedRef = v29.playerTileRef, 
                buttons = v29.props.buttons, 
                Selectable = true, 
                relevancyInfo = v45
            });
        end);
    end);
end;
return v16;
