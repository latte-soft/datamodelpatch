local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.constants);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.NotificationsCommon);
local l_NotificationCardProvider_0 = v4.NotificationCardProvider;
local l_NotificationCard_0 = v4.NotificationCard;
local l_NotificationHelper_0 = v4.NotificationHelper;
local l_constants_0 = v4.constants;
local l_marshalStreamNotificationData_0 = l_NotificationHelper_0.marshalStreamNotificationData;
local v10 = require(l_script_FirstAncestor_0.EnumStreamNotificationsDisplayState);
local v11 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v11.Core.Style.useStyle;
local l_IconButton_0 = v11.App.Button.IconButton;
local l_IconSize_0 = v11.App.ImageSet.Enum.IconSize;
local l_BaseMenu_0 = v11.App.Menu.BaseMenu;
local l_ImageSetLabel_0 = v11.Core.ImageSet.ImageSetLabel;
return function(v17)
    local v18 = l_useStyle_0();
    local l_activeNotification_0 = v17.activeNotification;
    local l_displayState_0 = v17.displayState;
    local l_isSmallScreen_0 = v17.isSmallScreen;
    local l_handleActions_0 = v17.handleActions;
    local l_closeNotificationDisplay_0 = v17.closeNotificationDisplay;
    if l_displayState_0 ~= v10.MetaActions then
        return nil;
    else
        local v24 = l_marshalStreamNotificationData_0(l_activeNotification_0);
        local v25 = {};
        if v24 then
            for _, v27 in ipairs(v24.state.visualItems.metaAction) do
                table.insert(v25, {
                    icon = v2.MetaActions.ActionIcons[v27.actionIcon] or v2.MetaActions.ActionIcons.default, 
                    text = v27.label.text, 
                    onActivated = function()
                        if l_handleActions_0 then
                            l_handleActions_0(v27, l_activeNotification_0);
                        end;
                    end
                });
            end;
        end;
        return {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = if l_isSmallScreen_0 then UDim.new(0, 0) else UDim.new(0, v2.Modal.CornerRadius)
            }), 
            MetaActions = v3.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v2.Modal.Padding), 
                    PaddingLeft = UDim.new(0, v2.Modal.Padding), 
                    PaddingRight = UDim.new(0, v2.Modal.Padding), 
                    PaddingBottom = UDim.new(0, v2.Modal.Padding)
                }), 
                v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v2.DefaultPadding)
                }), 
                CardAndClose = v3.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    ActiveCard = v3.createElement(l_NotificationCardProvider_0, {
                        notificationPayload = l_activeNotification_0, 
                        state = v24 and v24.state, 
                        isCompact = false, 
                        readOnly = false, 
                        openMetaActions = nil, 
                        handleActions = l_handleActions_0
                    }, {
                        NotificationCard = v3.createElement(l_NotificationCard_0, {
                            isHover = false, 
                            layoutOrder = 1
                        })
                    }), 
                    CloseButtonFrame = v3.createElement("Frame", {
                        Size = UDim2.fromOffset(v2.MetaActions.CloseButtonFrameSize, v2.MetaActions.CloseButtonFrameSize), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.new(1, -l_constants_0.Padding.DefaultCardPadding, 0, l_constants_0.Padding.DefaultCardPadding)
                    }, {
                        CloseIcon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 2, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            Size = UDim2.fromOffset(v2.MetaActions.CloseIconSize, v2.MetaActions.CloseIconSize), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Image = v2.Modal.CloseIcon, 
                            ImageColor3 = v18.Theme.UIEmphasis.Color
                        }), 
                        CloseButton = v3.createElement(l_IconButton_0, {
                            iconSize = l_IconSize_0.Small, 
                            size = UDim2.fromOffset(v2.MetaActions.CloseButtonSize, v2.MetaActions.CloseButtonSize), 
                            layoutOrder = 1, 
                            anchorPoint = Vector2.new(0.5, 0.5), 
                            position = UDim2.new(0.5, 0, 0.5, 0), 
                            onActivated = l_closeNotificationDisplay_0
                        })
                    })
                }), 
                Menu = v3.createElement(l_BaseMenu_0, {
                    buttonProps = v25, 
                    width = UDim.new(1, 0), 
                    layoutOrder = 2
                })
            })
        };
    end;
end;
