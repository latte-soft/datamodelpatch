local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_script_FirstAncestor_0.SocialLibraries);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.EnumScreens);
local v7 = require(l_script_FirstAncestor_0.Components.ChatDetails.Dialogs.GenericDialogType);
local v8 = require(l_script_FirstAncestor_0.createChatTopBar);
local l_ModalBottomSheet_0 = v3.ModalBottomSheet;
local l_Warning_0 = v4.Components.AlertViews.Warning;
local function v12(v11)
    return v2.createElement("TextButton", {
        AnchorPoint = v11.AnchorPoint or Vector2.new(0.5, 0), 
        BackgroundColor3 = Color3.new(1, 1, 1), 
        Font = Enum.Font.Gotham, 
        LayoutOrder = v11.LayoutOrder or 1, 
        Size = v11.Size or UDim2.new(0, 200, 0, 30), 
        Position = v11.Position or UDim2.new(0, 0, 0, 0), 
        Text = v11.Text, 
        TextColor3 = Color3.new(0, 0, 0), 
        TextSize = 18, 
        [v2.Event.Activated] = v11.onActivated
    });
end;
return {
    ChatLanding = function(v13)
        local l_navigation_0 = v13.navigation;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 1, 0), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v8(v5.Dictionary.join(v13, {
                backButtonDisabled = true, 
                barHeight = l_navigation_0.getScreenProps("topBarHeight", 0), 
                headerText = "Chat"
            })), 
            CreateNewChat = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 90), 
                Text = "CreateNewChat", 
                onActivated = function()
                    l_navigation_0.navigate(v6.CreateNewChat);
                end
            }), 
            ChatConversation1 = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 150), 
                Text = "ChatConversation123", 
                onActivated = function()
                    l_navigation_0.navigate(v6.ChatConversation, {
                        conversationId = 123
                    });
                end
            }), 
            ChatConversation2 = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 180), 
                Text = "ChatConversation456", 
                onActivated = function()
                    l_navigation_0.navigate(v6.ChatConversation, {
                        conversationId = 456
                    });
                end
            }), 
            EmptyConversation = l_navigation_0.getScreenProps("wideMode", false) and v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 220), 
                Text = "Empty Conv", 
                onActivated = function()
                    l_navigation_0.navigate("EmptyConversation");
                end
            })
        });
    end, 
    CreateNewChat = function(v15)
        local l_navigation_1 = v15.navigation;
        local v17 = l_navigation_1.getScreenProps("wideMode", false);
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 1, 0), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v8(v5.Dictionary.join(v15, {
                barHeight = l_navigation_1.getScreenProps("topBarHeight", 0), 
                headerText = "CreateNewChat"
            })), 
            ChatConversation = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 120), 
                Text = "ChatConversation123", 
                onActivated = function()
                    if not v17 then
                        l_navigation_1.replace(v6.ChatConversation, {
                            conversationId = 123
                        });
                        return ;
                    else
                        l_navigation_1.navigate(v6.ChatConversation, {
                            conversationId = 123
                        });
                        return ;
                    end;
                end
            })
        });
    end, 
    EmptyConversation = function(v18)
        return v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            BorderSizePixel = 0, 
            Font = Enum.Font.Gotham, 
            Text = "Empty Conversation page", 
            TextColor3 = Color3.new(0, 0, 0), 
            TextSize = 18
        }, {
            ChatTopBar = v8(v5.Dictionary.join(v18, {
                backButtonDisabled = true, 
                barHeight = v18.navigation.getScreenProps("topBarHeight", 0), 
                headerText = "No Title"
            }))
        });
    end, 
    ChatConversation = function(v19)
        local l_navigation_2 = v19.navigation;
        local v21 = l_navigation_2.getParam("conversationId", 0);
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v8(v5.Dictionary.join(v19, {
                backButtonDisabled = l_navigation_2.getScreenProps("wideMode", false), 
                barHeight = l_navigation_2.getScreenProps("topBarHeight", 0), 
                headerText = "Conversation" .. tostring(v21)
            })), 
            ChatDetails = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 120), 
                Text = "ChatDetails", 
                onActivated = function()
                    l_navigation_2.navigate(v6.ChatDetails, {
                        conversationId = v21
                    });
                end
            })
        });
    end, 
    ChatDetails = function(v22)
        local l_navigation_3 = v22.navigation;
        local v24 = l_navigation_3.getParam("conversationId", 0);
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 0, 1), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v8(v5.Dictionary.join(v22, {
                barHeight = l_navigation_3.getScreenProps("topBarHeight", 0), 
                headerText = "ChatDetails" .. v24
            })), 
            EditChatMembers = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 120), 
                Text = "EditChatMembers", 
                onActivated = function()
                    l_navigation_3.push(v6.EditChatMembers, {
                        conversationId = v24
                    });
                end
            })
        });
    end, 
    EditChatMembers = function(v25)
        local l_navigation_4 = v25.navigation;
        local v27 = l_navigation_4.getParam("conversationId", 0);
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 1, 1), 
            BorderSizePixel = 0
        }, {
            ChatTopBar = v8(v5.Dictionary.join(v25, {
                barHeight = l_navigation_4.getScreenProps("topBarHeight", 0), 
                headerText = "EditChatMembers"
            })), 
            ChatConversation = v2.createElement(v12, {
                Position = UDim2.new(0.5, 0, 0, 120), 
                Text = "Back To Conversation", 
                onActivated = function()
                    l_navigation_4.navigate(v6.ChatConversation, {
                        conversationId = v27
                    });
                end
            })
        });
    end, 
    ChatDetailsWithModals = function(v28)
        local l_navigation_5 = v28.navigation;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 0, 1), 
            BorderSizePixel = 0
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 10), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ChatTopBar = v8(v5.Dictionary.join(v28, {
                backButtonDisabled = true, 
                barHeight = l_navigation_5.getScreenProps("topBarHeight", 0), 
                contentHeight = l_navigation_5.getScreenProps("contentHeight", 0), 
                headerText = "ChatDetails", 
                LayoutOrder = 0
            })), 
            EditChatGroupName = v2.createElement(v12, {
                LayoutOrder = 1, 
                Text = "EditChatGroupName", 
                onActivated = function()
                    l_navigation_5.navigate(v7.EditChatGroupNameDialog);
                end
            }), 
            LeaveGroup = v2.createElement(v12, {
                LayoutOrder = 2, 
                Text = "LeaveGroup", 
                onActivated = function()
                    l_navigation_5.navigate(v7.LeaveGroupDialog);
                end
            }), 
            RemoveUser = v2.createElement(v12, {
                LayoutOrder = 3, 
                Text = "RemoveUser", 
                onActivated = function()
                    l_navigation_5.navigate(v7.RemoveUserDialog);
                end
            }), 
            ModalBottomSheet = v2.createElement(v12, {
                LayoutOrder = 4, 
                Text = "ModalBottomSheet", 
                onActivated = function()
                    l_navigation_5.navigate(v7.ParticipantDialog);
                end
            })
        });
    end, 
    EditChatGroupNameDialog = function(v30)
        return v2.createElement(l_Warning_0, {
            titleText = "EditChatGroupName", 
            bodyText = "Change to new name?", 
            onModalClose = function()
                v30.navigation.goBack();
            end
        });
    end, 
    LeaveGroupDialog = function(v31)
        return v2.createElement(l_Warning_0, {
            titleText = "LeaveGroup", 
            bodyText = "Leave group?", 
            onModalClose = function()
                v31.navigation.goBack();
            end
        });
    end, 
    ParticipantDialog = function(v32)
        return v2.createElement(l_ModalBottomSheet_0, {
            bottomGap = 10, 
            onDismiss = function()
                v32.navigation.goBack();
            end, 
            buttonModels = {
                {
                    text = "ViewProfile", 
                    onActivated = function()
                        v32.navigation.replace("Webview");
                    end
                }, 
                {
                    text = "ReportUser", 
                    onActivated = function()
                        v32.navigation.replace("Webview");
                    end
                }, 
                {
                    text = "RemoveUser", 
                    onActivated = function()
                        v32.navigation.replace(v7.RemoveUserDialog);
                    end
                }, 
                {
                    text = "Cancel", 
                    onActivated = function()
                    end
                }
            }, 
            screenWidth = 400, 
            showImages = false
        });
    end, 
    RemoveUserDialog = function(v33)
        return v2.createElement(l_Warning_0, {
            titleText = "RemoveUser", 
            bodyText = "Remove user?", 
            onModalClose = function()
                v33.navigation.goBack();
            end
        });
    end, 
    Webview = function(v34)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 0, 1), 
            BorderSizePixel = 0
        }, {
            BackButton = v2.createElement(v12, {
                AnchorPoint = Vector2.new(0, 0), 
                Text = "Back", 
                onActivated = function()
                    v34.navigation.goBack();
                end
            })
        });
    end
};
