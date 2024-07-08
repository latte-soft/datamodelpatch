local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
return function(v4, v5)
    local v6 = {
        buttonTextSize = v5.Global.FontSize_200, 
        buttonWidth = 360, 
        buttonHeight = 48, 
        contentPadding = 20
    };
    if v4.uiMode == l_UiMode_0.TenFoot then
        v6.buttonWidth = 846;
        v6.buttonHeight = v5.Global.Size_600;
        v6.contentPadding = v5.Global.Size_400;
    end;
    return v6;
end;
