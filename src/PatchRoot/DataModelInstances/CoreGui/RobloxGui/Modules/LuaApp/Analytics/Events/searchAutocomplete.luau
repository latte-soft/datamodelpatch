local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.SearchEventUtil);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAutocompleteDebounceMs);
return function(v6, v7, v8, v9, v10, v11, v12, v13)
    if v8 == v9 then
        return ;
    else
        v3.isType(v7, "string", "eventContext");
        v3.isType(v8, "string", "kwd");
        v3.isType(v9, "string", "prevKwd");
        v3.isType(v10, "table", "suggestion");
        v3.isType(v11, "string", "page");
        v6:setRBXEventStream(v7, "searchAutocomplete", {
            locale = l_LocalizationService_0.RobloxLocaleId, 
            suggestions = v4.convertSuggestionsToString(v10.entries), 
            kwd = v8, 
            prevKwd = v9, 
            page = v11, 
            latency = v12, 
            fromLocalCache = v13, 
            algorithm = v10.algorithmName, 
            timeoutDelayMs = v5()
        });
        return ;
    end;
end;
