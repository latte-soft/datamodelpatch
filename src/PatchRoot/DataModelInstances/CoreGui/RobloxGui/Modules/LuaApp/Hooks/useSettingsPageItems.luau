local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v5 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v7 = require(l_Modules_0.LuaApp.Components.More.Settings.MorePageSettings);
return function(v8)
    local v10 = v4(function(v9)
        return v8 or v9.getSettingsPageType();
    end);
    local v12 = v4(function(v11)
        return v11.getAllowPlatformAccountSwitching();
    end);
    local v13 = v5.useUiModeInfo().uiMode == l_UiMode_0.TenFoot;
    local v14 = v3.useMemo(function()
        return {
            [v7.ItemType.Settings_SwitchProfileSection] = v12
        };
    end, {
        v12
    });
    return v3.useMemo(function()
        return (v2.map(v2.map(v7.GetItemsInPage(v10), function(v15)
            return v15.contents;
        end), function(v16)
            return v2.filter(v16, function(v17)
                if not v13 then
                    return v14[v17.itemType] ~= false;
                else
                    return v14[v17.itemInfo.itemType] ~= false;
                end;
            end);
        end));
    end, {
        v10, 
        v13, 
        v14
    });
end;
