local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.t);
local l_FitFrameVertical_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v6 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v7 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v8 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v9 = require(l_CorePackages_0.UIBlox);
local l_ShimmerPanel_0 = v9.App.Loading.ShimmerPanel;
local l_StatWidget_0 = v9.App.Indicator.StatWidget;
local v12 = v9.App.ImageSet.Images["icons/actions/favoriteOn"];
local v13 = v6.wrap(v3.strictInterface({
    favoritesCount = v3.optional(v3.integer), 
    listPadding = v3.optional(v3.integer), 
    width = v3.optional(v3.number), 
    Position = v3.optional(v3.UDim2), 
    LayoutOrder = v3.optional(v3.integer)
}));
return function(v14)
    assert(v13(v14));
    local v15 = v14.LayoutOrder or 0;
    local v16 = v14.Position or UDim2.new(0, 0, 0, 0);
    local v17 = v14.width or 0;
    local v18 = v14.listPadding or 10;
    local l_favoritesCount_0 = v14.favoritesCount;
    local v20 = v7(v8);
    if l_favoritesCount_0 then
        return v2.createElement("Frame", {
            Size = UDim2.new(0, v17, 0, 70), 
            Position = v16, 
            LayoutOrder = v15, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            ItemStatisticsSection = v2.createElement(l_FitFrameVertical_0, {
                width = UDim.new(0, v17), 
                contentPadding = UDim.new(0, v18), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                LayoutOrder = 0, 
                Position = UDim2.new(0, 0, 0.5, 0)
            }, {
                FavoritesSection = v2.createElement(l_StatWidget_0, {
                    icon = v12, 
                    countText = l_NumberLocalization_0.abbreviate(l_favoritesCount_0, v20:GetLocale()), 
                    labelText = v20:Format("Feature.Catalog.Label.Favorites"), 
                    size = UDim2.new(0, v17 - v18 * 2, 1, 0), 
                    layoutOrder = 0
                })
            })
        });
    else
        return v2.createElement(l_ShimmerPanel_0, {
            Position = v16, 
            Size = UDim2.new(0, v17, 0, 70), 
            LayoutOrder = v15
        });
    end;
end;
