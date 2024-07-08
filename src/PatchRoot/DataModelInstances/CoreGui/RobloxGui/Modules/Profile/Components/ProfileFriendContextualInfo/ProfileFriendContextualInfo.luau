local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_t_0 = v1.t;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_PlayerContext_0 = l_UIBlox_0.App.Indicator.PlayerContext;
local v8 = require(l_Parent_0.Utils.ProfileContextualInfoUtils);
local v9 = require(l_Parent_0.Utils.isUserInGame);
local l_withLocalization_0 = v1.withLocalization;
local v11 = UDim2.fromOffset(12, 12);
local v12 = l_Roact_0.PureComponent:extend("ProfileFriendContextualInfo");
v12.validateProps = l_t_0.strictInterface({
    userPresenceType = l_PresenceType_0.isEnumValue, 
    lastLocation = l_t_0.optional(l_t_0.string), 
    layoutOrder = l_t_0.optional(l_t_0.number), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    isUserDeleted = l_t_0.optional(l_t_0.boolean)
});
local v13 = {
    [l_PresenceType_0.Offline] = "Common.Presence.Label.Offline", 
    [l_PresenceType_0.Online] = "Common.Presence.Label.Online", 
    [l_PresenceType_0.InGame] = "Common.Presence.Label.Online", 
    [l_PresenceType_0.InStudio] = "Common.Presence.Label.Online"
};
v12.render = function(v14)
    local l_props_0 = v14.props;
    local l_userPresenceType_0 = l_props_0.userPresenceType;
    local l_lastLocation_0 = l_props_0.lastLocation;
    return l_withStyle_0(function(v18)
        return l_withLocalization_0({
            presenceText = v13[l_userPresenceType_0], 
            accountDeletedText = "Feature.Friends.Action.AccountDeleted"
        })(function(v19)
            local v20 = not not l_props_0.isUserDeleted and v19.accountDeletedText or v19.presenceText;
            local v21 = false;
            if l_userPresenceType_0 == l_PresenceType_0.Online then
                v21 = not l_props_0.isUserDeleted;
            end;
            return l_Roact_0.createElement("Frame", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = l_props_0.layoutOrder
            }, {
                PlayerContext = l_Roact_0.createElement(l_PlayerContext_0, {
                    icon = v8.getPresenceIcon(l_userPresenceType_0), 
                    iconSize = not not v21 and v11 or nil, 
                    iconColor = not not v21 and v18.Theme.OnlineStatus.Color or nil, 
                    iconTransparency = not not v21 and v18.Theme.OnlineStatus.Transparency or nil, 
                    text = v8.getPresenceText(l_userPresenceType_0, l_lastLocation_0, v20), 
                    fontStyle = not not v9(l_userPresenceType_0, l_lastLocation_0) and v18.Font.CaptionHeader or v18.Font.CaptionBody, 
                    onActivated = not not v9(l_userPresenceType_0, l_lastLocation_0) and l_props_0.onActivated or nil
                })
            });
        end);
    end);
end;
return v12;
