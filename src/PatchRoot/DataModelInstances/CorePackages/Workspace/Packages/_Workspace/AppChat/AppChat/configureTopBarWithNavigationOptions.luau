local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactNavigation);
local v6 = require(l_script_FirstAncestor_0.createChatTopBar);
local v7 = require(l_script_FirstAncestor_0.TopBarContext);
return function(v8)
    local v9 = v5.getActiveChildNavigationOptions(v8);
    return v4.createElement(v7.Consumer, {
        render = function(v10)
            local l_state_0 = v8.state;
            local v12 = v10.getScreenTopBar(l_state_0.routes[l_state_0.index].routeName);
            v2.isType(v12, "table", "screenTopBar");
            return v6(v3.Dictionary.join(v12, v9, {
                navigation = v8
            }));
        end
    });
end;
