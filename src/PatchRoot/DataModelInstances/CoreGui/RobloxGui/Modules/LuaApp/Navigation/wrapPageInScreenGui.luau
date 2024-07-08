local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.LuaApp.Navigation.RNAdapterScreenWrap);
local l_FFlagUnifyNavigationGraph_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph;
return function(v6, v7, v8, v9)
    if not l_FFlagUnifyNavigationGraph_0 then
        return v3.createElement(v4, {
            component = v6, 
            pageType = v7, 
            isVisible = v8.isVisible, 
            DisplayOrder = v8.displayOrder, 
            props = v9
        });
    else
        return v3.createElement(v6, v9);
    end;
end;
