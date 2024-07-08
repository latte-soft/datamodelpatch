local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(script.Parent.FilteredConversationList);
local v4 = require(script.Parent.GameBanner);
local v5 = v1.PureComponent:extend("ShareTargetGame");
v5.defaultProps = {
    byBuilderText = "By (placeholder)", 
    gameName = "Placeholder Game", 
    gameThumbnail = "rbxasset://textures/grid2.png", 
    shouldShowCreatorName = true, 
    conversations = {
        {
            title = "PlaceholderName1"
        }, 
        {
            title = "PlaceholderName2"
        }, 
        {
            title = "PlaceholderName3"
        }
    }, 
    conversationSendingStatus = {}, 
    offlinePresence = nil, 
    onlinePresence = nil, 
    filterBoxPlaceHolderText = nil, 
    sendText = nil, 
    sentText = nil, 
    sendingText = nil, 
    failedText = nil, 
    onSendButtonActivated = nil, 
    conversationListScrollTouchedBottom = nil, 
    LayoutOrder = nil, 
    isLoading = false
};
v5.render = function(v6)
    return v2.Style.withStyle(function(_)
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -72), 
            BackgroundTransparency = 1, 
            LayoutOrder = v6.props.LayoutOrder
        }, {
            layout = v1.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            gameBanner = v1.createElement(v4, {
                creator = v6.props.byBuilderText, 
                shouldShowCreatorName = v6.props.shouldShowCreatorName, 
                name = v6.props.gameName, 
                thumbnail = v6.props.gameThumbnail, 
                isLoading = v6.props.isLoading, 
                LayoutOrder = 1
            }), 
            conversationListContainer = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -88), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                conversationList = v1.createElement(v3, {
                    conversations = v6.props.formattedConversations, 
                    conversationSendingStatuses = v6.props.conversationSendingStatuses, 
                    touchedBottomCallback = v6.props.conversationListScrollTouchedBottom, 
                    filterBoxPlaceHolderText = v6.props.filterBoxPlaceHolderText, 
                    onSendButtonActivated = v6.props.onSendButtonActivated, 
                    sendText = v6.props.sendText, 
                    sentText = v6.props.sentText, 
                    sendingText = v6.props.sendingText, 
                    failedText = v6.props.failedText, 
                    isLoading = v6.props.isLoading, 
                    entryHeight = 52, 
                    offlinePresence = v6.props.offlinePresence, 
                    onlinePresence = v6.props.onlinePresence
                })
            })
        });
    end);
end;
return v5;
