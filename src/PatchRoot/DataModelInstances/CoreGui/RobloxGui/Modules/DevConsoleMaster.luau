local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.Rodux);
local v8 = require(l_CorePackages_0.RoactRodux);
local l_DevConsole_0 = script.Parent.DevConsole;
local v10 = require(l_DevConsole_0.Constants);
local l_Components_0 = l_DevConsole_0.Components;
local v12 = require(l_Components_0.DevConsoleWindow);
local v13 = require(l_Components_0.DataProvider);
local v14 = require(l_Components_0.Log.MainViewLog);
local v15 = require(l_Components_0.Memory.MainViewMemory);
local v16 = require(l_Components_0.Network.MainViewNetwork);
local v17 = require(l_Components_0.Scripts.MainViewScripts);
local v18 = require(l_Components_0.DataStores.MainViewDataStores);
local v19 = require(l_Components_0.ServerStats.MainViewServerStats);
local v20 = require(l_Components_0.ActionBindings.MainViewActionBindings);
local v21 = require(l_Components_0.ServerJobs.MainViewServerJobs);
local v22 = require(l_Components_0.MicroProfiler.MainViewMicroProfiler);
local v23 = require(l_Components_0.ScriptProfiler.MainViewScriptProfiler);
local v24 = require(l_Components_0.DebugVisualizations.MainViewDebugVisualizations);
local v25 = require(l_Components_0.LuauHeap.MainViewLuauHeap);
local v26 = require(l_Components_0.MicroProfiler.RCCProfilerDataCompleteListener);
local v27 = require(l_DevConsole_0.Util.getClientReplicator);
local v28 = require(l_DevConsole_0.Reducers.MainView);
local v29 = require(l_DevConsole_0.Reducers.DevConsoleReducer);
local l_Actions_0 = l_DevConsole_0.Actions;
local v31 = require(l_Actions_0.SetDevConsoleVisibility);
local v32 = require(l_Actions_0.SetTabList);
local v33 = require(l_DevConsole_0.MiddleWare.DevConsoleAnalytics);
local v34 = require(l_CoreGui_0.RobloxGui.Modules.PlayerPermissionsModule);
local l_game_EngineFeature_0 = game:GetEngineFeature("ScriptProfiler");
local v36 = require(l_CoreGui_0.RobloxGui.Modules.Flags.GetFFlagRequestServerStatsFix);
local v37 = {
    Log = {
        tab = v14, 
        layoutOrder = 1, 
        hasClientServer = true
    }, 
    Memory = {
        tab = v15, 
        layoutOrder = 2, 
        hasClientServer = true
    }, 
    Network = {
        tab = v16, 
        layoutOrder = 3, 
        hasClientServer = true
    }, 
    Scripts = {
        tab = v17, 
        layoutOrder = 4
    }, 
    DataStores = {
        tab = v18, 
        layoutOrder = 5
    }, 
    ServerStats = {
        tab = v19, 
        layoutOrder = 6
    }, 
    ActionBindings = {
        tab = v20, 
        layoutOrder = 7
    }, 
    ServerJobs = {
        tab = v21, 
        layoutOrder = 8
    }, 
    MicroProfiler = {
        tab = v22, 
        layoutOrder = 9
    }, 
    DebugVisualizations = {
        tab = v24, 
        layoutOrder = 10
    }, 
    ScriptProfiler = if not l_game_EngineFeature_0 then nil else {
        tab = v23, 
        layoutOrder = 11
    }, 
    LuauHeap = {
        tab = v25, 
        layoutOrder = 12
    }
};
local v38 = {
    Log = {
        tab = v14, 
        layoutOrder = 1
    }, 
    Memory = {
        tab = v15, 
        layoutOrder = 2
    }, 
    ScriptProfiler = if not l_game_EngineFeature_0 then nil else {
        tab = v23, 
        layoutOrder = 3
    }, 
    LuauHeap = {
        tab = v25, 
        layoutOrder = 4
    }
};
local v39 = {
    Log = {
        tab = v14, 
        layoutOrder = 1
    }, 
    Memory = {
        tab = v15, 
        layoutOrder = 2
    }
};
local v40 = {};
v40.__index = v40;
local v41 = {
    [Enum.Platform.Windows] = v10.FormFactor.Large, 
    [Enum.Platform.OSX] = v10.FormFactor.Large, 
    [Enum.Platform.IOS] = v10.FormFactor.Small, 
    [Enum.Platform.Android] = v10.FormFactor.Small, 
    [Enum.Platform.XBoxOne] = v10.FormFactor.Console, 
    [Enum.Platform.PS4] = v10.FormFactor.Console, 
    [Enum.Platform.PS3] = v10.FormFactor.Console, 
    [Enum.Platform.XBox360] = v10.FormFactor.Console, 
    [Enum.Platform.WiiU] = v10.FormFactor.Console, 
    [Enum.Platform.NX] = v10.FormFactor.Console, 
    [Enum.Platform.Ouya] = v10.FormFactor.Console, 
    [Enum.Platform.AndroidTV] = v10.FormFactor.Console, 
    [Enum.Platform.Chromecast] = v10.FormFactor.Console, 
    [Enum.Platform.Linux] = v10.FormFactor.Large, 
    [Enum.Platform.SteamOS] = v10.FormFactor.Console, 
    [Enum.Platform.WebOS] = v10.FormFactor.Large, 
    [Enum.Platform.DOS] = v10.FormFactor.Large, 
    [Enum.Platform.BeOS] = v10.FormFactor.Large, 
    [Enum.Platform.UWP] = v10.FormFactor.Large, 
    [Enum.Platform.None] = v10.FormFactor.Large
};
local function _()
    return v34.IsPlayerAdminAsync(l_Players_0.LocalPlayer);
end;
local function _()
    if not l_RunService_0:IsStudio() then
        if not v34.CanPlayerManagePlaceAsync(l_Players_0.LocalPlayer) then
            return false;
        else
            return true;
        end;
    else
        return true;
    end;
end;
v40.new = function()
    local v44 = {};
    setmetatable(v44, v40);
    v44.init = false;
    v44.isDeveloperTabListActive = false;
    v44.waitForStart = true;
    v44.waitForStartBindable = Instance.new("BindableEvent");
    coroutine.wrap(function()
        v44:SetupDevConsole();
    end)();
    return v44;
end;
v40.SetupDevConsole = function(v45)
    local v46 = v41[l_UserInputService_0:GetPlatform()];
    v45.store = v7.Store.new(v29, {
        MainView = v28(nil, v32(v39, "Log"))
    }, {
        v33
    });
    v45.root = v6.createElement(v8.StoreProvider, {
        store = v45.store
    }, {
        DataProvider = v6.createElement(v13, {
            isDeveloperView = false
        }, {
            App = v6.createElement("ScreenGui", {
                OnTopOfCoreBlur = true, 
                DisplayOrder = 10
            }, {
                DevConsoleWindow = v6.createElement(v12, {
                    formFactor = v46, 
                    isDeveloperView = false, 
                    isVisible = v45.store:getState().DisplayOptions.isVisible, 
                    isMinimized = false, 
                    position = v10.MainWindowInit.Position, 
                    size = v10.MainWindowInit.Size, 
                    tabList = v39, 
                    onCloseCallback = function(v47)
                        v45:SetServerStatsConnection(v47);
                    end
                }), 
                RCCProfilerDataCompleteListener = v6.createElement(v26)
            })
        })
    });
    v45.waitForStart = false;
    v45.waitForStartBindable:Fire();
end;
local v48 = v40.new();
v40.Start = function(v49)
    if not v49.init then
        if v49.waitForStart then
            v49.waitForStartBindable.Event:Wait();
        end;
        v49.init = true;
        v49.element = v6.mount(v49.root, l_CoreGui_0, "DevConsoleMaster");
        local v50 = v27();
        task.spawn(function()
            if not (not v34.IsPlayerAdminAsync(l_Players_0.LocalPlayer) or v49.isDeveloperTabListActive) then
                v49.store:dispatch(v32(v38, "Log", false));
            end;
        end);
        if v50 then
            v49._statsConnector = v50.StatsReceived:connect(function(_)
                if v49._statsConnector then
                    v49._statsConnector:Disconnect();
                    v49._statsConnector = nil;
                    v49.isDeveloperTabListActive = true;
                    v49.store:dispatch(v32(v37, "Log", true));
                    return ;
                else
                    return ;
                end;
            end);
            if not v36() then
                v50:RequestServerStats(true);
            else
                v49:SetServerStatsConnection(true);
                return ;
            end;
        end;
    end;
end;
v40.ToggleVisibility = function(v52)
    if not v52.init then
        v48:Start();
    end;
    local v53 = not v52.store:getState().DisplayOptions.isVisible;
    if not v36() then
        v52.store:dispatch(v31(v53));
        return ;
    else
        v52:SetVisibility(v53);
        return ;
    end;
end;
v40.GetVisibility = function(v54)
    if v54.init then
        local v55 = v54.store:getState();
        if not v55 or not v55.DisplayOptions then
            return false;
        else
            return v55.DisplayOptions.isVisible and not v55.DisplayOptions.isMinimized;
        end;
    else
        return false;
    end;
end;
v40.SetServerStatsConnection = function(_, v57)
    local v58 = v27();
    if v58 then
        v58:RequestServerStats(v57);
    end;
end;
v40.SetVisibility = function(v59, v60)
    if type(v60) == "boolean" then
        if not (v59.init or not v60) then
            v48:Start();
        end;
        if v36() then
            v59:SetServerStatsConnection(v60);
        end;
        v59.store:dispatch(v31(v60));
    end;
end;
l_StarterGui_0:RegisterGetCore("DevConsoleVisible", function()
    return v48:GetVisibility();
end);
l_StarterGui_0:RegisterSetCore("DevConsoleVisible", function(v61)
    if type(v61) ~= "boolean" then
        error("DevConsoleVisible must be given a boolean value.");
    end;
    v48:SetVisibility(v61);
end);
return v48;
