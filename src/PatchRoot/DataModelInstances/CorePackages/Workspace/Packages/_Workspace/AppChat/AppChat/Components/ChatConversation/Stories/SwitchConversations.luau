local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.Roact);
local v2 = require(l_script_FirstAncestor_0.Components.ChatConversation.ChatConversation);
local v3 = v1.PureComponent:extend("Story");
local v4 = require(l_script_FirstAncestor_0.Tests.Utils.createMockMessages);
v3.init = function(v5)
    v5.conversation1 = {
        id = "CONVERSATION_ONE", 
        itemList = v4({
            messageIdPrefix = "CONVERSATION_ONE", 
            read = true
        }, 50)
    };
    v5.conversation2 = {
        id = "CONVERSATION_TWO", 
        itemList = v4({
            messageIdPrefix = "CONVERSATION_TWO", 
            read = true
        }, 40)
    };
    v5.switchConversations = function()
        v5:setState({
            conversation = v5.state.conversation.id == "CONVERSATION_ONE" and v5.conversation2 or v5.conversation1
        });
    end;
    v5.switchUnreadStatus = function()
        v5:setState({
            readingMessagesIsEnabled = not v5.state.readingMessagesIsEnabled
        });
    end;
    v5.state = {
        conversation = v5.conversation1, 
        readingMessagesIsEnabled = v5.props.initialReadingMessagesIsEnabled
    };
end;
v3.render = function(v6)
    return v1.createFragment({
        layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        chatConversation = v1.createElement(v2, {
            itemList = v6.state.conversation.itemList, 
            conversationId = v6.state.conversation.id, 
            markConversationAsRead = v6.props.markConversationAsRead or function()
            end, 
            readingMessagesIsEnabled = v6.state.readingMessagesIsEnabled
        }), 
        switchConversationButton = v1.createElement("TextButton", {
            Size = UDim2.new(0, 120, 0, 50), 
            Text = "Switch Conversations", 
            [v1.Event.Activated] = v6.switchConversations
        }), 
        toggleReadState = v1.createElement("TextButton", {
            Size = UDim2.new(0, 120, 0, 50), 
            Text = "Toggle UnreadStatus", 
            [v1.Event.Activated] = v6.switchUnreadStatus
        })
    });
end;
return function(v7)
    return v1.createElement("Frame", {
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.fromRGB(244, 244, 244), 
        Size = UDim2.new(0, 512, 0, 300)
    }, {
        ChatConversation = v1.createElement(v3, v7)
    });
end;
