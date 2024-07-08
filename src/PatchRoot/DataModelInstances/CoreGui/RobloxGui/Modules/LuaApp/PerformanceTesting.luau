local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local l_RunService_0 = game:GetService("RunService");
local l_Stats_0 = game:GetService("Stats");
local l_LuaApp_0 = l_CoreGui_0.RobloxGui.Modules.LuaApp;
local v7 = require(l_LuaApp_0.Config);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Constants;
local v9 = require(l_LuaApp_0.CreateGui);
local v12 = {
    Mode = {
        None = "None", 
        Playing = "Playing", 
        Recording = "Recording"
    }, 
    LuaState = function(_)
        local l_FrameRateManager_0 = l_Stats_0:FindFirstChild("FrameRateManager");
        if l_FrameRateManager_0 then
            return {
                AverageFPS = l_FrameRateManager_0:FindFirstChild("AverageFPS"):GetValue(), 
                FrameTimeVariance = l_FrameRateManager_0:FindFirstChild("FrameTimeVariance"):GetValue()
            };
        else
            warn("FrameRateManager not present in Stats");
            return {
                AverageFPS = 0, 
                FrameTimeVariance = 0
            };
        end;
    end
};
v12.ShowResults = function(_, v14)
    local v15 = v12:LuaState();
    v9.new("ScreenGui")({
        Name = "TestResults", 
        DisplayOrder = 5; 
        v9.new("Frame")({
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_Constants_0.Color.WHITE, 
            BorderSizePixel = 0; 
            v9.new("UIListLayout")({
                SortOrder = "LayoutOrder"
            }), 
            v9.new("TextLabel")({
                Name = "Title", 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 100), 
                Text = "Test: " .. v7.General.PerformanceTestFilename
            }), 
            v9.new("TextLabel")({
                Name = "AverageFPS", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 50), 
                Text = "AverageFPS:"
            }), 
            v9.new("TextLabel")({
                Name = "ExpectedAverageFPS", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = string.format("Expected: %g", v14.AverageFPS)
            }), 
            v9.new("TextLabel")({
                Name = "ActualAverageFPS", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = string.format("Actual  : %g", v15.AverageFPS)
            }), 
            v9.new("TextLabel")({
                Name = "ActualAverageFPS", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = string.format("Delta   : %g", v15.AverageFPS - v14.AverageFPS)
            }), 
            v9.new("TextLabel")({
                Name = "FrameTimeVariance", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 50), 
                Text = "FrameTimeVariance:"
            }), 
            v9.new("TextLabel")({
                Name = "ExpectedAFrameTimeVariance", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = string.format("Expected: %g", v14.FrameTimeVariance)
            }), 
            v9.new("TextLabel")({
                Name = "ActualFrameTimeVariance", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = string.format("Actual  : %g", v15.FrameTimeVariance)
            }), 
            v9.new("TextLabel")({
                Name = "ActualFrameTimeVariance", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextSize = l_Constants_0.Font.FONT_SIZE_14, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = string.format("Delta   : %g", v15.FrameTimeVariance - v14.FrameTimeVariance)
            })
        })
    }).Parent = l_CoreGui_0;
end;
v12.Record = function(v16)
    l_RunService_0:setThrottleFramerateEnabled(false);
    l_VirtualInputManager_0.RecordingCompleted:Connect(function(_)
        print("*** Finished Recording Test ***");
        l_VirtualInputManager_0.AdditionalLuaState = l_HttpService_0:JSONEncode(v16:LuaState());
        print("~~~           DUMP          ~~~");
        l_VirtualInputManager_0:Dump();
    end);
    l_VirtualInputManager_0:StartRecording();
end;
v12.Play = function(v18, v19)
    print("PerformanceTesting:Play");
    l_RunService_0:setThrottleFramerateEnabled(false);
    l_VirtualInputManager_0.PlaybackCompleted:Connect(function()
        print("*** Finished Playing Test ***");
        v18:ShowResults((l_HttpService_0:JSONDecode(l_VirtualInputManager_0.AdditionalLuaState)));
    end);
    l_VirtualInputManager_0:StartPlaying(v19);
end;
v12.Stop = function(_)
    if v7.General.PerformanceTestingMode == Enum.VirtualInputMode.Recording then
        l_VirtualInputManager_0:StopRecording();
    end;
end;
v12.Initialize = function(v21, v22)
    if v7.General.PerformanceTestingMode == Enum.VirtualInputMode.None then
        return ;
    else
        v21.appState = v22;
        if v7.General.PerformanceTestingMode == Enum.VirtualInputMode.Recording then
            v21:Record();
            return ;
        else
            if v7.General.PerformanceTestingMode == Enum.VirtualInputMode.Playing then
                v21:Play(v7.General.PerformanceTestFilename);
            end;
            return ;
        end;
    end;
end;
return v12;
