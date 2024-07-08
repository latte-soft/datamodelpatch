local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local l_clearTimeout_0 = v3.clearTimeout;
local l_Error_0 = v3.Error;
local l_setTimeout_0 = v3.setTimeout;
local v9 = require(l_Parent_0.luaUtils.isCallable);
local l_HttpService_0 = game:GetService("HttpService");
local l_print_0 = require(l_Parent_1.GraphQL).print;
local v12 = require(l_Parent_0.jsutils.equal);
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_ApolloLink_0 = require(l_Parent_1.ApolloClient).ApolloLink;
local v15 = require(l_Parent_0.utilities);
local l_Observable_0 = v15.Observable;
local l_addTypenameToDocument_0 = v15.addTypenameToDocument;
local l_removeClientSetsFromDocument_0 = v15.removeClientSetsFromDocument;
local l_removeConnectionDirectiveFromDocument_0 = v15.removeConnectionDirectiveFromDocument;
local l_cloneDeep_0 = v15.cloneDeep;
local l_stringifyForDisplay_0 = v15.stringifyForDisplay;
local function v25(v22, v23)
    local _ = nil;
    return l_HttpService_0:JSONEncode({
        query = if not l_Boolean_0.toJSBoolean(v22.query) then v22.query else if v23 then l_print_0(l_addTypenameToDocument_0(v22.query)) else l_print_0(v22.query)
    });
end;
local v26 = setmetatable({}, {
    __index = l_ApolloLink_0
});
v26.__index = v26;
v26.new = function(v27, v28)
    if v28 == nil then
        v28 = true;
    end;
    local v29 = setmetatable(l_ApolloLink_0.new(), v26);
    v29.addTypename = v28;
    v29.mockedResponsesByKey = {};
    if l_Boolean_0.toJSBoolean(v27) then
        l_Array_0.forEach(v27, function(v30)
            v29:addMockedResponse(v30);
        end);
    end;
    return v29;
end;
v26.addMockedResponse = function(v31, v32)
    local v33 = v31:normalizeMockedResponse(v32);
    local v34 = v25(v33.request, v31.addTypename);
    local v35 = v31.mockedResponsesByKey[v34];
    if not l_Boolean_0.toJSBoolean(v35) then
        v35 = {};
        v31.mockedResponsesByKey[v34] = v35;
    end;
    table.insert(v35, v33);
end;
v26.request = function(v36, v37)
    v36.operation = v37;
    local v38 = v25(v37, v36.addTypename);
    local v39 = {};
    local v40 = not not l_Boolean_0.toJSBoolean(v37.variables) and v37.variables or {};
    local v41 = v36.mockedResponsesByKey[v38];
    local v42 = nil;
    v42 = not l_Boolean_0.toJSBoolean(v41) and -1 or l_Array_0.findIndex(v41, function(v43, _)
        local v45 = not not l_Boolean_0.toJSBoolean(v43.request.variables) and v43.request.variables or {};
        if not v12(v40, v45) then
            table.insert(v39, v45);
            return false;
        else
            return true;
        end;
    end);
    local v46 = nil;
    v46 = if v42 >= 0 then v41[v42] else nil;
    local v47 = nil;
    if l_Boolean_0.toJSBoolean(v46) then
        l_Array_0.splice(v41, v42, 1);
        local l_newData_0 = v46.newData;
        if l_Boolean_0.toJSBoolean(l_newData_0) then
            v46.result = l_newData_0();
            table.insert(v41, v46);
        end;
        if not (l_Boolean_0.toJSBoolean(v46.result) or l_Boolean_0.toJSBoolean(v46.error)) then
            v47 = l_Error_0.new(("Mocked response should contain either result or error: %s"):format(v38));
        end;
    else
        v47 = l_Error_0.new(("No more mocked responses for the query: %s\nExpected variables: %s\n%s"):format(l_print_0(v37.query), l_stringifyForDisplay_0(v37.variables), (function()
            if #v39 > 0 then
                return ("\nFailed to match %s mock%s for this query, which had the following variables:\n\t%s\n"):format(tostring(#v39), #v39 == 1 and "" or "s", l_Array_0.join(l_Array_0.map(v39, function(v49)
                    return ("  %s"):format(l_stringifyForDisplay_0(v49));
                end, nil), "\n"));
            else
                return "";
            end;
        end)()));
    end;
    return l_Observable_0.new(function(v50)
        local v52 = l_setTimeout_0(function()
            if not l_Boolean_0.toJSBoolean(v47) then
                if l_Boolean_0.toJSBoolean(v46) then
                    if not l_Boolean_0.toJSBoolean(v46.error) then
                        if l_Boolean_0.toJSBoolean(v46.result) then
                            v50:next((function()
                                if not v9(v46.result) then
                                    return v46.result;
                                else
                                    return v46.result();
                                end;
                            end)());
                        end;
                        v50:complete();
                    else
                        v50:error(v46.error);
                        return ;
                    end;
                end;
                return ;
            else
                xpcall(function()
                    if v36:onError(v47, v50) ~= false then
                        error(v47);
                    end;
                end, function(v51)
                    v50:error(v51);
                end);
                return ;
            end;
        end, (not not l_Boolean_0.toJSBoolean(v46) and l_Boolean_0.toJSBoolean(v46.delay)) and v46.delay or 0);
        return function()
            l_clearTimeout_0(v52);
        end;
    end);
end;
v26.normalizeMockedResponse = function(_, v54)
    local v55 = l_cloneDeep_0(v54);
    local v56 = l_removeConnectionDirectiveFromDocument_0(v55.request.query);
    l_invariant_0(v56, "query is required");
    v55.request.query = v56;
    local v57 = l_removeClientSetsFromDocument_0(v55.request.query);
    if l_Boolean_0.toJSBoolean(v57) then
        v55.request.query = v57;
    end;
    return v55;
end;
v0.MockLink = v26;
v0.mockSingleLink = function(...)
    local v58 = {
        ...
    };
    local v59 = v58[#v58];
    local v60 = l_Array_0.slice(v58, 1, #v58);
    if typeof(v59) ~= "boolean" then
        v60 = v58;
        v59 = true;
    end;
    return v26.new(v60, v59);
end;
return v0;
