local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_Modules_0.LuaApp.Thunks.Search.ApiFetchPlayerSearch);
local v6 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v9 = require(l_CorePackages_0.Packages.Dash);
local v10 = require(script.Parent.UserSearchResultsPageLayerExposure);
local v11 = require(script.Parent.PlayerSearchPage);
local function _(v12)
    return v4.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN <= utf8.len(v12);
end;
return v3.connect(function(v14, v15)
    local l_searchKeyword_0 = v15.searchParameters.searchKeyword;
    local v17 = not (v4.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN <= utf8.len(l_searchKeyword_0));
    return {
        screenSize = v14.ScreenSize, 
        usersSearchResult = v14.UsersSearchResults[l_searchKeyword_0], 
        searchWordLengthNotSupported = v17, 
        playerSearchStatus = not not v17 and l_RetrievalStatus_0.Done or v5.GetFetchingStatus(v14, l_searchKeyword_0), 
        wideMode = v14.FormFactor == l_FormFactor_0.WIDE
    };
end, function(v18)
    return {
        fetchPlayerSearch = function(v19, ...)
            return v18(v6(v5.Fetch(v19, ...)));
        end
    };
end)(function(v20)
    return v2.createElement(v10, {
        renderChild = function(v21)
            return v2.createElement(v11, v9.join(v21 or {}, v20 or {}));
        end
    });
end);
