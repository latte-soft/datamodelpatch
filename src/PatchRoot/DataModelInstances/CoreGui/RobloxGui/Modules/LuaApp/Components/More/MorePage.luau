local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.More.MorePageGridLayout);
local v4 = require(l_Modules_0.LuaApp.Components.More.MorePageCarouselLayout);
local l_MorePageLayout_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).Enum.MorePageLayout;
local v6 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
return function()
    if not v6(function(v7)
        return v7.getMorePageLayout() == l_MorePageLayout_0.Carousel;
    end) then
        return v2.createElement(v3);
    else
        return v2.createElement(v4);
    end;
end;
