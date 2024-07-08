local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_script_FirstAncestor_0.TopBarContext);
local v6 = v4.Component:extend("MockTopBarProvider");
v6.init = function(v7)
    v7.state = {
        topBar = {}
    };
    v7.getScreenTopBar = function(v8)
        v2.isType(v8, "string", "screen");
        return v7.state.topBar[v8] or {};
    end;
    v7.setScreenTopBar = function(v9, v10)
        v2.isType(v9, "string", "screen");
        v2.isType(v10, "table", "state");
        v7:setState(function(v11)
            return {
                topBar = v3.Dictionary.join(v11.topBar, {
                    [v9] = v3.Dictionary.join(v11.topBar[v9] or {}, v10)
                })
            };
        end);
    end;
end;
v6.render = function(v12)
    return v4.createElement(v5.Provider, {
        value = v3.Dictionary.join(v12.state.topBar, {
            getScreenTopBar = v12.getScreenTopBar, 
            setScreenTopBar = v12.setScreenTopBar
        })
    }, {
        Element = v12.props[v4.Children]
    });
end;
return function(v13)
    return v4.createElement(v6, {}, v13);
end;
