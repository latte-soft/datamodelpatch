local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_0.NavigationContext);
local v6 = require(l_Parent_1.utils.invariant);
local function _(v7)
    local v8 = type(v7);
    local v9 = true;
    if v8 ~= "function" then
        v9 = v8 == "table";
    end;
    return v9;
end;
return function(v11, v12)
    local v13 = type(v11);
    local v14 = true;
    if v13 ~= "function" then
        v14 = v13 == "table";
    end;
    assert(v14, "withNavigation must be called with a Roact component (stateful or functional)");
    local v15 = l_Object_0.assign({
        forwardRef = true
    }, v12);
    return function(v16)
        local l_navigation_0 = v16.navigation;
        return v4.createElement(v5.Consumer, {
            render = function(v18)
                local v19 = l_navigation_0 or v18;
                v6(v19, "withNavigation and withNavigationFocus can only " .. "be used on a view hierarchy of a navigator. The wrapped component is " .. "unable to get access to navigation from props or context.");
                return v4.createElement(v11, l_Object_0.assign(table.clone(v16), {
                    navigation = v19, 
                    ref = if not v15.forwardRef then l_Object_0.None else v16.onRef
                }));
            end
        });
    end;
end;
