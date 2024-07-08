local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_ResponsiveLayoutProvider_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Layout.Responsive.ResponsiveLayoutProvider;
local v8 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v9 = require(l_Modules_0.LuaApp.Common.makeGridSettingsConfig);
return function(v10)
    local v11 = l_useDesignTokens_0();
    local v13 = v8(function(v12)
        return v12.useGridPageLayout();
    end);
    return v2.createElement(l_ResponsiveLayoutProvider_0, {
        width = l_useSelector_0(function(v14)
            if not v14.ScreenSize then
                return nil;
            else
                return v14.ScreenSize.X;
            end;
        end), 
        config = v2.useMemo(function()
            if v13 then
                return v10.config or v9(v11);
            else
                return {};
            end;
        end, l_dependencyArray_0(v10.config, v13, v11))
    }, v10.children);
end;
