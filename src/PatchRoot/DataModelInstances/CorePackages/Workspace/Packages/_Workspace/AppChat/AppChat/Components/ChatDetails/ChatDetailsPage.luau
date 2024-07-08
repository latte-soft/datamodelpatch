local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.Logger);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_useCallback_0 = v4.useCallback;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local v9 = require(script.Parent.SectionHeader);
local v10 = require(script.Parent.GroupNameEntryCell);
local v11 = require(script.Parent.AddFriendsEntry);
local v12 = require(script.Parent.ParticipantList);
local v13 = require(script.Parent.LeaveGroupCell);
local l_TestStyle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.TestStyle;
local v15 = require(script.Parent.UnfilteredThreads.ConversationTypeCell);
local v16 = require(script.Parent.UnfilteredThreads.CreateUnfilteredChatCell);
local v17 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v18 = {
    participants = {}, 
    localUserId = nil, 
    conversation = nil, 
    conversationId = nil, 
    isGroupConversation = false, 
    topBarHeight = 0, 
    shouldShowCreateUnfilteredChat = false, 
    shouldShowRevampedUI = false, 
    shouldHideGroupChatFunctionality = false, 
    navigateBack = function()
    end, 
    conversationTitle = "PlaceholderTitle", 
    pageHeaderText = "localizedText.ChatDetails", 
    generalText = "localizedText.General", 
    membersText = "localizedText.Members", 
    addFriendsText = "localizedText.AddFriends", 
    leaveGroupText = "localizedText.LeaveGroup", 
    onlinePresenceText = "localizedText.OnlineText", 
    offlinePresenceText = "localizedText.OfflineText", 
    conversationTypeHeaderText = "Type", 
    conversationTypeText = "localizedText.ConversationTypeText", 
    createUnfilteredChatText = "Create upgraded conversation", 
    onGroupNameEntryCellActivated = function()
        v2:warning("onGroupNameEntryCellActivated was not passed to ChatDetailsPage");
    end, 
    onAddFriendsCellActivated = function()
        v2:warning("onAddFriendsCellActivated was not passed to ChatDetailsPage");
    end, 
    onLeaveGroupCellActivated = function()
        v2:warning("onLeaveGroupCellActivated was not passed to ChatDetailsPage");
    end, 
    onParticipantCellActivated = function()
        v2:warning("onParticipantCellActivated was not passed to ChatDetailsPage");
    end, 
    onConversationTypeIconActivated = function()
        v2:warning("onConversationTypeIconActivated was not passed to ChatDetailsPage");
    end, 
    onCreateUnfilteredChatCellActivated = function()
        v2:warning("onCreateUnfilteredChatCellActivated was not passed to ChatDetailsPage");
    end, 
    LayoutOrder = 0, 
    style = l_TestStyle_0
};
ChatDetailsPage = function(v19)
    local v20 = v3.Dictionary.join(v18, v19);
    local function v21()
        v20.onGroupNameEntryCellActivated(v20.conversation);
    end;
    local function v22()
        v20.onAddFriendsCellActivated(v20.conversation);
    end;
    local function v23()
        v20.onLeaveGroupCellActivated(v20.conversation);
    end;
    local function v25(v24)
        v2:info("onParticipantCellActivated: {}", v24.id);
        if not v24.isLocalUser then
            v20.onParticipantCellActivated(v24.id);
            return ;
        else
            return ;
        end;
    end;
    local v26 = l_useCallback_0(function()
        v20.onCreateUnfilteredChatCellActivated(v20.conversation);
    end, l_dependencyArray_0(v20.conversation));
    local v30 = l_useCallback_0(function(_, v28, v29)
        if (not v20.wideMode and v28 == Enum.SwipeDirection.Right) and v29 == 1 then
            v20.navigateBack();
        end;
    end);
    local v31 = 0;
    for _, _ in pairs(v20.participants) do
        v31 = v31 + 1;
    end;
    local v34 = v17() and v20.shouldShowRevampedUI;
    local v35 = not v34 and 48 or 82;
    local v36 = if not not v17() and v20.shouldHideGroupChatFunctionality then v31 else v31 + 1 * v35;
    local v37 = v36 + (not v17() and 5 or 8) * v35;
    local l_style_0 = v20.style;
    return v4.createElement("TextButton", {
        AutoButtonColor = false, 
        BackgroundColor3 = l_style_0.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        LayoutOrder = v20.LayoutOrder, 
        Size = UDim2.new(1, 0, 1, -v20.topBarHeight), 
        Text = "", 
        Transparency = l_style_0.Theme.BackgroundDefault.Transparency, 
        [v4.Event.TouchSwipe] = v30
    }, {
        ScrollingContent = v4.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(1, 0, 0, v37), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScrollBarThickness = 0, 
            LayoutOrder = v20.LayoutOrder, 
            ScrollingDirection = Enum.ScrollingDirection.Y
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ChatGroupHeader = v20.isGroupConversation and v4.createElement(v9, {
                marginTop = 20, 
                LayoutOrder = 1, 
                Text = v20.chatGroupText, 
                style = v20.style
            }), 
            GroupNameEntryCell = v20.isGroupConversation and v4.createElement(v10, {
                LayoutOrder = 2, 
                groupNameText = v20.conversationTitle, 
                iconImage = l_Images_0["icons/actions/edit/edit"], 
                iconCellWidth = if not v34 then nil else 72, 
                isDisabled = not not v17() and v20.shouldHideGroupChatFunctionality, 
                cellHeight = if not v34 then nil else 44, 
                onActivated = v21, 
                style = v20.style
            }), 
            ConversationTypeHeader = if not v34 then nil else v4.createElement(v9, {
                LayoutOrder = 3, 
                Text = v20.conversationTypeHeaderText, 
                style = v20.style
            }), 
            ConversationTypeCell = if not v34 then nil else v4.createElement(v15, {
                layoutOrder = 4, 
                bodyText = v20.conversationTypeText, 
                iconImage = l_Images_0["icons/actions/info"], 
                onIconActivated = v20.onConversationTypeIconActivated, 
                style = v20.style
            }), 
            CreateUnfilteredChatCell = if not not v34 and v20.shouldShowCreateUnfilteredChat then v4.createElement(v16, {
                layoutOrder = 5, 
                bodyText = v20.createUnfilteredChatText, 
                iconImage = l_Images_0["icons/actions/edit/copy"], 
                cellHeight = v35, 
                onActivated = v26, 
                style = v20.style
            }) else nil, 
            MembersHeader = v4.createElement(v9, {
                LayoutOrder = 6, 
                marginTop = 14, 
                marginBottom = 8, 
                Text = v20.membersText, 
                style = v20.style
            }), 
            MembersFrame = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v36), 
                BackgroundColor3 = l_style_0.Theme.BackgroundDefault.Color, 
                BorderSizePixel = 0, 
                LayoutOrder = 7
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                AddFriendsCell = if not not v17() and v20.shouldHideGroupChatFunctionality then nil else v4.createElement(v11, {
                    LayoutOrder = 1, 
                    Text = v20.addFriendsText, 
                    iconImage = l_Images_0["icons/actions/edit/add"], 
                    cellHeight = v35, 
                    iconCellWidth = if not v34 then nil else 72, 
                    onActivated = v22, 
                    style = v20.style
                }), 
                ParticipantList = v4.createElement(v12, {
                    LayoutOrder = 2, 
                    entries = v20.participants, 
                    entryHeight = v35, 
                    onlinePresenceText = v20.onlinePresenceText, 
                    offlinePresenceText = v20.offlinePresenceText, 
                    childWidth = 48, 
                    shouldUseExpandedCell = v34, 
                    onEntryActivated = v25
                })
            }), 
            LeaveGroupCell = v20.isGroupConversation and v4.createElement(v13, {
                LayoutOrder = 8, 
                leaveGroupText = v20.leaveGroupText, 
                iconImage = l_Images_0["icons/controls/vehicle/exit"], 
                cellHeight = v35, 
                iconCellWidth = if not v34 then nil else 72, 
                marginTop = if not v34 then nil else 0, 
                onActivated = v23, 
                style = v20.style
            })
        })
    });
end;
return l_memo_0(ChatDetailsPage);
