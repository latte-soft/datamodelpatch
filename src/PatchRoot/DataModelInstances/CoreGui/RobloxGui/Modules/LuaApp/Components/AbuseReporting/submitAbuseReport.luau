local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.HttpRequest);
local v3 = require(l_CorePackages_0.Packages.RoduxNetworking);
local _ = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v5 = require(l_Modules_0.LuaApp.Components.AbuseReporting.constructAbuseReportTags);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
return function(v8, v9, v10, v11)
    local v12 = v3.config({
        keyPath = "AbuseReporting", 
        networkImpl = v2.config({
            requestFunction = v2.requestFunctions.HttpRbxApi, 
            maxWaitTime = 3, 
            maxRetryCount = 2
        })
    });
    local v13 = {
        safetyEvent = {
            tags = v5(v8, v10, v11)
        }
    };
    return v12.POST({
        Name = "SubmitAbuseReport"
    }, function(v14)
        return v14(v9):body(v13);
    end).API();
end;
