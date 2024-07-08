local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Components.Search.SearchPage);
local v6 = require(l_Modules_0.LuaApp.Components.Search.TenFootUi.TenFootUiSearch);
return function(v7)
    return v1.createElement(if not (l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot) then v5 else v6, v7);
end;
