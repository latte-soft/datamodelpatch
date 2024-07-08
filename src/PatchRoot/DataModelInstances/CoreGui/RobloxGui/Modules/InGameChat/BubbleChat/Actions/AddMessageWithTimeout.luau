local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local _ = require(game:GetService("CorePackages").Packages.Cryo);
local v2 = require(script.Parent.Parent.Types);
local v3 = require(script.Parent.Parent.Helpers.maybeAssert);
local v4 = require(script.Parent.AddMessage);
local v5 = require(script.Parent.RemoveMessage);
local v6 = require(script.Parent.Parent.Helpers.getSettingsForMessage);
local v7 = game:DefineFastInt("BubbleChatAddMessageRolloutPercent", 100);
return function(v8)
    v3(v2.IMessage(v8));
    return function(v9)
        v9:dispatch(v4(v8));
        local v10 = v6(v9:getState().chatSettings, v8);
        local v11 = v9:getState().userMessages[v8.userId];
        local l_messages_0 = v9:getState().messages;
        for v13 = 1, #v11 - v10.MaxBubbles do
            v9:dispatch(v5(l_messages_0[v11[v13]]));
        end;
        l_RbxAnalyticsService_0:ReportCounter("RoactBubbleChat-MessagesSent");
        if math.random(1, 100) <= v7 then
            l_RbxAnalyticsService_0:SendEventDeferred("client", "bubbleChatMetric", "messageAdded", {
                placeId = game.PlaceId, 
                senderUserId = v8.userId
            });
        end;
        wait(v10.BubbleDuration);
        v9:dispatch(v5(v8));
    end;
end;
