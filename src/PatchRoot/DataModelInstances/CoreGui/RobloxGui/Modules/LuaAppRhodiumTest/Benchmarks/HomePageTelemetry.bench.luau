local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = require(l_CorePackages_0.Packages.Dev.JestGlobals3);
local v9 = require(l_CorePackages_0.Packages.Dev.JestBenchmark);
local v10 = require(l_CorePackages_0.Packages.Dev.TagUtils);
local l_waitUntil_0 = require(l_CorePackages_0.Workspace.Packages.TestUtils).waitUntil;
local v12 = require(l_Modules_0.LuaApp.TestHelpers.toBeVisible);
local v13 = require(l_Modules_0.LuaApp.TestHelpers.MockIXPService);
local v14 = require(l_Modules_0.LuaApp.TestHelpers.createRbxAnalyticsServiceMock);
local v15 = require(l_CorePackages_0.Packages.Dev.RecordPlayback);
local l_expect_0 = v8.expect;
local l_beforeAll_0 = v8.beforeAll;
local l_beforeEach_0 = v8.beforeEach;
local l_afterEach_0 = v8.afterEach;
local l_benchmark_0 = v9.benchmark;
local l_jest_0 = v8.jest;
local v22 = nil;
l_beforeAll_0(function()
    l_expect_0.extend({
        toBeVisible = v12
    });
    v22 = v15.createRecordPlayback({
        instanceParent = l_CoreGui_0.RobloxGui.Modules.HttpArtifacts, 
        fileSystemPath = "src/internal/HttpArtifacts/Modules/HttpArtifacts"
    });
end);
local v23 = nil;
l_beforeEach_0(function()
    l_jest_0.resetModules();
    l_jest_0.mock(l_Modules_0.LuaApp.Flags.GetFFlagInjectAnalyticsService, function()
        return function()
            return true;
        end;
    end);
    require(l_CorePackages_0.Packages.UIBlox).init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
    v3 = require(l_CorePackages_0.Packages.React);
    v4 = require(l_CorePackages_0.Packages.ReactRoblox);
    v5 = require(l_CorePackages_0.Packages.LuauPolyfill).Object;
    v6 = require(l_Modules_0.LuaApp.Components.UniversalApp);
    v7 = v4.act;
    v23 = Instance.new("Folder");
    v23.Name = "TestComponent";
    v23.Parent = l_CoreGui_0;
end);
l_afterEach_0(function()
    if v23 then
        v23:Destroy();
    end;
    v23 = nil;
end);
local function v31(v24, v25)
    local v26 = v14();
    v22(v24):ignoreMissingRequests():skipExistenceAssertion():execute(function(v27)
        local v28 = v3.createElement(v6, v5.assign({}, {
            appName = "LuaApp", 
            httpService = v27, 
            rbxAnalyticsService = v26, 
            ixpService = v13.new({}, {}, true)
        }, v25));
        local v29 = v4.createRoot(v23);
        v7(function()
            v29:render(v28);
        end);
        l_expect_0((l_waitUntil_0(function()
            v4.act(function()
                task.wait();
            end);
            local v30 = v10.getUnique("app-screen.home");
            return v30 ~= nil, v30;
        end, 6))).toBeVisible();
        v7(function()
            v29:unmount();
        end);
    end);
end;
l_benchmark_0("Testing-Home-Page-Initial-Mount", function()
    v31("universal-app-load-home-page");
end);
