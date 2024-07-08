local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v3 = {};
local v4 = {};
l_RunService_0.Heartbeat:Connect(function(v5)
    local v6 = {};
    for v7, _ in pairs(v3) do
        if v7(v5) then
            table.insert(v6, v7);
        end;
    end;
    for _, v10 in ipairs(v6) do
        v3[v10] = nil;
    end;
    for v11, _ in pairs(v4) do
        if v4[v11] == false then
            v4[v11] = nil;
        else
            v11:Fire(v5);
        end;
    end;
end);
local v13 = {};
local v14 = nil;
v13.setCurrentWindow = function(v15)
    local l_v14_0 = v14;
    v14 = v15;
    return l_v14_0;
end;
v13.getCurrentWindow = function()
    return v14;
end;
v13.waitForInputEventsProcessed = function()
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
v13.__asyncRun = function(v17)
    v3[v17] = true;
end;
v13.__syncRun = function(v18)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    v4[l_BindableEvent_0] = true;
    local v20 = 0;
    while not v18(v20) do
        v20 = l_BindableEvent_0.Event:Wait();
    end;
    v4[l_BindableEvent_0] = false;
end;
v13.__handleGuiInset = function(v21, v22)
    local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
    return v21 + l_l_GuiService_0_GuiInset_0.X, v22 + l_l_GuiService_0_GuiInset_0.Y;
end;
return v13;
