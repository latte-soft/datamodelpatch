local l_LocalizationService_0 = game:GetService("LocalizationService");
local v1 = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck);
local v2 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Analytics.Events.SearchEventUtil);
return function(v3, v4, v5, v6, v7, v8)
    v1.isType(v4, "string", "eventContext");
    v1.isType(v5, "string", "kwd");
    v1.isType(v7, "string", "page");
    local v9 = 0;
    if v6 == true then
        v9 = 1;
    end;
    local v10 = "";
    if v8 then
        v10 = v2.convertSuggestionsToString(v8);
    end;
    v3:sendEventDeferred(v4, "catalogSearch", {
        locale = l_LocalizationService_0.RobloxLocaleId, 
        kwd = v5, 
        autoCompleteFlag = v9, 
        previousPage = v7, 
        suggestions = v10
    });
end;
