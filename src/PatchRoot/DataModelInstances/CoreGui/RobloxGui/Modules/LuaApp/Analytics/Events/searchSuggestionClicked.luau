local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.SearchEventUtil);
return function(v5, v6, v7, v8, v9, v10, v11)
    v3.isType(v6, "string", "eventContext");
    v3.isType(v7, "string", "kwd");
    v3.isType(v8, "string", "searchType");
    v3.isType(v9, "table", "entries");
    v3.isType(v10, "number", "clickedPos");
    v3.isType(v11, "table", "clickedEntry");
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v13 = v4.getSuggestionNameTypeStrings(v11);
    v5:setRBXEventStream(v6, "searchSuggestionClicked", {
        locale = l_RobloxLocaleId_0, 
        kwd = v7, 
        searchType = v8, 
        suggestions = v4.convertSuggestionsToString(v9), 
        suggestionPosition = v10, 
        suggestionClicked = v13.name, 
        suggestionType = v13.type, 
        maxResults = #v9
    });
end;
