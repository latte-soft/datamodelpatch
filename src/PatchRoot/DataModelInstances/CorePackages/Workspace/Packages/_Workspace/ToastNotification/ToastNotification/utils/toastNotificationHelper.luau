local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.type);
local v5 = require(l_Parent_0.constants);
local l_TimeTrigger_0 = require(l_Parent_0.dependencies).ToastNotificationProtocolEnums.TimeTrigger;
local v7 = game:DefineFastFlag("FFlagLuaAppFixToastNotificationClosePosition", false);
local v8 = require(l_CorePackages_0.Logging);
local function v10(v9)
    if v9.Y < v9.X then
        return v4.DeviceOrientationEnum.Landscape;
    else
        return v4.DeviceOrientationEnum.Portrait;
    end;
end;
local function v13(v11, v12)
    if v12 < v5.FullWidthDeviceThreshold then
        return UDim2.new(0, v12 - 24, 0, 0);
    elseif not v11 then
        return UDim2.new(0, v5.InAppToastWidth, 0, 0);
    elseif v12 < v5.CompactCardThreashold then
        return UDim2.new(0, v5.InExperienceToastWidth, 0, 0);
    else
        return UDim2.new(0, v5.InAppToastWidth, 0, 0);
    end;
end;
local function _(v14, v15)
    if not v14 then
        return {
            v15
        };
    else
        table.insert(v14, v15);
        return v14;
    end;
end;
local function _(v17)
    if v17.button ~= nil then
        return "button";
    elseif v17.textBody ~= nil then
        return "textBody";
    elseif v17.thumbnail ~= nil then
        return "thumbnail";
    elseif v17.metaAction ~= nil then
        return "metaAction";
    else
        return "unknown";
    end;
end;
local function v27(v19)
    if not v19 then
        return nil;
    else
        local v20 = {
            button = nil, 
            textBody = nil, 
            thumbnail = nil, 
            metaAction = nil
        };
        for _, v22 in ipairs(v19.visualItems) do
            local v23 = v22.button ~= nil and "button" or (v22.textBody ~= nil and "textBody" or (v22.thumbnail ~= nil and "thumbnail" or (v22.metaAction ~= nil and "metaAction" or "unknown")));
            if v23 ~= "unknown" then
                local v24 = v20[v23];
                local v25 = v22[v23];
                local v26;
                if not v24 then
                    v26 = {
                        v25
                    };
                else
                    table.insert(v24, v25);
                    v26 = v24;
                end;
                v20[v23] = v26;
            end;
        end;
        return {
            layoutKey = v19.layoutKey, 
            name = v19.name, 
            timeOnScreenMs = v19.timeOnScreenMs, 
            visualItems = v20
        };
    end;
end;
return {
    calculateToastPosition = function(v28, v29, v30)
        local v31 = 60;
        if not (not v7 or not l_GuiService_0) then
            v31 = l_GuiService_0:GetGuiInset().Y + 20;
        end;
        if not v28 then
            if not v29 then
                return {
                    positionX = 0.5, 
                    positionXOffset = 0, 
                    positionY = 0, 
                    positionYOffset = not v7 and -50 or -1 * v31, 
                    anchorX = 0.5, 
                    anchorY = 1
                };
            else
                return {
                    positionX = 1, 
                    positionXOffset = 20, 
                    positionY = 0, 
                    positionYOffset = v30, 
                    anchorX = 0, 
                    anchorY = 0
                };
            end;
        elseif not v29 then
            return {
                positionX = 0.5, 
                positionXOffset = 0, 
                positionY = 0, 
                positionYOffset = v30, 
                anchorX = 0.5, 
                anchorY = 0
            };
        else
            return {
                positionX = 1, 
                positionXOffset = -20, 
                positionY = 0, 
                positionYOffset = v30, 
                anchorX = 1, 
                anchorY = 0
            };
        end;
    end, 
    getDeviceOrientation = v10, 
    getNotificationSize = v13, 
    marshalNotificationData = function(v32, v33)
        local v34 = {
            currentState = v32.currentState, 
            notificationType = v32.notificationType, 
            id = v32.id, 
            priority = v32.priority, 
            clientEventsPayload = v32.clientEventsPayload, 
            deliverTimestamp = v33
        };
        if v32.states then
            v34.state = v27(v32.states[v32.currentState]);
        end;
        return v34;
    end, 
    marshalNotificationDataV2 = function(v35)
        local v36 = {
            currentState = v35.content.currentState, 
            notificationType = v35.content.notificationType, 
            id = v35.content.id, 
            priority = v35.content.priority, 
            clientEventsPayload = v35.content.clientEventsPayload, 
            deliverTimestamp = v35.deliverTimestamp, 
            notificationReceivedTimestampMs = v35.notificationReceivedTimestampMs, 
            timers = if not v35.timers then nil else v35.timers
        };
        if v35.content.states then
            v36.state = v27(v35.content.states[v35.content.currentState]);
        end;
        return v36;
    end, 
    isToastToRight = function(v37)
        if v37 == v4.DeviceOrientationEnum.Landscape then
            return true;
        else
            return false;
        end;
    end, 
    isDesktopDevice = function()
        local l_None_0 = Enum.Platform.None;
        pcall(function()
            l_None_0 = l_UserInputService_0:GetPlatform();
        end);
        local v39 = true;
        if l_None_0 ~= Enum.Platform.Windows then
            v39 = true;
            if l_None_0 ~= Enum.Platform.OSX then
                v39 = l_None_0 == Enum.Platform.UWP;
            end;
        end;
        return v39;
    end, 
    getNearestWholeNumber = function(v40)
        if v40 % 1 < 0.5 then
            return (math.floor(v40));
        else
            return (math.ceil(v40));
        end;
    end, 
    getTimerFromCardData = function(v41, v42)
        if (not v41 or not v41.timers) or not v41.timers[v42] then
            v8.warn(string.format("timerKey %s not found in list of timers. Using default.", v42));
            return {
                timespanMs = 0, 
                trigger = l_TimeTrigger_0.OnDisplay
            };
        else
            return v41.timers[v42];
        end;
    end, 
    fireEvent = function(v43, v44)
        v43.sendEventDeferred("ToastNotification", "toastNotificationClientEvent", v44);
    end
};
