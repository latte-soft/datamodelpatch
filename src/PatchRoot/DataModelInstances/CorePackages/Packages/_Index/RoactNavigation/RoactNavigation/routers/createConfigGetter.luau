local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Object_0 = require(l_Parent_1.Parent.LuauPolyfill).Object;
local v3 = require(l_Parent_0.getScreenForRouteName);
local v4 = require(l_Parent_0.validateScreenOptions);
local v5 = require(l_Parent_1.utils.invariant);
local function v10(v6, v7, v8)
    v7 = v7 or {};
    local v9 = type(v6);
    if v9 == "function" then
        return l_Object_0.assign({}, v7, v6(l_Object_0.assign(table.clone(v8), {
            navigationOptions = v7
        })));
    elseif v9 == "table" then
        return l_Object_0.assign(table.clone(v7), v6);
    else
        return v7;
    end;
end;
return function(v11, v12)
    return function(v13, v14)
        v14 = v14 or {};
        local l_state_0 = v13.state;
        v5(type(l_state_0.routeName) == "string", "Cannot get config because the route does not have a routeName.");
        local v16 = v3(v11, l_state_0.routeName);
        local v17 = v11[l_state_0.routeName];
        local v18 = nil;
        if v17 ~= v16 then
            v18 = v17.navigationOptions;
        end;
        local v19 = if type(v16) == "table" then v16.navigationOptions else {};
        local v20 = {
            navigation = v13, 
            screenProps = v14
        };
        local v21 = v10(v18, v10(v19, v10(v12, {}, v20), v20), v20);
        v4(v21, l_state_0);
        return v21;
    end;
end;
