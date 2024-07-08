local v0 = require(game:GetService("CorePackages").Roact);
local v1 = v0.Component:extend("PageObjectManagerProvider");
local v2 = v0.createContext(nil);
v1.render = function(v3)
    return v0.createElement(v2.Provider, {
        value = v3.props.pageObjectManager
    }, v3.props[v0.Children]);
end;
return {
    Provider = v1, 
    Consumer = v2.Consumer
};
