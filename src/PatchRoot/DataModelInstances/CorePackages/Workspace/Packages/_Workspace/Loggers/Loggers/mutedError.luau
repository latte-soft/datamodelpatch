local l_Parent_0 = script:FindFirstAncestor("Loggers").Parent;
local v1 = require(l_Parent_0.RobloxAppEvents);
local l_FFlagDebugUnmuteLuaErrors_0 = require(l_Parent_0.SharedFlags).Debug.FFlagDebugUnmuteLuaErrors;
local function _()
    return game:GetService("RunService"):IsStudio();
end;
return function(v4, v5)
    if type(v4) ~= "string" then
        warn("mutedError: errorMessage should be a string");
        local l_status_0, _ = pcall(function()
            v4 = tostring(v4);
        end);
        if not l_status_0 then
            v4 = "mutedError";
        end;
    end;
    if not (l_FFlagDebugUnmuteLuaErrors_0 or game:GetService("RunService"):IsStudio()) and not _G.__TESTEZ_RUNNING_TEST__ then
        if type(v5) == "table" and type(v5.stacks) == "table" then
            table.insert(v5.stacks, debug.traceback());
        end;
        v1.ReportMutedError:fire(v4, debug.traceback(), script, v5);
    else
        error(v4);
    end;
end;
