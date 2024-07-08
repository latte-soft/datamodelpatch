local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.Common.Signal);
local v5 = v3.Component:extend("TopBarSearchSignalProvider");
local v6 = v3.createContext(nil);
v5.init = function(v7)
    v7.signal = v4.new();
end;
v5.render = function(v8)
    return v3.createElement(v6.Provider, {
        value = v8.signal
    }, v8.props[v3.Children]);
end;
return {
    Provider = v5, 
    Consumer = v6.Consumer
};
