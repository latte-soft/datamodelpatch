local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactNavigation);
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
    end, 
    replace = function()
    end, 
    push = function()
    end
};
return function(v4)
    return v1.createElement(v2.Provider, {
        value = v3
    }, {
        Element = v4
    });
end;
