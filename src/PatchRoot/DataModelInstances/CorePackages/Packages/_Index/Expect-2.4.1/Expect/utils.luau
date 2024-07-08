local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_1.RegExp);
local v6 = require(l_Parent_1.RobloxShared);
local l_equals_0 = require(l_Parent_0.jasmineUtils).equals;
local v8 = nil;
local function v9(v10, v11)
    if not l_Array_0.isArray(v11) then
        v11 = v8(v11);
    end;
    if #v11 > 0 then
        local v12 = #v11 == 1;
        local v13 = v11[1];
        local l_status_0, l_result_0 = pcall(function()
            return v10[v13];
        end);
        if not l_status_0 or not v12 and l_result_0 == nil then
            return {
                hasEndProp = false, 
                lastTraversedObject = v10, 
                traversedPath = {}
            };
        else
            local v16 = v9(l_result_0, l_Array_0.slice(v11, 2));
            if v16.lastTraversedObject == nil then
                v16.lastTraversedObject = v10;
            end;
            table.insert(v16.traversedPath, 1, v13);
            if v12 then
                v16.hasEndProp = l_result_0 ~= nil;
                if not v16.hasEndProp then
                    l_Array_0.shift(v16.traversedPath);
                end;
            end;
            return v16;
        end;
    else
        return {
            lastTraversedObject = nil, 
            traversedPath = {}, 
            value = v10
        };
    end;
end;
local l_getObjectSubset_0 = v6.expect.getObjectSubset;
local l_iterableEquality_0 = v6.expect.iterableEquality;
local l_subsetEquality_0 = v6.expect.subsetEquality;
local function v22(v20, v21)
    if not (v20 ~= nil) or v21 == nil then
        return nil;
    elseif typeof(v20) ~= typeof(v21) then
        return false;
    elseif getmetatable(v20) or getmetatable(v21) then
        if not (((not getmetatable(v20) or not getmetatable(v21)) or not getmetatable(v20).__index) or not getmetatable(v21).__index) and getmetatable(v20).__index == getmetatable(v21).__index then
            return nil;
        else
            return false;
        end;
    else
        return nil;
    end;
end;
local function v25(v23, v24)
    if l_Array_0.isArray(v23) and l_Array_0.isArray(v24) then
        return l_equals_0(v23, v24, {
            v22
        }, true) and l_equals_0(l_Object_0.keys(v23), (l_Object_0.keys(v24)));
    else
        return nil;
    end;
end;
local function v31(v26, v27)
    local v28 = {
        {}, 
        {}
    };
    for _, v30 in ipairs(v26) do
        table.insert(v28[not v27(v30) and 2 or 1], v30);
    end;
    return v28;
end;
v8 = function(v32)
    local v33 = v5("[^.[\\]]+|(?=(?:\\.)(?:\\.|$))");
    local v34 = {};
    if v32:sub(1, 1) == "." then
        table.insert(v34, "");
    end;
    local v35 = 0;
    local l_v32_0 = v32;
    local v37 = v33:exec(l_v32_0);
    while v37 ~= nil and v35 < #v32 do
        local v38 = v37[1];
        local v39 = v37.index + #v38;
        local v40 = v35 + v37.index;
        if v32:sub(v40 - 1, v40 - 1) == "[" then
            local v41 = tonumber(v38, 10);
            if not v41 then
                table.insert(v34, v38);
            else
                table.insert(v34, v41);
            end;
        else
            table.insert(v34, v38);
        end;
        v35 = v35 + v39;
        l_v32_0 = l_v32_0:sub(v39 + 1);
        v37 = v33:exec(l_v32_0);
    end;
    return v34;
end;
return {
    getPath = v9, 
    getObjectSubset = l_getObjectSubset_0, 
    iterableEquality = l_iterableEquality_0, 
    subsetEquality = l_subsetEquality_0, 
    typeEquality = v22, 
    sparseArrayEquality = v25, 
    partition = v31, 
    pathAsArray = v8, 
    isError = function(v42)
        if not (typeof(v42) ~= "string") or typeof(v42) == "table" then
            return true;
        else
            return false;
        end;
    end, 
    emptyObject = function(v43)
        local v44;
        if typeof(v43) == "table" then
            v44 = true;
            if not (#l_Object_0.keys(v43) ~= 0) then
                goto label0;
            end;
        end;
        v44 = false;
        ::label0::;
        return v44;
    end, 
    isOneline = function(v45, v46)
        local v47 = false;
        if typeof(v45) == "string" then
            v47 = false;
            if typeof(v46) == "string" then
                v47 = not v46:match("[\r\n]") or not v45:match("[\r\n]");
            end;
        end;
        return v47;
    end
};
