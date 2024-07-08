local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_withGridConfig_DEPRECATED_0 = require(l_CorePackages_0.UIBlox).Core.Layout.Grid.withGridConfig_DEPRECATED;
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local v5 = require(script.Parent.TopBarContentFrame);
local function v10(v6, _)
    local l_topBarHeight_0 = v6.topBarHeight;
    local v9 = table.clone(v6);
    v9.heightOffset = l_topBarHeight_0;
    v9.topBarHeight = nil;
    return v1.createElement(v5, v9);
end;
return (v2.connect(function(v11, _)
    return {
        topBarHeight = v11.TopBar.topBarHeight
    };
end, nil)(function(v13)
    return l_withGridConfig_DEPRECATED_0({
        [l_LayoutConfig_0.Keys.PaddingVertical] = 0
    }, l_LayoutConfig_0.Kind)(function(v14)
        return v10(v13, v14);
    end);
end));
