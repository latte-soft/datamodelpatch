local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Utility_0 = require(l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("Utility"));
local v4 = {
    BackgroundLoop = "RobloxMusic.ogg", 
    Error = "Error.mp3", 
    ButtonPress = "ButtonPress.mp3", 
    MoveSelection = "MoveSelection.mp3", 
    OverlayOpen = "OverlayOpen.mp3", 
    PopUp = "PopUp.mp3", 
    PurchaseSuccess = "PurchaseSuccess.mp3", 
    ScreenChange = "ScreenChange.mp3", 
    SideMenuSlideIn = "SideMenuSlideIn.mp3"
};
local v5 = {};
local function _(v6, v7, v8, v9)
    v6 = v6 / v9 - 1;
    return v8 * math.sqrt(1 - v6 * v6) + v7;
end;
local function v11()
    if not UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows then
        return true;
    else
        return l_RunService_0:IsRunning();
    end;
end;
GetSoundManager = function()
    local v12 = {
        SoundHolder = nil
    };
    local v13 = {};
    local function _(v14)
        if v5[v14] then
            local v15 = table.remove(v5[v14], 1);
            if v15 then
                table.insert(v5[v14], v15);
                return v15;
            end;
        end;
    end;
    v12.CreateSound = function(_, v18)
        local v19 = "rbxasset://sounds/ui/Shell/" .. v4[v18];
        local l_Sound_0 = Instance.new("Sound");
        l_Sound_0.Name = v18;
        l_Sound_0.SoundId = v19;
        return l_Sound_0;
    end;
    v12.Play = function(_, v22, v23, v24, v25, ...)
        local v26 = nil;
        if not v4[v22] then
            spawn(function()
                error("Unable to find sound: " .. tostring(v22));
            end);
            return v26;
        else
            local v27;
            if v5[v22] then
                local v28 = table.remove(v5[v22], 1);
                if v28 then
                    table.insert(v5[v22], v28);
                    v27 = v28;
                    goto label0 --[[  true, true  ]];
                end;
            end;
            v27 = nil;
            ::label0::;
            if not v27 then
                l_Utility_0.DebugLog("No sound:", v22, "in the queue.");
                return v26;
            else
                v27.Volume = v23 or 1;
                v27.Looped = v24 or false;
                v27.Pitch = v25 or 1;
                v27:Play(...);
                v13[v27] = v27.Volume;
                if not v11() then
                    v27.Volume = 0;
                end;
                return v27;
            end;
        end;
    end;
    v12.IsPlaying = function(_, v30)
        local l_FirstChild_0 = v12.SoundHolder:FindFirstChild(v30);
        if not l_FirstChild_0 then
            return false;
        else
            return l_FirstChild_0.IsPlaying;
        end;
    end;
    v12.Stop = function(_, v33, ...)
        if not (not v12.SoundHolder or not v4[v33]) then
            local l_FirstChild_1 = v12.SoundHolder:FindFirstChild(v33);
            if l_FirstChild_1 then
                l_FirstChild_1:Stop();
            end;
        end;
    end;
    v12.TweenSound = function(_, v36, v37, v38)
        v13[v36] = nil;
        l_Utility_0.PropertyTweener(v36, "Volume", v36.Volume, v37, v38, function(...)
            return not not v11() and l_Utility_0.EaseInOutQuad(...) or 0;
        end, true, function()
            v13[v36] = v37;
        end);
    end;
    (function()
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "AppShellSounds";
        l_Folder_0.Parent = l_CoreGui_0;
        v12.SoundHolder = l_Folder_0;
        for v40, _ in pairs(v4) do
            local l_Folder_1 = Instance.new("Folder");
            l_Folder_1.Name = v40;
            l_Folder_1.Parent = v12.SoundHolder;
            v5[v40] = {};
            local l_v12_Sound_0 = v12:CreateSound(v40);
            l_v12_Sound_0.Parent = l_Folder_1;
            table.insert(v5[v40], l_v12_Sound_0);
            l_v12_Sound_0 = v12:CreateSound(v40);
            l_v12_Sound_0.Parent = l_Folder_1;
            table.insert(v5[v40], l_v12_Sound_0);
            l_v12_Sound_0 = v12:CreateSound(v40);
            l_v12_Sound_0.Parent = l_Folder_1;
            table.insert(v5[v40], l_v12_Sound_0);
        end;
        local v44 = nil;
        l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
            local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
            if not (not l_SelectedCoreObject_0 or not v44) then
                local l_MoveSelection_0 = l_SelectedCoreObject_0:FindFirstChild("MoveSelection");
                if not (not l_MoveSelection_0 or not l_MoveSelection_0:IsA("Sound")) then
                    l_MoveSelection_0.Volume = 0.35;
                    l_MoveSelection_0:Play();
                end;
            end;
            v44 = l_SelectedCoreObject_0;
        end);
        if not v11() then
            spawn(function()
                while not v11() do
                    wait(0.1);
                end;
                for v47, v48 in pairs(v13) do
                    v47.Volume = v48;
                end;
            end);
        end;
    end)();
    return v12;
end;
return GetSoundManager();
