local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("StarterGui");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui"):WaitForChild("Modules");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v7 = require(l_Modules_0.NetworkPauseNotification);
local v8 = require(l_Modules_0.Common.Create);
local v9 = game:DefineFastFlag("GameplayPausePausesInteraction", false);
local v10 = true;
local v11 = v7.new();
local v12 = v9 and v8("Frame")({
    Name = "Container", 
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundTransparency = 1, 
    Active = false
});
local v13 = v8("ScreenGui")({
    Name = "RobloxNetworkPauseNotification", 
    OnTopOfCoreBlur = true, 
    DisplayOrder = 8, 
    Parent = l_CoreGui_0, 
    IgnoreGuiInset = v9, 
    AutoLocalize = false; 
    v12
});
l_LocalPlayer_0:GetPropertyChangedSignal("GameplayPaused"):Connect(function()
    local v14 = (l_LocalPlayer_0.GameplayPaused and v13.Enabled) and not v10;
    v10 = false;
    if not v14 then
        v11:Hide();
    else
        v11:Show();
    end;
    if v9 then
        v12.Active = v14;
    end;
    l_RunService_0:SetRobloxGuiFocused(v14);
end);
local function v17(v15)
    assert(type(v15) == "boolean", "Specified argument 'enabled' must be of type boolean");
    if v15 == v13.Enabled then
        return ;
    else
        v13.Enabled = v15;
        local v16 = (l_LocalPlayer_0.GameplayPaused and v13.Enabled) and not v10;
        v10 = false;
        if not v16 then
            v11:Hide();
        else
            v11:Show();
        end;
        if v9 then
            v12.Active = v16;
        end;
        l_RunService_0:SetRobloxGuiFocused(v16);
        return ;
    end;
end;
if not v9 then
    v11:SetParent(v13);
else
    v11:SetParent(v12);
end;
l_GuiService_0.NetworkPausedEnabledChanged:Connect(v17);
