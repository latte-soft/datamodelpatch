local _ = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v6 = require(l_RobloxGui_0.Modules.ErrorPrompt);
local v7 = require(l_RobloxGui_0.Modules.Common.Url);
local v8 = require(l_RobloxGui_0.Modules.Flags.FFlagErrorPromptResizesHeight);
local function _()
    l_GuiService_0.SelectedCoreObject = nil;
    game:Shutdown();
end;
local v10 = {
    Warning = 1, 
    Lockout = 2
};
local function _(v11)
    return {
        State = v11.response.state.type, 
        Messages = v11.response.state.messages
    };
end;
local _ = function(v13)
    local _, _ = pcall(l_HttpRbxApiService_0.GetAsyncFullUrl, l_HttpRbxApiService_0, v7.RCS_URL .. "screen-time-api/v1/messages/mark-read" .. "?" .. "mesasgeId=" .. v13);
end;
local v26 = {
    pendingResolveMessage = {}, 
    displaying = nil, 
    resolvedMessage = {}, 
    displayMessageCallback = nil, 
    update = function(v17, v18)
        for _, v20 in pairs(v18) do
            table.insert(v17.pendingResolveMessage, {
                id = v20.id, 
                message = v20.text
            });
        end;
        v17:processNext();
    end, 
    processNext = function(v21)
        if not v21.displaying then
            local v22 = table.remove(v21.pendingResolveMessage, 1);
            if v22 then
                if not v21.resolvedMessage[v22.id] then
                    v21.displaying = v22;
                    if v21.displayMessageCallback then
                        v21.displayMessageCallback(v22.message);
                    end;
                    spawn(function()
                        local _, _ = pcall(l_HttpRbxApiService_0.GetAsyncFullUrl, l_HttpRbxApiService_0, v7.RCS_URL .. "screen-time-api/v1/messages/mark-read" .. "?" .. "mesasgeId=" .. v22.id);
                    end);
                    return ;
                else
                    v21:processNext();
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end, 
    resolve = function(v25)
        v25.resolvedMessage[v25.displaying.id] = v25.displaying.message;
        v25.displaying = nil;
        v25:processNext();
    end
};
local v27 = v6.new("Default", {
    MessageTextScaled = true, 
    HideErrorCode = true, 
    MenuIsOpenKey = "AnitAddictionPrompt"
});
v27:setParent(l_RobloxGui_0);
local function v29(v28)
    v27:_open(v28);
end;
local v30 = {
    {
        Text = "OK", 
        LocalizationKey = "InGame.CommonUI.Button.Ok", 
        LayoutOrder = 1, 
        Callback = function()
            v27:_close();
            v26:resolve();
        end, 
        Primary = true
    }
};
v26.displayMessageCallback = v29;
v27:updateButtons(v30);
v27:setErrorTitle("Warning", "InGame.CommonUI.Title.Warning");
local l_X_0 = l_RobloxGui_0.AbsoluteSize.X;
local v32 = nil;
if v8() then
    v32 = l_RobloxGui_0.AbsoluteSize.Y;
end;
local function v35()
    if v27 then
        local l_X_1 = l_RobloxGui_0.AbsoluteSize.X;
        if not v8() then
            if l_X_0 ~= l_X_1 then
                l_X_0 = l_X_1;
                v27:resizeWidth(l_X_0);
            end;
        else
            local l_Y_0 = l_RobloxGui_0.AbsoluteSize.Y;
            if not (l_X_0 == l_X_1) or v32 ~= l_Y_0 then
                l_X_0 = l_X_1;
                v32 = l_Y_0;
                v27:resizeWidthAndHeight(l_X_0, v32);
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(v35);
v35();
local v36 = nil;
local function _(v37)
    local v38 = {
        State = v37.response.state.type, 
        Messages = v37.response.state.messages
    };
    if v38.State == v10.Lockout then
        if v36 then
            v36:Disconnect();
        end;
        l_GuiService_0.SelectedCoreObject = nil;
        game:Shutdown();
    end;
    v26:update(v38.Messages);
end;
v36 = l_NotificationService_0.RobloxEventReceived:Connect(function(v40)
    if v40.namespace == "AntiAddictionNotifications" then
        local v41 = l_HttpService_0:JSONDecode(v40.detail);
        local v42 = {
            State = v41.response.state.type, 
            Messages = v41.response.state.messages
        };
        if v42.State == v10.Lockout then
            if v36 then
                v36:Disconnect();
            end;
            l_GuiService_0.SelectedCoreObject = nil;
            game:Shutdown();
        end;
        v26:update(v42.Messages);
    end;
end);
