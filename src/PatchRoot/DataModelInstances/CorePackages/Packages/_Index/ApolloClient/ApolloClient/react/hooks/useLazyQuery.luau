local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Parent.GraphQL);
local _ = require(l_Parent_0.jsutils.typedDocumentNode);
local _ = require(l_Parent_0.react.types.types);
local l_useBaseQuery_0 = require(script.Parent.utils.useBaseQuery).useBaseQuery;
local _ = require(l_Parent_0.core);
return {
    useLazyQuery = function(v6, v7)
        return l_useBaseQuery_0(v6, v7, true);
    end
};
