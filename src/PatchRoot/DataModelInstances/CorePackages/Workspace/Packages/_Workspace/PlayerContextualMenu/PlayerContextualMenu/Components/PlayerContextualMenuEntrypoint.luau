local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerContextualMenu");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(script.Parent.HttpRequest.HttpRequestContext);
local v3 = require(script.Parent.HttpRequest.DefaultHttpRequestInstance);
local v4 = require(l_script_FirstAncestor_0.Components.PlayerContextualMenuContainer);
return function(v5)
    return v1.createElement(v2.Provider, {
        value = v5.httpRequest or v3
    }, {
        app = v1.createElement(v4, v5)
    });
end;
