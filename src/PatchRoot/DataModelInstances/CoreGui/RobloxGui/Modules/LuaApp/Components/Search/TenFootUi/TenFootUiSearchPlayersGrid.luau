local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v4 = require(l_Modules_0.LuaApp.Components.Players.PlayerSearch);
local v5 = require(l_Modules_0.LuaApp.Constants);
return function(v6)
    local l_searchKeyword_0 = v6.searchKeyword;
    local l_layoutOrder_0 = v6.layoutOrder;
    local l_searchType_0 = v6.searchType;
    local l_SearchBoxAndTypeOffset_0 = l_useDesignTokens_0().LuaApps.Search.SearchBoxAndTypeOffset;
    if l_searchType_0 ~= v5.SearchTypes.Players then
        return v2.createElement(v2.Fragment, nil, {});
    else
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
            LayoutOrder = l_layoutOrder_0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            ["PlayerSearch_" .. l_searchKeyword_0] = v2.createElement(v4, {
                enableRecommendationsSearchContext = false, 
                backgroundTransparency = 1, 
                enableNewEmptySearchUI = false, 
                searchParameters = {
                    searchKeyword = l_searchKeyword_0, 
                    isKeywordSuggestionEnabled = true
                }
            })
        });
    end;
end;
