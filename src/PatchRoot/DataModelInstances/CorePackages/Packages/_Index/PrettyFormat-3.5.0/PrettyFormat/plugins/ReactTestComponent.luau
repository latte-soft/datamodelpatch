local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Object_0 = v0.Object;
local l_Symbol_0 = v0.Symbol;
local v4 = {};
local _ = require(script.Parent.Parent.Types);
local v6 = require(script.Parent.lib.markup);
local l_printChildren_0 = v6.printChildren;
local l_printElement_0 = v6.printElement;
local l_printElementAsLeaf_0 = v6.printElementAsLeaf;
local l_printProps_0 = v6.printProps;
local v11 = l_Symbol_0.for_("react.test.json");
local function v15(v12)
    local l_props_0 = v12.props;
    if l_props_0 ~= nil then
        return (l_Array_0.sort(l_Array_0.filter(l_Object_0.keys(l_props_0), function(v14)
            return l_props_0[v14] ~= nil;
        end)));
    else
        return {};
    end;
end;
local function v22(v16, v17, v18, v19, v20, v21)
    v19 = v19 + 1;
    if v17.maxDepth < v19 then
        return (l_printElementAsLeaf_0(v16.type, v17));
    else
        return (l_printElement_0(v16.type, if v16.props ~= nil then l_printProps_0(v15(v16), v16.props, v17, v18 .. v17.indent, v19, v20, v21) else "", if v16.children ~= nil then l_printChildren_0(v16.children, v17, v18 .. v17.indent, v19, v20, v21) else "", v17, v18));
    end;
end;
v4.serialize = v22;
local function v25(v23)
    local v24 = false;
    if typeof(v23) == "table" then
        v24 = v23["$$typeof"] == v11;
    end;
    return v24;
end;
v4.test = v25;
v4.default = {
    serialize = v22, 
    test = v25
};
return v4;
