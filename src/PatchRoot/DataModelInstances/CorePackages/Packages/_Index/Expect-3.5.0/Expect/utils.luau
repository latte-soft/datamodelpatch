local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_instanceof_0 = v2.instanceof;
local l_Object_0 = v2.Object;
local v7 = require(l_Parent_1.RegExp);
local v8 = require(l_Parent_1.RobloxShared);
local l_equals_0 = require(l_Parent_0.jasmineUtils).equals;
local v10 = nil;
local function v11(v12, v13)
    if not l_Array_0.isArray(v13) then
        v13 = v10(v13);
    end;
    if #v13 > 0 then
        local v14 = #v13 == 1;
        local v15 = v13[1];
        local l_status_0, l_result_0 = pcall(function()
            return v12[v15];
        end);
        if not l_status_0 or not v14 and l_result_0 == nil then
            return {
                hasEndProp = false, 
                lastTraversedObject = v12, 
                traversedPath = {}
            };
        else
            local v18 = v11(l_result_0, l_Array_0.slice(v13, 2));
            if v18.lastTraversedObject == nil then
                v18.lastTraversedObject = v12;
            end;
            table.insert(v18.traversedPath, 1, v15);
            if v14 then
                v18.hasEndProp = l_result_0 ~= nil;
                if not v18.hasEndProp then
                    l_Array_0.shift(v18.traversedPath);
                end;
            end;
            return v18;
        end;
    else
        return {
            lastTraversedObject = nil, 
            traversedPath = {}, 
            value = v12
        };
    end;
end;
local l_getObjectSubset_0 = v8.expect.getObjectSubset;
local l_iterableEquality_0 = v8.expect.iterableEquality;
local l_subsetEquality_0 = v8.expect.subsetEquality;
local function v24(v22, v23)
    if not (v22 ~= nil) or v23 == nil then
        return nil;
    elseif typeof(v22) ~= typeof(v23) then
        return false;
    elseif getmetatable(v22) or getmetatable(v23) then
        if not (((not getmetatable(v22) or not getmetatable(v23)) or not getmetatable(v22).__index) or not getmetatable(v23).__index) and getmetatable(v22).__index == getmetatable(v23).__index then
            return nil;
        else
            return false;
        end;
    else
        return nil;
    end;
end;
local function v27(v25, v26)
    if l_Array_0.isArray(v25) and l_Array_0.isArray(v26) then
        return l_equals_0(v25, v26, {
            v24
        }, true) and l_equals_0(l_Object_0.keys(v25), (l_Object_0.keys(v26)));
    else
        return nil;
    end;
end;
local function v33(v28, v29)
    local v30 = {
        {}, 
        {}
    };
    for _, v32 in ipairs(v28) do
        table.insert(v30[not v29(v32) and 2 or 1], v32);
    end;
    return v30;
end;
v10 = function(v34)
    local v35 = v7("[^.[\\]]+|(?=(?:\\.)(?:\\.|$))");
    local v36 = {};
    if v34:sub(1, 1) == "." then
        table.insert(v36, "");
    end;
    local v37 = 0;
    local l_v34_0 = v34;
    local v39 = v35:exec(l_v34_0);
    while v39 ~= nil and v37 < #v34 do
        local v40 = v39[1];
        local v41 = v39.index + #v40;
        local v42 = v37 + v39.index;
        if v34:sub(v42 - 1, v42 - 1) == "[" then
            local v43 = tonumber(v40, 10);
            if not v43 then
                table.insert(v36, v40);
            else
                table.insert(v36, v43);
            end;
        else
            table.insert(v36, v40);
        end;
        v37 = v37 + v41;
        l_v34_0 = l_v34_0:sub(v41 + 1);
        v39 = v35:exec(l_v34_0);
    end;
    return v36;
end;
return {
    getPath = v11, 
    getObjectSubset = l_getObjectSubset_0, 
    iterableEquality = l_iterableEquality_0, 
    subsetEquality = l_subsetEquality_0, 
    typeEquality = v24, 
    sparseArrayEquality = v27, 
    partition = v33, 
    pathAsArray = v10, 
    isError = function(v44)
        return l_instanceof_0(v44, l_Error_0);
    end, 
    emptyObject = function(v45)
        local v46;
        if typeof(v45) == "table" then
            v46 = true;
            if not (#l_Object_0.keys(v45) ~= 0) then
                goto label0;
            end;
        end;
        v46 = false;
        ::label0::;
        return v46;
    end, 
    isOneline = function(v47, v48)
        local v49 = false;
        if typeof(v47) == "string" then
            v49 = false;
            if typeof(v48) == "string" then
                v49 = not v48:match("[\r\n]") or not v47:match("[\r\n]");
            end;
        end;
        return v49;
    end
};
