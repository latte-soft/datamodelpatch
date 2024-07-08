local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
return function(v4, v5)
    local v6 = {
        AddFriendsPage = {}, 
        FriendsLandingPage = {}, 
        ShowMore = {}
    };
    if v4.uiMode == l_UiMode_0.TenFoot then
        v6.AddFriendsPage.GridViewItemMetrics = {
            minimumItemsPerRow = 6, 
            minimumItemWidth = 258
        };
        v6.AddFriendsPage.ItemMargin = v5.Global.Space_300;
        v6.AddFriendsPage.PagePaddingTop = v5.Global.Space_200;
        v6.ShowMore.ButtonWidth = 960;
        v6.ShowMore.ButtonHeight = v5.Global.Size_600;
        v6.FriendsLandingPage.GridViewItemMetrics = {
            minimumItemsPerRow = 6, 
            minimumItemWidth = 258
        };
        v6.FriendsLandingPage.GridHorizontalSpacing = v5.Global.Space_300;
        v6.FriendsLandingPage.GridVerticalSpacing = v5.Global.Space_300;
    end;
    return v6;
end;
