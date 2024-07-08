local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.NotificationType);
local l_GuiService_0 = game:GetService("GuiService");
return function()
    local v2 = nil;
    return {
        disconnect = function()
            if v2 then
                v2:Disconnect();
                v2 = nil;
            end;
        end, 
        connect = function(v3)
            if not (not v2 or not v2) then
                v2:Disconnect();
                v2 = nil;
            end;
            if l_GuiService_0 then
                v2 = l_GuiService_0.ShowLeaveConfirmation:Connect(v3);
            end;
        end, 
        showExitDialog = function()
            if not (not l_GuiService_0 or not v0) then
                l_GuiService_0:BroadcastNotification("", v0.BACK_BUTTON_NOT_CONSUMED);
            end;
        end
    };
end;
