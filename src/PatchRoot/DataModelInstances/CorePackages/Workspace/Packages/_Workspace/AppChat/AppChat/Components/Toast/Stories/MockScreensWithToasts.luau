local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.createChatTopBar);
return {
    ChatLanding = function(v6)
        local l_navigation_0 = v6.navigation;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 1, 0), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v5(v4.Dictionary.join(v6, {
                backButtonDisabled = true, 
                barHeight = l_navigation_0.getScreenProps("topBarHeight", 0), 
                headerText = "Chat"
            })), 
            CreateNewChat = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 90), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "CreateNewChat", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_0.navigate(v2.CreateNewChat);
                end
            }), 
            ChatConversation1 = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 150), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "ChatConversation123", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_0.navigate(v2.ChatConversation, {
                        conversationId = 123
                    });
                end
            }), 
            ChatConversation2 = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 180), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "ChatConversation456", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_0.navigate(v2.ChatConversation, {
                        conversationId = 456
                    });
                end
            }), 
            EmptyConversation = l_navigation_0.getScreenProps("wideMode", false) and v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 220), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Empty Conv", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_0.navigate("EmptyConversation");
                end
            }), 
            Toast = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 280), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Show a Toast", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_0.navigate(v2.RoactChatToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = "This is a toast nagivated to by the ChatLanding screen"
                            }
                        }
                    });
                end
            })
        });
    end, 
    CreateNewChat = function(v8)
        local l_navigation_1 = v8.navigation;
        local v10 = l_navigation_1.getScreenProps("wideMode", false);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 1, 0), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v5(v4.Dictionary.join(v8, {
                barHeight = l_navigation_1.getScreenProps("topBarHeight", 0), 
                headerText = "CreateNewChat"
            })), 
            ChatConversation = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 120), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "ChatConversation123", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    if not v10 then
                        l_navigation_1.replace(v2.ChatConversation, {
                            conversationId = 123
                        });
                        return ;
                    else
                        l_navigation_1.navigate(v2.ChatConversation, {
                            conversationId = 123
                        });
                        return ;
                    end;
                end
            }), 
            Toast = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 250), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Show a Toast", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_1.navigate(v2.RoactChatToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = "This is a toast nagivated to by the CreateNewChat screen"
                            }
                        }
                    });
                end
            })
        });
    end, 
    EmptyConversation = function(v11)
        return v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            BorderSizePixel = 0, 
            Font = Enum.Font.Gotham, 
            Text = "Empty Conversation page", 
            TextColor3 = Color3.new(0, 0, 0), 
            TextSize = 18
        }, {
            ChatTopBar = v5(v4.Dictionary.join(v11, {
                backButtonDisabled = true, 
                barHeight = v11.navigation.getScreenProps("topBarHeight", 0), 
                headerText = "No Title"
            }))
        });
    end, 
    ChatConversation = function(v12)
        local l_navigation_2 = v12.navigation;
        local v14 = l_navigation_2.getParam("conversationId", 0);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v5(v4.Dictionary.join(v12, {
                backButtonDisabled = l_navigation_2.getScreenProps("wideMode", false), 
                barHeight = l_navigation_2.getScreenProps("topBarHeight", 0), 
                headerText = "Conversation" .. tostring(v14)
            })), 
            ChatDetails = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 120), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "ChatDetails", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_2.navigate(v2.ChatDetails, {
                        conversationId = v14
                    });
                end
            }), 
            Toast = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 180), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Show a Toast", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_2.navigate(v2.RoactChatToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = "This is a toast nagivated to by the ChatConversation screen"
                            }
                        }
                    });
                end
            })
        });
    end, 
    ChatDetails = function(v15)
        local l_navigation_3 = v15.navigation;
        local v17 = l_navigation_3.getParam("conversationId", 0);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 0, 1), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v5(v4.Dictionary.join(v15, {
                barHeight = l_navigation_3.getScreenProps("topBarHeight", 0), 
                headerText = "ChatDetails" .. v17
            })), 
            EditChatMembers = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 120), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "EditChatMembers", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_3.push(v2.EditChatMembers, {
                        conversationId = v17
                    });
                end
            }), 
            Toast = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 180), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Show a Toast", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_3.navigate(v2.RoactChatToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = "This is a toast nagivated to by the ChatDetails screen"
                            }
                        }
                    });
                end
            })
        });
    end, 
    EditChatMembers = function(v18)
        local l_navigation_4 = v18.navigation;
        local v20 = l_navigation_4.getParam("conversationId", 0);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 1, 1), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v5(v4.Dictionary.join(v18, {
                barHeight = l_navigation_4.getScreenProps("topBarHeight", 0), 
                headerText = "EditChatMembers"
            })), 
            ChatConversation = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 120), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Back To Conversation", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_4.navigate(v2.ChatConversation, {
                        conversationId = v20
                    });
                end
            }), 
            Toast1 = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 180), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Show a Toast", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_4.navigate(v2.RoactChatToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = "A Toast this is"
                            }
                        }
                    });
                end
            }), 
            Toast2 = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                Font = Enum.Font.Gotham, 
                Position = UDim2.new(0.5, 0, 0, 210), 
                Size = UDim2.new(0, 200, 0, 30), 
                Text = "Show a Different Toast", 
                TextColor3 = Color3.new(0, 0, 0), 
                TextSize = 18, 
                [v3.Event.Activated] = function()
                    l_navigation_4.navigate(v2.RoactChatToast, {
                        toastProps = {
                            toastContent = {
                                toastTitle = "This is a different toast"
                            }
                        }
                    });
                end
            })
        });
    end
};
