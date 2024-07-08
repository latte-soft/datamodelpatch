local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotificationsCommon");
local v3 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v4 = require(l_script_FirstAncestor_0.type);
local v5 = require(l_script_FirstAncestor_0.constants);
local v6 = game:DefineFastFlag("FFlagLuaAppFixToastNotificationClosePosition", false);
return {
    calculateToastPosition = function(v7, v8, v9)
        local v10 = 60;
        if not (not v6 or not l_GuiService_0) then
            v10 = l_GuiService_0:GetGuiInset().Y + 20;
        end;
        if not v7 then
            if not v8 then
                return {
                    positionX = 0.5, 
                    positionXOffset = 0, 
                    positionY = 0, 
                    positionYOffset = not v6 and -50 or -1 * v10, 
                    anchorX = 0.5, 
                    anchorY = 1
                };
            else
                return {
                    positionX = 1, 
                    positionXOffset = 20, 
                    positionY = 0, 
                    positionYOffset = v9, 
                    anchorX = 0, 
                    anchorY = 0
                };
            end;
        elseif not v8 then
            return {
                positionX = 0.5, 
                positionXOffset = 0, 
                positionY = 0, 
                positionYOffset = v9, 
                anchorX = 0.5, 
                anchorY = 0
            };
        else
            return {
                positionX = 1, 
                positionXOffset = -20, 
                positionY = 0, 
                positionYOffset = v9, 
                anchorX = 1, 
                anchorY = 0
            };
        end;
    end, 
    getDeviceOrientation = function(v11)
        if v11.Y < v11.X then
            return v4.DeviceOrientationEnum.Landscape;
        else
            return v4.DeviceOrientationEnum.Portrait;
        end;
    end, 
    getNotificationSize = function(v12, v13)
        if v13 < v5.FullWidthDeviceThreshold then
            return UDim2.new(0, v13 - 24, 0, 0);
        elseif not v12 then
            return UDim2.new(0, v5.InAppToastWidth, 0, 0);
        elseif v13 < v5.CompactCardThreashold then
            return UDim2.new(0, v5.InExperienceToastWidth, 0, 0);
        else
            return UDim2.new(0, v5.InAppToastWidth, 0, 0);
        end;
    end, 
    marshalStreamNotificationData = function(v14, _)
        local v16 = {
            currentState = v14.content.currentState, 
            notificationType = v14.content.notificationType, 
            id = v14.id
        };
        if v14.content.states then
            local v17 = v14.content.states[v14.content.currentState];
            v16.state = {
                layoutKey = v17.layoutKey, 
                name = v17.name, 
                visualItems = v17.visualItems
            };
        end;
        return v16;
    end, 
    isToastToRight = function(v18)
        if v18 == v4.DeviceOrientationEnum.Landscape then
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
        local v20 = true;
        if l_None_0 ~= Enum.Platform.Windows then
            v20 = true;
            if l_None_0 ~= Enum.Platform.OSX then
                v20 = l_None_0 == Enum.Platform.UWP;
            end;
        end;
        return v20;
    end, 
    fireEvent = function(v21, v22, v23, v24)
        local v25 = {
            streamContext = "InApp"
        };
        if not (v23 ~= nil) or v23 == "" then
            v23 = v5.NotificationsClientEventNameDefault;
        end;
        v21.sendEventDeferred(v22, v23, v3.Dictionary.join(v24, v25));
    end
};
