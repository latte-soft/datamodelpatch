local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local _ = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateBack);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AccountSettingsUpsell_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).AccountSettingsUpsell;
local v7 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v8 = require(l_script_FirstAncestor_0.LuaApp.Http.UrlBuilder);
local v9 = require(l_CorePackages_0.Cryo);
return function(v10)
    local v11 = l_useDispatch_0();
    return v2.createElement(l_AccountSettingsUpsell_0, (v9.Dictionary.join(v10 or {}, {
        openAccountSettings = function(v12)
            v11(v7({
                name = v3.GenericWebPage, 
                detail = v8.static.settings.account(), 
                extraProps = {
                    title = v12
                }
            }));
        end
    })));
end;
