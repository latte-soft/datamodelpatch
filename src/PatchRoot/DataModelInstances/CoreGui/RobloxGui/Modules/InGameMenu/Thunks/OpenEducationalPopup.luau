local v0 = require(script.Parent.Parent.Actions.OpenNativeClosePrompt);
return function(v1, v2, v3)
    local function _()
        return tonumber(v2:GetItem("NativeCloseLuaPromptDisplayCount")) or 0;
    end;
    local function _(v5)
        v2:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(v5)));
        v2:flush();
    end;
    local l_v1_NotificationTypeList_0 = v1:GetNotificationTypeList();
    return function(v8)
        local l_closingApp_0 = v8:getState().nativeClosePrompt.closingApp;
        local v10 = tonumber(v2:GetItem("NativeCloseLuaPromptDisplayCount")) or 0;
        if l_closingApp_0 or v3 <= v10 then
            v1:BroadcastNotification("", l_v1_NotificationTypeList_0.NATIVE_EXIT);
            return ;
        else
            v8:dispatch(v0());
            v2:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(v10 + 1)));
            v2:flush();
            return ;
        end;
    end;
end;
