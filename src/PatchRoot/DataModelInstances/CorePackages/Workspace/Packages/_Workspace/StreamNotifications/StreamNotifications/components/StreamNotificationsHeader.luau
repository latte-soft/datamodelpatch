local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.constants);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local l_NotificationHelper_0 = require(l_Parent_0.NotificationsCommon).NotificationHelper;
local v12 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
return function(v13)
    local v14 = l_useStyle_0();
    local l_Font_0 = v14.Font;
    local l_Font_1 = l_Font_0.Header1.Font;
    local v17 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    local v18 = if not not l_UserInputService_0.StatusBarSize and v13.isSmallScreen then l_UserInputService_0.StatusBarSize.Y else 0;
    local v19 = l_useLocalization_0({
        headerText = v2.Text.HeaderKey
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v2.Modal.HeaderHeight + v18), 
        BackgroundTransparency = 1
    }, {
        HeaderFrame = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v2.Modal.HeaderHeight), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1)
        }, {
            CloseModal = v4.createElement(l_IconButton_0, {
                anchorPoint = Vector2.new(0, 0), 
                iconSize = l_IconSize_0.Medium, 
                icon = if not v13.isSmallScreen then v2.Modal.CloseIcon else v2.Modal.BackIcon, 
                layoutOrder = 1, 
                size = UDim2.new(0, v2.Modal.HeaderHeight - v2.Modal.Padding * 2, 0, v2.Modal.HeaderHeight - v2.Modal.Padding * 2), 
                position = UDim2.fromOffset(v2.Modal.Padding, v2.Modal.Padding), 
                onActivated = function()
                    v13.displayStream(false);
                    l_NotificationHelper_0.fireEvent(l_EventStream_0, v12.Context.click, v12.EventNames.closeContent, {
                        closeMethod = v12.CloseMethod.closeIcon
                    });
                end
            }), 
            HeaderText = v4.createElement("TextLabel", {
                Text = v19 and v19.headerText, 
                Font = l_Font_1, 
                TextSize = v17, 
                TextColor3 = v14.Theme.TextEmphasis.Color, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(1, 0, 0, v2.Modal.HeaderHeight), 
                BackgroundTransparency = 1
            })
        })
    });
end;
