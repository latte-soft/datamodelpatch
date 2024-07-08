local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_IconTabGroup_0 = v3.App.Navigation.PrimaryNavBar.IconTabGroup;
local l_Images_0 = v3.App.ImageSet.Images;
return function(v9)
    local l_layoutOrder_0 = v9.layoutOrder;
    local l_searchType_0 = v9.searchType;
    local l_onSearchTypeSelected_0 = v9.onSearchTypeSelected;
    local v13 = l_useDesignTokens_0();
    local v14 = v6({
        games = "CommonUI.Features.Label.Game", 
        players = "CommonUI.Features.Label.Players"
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(v13.LuaApps.Search.SearchHeadingScale, 0, 0, 0), 
        Position = UDim2.fromScale(1 - v13.LuaApps.Search.SearchHeadingScale, 0), 
        LayoutOrder = l_layoutOrder_0, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v13.LuaApps.Search.SearchTypePaddingVertical), 
            PaddingBottom = UDim.new(0, v13.LuaApps.Search.SearchTypePaddingVertical)
        }), 
        SearchTypeSelector = v2.createElement(l_IconTabGroup_0, {
            items = {
                {
                    title = v14.games, 
                    icon = l_Images_0["icons/common/play"], 
                    onActivated = function()
                        l_onSearchTypeSelected_0(v5.SearchTypes.Games);
                    end, 
                    showRoundedBackground = l_searchType_0 == v5.SearchTypes.Games
                }, 
                {
                    title = v14.players, 
                    icon = l_Images_0["icons/menu/profile"], 
                    onActivated = function()
                        l_onSearchTypeSelected_0(v5.SearchTypes.Players);
                    end, 
                    showRoundedBackground = l_searchType_0 == v5.SearchTypes.Players
                }
            }
        })
    });
end;
