local l_CorePackages_0 = game:GetService("CorePackages");
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_CorePackages_0.Packages.React);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
return function(v6)
    return function(v7)
        return v4.createElement(v6, v3.join(v7, {
            designTokens = l_useDesignTokens_0(function(v8)
                local v9 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
                local v10 = not v9 and 0 or v8.Global.Space_500;
                local v11 = not v9 and 0 or v8.Global.Space_800;
                return {
                    topPadding = v10, 
                    leftPadding = v11, 
                    bottomPadding = not v9 and 0 or -(v10 + v8.Global.Space_500), 
                    rightPadding = not v9 and 0 or -2 * v11
                };
            end)
        }));
    end;
end;
