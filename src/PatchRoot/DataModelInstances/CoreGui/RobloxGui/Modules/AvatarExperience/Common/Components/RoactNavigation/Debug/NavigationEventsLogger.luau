local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_NavigationEvents_0 = require(l_CorePackages_0.RoactNavigation).NavigationEvents;
local l_useRouteName_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useRouteName;
local v5 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.rn.events");
if v5.active[v5.Levels.Debug] then
    return function()
        local v6 = l_useRouteName_0();
        local function _(v7)
            v5:debug("[{}] {}", v6, v7);
        end;
        v2.useEffect(function()
            v5:debug("[{}] {}", v6, "didMount");
            return function()
                v5:debug("[{}] {}", v6, "willUnmount");
            end;
        end, {});
        return v2.createElement(l_NavigationEvents_0, {
            onWillFocus = function()
                v5:debug("[{}] {}", v6, "onWillFocus");
            end, 
            onWillBlur = function()
                v5:debug("[{}] {}", v6, "onWillBlur");
            end, 
            onDidFocus = function()
                v5:debug("[{}] {}", v6, "onDidFocus");
            end, 
            onDidBlur = function()
                v5:debug("[{}] {}", v6, "onDidBlur");
            end
        });
    end;
else
    return function()
    end;
end;
