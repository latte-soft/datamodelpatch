local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Set_0 = v1.Set;
local _ = require(l_Parent_0.jsutils.ObjMap);
local _ = require(l_Parent_0.language.ast);
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local l_visit_0 = require(l_Parent_0.language.visitor).visit;
local v8 = nil;
local v9 = nil;
local function v24(v10)
    local v11 = {};
    local v12 = {};
    for _, v14 in pairs(v10.definitions) do
        local l_kind_0 = v14.kind;
        if l_kind_0 == l_Kind_0.OPERATION_DEFINITION then
            table.insert(v11, v14);
        elseif l_kind_0 == l_Kind_0.FRAGMENT_DEFINITION then
            v12[v14.name.value] = v8(v14.selectionSet);
        end;
    end;
    local v16 = {};
    for _, v18 in pairs(v11) do
        local v19 = l_Set_0.new();
        for _, v21 in pairs(v8(v18.selectionSet)) do
            v9(v19, v12, v21);
        end;
        v16[not not v18.name and v18.name.value or ""] = {
            kind = l_Kind_0.DOCUMENT, 
            definitions = l_Array_0.filter(v10.definitions, function(v22)
                local v23 = true;
                if v22 ~= v18 then
                    v23 = false;
                    if v22.kind == l_Kind_0.FRAGMENT_DEFINITION then
                        v23 = v19:has(v22.name.value);
                    end;
                end;
                return v23;
            end)
        };
    end;
    return v16;
end;
v9 = function(v25, v26, v27)
    if not v25:has(v27) then
        v25:add(v27);
        local v28 = v26[v27];
        if v28 ~= nil then
            for _, v30 in pairs(v28) do
                v9(v25, v26, v30);
            end;
        end;
    end;
end;
v8 = function(v31)
    local v32 = {};
    l_visit_0(v31, {
        FragmentSpread = function(_, v34)
            table.insert(v32, v34.name.value);
        end
    });
    return v32;
end;
return {
    separateOperations = v24
};
