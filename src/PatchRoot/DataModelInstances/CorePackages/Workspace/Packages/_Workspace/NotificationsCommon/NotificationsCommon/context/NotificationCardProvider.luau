local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.NotificationCardContext);
local v3 = require(l_Parent_1.Parent.React);
local _ = require(l_Parent_1.type);
local v5 = require(l_Parent_1.constants);
return function(v6)
    local v7 = {
        thumbnail = v5.CardSizeDefault.thumbnail, 
        cardPadding = v5.Padding.DefaultCardPadding
    };
    if v6.isCompact then
        v7.thumbnail = v5.CardSizeCompact.thumbnail;
        v7.cardPadding = v5.Padding.CompactCardPadding;
    end;
    return v3.createElement(v2.Provider, {
        value = {
            notificationPayload = v6.notificationPayload, 
            state = v6.state, 
            cardSize = v7, 
            handleActions = v6.handleActions, 
            openMetaActions = v6.openMetaActions, 
            readOnly = v6.readOnly, 
            cardTransparency = if not v6.isCompact then v5.CardTransparency.Default else v5.CardTransparency.Compact
        }
    }, v6.children);
end;
