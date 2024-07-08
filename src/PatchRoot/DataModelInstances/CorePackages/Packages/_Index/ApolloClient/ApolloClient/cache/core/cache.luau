local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Object_0 = v2.Object;
local l_Boolean_0 = v2.Boolean;
local v5 = {};
local _ = require(l_Parent_1.GraphQL);
local l_wrap_0 = require(l_Parent_0.optimism).wrap;
local l_getFragmentQueryDocument_0 = require(script.Parent.Parent.Parent.utilities).getFragmentQueryDocument;
local _ = require(script.Parent.types.DataProxy);
local _ = require(script.Parent.types.Cache);
local v11 = {};
v11.__index = v11;
v11.new = function()
    local v12 = setmetatable({}, v11);
    v12.getFragmentDoc = l_wrap_0(l_getFragmentQueryDocument_0);
    return v12;
end;
v11.read = function(_, _)
    error("not implemented abstract method");
end;
v11.write = function(_, _)
    error("not implemented abstract method");
end;
v11.diff = function(_, _)
    error("not implemented abstract method");
end;
v11.watch = function(_, _)
    error("not implemented abstract method");
end;
v11.reset = function(_)
    error("not implemented abstract method");
end;
v11.evict = function(_, _)
    error("not implemented abstract method");
end;
v11.restore = function(_, _)
    error("not implemented abstract method");
end;
v11.extract = function(_, _)
    error("not implemented abstract method");
end;
v11.removeOptimistic = function(_, _)
    error("not implemented abstract method");
end;
v11.batch = function(v30, v31)
    local _ = nil;
    v30:performTransaction(v31.update, if typeof(v31.optimistic) == "string" then v31.optimistic else if v31.optimistic == false then nil else nil);
end;
v11.performTransaction = function(_, _, _)
    error("not implemented abstract method");
end;
v11.recordOptimisticTransaction = function(v36, v37, v38)
    v36:performTransaction(v37, v38);
end;
v11.transformDocument = function(_, v40)
    return v40;
end;
v11.identify = function(_, _)
end;
v11.gc = function(_)
    return {};
end;
v11.modify = function(_, _)
    return false;
end;
v11.transformForLink = function(_, v47)
    return v47;
end;
v11.readQuery = function(v48, v49, v50)
    if v50 == nil then
        v50 = not not v49.optimistic;
    end;
    return v48:read(l_Object_0.assign(table.clone(v49), {
        rootId = not not l_Boolean_0.toJSBoolean(v49.id) and v49.id or "ROOT_QUERY", 
        optimistic = v50
    }));
end;
v11.readFragment = function(v51, v52, v53)
    if v53 == nil then
        v53 = not not v52.optimistic;
    end;
    return v51:read(l_Object_0.assign({}, v52, {
        query = v51.getFragmentDoc(v52.fragment, v52.fragmentName), 
        rootId = v52.id, 
        optimistic = v53
    }));
end;
v11.writeQuery = function(v54, v55)
    return v54:write(l_Object_0.assign(l_Object_0.assign(table.clone(v55), {
        id = l_Object_0.None, 
        data = l_Object_0.None
    }), {
        dataId = v55.id or "ROOT_QUERY", 
        result = v55.data
    }));
end;
v11.writeFragment = function(v56, v57)
    return v56:write(l_Object_0.assign(l_Object_0.assign(table.clone(v57), {
        id = l_Object_0.None, 
        data = l_Object_0.None, 
        fragment = l_Object_0.None, 
        fragmentName = l_Object_0.None
    }), {
        query = v56.getFragmentDoc(v57.fragment, v57.fragmentName), 
        dataId = v57.id, 
        result = v57.data
    }));
end;
v5.ApolloCache = v11;
return v5;
