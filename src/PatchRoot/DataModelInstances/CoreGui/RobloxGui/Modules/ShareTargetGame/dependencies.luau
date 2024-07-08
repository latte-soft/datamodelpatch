local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.LuaSocialLibrariesDeps);
local v3 = v2.SocialLibraries.config({});
local v4 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger:new("ShareTargetGame");
local v5 = require(l_CorePackages_0.Packages.HttpRequest);
return {
    Diag = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.Diag, 
    EventStream = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream, 
    Roact = require(l_CorePackages_0.Roact), 
    Rodux = require(l_CorePackages_0.Rodux), 
    RoactRodux = require(l_CorePackages_0.RoactRodux), 
    SocialLibraries = v3, 
    Text = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text, 
    UIBlox = require(l_CorePackages_0.UIBlox), 
    User = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel, 
    UniversalAppPolicy = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy, 
    withLocalization = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization, 
    LocalizationProvider = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider, 
    Promise = require(l_CorePackages_0.Promise), 
    request = v5.config({
        requestFunction = function(v6, v7, v8)
            v4:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v7, v6));
            return v5.requestFunctions.HttpRbxApi(v6, v7, v8);
        end
    }), 
    SharedFlags = require(l_CorePackages_0.Workspace.Packages.SharedFlags), 
    RoactServices = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices, 
    RoactLocalization = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.Services.RoactLocalization), 
    Mock = v2.Mock, 
    JestGlobals = require(l_CorePackages_0.JestGlobals)
};
