local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Platform_0 = game:GetService("UserInputService"):GetPlatform();
local l_FStringLuaAppEphemeralCounterPrefix_0 = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FStringLuaAppEphemeralCounterPrefix;
return function(v3, v4)
    pcall(function()
        assert(type(v3) == "string", "Expected counterName to be a string");
        v3 = v3 or "";
        v4 = v4 or 1;
        if l_Platform_0 == Enum.Platform.Android then
            v3 = "Android-" .. tostring(v3);
        elseif l_Platform_0 == Enum.Platform.IOS then
            v3 = "iOS-" .. tostring(v3);
        elseif l_Platform_0 == Enum.Platform.Windows then
            v3 = "Win32-" .. tostring(v3);
        elseif l_Platform_0 == Enum.Platform.UWP then
            v3 = "UWP-" .. tostring(v3);
        elseif l_Platform_0 == Enum.Platform.OSX then
            v3 = "Mac-" .. tostring(v3);
        elseif l_FStringLuaAppEphemeralCounterPrefix_0 ~= "" then
            v3 = l_FStringLuaAppEphemeralCounterPrefix_0 .. tostring(v3);
        end;
        l_RbxAnalyticsService_0:ReportCounter(v3, v4);
    end);
end;
