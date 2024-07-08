local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RobloxApiDump);
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Object_0 = v4.Object;
local v7 = require(l_Parent_0.expect);
local l_equals_0 = v7.equals;
local l_isObjectWithKeys_0 = v7.isObjectWithKeys;
local l_hasPropertyInObject_0 = v7.hasPropertyInObject;
local l_isAsymmetric_0 = v7.isAsymmetric;
local function v17(v12)
    local v13 = v2[v12];
    local v14 = {};
    while v13 do
        for _, v16 in ipairs(v13.Properties) do
            table.insert(v14, v16);
        end;
        v13 = v2[v13.Superclass];
    end;
    table.sort(v14);
    return v14;
end;
local function v43(v18, v19)
    local function v20(v21)
        return function(v22, v23)
            v21 = v21 or {};
            if l_getType_0(v22) == "Instance" and l_isObjectWithKeys_0(v23) then
                local v24 = v17(v22.ClassName);
                local v25 = {};
                for _, v27 in ipairs(v22:getChildren()) do
                    v25[v27.Name] = true;
                end;
                return l_Array_0.every(l_Object_0.keys(v23), function(v28)
                    local v29 = v23[v28];
                    if l_isObjectWithKeys_0(v29) then
                        if not v21[v29] then
                            v21[v29] = true;
                        else
                            return false;
                        end;
                    end;
                    local v30 = false;
                    if v22 ~= nil then
                        if table.find(v24, v28) == nil then
                            v30 = false;
                            if not (v25[v28] ~= nil) then
                                goto label0;
                            end;
                        end;
                        v30 = l_equals_0(v22[v28], v29, {
                            v20(v21)
                        });
                    end;
                    ::label0::;
                    v21[v29] = nil;
                    return v30;
                end);
            else
                return nil;
            end;
        end;
    end;
    local v31 = nil;
    local v32;
    do
        local l_v31_0 = v31;
        v32 = function(v34, v35)
            l_v31_0 = l_v31_0 or {};
            if l_getType_0(v34) == "Instance" and l_isObjectWithKeys_0(v35) then
                local v36 = v17(v34.ClassName);
                local v37 = {};
                for _, v39 in ipairs(v34:getChildren()) do
                    v37[v39.Name] = true;
                end;
                return l_Array_0.every(l_Object_0.keys(v35), function(v40)
                    local v41 = v35[v40];
                    if l_isObjectWithKeys_0(v41) then
                        if not l_v31_0[v41] then
                            l_v31_0[v41] = true;
                        else
                            return false;
                        end;
                    end;
                    local v42 = false;
                    if v34 ~= nil then
                        if table.find(v36, v40) == nil then
                            v42 = false;
                            if not (v37[v40] ~= nil) then
                                goto label1;
                            end;
                        end;
                        v42 = l_equals_0(v34[v40], v41, {
                            v20(l_v31_0)
                        });
                    end;
                    ::label1::;
                    l_v31_0[v41] = nil;
                    return v42;
                end);
            else
                return nil;
            end;
        end;
    end;
    if not v32 then
        return v32;
    else
        return v32(v18, v19);
    end;
end;
local v44 = {};
v44.__index = v44;
v44.new = function(v45, v46)
    table.sort(v46);
    local v47 = {
        ClassName = v45, 
        subset = v46
    };
    setmetatable(v47, v44);
    return v47;
end;
local function v48(v49, v50, v51)
    v51 = v51 or {};
    local v52 = {};
    v51[v49] = v52;
    if not l_equals_0(v49, v50) then
        if typeof(v50) == "table" and not l_isAsymmetric_0(v50) then
            local v53 = {};
            for v54, v55 in pairs(v50) do
                if typeof(v55) ~= "table" then
                    v53[v54] = v55;
                end;
            end;
            local v56 = v17(v49.ClassName);
            for _, v58 in ipairs(v49:getChildren()) do
                table.insert(v56, v58.Name);
            end;
            for _, v61 in ipairs(l_Array_0.filter(v56, function(v59)
                return l_hasPropertyInObject_0(v50, v59);
            end)) do
                if v51[v49[v61]] ~= nil then
                    error("Circular reference passed into .toMatchInstance(subset)");
                else
                    local _ = nil;
                    local v63, v64 = v48(v49[v61], v50[v61], v51);
                    v52[v61] = v63;
                    v53[v61] = v64;
                end;
            end;
            local l_ClassName_0 = v49.ClassName;
            if not (not (typeof(v50) == "table") or not rawget(v50, "ClassName")) then
                l_ClassName_0 = rawget(v50, "ClassName");
            end;
            return v44.new(v49.ClassName, v52), v44.new(l_ClassName_0, v53);
        else
            return v49, v50;
        end;
    else
        return v50, v50;
    end;
end;
return {
    getRobloxProperties = v17, 
    instanceSubsetEquality = v43, 
    InstanceSubset = v44, 
    getInstanceSubset = v48
};
