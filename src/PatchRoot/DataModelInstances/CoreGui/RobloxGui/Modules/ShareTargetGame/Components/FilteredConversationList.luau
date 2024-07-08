local l_script_FirstAncestor_0 = script:FindFirstAncestor("ShareTargetGame");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_UIBlox_0 = v1.UIBlox;
local l_User_0 = v1.User;
local l_FilteredScrollingList_0 = l_SocialLibraries_0.Components.FilteredScrollingList;
local v7 = require(l_script_FirstAncestor_0.Utils.conversationSortComparator);
local v8 = require(script.Parent.ConversationCellWithSendButton);
local v9 = l_Roact_0.PureComponent:extend("FilteredConversationList");
v9.defaultProps = {
    searchFilterPredicate = function(v10, v11)
        local l_title_0 = v11.title;
        if not v10 or v10 == "" then
            return true;
        else
            return string.find(string.lower(l_title_0), string.lower(v10), 1, true) ~= nil;
        end;
    end, 
    conversations = {}, 
    conversationSendingStatuses = {}, 
    touchedBottomCallback = nil, 
    filterBoxPlaceHolderText = nil, 
    offlinePresence = nil, 
    onlinePresence = nil, 
    sendText = "Send", 
    sentText = "Sent", 
    sendingText = "Sending", 
    failedText = "Failed", 
    entryHeight = nil, 
    isLoading = false, 
    onSendButtonActivated = function(_)
    end
};
v9.init = function(v14)
    v14.loadingEntries = table.create(3, {
        title = ""
    });
    v14.renderConversationCell = function(v15)
        local _ = nil;
        return l_Roact_0.createElement(v8, {
            conversation = v15, 
            sentStatus = v14.props.conversationSendingStatuses[v15.conversationId], 
            subTitleText = not v15.presence and "" or if v15.presence == l_User_0.PresenceType.ONLINE then v14.props.onlinePresence else if v15.presence == l_User_0.PresenceType.OFFLINE then v14.props.offlinePresence else v15.lastLocation, 
            sendText = v14.props.sendText, 
            sentText = v14.props.sentText, 
            sendingText = v14.props.sendingText, 
            failedText = v14.props.failedText, 
            secondaryTitleText = v15.alias, 
            onSendButtonActivated = v14.props.onSendButtonActivated, 
            isLoading = v14.props.isLoading
        });
    end;
end;
v9.render = function(v17)
    local v18 = not not v17.props.isLoading and v17.loadingEntries or v17.props.conversations;
    return l_UIBlox_0.Style.withStyle(function(v19)
        local l_Theme_0 = v19.Theme;
        local l_Font_0 = v19.Font;
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            dividerTop = l_Roact_0.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1), 
                LayoutOrder = 1
            }), 
            filterBoxContainer = l_Roact_0.createElement(l_FilteredScrollingList_0, {
                searchBoxHeight = 48, 
                searchBackgroundColor3 = l_Theme_0.UIMuted.Color, 
                searchBackgroundTransparency = l_Theme_0.UIMuted.Transparency, 
                searchIconCellWidth = 60, 
                searchIconSize = 24, 
                searchIconColor3 = l_Theme_0.TextDefault.Color, 
                searchIconTransparency = l_Theme_0.TextDefault.Transparency, 
                searchIconImage = "rbxasset://textures/ui/LuaChat/icons/ic-search.png", 
                searchInputTextFont = l_Font_0.Body.Font, 
                searchInputTextColor3 = l_Theme_0.TextDefault.Color, 
                searchInputTextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                searchInputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                searchPlaceholderTextTransparency = l_Theme_0.PlaceHolder.Transparency, 
                searchPlaceholderTextColor3 = l_Theme_0.TextDefault.Color, 
                searchPlaceholderText = v17.props.filterBoxPlaceHolderText, 
                searchClearIconColor3 = l_Theme_0.TextDefault.Color, 
                searchClearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png", 
                searchDividerColor3 = l_Theme_0.Divider.Color, 
                searchDividerTransparency = l_Theme_0.Divider.Transparency, 
                searchDividerHeight = 1, 
                scrollBarImageTransparency = v19.Theme.UIDefault.Transparency, 
                scrollBarImageColor3 = v19.Theme.UIDefault.Color, 
                entries = v18, 
                renderEntry = v17.renderConversationCell, 
                entryHeight = v17.props.entryHeight, 
                scrollTouchedBottomCallback = v17.props.touchedBottomCallback, 
                filterPredicate = v17.props.searchFilterPredicate, 
                sortComparator = v7, 
                LayoutOrder = 2
            })
        });
    end);
end;
return v9;
