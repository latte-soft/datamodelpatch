local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_DataModelPatchService_0 = game:GetService("DataModelPatchService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_BacktraceReporter_0 = require(l_CorePackages_0.Workspace.Packages.ErrorReporters).BacktraceReporter;
local l_SystemInfoProtocol_0 = require(l_CorePackages_0.Workspace.Packages.SystemInfoProtocol).SystemInfoProtocol;
local v11 = require(l_Modules_0.LuaApp.Util.safeCall);
local v12 = require(l_Modules_0.LuaApp.Enum.LocalStorageKey);
local l_OtaPatchName_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).OtaPatchName;
local l_OtaPackagesStatus_0 = require(l_CorePackages_0.Workspace.Packages.OtaPatchPackagesStatus).OtaPackagesStatus;
local l_game_FastString_0 = game:GetFastString("ErrorUploadToBacktraceLuaAppToken");
local v16 = require(script.Parent.LuaAppBacktraceLogger);
local l_game_EngineFeature_0 = game:GetEngineFeature("DataModelPatchServiceHasGetVersion");
local v18 = game:DefineFastFlag("LuaAppBacktraceReportDiscovery", false);
local l_FFlagLuaAppShowOtaPackagesLoaded_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppShowOtaPackagesLoaded;
local v20 = nil;
local function _()
    return v11(function()
        local v21 = {
            AppVersion = l_RunService_0:GetRobloxVersion(), 
            UserAgent = l_HttpService_0:GetUserAgent(), 
            BaseUrl = l_ContentProvider_0.BaseUrl, 
            WindowsLaunchType = l_MemStorageService_0:GetItem("Backtrace.WindowsLaunchType"), 
            CoreScriptVersion = l_RunService_0:GetCoreScriptVersion(), 
            AppInstallationId = l_AppStorageService_0:GetItem(v12.AppInstallationId), 
            RobloxChannel = l_RunService_0:GetRobloxClientChannel()
        };
        local l_status_0, l_result_0 = pcall(function()
            return l_SystemInfoProtocol_0.default:getSystemInfo(l_SystemInfoProtocol_0.ALL_INFO_NAMES);
        end);
        if l_status_0 and typeof(l_result_0) == "table" then
            for v24, v25 in pairs(l_result_0) do
                v21[v24] = v25;
            end;
        end;
        return v21;
    end, {});
end;
return (l_BacktraceReporter_0.new({
    httpService = l_HttpService_0, 
    token = l_game_FastString_0, 
    processErrorReportMethod = function(v27)
        if not v20 then
            v20 = v11(function()
                local v28 = {
                    AppVersion = l_RunService_0:GetRobloxVersion(), 
                    UserAgent = l_HttpService_0:GetUserAgent(), 
                    BaseUrl = l_ContentProvider_0.BaseUrl, 
                    WindowsLaunchType = l_MemStorageService_0:GetItem("Backtrace.WindowsLaunchType"), 
                    CoreScriptVersion = l_RunService_0:GetCoreScriptVersion(), 
                    AppInstallationId = l_AppStorageService_0:GetItem(v12.AppInstallationId), 
                    RobloxChannel = l_RunService_0:GetRobloxClientChannel()
                };
                local l_status_1, l_result_1 = pcall(function()
                    return l_SystemInfoProtocol_0.default:getSystemInfo(l_SystemInfoProtocol_0.ALL_INFO_NAMES);
                end);
                if l_status_1 and typeof(l_result_1) == "table" then
                    for v31, v32 in pairs(l_result_1) do
                        v28[v31] = v32;
                    end;
                end;
                return v28;
            end, {});
        end;
        v27:addAttributes({
            AppRunningTime = string.format("%.02f", elapsedTime())
        });
        v27:addAttributes(v20);
        if not (not v18 or not l_game_EngineFeature_0) then
            local l_status_2, l_result_2 = pcall(function()
                return l_DataModelPatchService_0:GetLuaVersion(l_OtaPatchName_0.DiscoveryOta);
            end);
            if not (not l_status_2 or not l_result_2) then
                v27:addAttributes({
                    DiscoveryScriptVersion = l_result_2
                });
            end;
            if l_FFlagLuaAppShowOtaPackagesLoaded_0 then
                local l_status_3, l_result_3 = pcall(function()
                    return l_OtaPackagesStatus_0.AllPatchPackagesLoaded(l_OtaPatchName_0.DiscoveryOta);
                end);
                if not (not l_status_3 or not l_result_3) then
                    v27:addAttributes({
                        DiscoveryScriptLoaded = l_result_3
                    });
                end;
            end;
        end;
        return v27;
    end, 
    generateLogMethod = function()
        return v16:generateAppLog();
    end
}));
