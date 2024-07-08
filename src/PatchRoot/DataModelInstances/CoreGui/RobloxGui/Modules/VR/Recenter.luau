local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.VR.Panel3D);
local v4 = require(l_RobloxGui_0.Modules.VR.VRHub);
local v5 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v6 = false;
local v7 = {
    ModuleName = "Recenter", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = false
};
v4:RegisterModule(v7);
local v8 = v3.Get("RecenterCountdown");
v8:SetType(v3.Type.HorizontalFollow);
v8:ResizeStuds(5, 3, 128);
v8:SetCanFade(false);
local v9 = v5:Create("TextLabel")({
    Parent = v8:GetGUI(), 
    Position = UDim2.new(0.5, -64, 0.5, -64), 
    Size = UDim2.new(0, 128, 0, 128), 
    BackgroundTransparency = 0.9, 
    BackgroundColor3 = Color3.new(0.2, 0.2, 0.2), 
    TextColor3 = Color3.new(1, 1, 1), 
    Text = "", 
    TextScaled = true, 
    Font = Enum.Font.SourceSansBold, 
    Visible = true
});
local _ = v5:Create("ImageLabel")({
    Parent = v8:GetGUI(), 
    Position = UDim2.new(0, 0, 0, 0), 
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundTransparency = 1, 
    Image = "rbxasset://textures/ui/VR/recenterFrame.png"
});
v8:SetVisible(false);
local v11 = false;
local function _()
    v11 = false;
    v8:SetVisible(false);
end;
v4.ModuleOpened.Event:connect(function(v13)
    if not (not (v13 ~= v7.ModuleName) or not v4:GetModule(v13).VRIsExclusive) then
        v11 = false;
        v8:SetVisible(false);
    end;
end);
v7.SetVisible = function(_, v15)
    v6 = v15;
    if not v6 then
        v11 = false;
        v8:SetVisible(false);
        v4:FireModuleClosed(v7.ModuleName);
        return ;
    elseif not v11 then
        v4:FireModuleOpened(v7.ModuleName);
        spawn(function()
            v11 = true;
            v8:SetVisible(true);
            l_ContextActionService_0:BindCoreAction("CancelRecenterShortcut", function(_, v17, _)
                if v17 == Enum.UserInputState.Begin then
                    v11 = false;
                    v8:SetVisible(false);
                end;
            end, false, Enum.KeyCode.ButtonB);
            if v11 then
                v9.Text = tostring(3);
                wait(1);
            end;
            if v11 then
                v9.Text = tostring(2);
                wait(1);
            end;
            if v11 then
                v9.Text = tostring(1);
                wait(1);
            end;
            if v11 then
                l_UserInputService_0:RecenterUserHeadCFrame();
            end;
            v8:SetVisible(false);
            v11 = false;
            l_ContextActionService_0:UnbindCoreAction("CancelRecenterShortcut");
            v4:FireModuleClosed(v7.ModuleName);
        end);
        return ;
    else
        v11 = false;
        v8:SetVisible(false);
        v4:FireModuleClosed(v7.ModuleName);
        return ;
    end;
end;
v7.IsVisible = function(_)
    return v6;
end;
return v7;
