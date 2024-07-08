local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Boolean_0 = v2.Boolean;
local l_Object_0 = v2.Object;
local _ = require(l_Parent_0.core);
local _ = require(script.Parent.types);
local l_useQuery_0 = require(script.Parent.Parent.hooks).useQuery;
v0.Query = function(v8)
    local l_children_0 = v8.children;
    local v10 = l_useQuery_0(v8.query, (l_Object_0.assign({}, v8, {
        children = l_Object_0.None, 
        query = l_Object_0.None
    })));
    if not l_Boolean_0.toJSBoolean(v10) then
        return nil;
    else
        return l_children_0(v10);
    end;
end;
return v0;
