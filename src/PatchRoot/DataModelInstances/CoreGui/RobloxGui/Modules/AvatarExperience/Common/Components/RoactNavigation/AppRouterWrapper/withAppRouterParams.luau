local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AppRouterParamsContext);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v6 = require(l_Modules_0.LuaApp.Navigation.isRootRouteInRN);
return function(v7)
    local v8 = v3.PureComponent:extend("AppRouterParams");
    v8.init = function(v9)
        local l_navigation_0 = v9.props.navigation;
        if not (not v6(v5.getRootNavigation(l_navigation_0).state) or not v9.props.params) then
            l_navigation_0.setParams(v9.props.params);
        end;
    end;
    v8.render = function(v11)
        if v11.props.navigation.state.params == nil then
            return nil;
        else
            return v3.createElement(v7, v2.Dictionary.join(v11.props, {
                params = v2.None
            }));
        end;
    end;
    return function(v12)
        return v3.createElement(v4.Consumer, {
            render = function(v13)
                if v13.setNavigationForTests then
                    v13.setNavigationForTests(v12.navigation);
                    v13 = v2.Dictionary.join(v13, {
                        setNavigationForTests = v2.None
                    });
                end;
                return v3.createElement(v8, (v2.Dictionary.join(v12, {
                    params = v13
                })));
            end
        });
    end;
end;
