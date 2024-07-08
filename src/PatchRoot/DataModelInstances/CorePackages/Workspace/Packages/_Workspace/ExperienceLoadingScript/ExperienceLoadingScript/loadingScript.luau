local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = require(l_CorePackages_0.Workspace.Packages.MockableProxyServices).Players;
local l_ReplicatedFirst_0 = require(l_CorePackages_0.Workspace.Packages.MockableProxyServices).ReplicatedFirst;
local l_RunService_0 = require(l_CorePackages_0.Workspace.Packages.MockableProxyServices).RunService;
local l_VRService_0 = require(l_CorePackages_0.Workspace.Packages.MockableProxyServices).VRService;
local l_SplashScreenManager_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).SplashScreenManager;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_game_0 = require(l_CorePackages_0.Workspace.Packages.MockableProxyServices).game;
local l_waitProxy_0 = require(l_CorePackages_0.Workspace.Packages.MockableProxyServices).waitProxy;
local l_settingsProxy_0 = require(l_CorePackages_0.Workspace.Packages.MockableProxyServices).settingsProxy;
game:DefineFastInt("FPSAwareSplashScreenTimeout", 30);
local v13 = require(l_CorePackages_0.UIBlox);
v13.init((require(l_Modules_0.UIBloxInGameConfig)));
local l_Constants_0 = v13.App.Style.Constants;
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
local l_Create_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("Common"):WaitForChild("Create"));
local v17 = require(l_Modules_0.LoadingScreen.LoadingScreen);
local v18 = require(l_Modules_0.LoadingScreen.Reducers.LoadingScreenReducer);
local v19 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v21 = (function()
    local v20 = l_Create_0("ScreenGui")({
        Name = "DevGUIBlackoutCurtain", 
        DisplayOrder = 8, 
        IgnoreGuiInset = true
    });
    l_Create_0("Frame")({
        Name = "BlackFrame", 
        BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
        BackgroundTransparency = 0, 
        Size = UDim2.fromScale(10, 10), 
        Position = UDim2.fromOffset(0, 0), 
        Active = true, 
        Parent = v20
    });
    v20.Parent = l_CoreGui_0;
    return v20;
end)();
local function _()
    if v21 then
        v21.Enabled = false;
        v21:Destroy();
        v21 = nil;
    end;
end;
local v23 = true;
local v24 = false;
local v25 = false;
local v26 = nil;
local v27 = nil;
local function v31(v28)
    v27 = require(l_CorePackages_0:WaitForChild("Roact"));
    local l_Rodux_0 = require(l_CorePackages_0:WaitForChild("Rodux"));
    local v30 = v27.mount(v27.createElement(require(l_CorePackages_0:WaitForChild("RoactRodux")).StoreProvider, {
        store = l_Rodux_0.Store.new(v18, {}, {
            l_Rodux_0.thunkMiddleware
        })
    }, {
        v27.createElement(l_UiModeStyleProvider_0, {
            style = {
                themeName = l_Constants_0.ThemeName.Dark, 
                fontName = l_Constants_0.FontName.Gotham
            }
        }, {
            loadingScreenUI = v27.createElement(v17, {
                placeId = v28
            })
        })
    }), l_CoreGui_0, "RobloxLoadingGUI");
    l_RunService_0.Heartbeat:Wait();
    v21.Enabled = false;
    return v30;
end;
local v32 = nil;
local function _()
    if v27 then
        l_waitProxy_0(0.6);
        if v32 ~= nil then
            v27.unmount(v32);
            v32 = nil;
        end;
    end;
end;
local function v36(v34)
    v23 = false;
    if v27 then
        l_waitProxy_0(0.6);
        if v32 ~= nil then
            v27.unmount(v32);
            v32 = nil;
        end;
    end;
    l_SplashScreenManager_0.initialize(v34 / 2, game:GetFastInt("FPSAwareSplashScreenTimeout"), v34);
    l_SplashScreenManager_0.addStatusChangeListener(function(v35)
        v23 = v35;
        if not (not v23 or not v26) then
            v26();
        end;
    end);
    v21.Enabled = true;
    require(l_RobloxGui_0.Modules.LoadingScreen3D).Parent = v21;
end;
local function _()
    if l_Players_0.CharacterAutoLoads then
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_0 then
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        if not l_LocalPlayer_0.Character then
            l_LocalPlayer_0.CharacterAdded:Wait();
        end;
    end;
end;
local function v43()
    if not l_game_0:IsLoaded() then
        local v39 = nil;
        do
            local l_v39_0 = v39;
            l_v39_0 = l_game_0.Loaded:Connect(function()
                l_v39_0:Disconnect();
                l_v39_0 = nil;
                if l_Players_0.CharacterAutoLoads then
                    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
                    if not l_LocalPlayer_1 then
                        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
                        l_LocalPlayer_1 = l_Players_0.LocalPlayer;
                    end;
                    if not l_LocalPlayer_1.Character then
                        l_LocalPlayer_1.CharacterAdded:Wait();
                    end;
                end;
                v24 = true;
                if v26 then
                    v26();
                end;
            end);
        end;
    else
        if l_Players_0.CharacterAutoLoads then
            local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
            if not l_LocalPlayer_2 then
                l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
                l_LocalPlayer_2 = l_Players_0.LocalPlayer;
            end;
            if not l_LocalPlayer_2.Character then
                l_LocalPlayer_2.CharacterAdded:Wait();
            end;
        end;
        v24 = true;
        if v26 then
            v26();
            return ;
        end;
    end;
end;
return function(v44, v45)
    if not l_VRService_0.VREnabled and not l_IsVRAppBuild_0() then
        l_VRService_0:GetPropertyChangedSignal("VREnabled"):Connect(function()
            if l_VRService_0.VREnabled then
                v36(v45);
            end;
        end);
        v32 = v31(v44);
    else
        v36(v45);
    end;
    v26 = function()
        if not l_VRService_0.VREnabled then
            if not (not v24 and not v25) then
                if v27 then
                    l_waitProxy_0(0.6);
                    if v32 ~= nil then
                        v27.unmount(v32);
                        v32 = nil;
                    end;
                end;
                if v21 then
                    v21.Enabled = false;
                    v21:Destroy();
                    v21 = nil;
                end;
                l_ReplicatedFirst_0:SetDefaultLoadingGuiRemoved();
                v19.default:logEventOnce("first_experience_interactive");
            end;
        elseif v23 or l_settingsProxy_0().Rendering.QualityLevel ~= Enum.QualityLevel.Automatic then
            if v21 then
                v21.Enabled = false;
                v21:Destroy();
                v21 = nil;
            end;
            l_ReplicatedFirst_0:SetDefaultLoadingGuiRemoved();
            v19.default:logEventOnce("first_experience_interactive");
            return ;
        end;
    end;
    l_ReplicatedFirst_0.FinishedReplicating:Connect(v43);
    if l_ReplicatedFirst_0:IsFinishedReplicating() then
        v43();
    end;
    l_ReplicatedFirst_0.RemoveDefaultLoadingGuiSignal:Connect(function()
        v25 = true;
        v26();
    end);
    if l_ReplicatedFirst_0:IsDefaultLoadingGuiRemoved() then
        v25 = true;
        v26();
    end;
end;
