local v0 = {};
local v1 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local function v9(v5, v6)
    local v7 = {};
    l_Array_0.forEach(v6, function(v8)
        v7[v8] = l_Object_0.None;
    end);
    return l_Object_0.assign({}, v5, v7);
end;
local _ = require(script.Parent.Parent.Parent.cache.inmemory.policies_types);
local _ = require(script.Parent.Parent.graphql.storeUtils);
local l_mergeDeep_0 = require(script.Parent.Parent.common.mergeDeep).mergeDeep;
local v13 = nil;
local v14 = nil;
local v15 = nil;
v0.concatPagination = function(v16)
    if v16 == nil then
        v16 = false;
    end;
    return {
        keyArgs = v16, 
        merge = function(_, v18, v19)
            if not v18 then
                return v19;
            else
                return (l_Array_0.concat(v18, v19));
            end;
        end
    };
end;
v0.offsetLimitPagination = function(v20)
    if v20 == nil then
        v20 = false;
    end;
    return {
        keyArgs = v20, 
        merge = function(_, v22, v23, v24)
            local l_args_0 = v24.args;
            local v26 = nil;
            v26 = if v22 ~= nil then l_Array_0.slice(v22, 1) else {};
            if l_args_0 ~= nil then
                local v27 = nil;
                v27 = l_args_0.offset == nil and 0 or l_args_0.offset;
                for v28 = 1, #v23 do
                    v26[v27 + v28] = v23[v28];
                end;
                return v26;
            else
                return (l_Array_0.concat(v26, v23));
            end;
        end
    };
end;
v0.relayStylePagination = function(v29)
    if v29 == nil then
        v29 = false;
    end;
    return {
        keyArgs = v29, 
        read = function(_, v31, v32)
            if v31 then
                local v33 = {};
                local v34 = "";
                local v35 = "";
                l_Array_0.forEach(v31.edges, function(v36)
                    if v32:canRead(v32:readField("node", v36)) then
                        table.insert(v33, v36);
                        if v36.cursor then
                            v34 = (not not l_Boolean_0.toJSBoolean(v34) and v34 or v36.cursor) or "";
                            v35 = not not l_Boolean_0.toJSBoolean(v36.cursor) and v36.cursor or v35;
                        end;
                    end;
                end);
                local l_pageInfo_0 = v31.pageInfo;
                local v38 = l_pageInfo_0 and l_pageInfo_0.startCursor;
                local v39 = l_pageInfo_0 and l_pageInfo_0.endCursor;
                return l_Object_0.assign({}, v13(v31), {
                    edges = v33, 
                    pageInfo = l_Object_0.assign({}, v31.pageInfo, {
                        startCursor = not not l_Boolean_0.toJSBoolean(v38) and v38 or v34, 
                        endCursor = not not l_Boolean_0.toJSBoolean(v39) and v39 or v35
                    })
                });
            else
                return ;
            end;
        end, 
        merge = function(_, v41, v42, v43)
            if v41 == nil then
                v41 = v14();
            end;
            local l_v41_0 = v41;
            local l_args_1 = v43.args;
            local v46 = nil;
            v46 = if not v42.edges then {} else l_Array_0.map(v42.edges, function(v47)
                local v48 = l_Object_0.assign({
                    cursor = ""
                }, v47);
                if v43:isReference(v48) then
                    v48.cursor = v43:readField("cursor", v48);
                end;
                return v48;
            end);
            if v42.pageInfo then
                local l_pageInfo_1 = v42.pageInfo;
                local l_startCursor_0 = l_pageInfo_1.startCursor;
                local l_endCursor_0 = l_pageInfo_1.endCursor;
                local v52 = v46[1];
                local v53 = v46[#v46];
                if not (not v52 or not l_startCursor_0) then
                    v52.cursor = l_startCursor_0;
                end;
                if not (not v53 or not l_endCursor_0) then
                    v53.cursor = l_endCursor_0;
                end;
                local v54 = v52 and v52.cursor;
                if not (not v54 or l_startCursor_0) then
                    v42 = l_mergeDeep_0(v42, {
                        pageInfo = {
                            startCursor = v54
                        }
                    });
                end;
                local v55 = v53 and v53.cursor;
                if not (not v55 or l_endCursor_0) then
                    v42 = l_mergeDeep_0(v42, {
                        pageInfo = {
                            endCursor = v55
                        }
                    });
                end;
            end;
            local l_edges_0 = l_v41_0.edges;
            local v57 = {};
            if not (l_args_1 ~= nil) or not l_args_1.after then
                if not (l_args_1 ~= nil) or not l_Boolean_0.toJSBoolean(l_args_1.before) then
                    if l_Boolean_0.toJSBoolean(v42.edges) then
                        l_edges_0 = {};
                    end;
                else
                    local v59 = l_Array_0.findIndex(l_edges_0, function(v58)
                        return v58.cursor == l_args_1.before;
                    end);
                    v57 = if v59 < 0 then l_edges_0 else l_Array_0.slice(l_edges_0, v59);
                    l_edges_0 = {};
                end;
            else
                local v61 = l_Array_0.findIndex(l_edges_0, function(v60)
                    return v60.cursor == l_args_1.after;
                end);
                if v61 >= 1 then
                    l_edges_0 = l_Array_0.slice(l_edges_0, 1, v61 + 1);
                end;
            end;
            local v62 = l_Array_0.concat(l_edges_0, v46, v57);
            local v63 = l_Object_0.assign({}, v42.pageInfo, l_v41_0.pageInfo);
            if v42.pageInfo then
                local v64 = nil;
                local v65 = nil;
                local v66 = nil;
                local v67 = nil;
                local _ = nil;
                local l_pageInfo_2 = v42.pageInfo;
                v64 = l_pageInfo_2.hasPreviousPage;
                v65 = l_pageInfo_2.hasNextPage;
                v66 = l_pageInfo_2.startCursor;
                v67 = l_pageInfo_2.endCursor;
                l_Object_0.assign(v63, (l_Object_0.assign({}, l_pageInfo_2, {
                    hasPreviousPage = l_Object_0.None, 
                    hasNextPage = l_Object_0.None, 
                    startCursor = l_Object_0.None, 
                    endCursor = l_Object_0.None
                })));
                if not l_Boolean_0.toJSBoolean(#l_edges_0) then
                    if v64 ~= nil then
                        v63.hasPreviousPage = v64;
                    end;
                    if v66 ~= nil then
                        v63.startCursor = v66;
                    end;
                end;
                if not l_Boolean_0.toJSBoolean(#v57) then
                    if v65 ~= nil then
                        v63.hasNextPage = v65;
                    end;
                    if v67 ~= nil then
                        v63.endCursor = v67;
                    end;
                end;
            end;
            return l_Object_0.assign({}, v13(l_v41_0), v13(v42), {
                edges = v62, 
                pageInfo = v63
            });
        end
    };
end;
v13 = function(v70)
    return v9(v70, v15);
end;
v15 = {
    "edges", 
    "pageInfo"
};
v14 = function()
    return {
        edges = {}, 
        pageInfo = {
            hasPreviousPage = false, 
            hasNextPage = true, 
            startCursor = "", 
            endCursor = ""
        }
    };
end;
return v0;
