local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.NotificationCardContext);
local v3 = require(l_Parent_1.Parent.React);
local _ = require(l_Parent_1.type);
local v5 = require(l_Parent_1.constants);
local v6 = require(l_Parent_1.analytics.analyticsService);
local v7 = require(l_Parent_1.utils.toastNotificationHelper);
return function(v8)
    local l_EventStream_0 = v6.EventStream;
    local v10 = {
        thumbnail = v5.CardSizeDefault.thumbnail, 
        cardPadding = v5.Padding.DefaultCardPadding
    };
    if v8.isCompact then
        v10.thumbnail = v5.CardSizeCompact.thumbnail;
        v10.cardPadding = v5.Padding.CompactCardPadding;
    end;
    return v3.createElement(v2.Provider, {
        value = {
            state = v8.state, 
            cardSize = v10, 
            handleActions = v8.handleActions, 
            sendEvent = function(v11)
                v7.fireEvent(l_EventStream_0, v11);
            end, 
            cardTransparency = if not v8.isCompact then v5.CardTransparency.Default else v5.CardTransparency.Compact, 
            notificationReceivedTimestampMs = v8.notificationReceivedTimestampMs, 
            timers = v8.timers, 
            displayTimestampMs = v8.displayTimestampMs
        }
    }, v8.children);
end;
