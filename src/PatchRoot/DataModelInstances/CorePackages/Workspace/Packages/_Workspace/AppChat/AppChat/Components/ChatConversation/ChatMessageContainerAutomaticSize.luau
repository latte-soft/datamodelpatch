local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_AvatarCircle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.AvatarCircle;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v7 = require(l_Parent_0.Cryo);
local l_ShimmerPanel_0 = v4.App.Loading.ShimmerPanel;
local v9 = require(script.Parent.Logger);
local v10 = require(script.Parent.NoticeText);
local v11 = require(script.Parent.SystemMessage);
local v12 = require(l_Parent_0.UserProfiles);
local v13 = {
    failed = false, 
    filteredForReceivers = false, 
    Font = Enum.Font.Gotham, 
    isIncoming = false, 
    isNewSender = false, 
    parentWidth = 0, 
    messageTypePaddingOffset = 0, 
    moderated = false, 
    messageMaxWidth = 0, 
    openViewProfile = function()
        v9:warning("openViewProfile was not passed to ChatMessage");
    end, 
    renderMessage = function()
        v9:warning("renderMessage was not passed to ChatMessage");
    end, 
    viewProfileOnAvatarPressed = true, 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    unknownUserText = "PLACEHOLDER unknown user"
};
ChatMessageContainer = function(v14)
    local v15 = v7.Dictionary.join(v13, v14);
    local v16 = v3.useCallback(function()
        if v15.viewProfileOnAvatarPressed then
            v15.openViewProfile(v15.senderUserId);
        end;
    end, {
        v15.senderUserId
    });
    local v17 = l_useStyle_0();
    local v18 = nil;
    local v19 = nil;
    local l_shouldShowName_0 = v15.shouldShowName;
    local v21 = v12.Hooks.useUserProfilesFetch({
        userIds = {
            v15.senderUserId
        }, 
        query = v12.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    if not v21.data then
        v19 = true;
        v18 = "";
    else
        v19 = false;
        v18 = v12.Selectors.getCombinedNameFromId(v21.data, v15.senderUserId) or v15.unknownUserText;
    end;
    local v23 = v3.useCallback(function()
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v18, v17.Font.BaseSize * v17.Font.Footer.RelativeSize, v17.Font.Footer.Font, (Vector2.new(math.max(1, v15.messageMaxWidth - 6), math.huge)));
        return UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y);
    end, {
        v17.Font.BaseSize * v17.Font.Footer.RelativeSize, 
        v17.Font.Footer.Font, 
        v15.messageMaxWidth - 6, 
        v18
    });
    local v24 = 0;
    if not v15.showDateTime then
        v24 = (not v15.isNewSender and 2 or 10) + v15.messageTypePaddingOffset;
    end;
    local v25 = not not v15.isIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = v25, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        DateTime = v15.showDateTime and v3.createElement(v11, {
            LayoutOrder = 1, 
            Text = v15.sent:GetLongRelativeTime(), 
            maxWidth = 1000
        }), 
        MessageWithAvatar = (function()
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v24), 
                    PaddingLeft = UDim.new(0, not v15.thumbnail and 44 or 8)
                }), 
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = v25
                }), 
                Avatar = not not v15.thumbnail and v3.createElement("Frame", {
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, 36, 0, 36)
                }, {
                    AvatarCircle = v3.createElement(l_AvatarCircle_0, {
                        circleColor3 = v15.BackgroundColor3 or v17.Theme.BackgroundDefault.Color, 
                        circleInteriorBackgroundColor3 = v15.BackgroundColor3 or v17.Theme.BackgroundDefault.Color, 
                        onActivated = v16, 
                        thumbnails = {
                            v15.thumbnail
                        }
                    })
                }) or nil, 
                MessageWithDisplayName = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    AutomaticSize = if not game:GetEngineFeature("UseActualSizeToCalculateListMinSize") then nil else Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, not v15.isIncoming and 0 or -44, 0, 0)
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = v25
                    }), 
                    Padding = v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, not v15.isIncoming and 0 or 5)
                    }), 
                    DisplayNameContainer = l_shouldShowName_0 and v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(0, v15.messageMaxWidth - 6, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 1
                    }, {
                        Padding = v3.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 6)
                        }), 
                        DisplayName = if v19 then nil else v3.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = v17.Font.Footer.Font, 
                            Size = v23(), 
                            Text = v18, 
                            TextColor3 = v17.Theme.TextDefault.Color, 
                            TextSize = v17.Font.BaseSize * v17.Font.Footer.RelativeSize, 
                            TextTransparency = v17.Theme.TextDefault.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            AutomaticSize = Enum.AutomaticSize.XY
                        }, {
                            SizeConstraint = v3.createElement("UISizeConstraint", {
                                MaxSize = Vector2.new(v15.messageMaxWidth - 6, math.huge)
                            })
                        }), 
                        ShimmerName = if not v19 then nil else v3.createElement(l_ShimmerPanel_0, {
                            Size = UDim2.new(0, 150, 0, 20), 
                            LayoutOrder = 2
                        })
                    }), 
                    MessageWithAlertIcon = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 2, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, not v15.isIncoming and 0 or -44, 0, 0)
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = v25, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, 10)
                        }), 
                        AlertIcon = (v15.failed or v15.moderated) and v3.createElement("ImageLabel", {
                            BackgroundTransparency = 1, 
                            Image = "rbxasset://textures/ui/LuaChat/icons/ic-alert.png", 
                            ImageColor3 = v17.Theme.Alert.Color, 
                            ImageTransparency = v17.Theme.Alert.Transparency, 
                            LayoutOrder = not v15.isIncoming and 1 or 2, 
                            Size = UDim2.new(0, 18, 0, 18)
                        }), 
                        Message = v15.renderMessage({
                            LayoutOrder = not v15.isIncoming and 2 or 1
                        })
                    })
                })
            });
        end)(), 
        Notice = (v15.moderated or v15.filteredForReceivers) and v3.createElement(v10, {
            Font = v15.Font, 
            HorizontalAlignment = v25, 
            LayoutOrder = 3, 
            Text = not not v15.moderated and v15.messageModeratedNoticeText or v15.messageDefaultNoticeText, 
            TextColor3 = not not v15.moderated and v17.Theme.Alert.Color or v17.Theme.UIDefault.Color, 
            TextTransparency = not not v15.moderated and v17.Theme.Alert.Transparency or v17.Theme.UIDefault.Transparency, 
            TextXAlignment = not not v15.isIncoming and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right, 
            margin = {
                top = 0, 
                left = not v15.isIncoming and 0 or 54, 
                right = v15.isIncoming and 0 or 10, 
                bottom = 0
            }, 
            maxWidth = v15.parentWidth, 
            width = UDim.new(1, not v15.isIncoming and 0 or -44)
        }), 
        debug = v15.debugElement or nil
    });
end;
return ChatMessageContainer;
