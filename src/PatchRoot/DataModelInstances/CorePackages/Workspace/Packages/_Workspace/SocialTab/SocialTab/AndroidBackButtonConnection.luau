return function(v0, v1)
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
            if v0 then
                v2 = v0.ShowLeaveConfirmation:Connect(v3);
            end;
        end, 
        showExitDialog = function()
            if not (not v0 or not v1) then
                v0:BroadcastNotification("", v1.BACK_BUTTON_NOT_CONSUMED);
            end;
        end
    };
end;
