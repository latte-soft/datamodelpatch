local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_CorePackages_0.Regulations.ScreenTime.HttpRequests);
local v6 = require(l_CorePackages_0.Regulations.ScreenTime.Constants);
local v7 = require(l_CorePackages_0.Regulations.ScreenTime.GetFFlagScreenTimeSignalR);
local v8 = require(l_CorePackages_0.Logging);
local v9 = require(l_RobloxGui_0.Modules.ErrorPrompt);
local v10 = require(l_RobloxGui_0.Modules.Flags.FFlagErrorPromptResizesHeight);
local function _()
    l_GuiService_0.SelectedCoreObject = nil;
    game:Shutdown();
end;
local v12 = {
    Warning = 1, 
    Lockout = 2, 
    OpenWebView = 3
};
local v13 = v5:new(l_HttpService_0);
local v14 = nil;
local function _()
    if v14 then
        v14:Disconnect();
        v14 = nil;
    end;
    l_GuiService_0.SelectedCoreObject = nil;
    game:Shutdown();
end;
local v23 = {
    pendingResolveMessage = {}, 
    displaying = nil, 
    resolvedMessage = {}, 
    displayMessageCallback = nil, 
    update = function(v16, v17)
        for _, v19 in pairs(v17) do
            table.insert(v16.pendingResolveMessage, {
                id = v19.serialId, 
                instructionName = v19.instructionName, 
                message = v19.message, 
                type = v19.type
            });
        end;
        v16:processNext();
    end, 
    processNext = function(v20)
        if not v20.displaying then
            local v21 = table.remove(v20.pendingResolveMessage, 1);
            if v21 then
                if not v20.resolvedMessage[v21.id] then
                    v20.displaying = v21;
                    if v20.displayMessageCallback then
                        v20.displayMessageCallback(v21.message);
                    end;
                    return ;
                else
                    v20:processNext();
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end, 
    resolve = function(v22)
        v22.resolvedMessage[v22.displaying.id] = v22.displaying.message;
        v13:reportExecution(v22.displaying.instructionName, v22.displaying.id);
        v22.displaying = nil;
        v22:processNext();
    end
};
local v24 = v9.new("Default", {
    MessageTextScaled = true, 
    HideErrorCode = true, 
    MenuIsOpenKey = "ScreenTimePrompt"
});
v24:setParent(l_RobloxGui_0);
local function v26(v25)
    v24:_open(v25);
end;
local v27 = {
    {
        Text = "OK", 
        LocalizationKey = "InGame.CommonUI.Button.Ok", 
        LayoutOrder = 1, 
        Callback = function()
            v24:_close();
            v23:resolve();
        end, 
        Primary = true
    }
};
v23.displayMessageCallback = v26;
v24:updateButtons(v27);
v24:setErrorTitle("Warning", "InGame.CommonUI.Title.Warning");
local l_X_0 = l_RobloxGui_0.AbsoluteSize.X;
local v29 = nil;
if v10() then
    v29 = l_RobloxGui_0.AbsoluteSize.Y;
end;
local function v32()
    if v24 then
        local l_X_1 = l_RobloxGui_0.AbsoluteSize.X;
        if not v10() then
            if l_X_0 ~= l_X_1 then
                l_X_0 = l_X_1;
                v24:resizeWidth(l_X_0);
            end;
        else
            local l_Y_0 = l_RobloxGui_0.AbsoluteSize.Y;
            if not (l_X_0 == l_X_1) or v29 ~= l_Y_0 then
                l_X_0 = l_X_1;
                v29 = l_Y_0;
                v24:resizeWidthAndHeight(l_X_0, v29);
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(v32);
v32();
local function v37(v33)
    local v34 = {};
    for _, v36 in ipairs(v33) do
        if v36.type == v12.Warning then
            table.insert(v34, v36);
        elseif v36.type == v12.Lockout then
            if v14 then
                v14:Disconnect();
                v14 = nil;
            end;
            l_GuiService_0.SelectedCoreObject = nil;
            game:Shutdown();
            return ;
        elseif v36.type == v12.OpenWebView then
        end;
    end;
    v23:update(v34);
end;
local function _()
    v13:getInstructions(function(v38, v39, v40)
        if not v38 then
            if not v39 then
                v8.warn("ScreenTimeInGame" .. " requestInstructions failed: error");
                return ;
            else
                v8.warn("ScreenTimeInGame" .. " requestInstructions failed: unauthorized");
                return ;
            end;
        else
            v37(v40);
            return ;
        end;
    end);
end;
v14 = l_NotificationService_0.RobloxEventReceived:Connect(function(v42)
    if not v7() then
        if v42.namespace == v6.HEARTBEAT_NOTIFICATIONS_NAMESPACE then
            if v42.detailType == v6.HEARTBEAT_CONSECUTIVE_FAILURE then
                if v14 then
                    v14:Disconnect();
                    v14 = nil;
                end;
                l_GuiService_0.SelectedCoreObject = nil;
                game:Shutdown();
                return ;
            else
                local l_status_0, l_result_0 = pcall(function()
                    return l_HttpService_0:JSONDecode(v42.detail);
                end);
                if l_status_0 then
                    if l_result_0.notifications == nil then
                        v8.warn("ScreenTimeInGame" .. " empty heartbeat notifications");
                        return ;
                    else
                        for _, v46 in ipairs(l_result_0.notifications) do
                            if v46.type == v6.HEARTBEAT_NOTIFICATION_TYPE_NEW_INSTRUCTION then
                                v13:getInstructions(function(v47, v48, v49)
                                    if not v47 then
                                        if not v48 then
                                            v8.warn("ScreenTimeInGame" .. " requestInstructions failed: error");
                                            return ;
                                        else
                                            v8.warn("ScreenTimeInGame" .. " requestInstructions failed: unauthorized");
                                            return ;
                                        end;
                                    else
                                        v37(v49);
                                        return ;
                                    end;
                                end);
                            end;
                        end;
                    end;
                else
                    v8.warn("ScreenTimeInGame" .. " json decoding failed");
                    return ;
                end;
            end;
        end;
    elseif v42.namespace == v6.SIGNALR_NAMESPACE and v42.detailType == v6.SIGNALR_TYPE_NEW_INSTRUCTION then
        v13:getInstructions(function(v50, v51, v52)
            if not v50 then
                if not v51 then
                    v8.warn("ScreenTimeInGame" .. " requestInstructions failed: error");
                    return ;
                else
                    v8.warn("ScreenTimeInGame" .. " requestInstructions failed: unauthorized");
                    return ;
                end;
            else
                v37(v52);
                return ;
            end;
        end);
        return ;
    end;
end);
