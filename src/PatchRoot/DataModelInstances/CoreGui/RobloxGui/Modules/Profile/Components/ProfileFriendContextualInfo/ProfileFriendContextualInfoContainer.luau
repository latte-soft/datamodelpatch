local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local v5 = require(l_Parent_0.ProfileContext);
local v6 = require(l_Parent_0.Common.ContextPropsTypes);
local v7 = require(l_Parent_0.Common.ProfileScreens);
local v8 = require(script.Parent.ProfileFriendContextualInfo);
local l_RoactRodux_0 = v1.RoactRodux;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local v13 = require(l_Parent_0.Analytics);
local v14 = l_Roact_0.PureComponent:extend("ProfileFriendContextualInfoContainer");
v14.validateProps = l_t_0.strictInterface({
    layoutOrder = l_t_0.optional(l_t_0.number), 
    profileUserId = l_t_0.string, 
    userPresenceType = l_PresenceType_0.isEnumValue, 
    lastLocation = l_t_0.optional(l_t_0.string), 
    isUserDeleted = l_t_0.optional(l_t_0.boolean), 
    universeId = l_t_0.optional(l_t_0.number), 
    analytics = l_t_0.table, 
    navigateToLuaAppPages = v6.validateNavigateToLuaAppPages, 
    peekViewProps = v6.validatePeekViewProps
});
v14.init = function(v15)
    v15.openGameDetails = function()
        local l_props_0 = v15.props;
        local l_universeId_0 = l_props_0.universeId;
        if l_universeId_0 then
            l_props_0.analytics:buttonClick(v13.Enums.ButtonClickEvents.GameDetails);
            l_props_0.navigateToLuaAppPages[v7.GameDetailsPeekView](tostring(l_universeId_0), {
                mountAsFullView = true, 
                showBackButton = true, 
                onPeekViewClosed = l_props_0.peekViewProps.onPeekViewClosed
            });
        end;
    end;
end;
v14.render = function(v18)
    local l_props_1 = v18.props;
    return l_Roact_0.createElement(v8, {
        userPresenceType = l_props_1.userPresenceType, 
        lastLocation = l_props_1.lastLocation, 
        layoutOrder = l_props_1.layoutOrder, 
        onActivated = v18.openGameDetails, 
        isUserDeleted = l_props_1.isUserDeleted
    });
end;
local function v23(v20, v21)
    local v22 = v21.profileUserId or "";
    return {
        userPresenceType = l_getDeepValue_0(v20, string.format("Profile.Presence.byUserId.%s.userPresenceType", v22)) or l_PresenceType_0.Offline, 
        lastLocation = l_getDeepValue_0(v20, string.format("Profile.Presence.byUserId.%s.lastLocation", v22)), 
        isUserDeleted = l_getDeepValue_0(v20, string.format("Profile.AdditionalUserFields.%s.isDeleted", v22)) or false, 
        universeId = l_getDeepValue_0(v20, string.format("Profile.Presence.byUserId.%s.universeId", v22))
    };
end;
return {
    Container = l_compose_0(l_RoactRodux_0.connect(v23, nil), v5.connect(function(v24)
        return {
            navigateToLuaAppPages = v24.navigateToLuaAppPages, 
            peekViewProps = v24.peekViewProps
        };
    end), v13.connect(function(v25)
        return {
            analytics = v25
        };
    end))(v14), 
    mapStateToProps = v23
};
