local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local _ = require(l_CorePackages_0.Packages.ReactOtter);
return function(v5, v6)
    local l_Space_300_0 = v6.Global.Space_300;
    local l_Space_300_1 = v6.Global.Space_300;
    local l_Space_600_0 = v6.Global.Space_600;
    local v10 = {
        layoutPadding = 26, 
        topMargin = 0, 
        bottomMargin = 26
    };
    local v11 = {
        dampingRatio = 1, 
        frequency = 3
    };
    if v5.uiMode == l_UiMode_0.TenFoot then
        l_Space_300_0 = v6.Global.Space_400;
        l_Space_300_1 = v6.Global.Space_300 + v6.Global.Space_200;
        l_Space_600_0 = v6.Global.Space_400;
        v10.layoutPadding = l_Space_300_0;
        v10.topMargin = l_Space_300_1;
        v10.bottomMargin = l_Space_600_0;
    end;
    return {
        getLayoutSpacing = function(v12)
            if not v12 then
                return {
                    layoutPadding = l_Space_300_0, 
                    topMargin = l_Space_300_1, 
                    bottomMargin = l_Space_600_0
                };
            else
                return v10;
            end;
        end, 
        trailingWhitespace = 1000, 
        animationConfig = v11, 
        scrollBarThickness = 0
    };
end;
