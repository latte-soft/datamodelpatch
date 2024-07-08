local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Constants);
local v2 = require(l_Modules_0.LuaApp.Thunks.ApiFetchAutocompleteGameSuggestion);
local v3 = require(l_Modules_0.LuaApp.Thunks.ApiFetchAutocompleteAvatarSuggestion);
return {
    Fetch = function(v4, v5, v6, v7)
        if v7 == v1.SearchTypes.Catalog then
            return v3.Fetch(v4, v5);
        else
            return v2.Fetch(v4, v5, v6);
        end;
    end, 
    GetFetchingStatus = function(v8, v9, v10)
        if v10 == v1.SearchTypes.Catalog then
            return v3.GetFetchingStatus(v8, v9);
        else
            return v2.GetFetchingStatus(v8, v9);
        end;
    end
};
