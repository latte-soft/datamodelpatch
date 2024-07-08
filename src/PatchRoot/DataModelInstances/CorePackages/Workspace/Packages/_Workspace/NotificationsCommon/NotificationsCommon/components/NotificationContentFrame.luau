local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotificationsCommon");
local l_components_0 = l_script_FirstAncestor_0.components;
local l_context_0 = l_script_FirstAncestor_0.context;
local v3 = require(l_script_FirstAncestor_0.dependencies);
local v4 = require(l_components_0.NotificationStyledText);
local v5 = require(l_components_0.NotificationThumbnail);
local _ = require(l_script_FirstAncestor_0.type);
local l_React_0 = v3.React;
local l_UIBlox_0 = v3.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v10 = require(l_script_FirstAncestor_0.constants);
local v11 = require(l_context_0.useNotificationCardState);
local v12 = require(l_context_0.useNotificationCardData);
local v13 = require(l_components_0.NotificationActionsFrame);
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconSize_0 = l_UIBlox_0.App.ImageSet.Enum.IconSize;
local v17 = l_Images_0["icons/common/overflow"];
local l_DefaultContentPadding_0 = v10.DefaultContentPadding;
local l_DefaultTextContentPadding_0 = v10.DefaultTextContentPadding;
local l_MetaActionsWidth_0 = v10.MetaActionsWidth;
local l_TimestampWidth_0 = v10.TimestampWidth;
local l_TimestampHeight_0 = v10.TimestampHeight;
return function()
    local v23 = l_useStyle_0();
    local v24 = v23.Font.BaseSize * v23.Font.CaptionHeader.RelativeSize;
    local v25 = v23.Font.BaseSize * v23.Font.CaptionBody.RelativeSize;
    local v26 = v12();
    local l_cardSize_0 = v26.cardSize;
    local l_readOnly_0 = v26.readOnly;
    local v29 = not not l_cardSize_0 and l_cardSize_0.thumbnail or v10.CardSizeDefault.thumbnail;
    local l_openMetaActions_0 = v26.openMetaActions;
    local l_notificationPayload_0 = v26.notificationPayload;
    local l_handleActions_0 = v26.handleActions;
    local v33 = v11("textBody");
    local v34 = v33 and v33[1];
    local v35 = (v34 and v34.title) and {
        Text = v34.title, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextSize = v24, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        LayoutOrder = 1, 
        Font = v23.Font.CaptionHeader.Font, 
        TextColor3 = v23.Theme.TextEmphasis.Color
    };
    local v36 = (v34 and v34.label) and {
        Text = v34.label, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextSize = v25, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        LayoutOrder = 2, 
        Font = v23.Font.CaptionBody.Font, 
        TextColor3 = v23.Theme.TextEmphasis.Color
    };
    local v37 = (l_notificationPayload_0 and l_notificationPayload_0.timestamp) and {
        Text = {
            text = l_notificationPayload_0.timestamp
        }, 
        Size = UDim2.new(0, l_TimestampWidth_0 + l_DefaultTextContentPadding_0, 0, l_TimestampHeight_0), 
        TextSize = v24, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Right, 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, if not l_readOnly_0 then -(l_MetaActionsWidth_0 + l_DefaultTextContentPadding_0) else -l_DefaultTextContentPadding_0, 0, 0), 
        LayoutOrder = 2, 
        Font = v23.Font.CaptionHeader.Font, 
        TextColor3 = v23.Theme.TextEmphasis.Color, 
        TextTransparency = 0
    };
    return l_React_0.createElement("TextButton", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        Text = "", 
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        [l_React_0.Event.Activated] = function()
            if not ((not l_handleActions_0 or not v34) or not l_notificationPayload_0) then
                l_handleActions_0(v34, l_notificationPayload_0);
            end;
        end
    }, {
        UIListLayout = l_React_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, l_DefaultContentPadding_0)
        }), 
        NotificationThumbnailFrame = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(0, v29, 0, v29)
        }, {
            NotificationThumbnail = l_React_0.createElement(v5)
        }), 
        ContentFrame = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, -(v29 + l_DefaultContentPadding_0), 0, 0)
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, l_DefaultTextContentPadding_0)
            }), 
            NotificationsBody = l_React_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v10.MetaActionsHeight), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                NotificationsText = l_React_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, if not l_readOnly_0 then -((l_MetaActionsWidth_0 + l_TimestampWidth_0) + l_DefaultTextContentPadding_0 * 2) else -(l_TimestampWidth_0 + l_DefaultTextContentPadding_0), 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    UIPadding = l_React_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, l_DefaultTextContentPadding_0)
                    }), 
                    UIListLayout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        Padding = UDim.new(0, l_DefaultTextContentPadding_0)
                    }), 
                    Title = if not v35 then nil else l_React_0.createElement(v4, v35), 
                    Subtitle = if not v36 then nil else l_React_0.createElement(v4, v36)
                }), 
                Timestamp = if not v37 then nil else l_React_0.createElement(v4, v37), 
                MetaActionsButton = if not l_openMetaActions_0 or l_readOnly_0 then nil else l_React_0.createElement(l_IconButton_0, {
                    anchorPoint = Vector2.new(1, 0), 
                    position = UDim2.new(1, 0, 0, 0), 
                    size = UDim2.fromOffset(0, 0), 
                    iconSize = l_IconSize_0.Medium, 
                    icon = v17, 
                    layoutOrder = 3, 
                    onActivated = function()
                        l_openMetaActions_0(l_notificationPayload_0);
                    end
                })
            }), 
            NotificationActionsFrame = if l_readOnly_0 then nil else l_React_0.createElement(v13)
        })
    });
end;
