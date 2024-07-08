local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
game:DefineFastFlag("PCallModerationCheck", false);
local l_PCallModerationCheck_0 = game:GetFastFlag("PCallModerationCheck");
return function(v5)
    if v5.StatusCode == l_StatusCodes_0.FORBIDDEN then
        local v6 = nil;
        local v7 = nil;
        if not l_PCallModerationCheck_0 then
            v7 = l_HttpService_0:JSONDecode(v5.Body);
        else
            local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v5.Body);
            v6 = l_status_0;
            v7 = l_result_0;
            if not v6 then
                l_Logger_0:info("Failed to parse JSON error body for moderation");
                l_Logger_0:info(v5.Body);
                return false;
            end;
        end;
        local v10 = not not v7 and v7.errors or nil;
        if v10 == nil then
            return false;
        else
            for _, v12 in pairs(v10) do
                for v13, v14 in pairs(v12) do
                    if v13 == "message" and v14 == "User is moderated" then
                        return true;
                    end;
                end;
            end;
        end;
    end;
    return false;
end;
