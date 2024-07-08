local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
return function(v4, v5)
    return {
        BackgroundTransparency = if v4.uiMode == l_UiMode_0.TenFoot then v5.Global.Opacity_0 else v5.Global.Opacity_100
    };
end;
