local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Analytics_0 = require(l_script_FirstAncestor_0.Parent.Analytics).Analytics;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v4 = require(l_script_FirstAncestor_0.LegacyAnalytics.RoactChatAnalytics);
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.filterForLinksWithPolicy);
local v6 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
return function(v7, v8, v9)
    local v10 = nil;
    v10 = v9 or v4.new(l_Analytics_0.new(l_RbxAnalyticsService_0), (tostring(l_Players_0.LocalPlayer.UserId)));
    if v7.messageType == v6.PlainText then
        for _, v12 in pairs(v5(v7)) do
            if v12.messageType == v6.Link then
                v10:loadGameLinkCardInChat(v8, v12.placeId);
            end;
        end;
        return ;
    else
        if v7.messageType == v6.Link then
            v10:loadGameLinkCardInChat(v8, v7.gameLink.universeId);
        end;
        return ;
    end;
end;
