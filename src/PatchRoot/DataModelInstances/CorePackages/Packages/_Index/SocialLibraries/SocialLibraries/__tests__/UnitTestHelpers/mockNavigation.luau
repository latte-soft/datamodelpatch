local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_Roact_0 = v0.Roact;
local l_RoactNavigation_0 = v0.RoactNavigation;
local v3 = {
    state = {
        params = {}, 
        routeName = "", 
        key = ""
    }, 
    dispatch = function()
    end, 
    goBack = function()
    end, 
    addListener = function()
    end, 
    isFocused = function()
    end, 
    setParams = function()
    end, 
    getParam = function()
    end
};
return function(v4)
    return l_Roact_0.createElement(l_RoactNavigation_0.Provider, {
        value = v3
    }, {
        Element = v4
    });
end;
