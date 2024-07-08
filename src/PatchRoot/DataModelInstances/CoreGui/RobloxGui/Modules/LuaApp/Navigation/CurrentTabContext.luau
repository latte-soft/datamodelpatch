local l_CorePackages_0 = game:GetService("CorePackages");
if not require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph then
    local v1 = require(l_CorePackages_0.Cryo);
    local v2 = require(l_CorePackages_0.Roact);
    local v3 = v2.createContext(nil);
    return {
        Consumer = v3.Consumer, 
        Provider = v3.Provider, 
        withCurrentTab = function(v4)
            return function(v5)
                return v2.createElement(v3.Consumer, {
                    render = function(v6)
                        return v2.createElement(v4, (v1.Dictionary.join({
                            currentTab = v6
                        }, v5)));
                    end
                });
            end;
        end
    };
else
    return require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).CurrentTabContext;
end;
