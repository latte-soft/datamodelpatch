local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(script.Parent.ChatBubble);
local v6 = require(script.Parent.Parent.Types);
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v8 = v2.Component:extend("BubbleChatList");
v8.validateProps = v4.strictInterface({
    userId = v4.string, 
    isVisible = v4.optional(v4.boolean), 
    theme = v4.optional(v4.string), 
    onLastBubbleFadeOut = v4.optional(v4.callback), 
    chatSettings = v6.IChatSettings, 
    renderFirstInsert = v4.optional(v4.callback), 
    insertSize = v4.optional(v4.Vector2), 
    messageIds = v4.array(v4.string)
});
v8.defaultProps = {
    theme = "Light"
};
v8.getDerivedStateFromProps = function(v9, v10)
    local v11 = {};
    if v10.bubbles then
        for _, v13 in ipairs(v10.bubbles) do
            if not v1.List.find(v9.messageIds, v13.messageId) then
                table.insert(v11, {
                    messageId = v13.messageId, 
                    fadingOut = true
                });
            end;
        end;
    end;
    for _, v15 in ipairs(v9.messageIds) do
        table.insert(v11, {
            messageId = v15, 
            fadingOut = false
        });
    end;
    return {
        bubbles = v11
    };
end;
v8.init = function(v16, v17)
    if not (not (not v17.messageIds or #v17.messageIds == 0) or not v17.onLastBubbleFadeOut) then
        v17.onLastBubbleFadeOut();
    end;
    v16.onBubbleFadeOut = function(v18)
        local v20 = v1.List.filter(v16.state.bubbles, function(v19)
            return v19.messageId ~= v18;
        end);
        if not (#v20 == 0) or not v16.props.onLastBubbleFadeOut then
            v16:setState({
                bubbles = v20
            });
            return ;
        else
            v16.props.onLastBubbleFadeOut();
            return ;
        end;
    end;
end;
v8.render = function(v21)
    local v22 = {};
    local l_chatSettings_0 = v21.props.chatSettings;
    v22.Layout = v2.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
        Padding = UDim.new(0, l_chatSettings_0.BubblesSpacing)
    });
    v22.CaretPadding = (l_chatSettings_0.TailVisible and v21.props.showCarat) and v2.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 8)
    });
    for v24, v25 in ipairs(v21.state.bubbles) do
        local v26 = v24 == #v21.state.bubbles;
        v22["Bubble" .. v25.messageId] = v2.createElement(v5, {
            messageId = v25.messageId, 
            isMostRecent = v26, 
            theme = v21.props.theme, 
            fadingOut = v25.fadingOut, 
            onFadeOut = v21.onBubbleFadeOut, 
            chatSettings = l_chatSettings_0, 
            renderInsert = not not v26 and v21.props.renderFirstInsert or nil, 
            insertSize = v21.props.insertSize, 
            showCarat = v21.props.showCarat
        });
    end;
    return v2.createElement("Frame", {
        Visible = v21.props.isVisible, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, v22);
end;
return v3.connect(function(v27, v28)
    return {
        messageIds = v27.userMessages[v28.userId] or {}
    };
end)(v8);
