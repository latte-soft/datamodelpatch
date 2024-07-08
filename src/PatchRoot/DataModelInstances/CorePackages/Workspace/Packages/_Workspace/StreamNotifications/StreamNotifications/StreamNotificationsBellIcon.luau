local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.StreamNotifications);
local v4 = require(l_Parent_0.UIBlox);
local l_Badge_0 = v4.App.Indicator.Badge;
local l_IconButton_0 = v4.App.Button.IconButton;
local l_IconSize_0 = v4.App.Constant.IconSize;
local l_Images_0 = v4.App.ImageSet.Images;
local l_BadgeVariant_0 = v4.App.Indicator.Enum.BadgeVariant;
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local l_NotificationHelper_0 = require(l_Parent_0.NotificationsCommon).NotificationHelper;
local l_ixpHelper_0 = require(l_Parent_0.NotificationsCommon).ixpHelper;
local v13 = require(l_script_FirstAncestor_0.constants);
local v14 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
local l_GetFStringNotificationsStreamNotificationUXLayer_0 = require(l_Parent_0.SharedFlags).GetFStringNotificationsStreamNotificationUXLayer;
local v16 = l_Images_0["icons/common/notificationOn"];
return function(v17)
    local v18, v19 = v2.useState(false);
    local v20 = not not v17.notificationCount and tonumber(v17.notificationCount) or 0;
    local l_layoutOrder_0 = v17.layoutOrder;
    local v22 = 44;
    if v17.compactWidth then
        v22 = 34;
    end;
    v2.useEffect(function()
        if v20 > 0 then
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v14.Context.seen, v14.EventNames.openCTAShown, {
                count = v20, 
                sendrVersion = v13.SENDRVersion
            });
        end;
    end, {
        v20
    });
    return v2.createElement(l_IconButton_0, {
        size = UDim2.new(0, v22, 1, 0), 
        icon = v16, 
        iconSize = l_IconSize_0.Medium, 
        layoutOrder = l_layoutOrder_0 or 3, 
        onActivated = function()
            v19(true);
            l_ixpHelper_0.logUserLayerExposure(l_GetFStringNotificationsStreamNotificationUXLayer_0());
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v14.Context.click, v14.EventNames.openContent, {
                countOfUnreadNotification = v20, 
                sendrVersion = v13.SENDRVersion
            });
        end
    }, {
        notificationBadge = if v20 > 0 then v2.createElement(l_Badge_0, {
            position = UDim2.new(0.5, 0, 0.5, 0), 
            anchorPoint = Vector2.new(0, 1), 
            value = v20, 
            badgeVariant = l_BadgeVariant_0.Alert
        }) else nil
    }, {
        (v2.useMemo(function()
            if not v18 then
                return nil;
            else
                return v2.createElement(v3, {
                    displayStream = v19
                });
            end;
        end, {
            v18
        }))
    });
end;
