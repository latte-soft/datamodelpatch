local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Parent.GraphQL);
local _ = require(l_Parent_0.jsutils.typedDocumentNode);
local _ = require(script.Parent.Parent.types.types);
local l_useBaseQuery_0 = require(script.Parent.utils.useBaseQuery).useBaseQuery;
local _ = require(l_Parent_0.core);
v0.useQuery = function(v7, v8)
    return l_useBaseQuery_0(v7, v8, false);
end;
return v0;
