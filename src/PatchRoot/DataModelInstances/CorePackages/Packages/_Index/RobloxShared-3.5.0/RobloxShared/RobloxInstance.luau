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
local v12 = {};
local function v15(v13, v14)
    return v13[v14];
end;
local function v21(v16)
    local v17 = v2[v16];
    local v18 = {};
    while v17 do
        for _, v20 in ipairs(v17.Properties) do
            table.insert(v18, v20);
        end;
        v17 = v2[v17.Superclass];
    end;
    table.sort(v18);
    return v18;
end;
local function v30(v22)
    local v23 = v21(v22);
    local v24 = v12[v22];
    if not v24 then
        v24 = {};
        v12[v22] = v24;
        local v25 = Instance.new(v22);
        for _, v27 in ipairs(v23) do
            local l_status_0, l_result_0 = pcall(v15, v25, v27);
            if l_status_0 then
                v24[v27] = l_result_0;
            end;
        end;
        v25:Destroy();
        return v24, v23;
    else
        return v24, v23;
    end;
end;
local function v56(v31, v32)
    local function v33(v34)
        return function(v35, v36)
            v34 = v34 or {};
            if l_getType_0(v35) == "Instance" and l_isObjectWithKeys_0(v36) then
                local v37 = v21(v35.ClassName);
                local v38 = {};
                for _, v40 in ipairs(v35:getChildren()) do
                    v38[v40.Name] = true;
                end;
                return l_Array_0.every(l_Object_0.keys(v36), function(v41)
                    local v42 = v36[v41];
                    if l_isObjectWithKeys_0(v42) then
                        if not v34[v42] then
                            v34[v42] = true;
                        else
                            return false;
                        end;
                    end;
                    local v43 = false;
                    if v35 ~= nil then
                        if table.find(v37, v41) == nil then
                            v43 = false;
                            if not (v38[v41] ~= nil) then
                                goto label0;
                            end;
                        end;
                        v43 = l_equals_0(v35[v41], v42, {
                            v33(v34)
                        });
                    end;
                    ::label0::;
                    v34[v42] = nil;
                    return v43;
                end);
            else
                return nil;
            end;
        end;
    end;
    local v44 = nil;
    local v45;
    do
        local l_v44_0 = v44;
        v45 = function(v47, v48)
            l_v44_0 = l_v44_0 or {};
            if l_getType_0(v47) == "Instance" and l_isObjectWithKeys_0(v48) then
                local v49 = v21(v47.ClassName);
                local v50 = {};
                for _, v52 in ipairs(v47:getChildren()) do
                    v50[v52.Name] = true;
                end;
                return l_Array_0.every(l_Object_0.keys(v48), function(v53)
                    local v54 = v48[v53];
                    if l_isObjectWithKeys_0(v54) then
                        if not l_v44_0[v54] then
                            l_v44_0[v54] = true;
                        else
                            return false;
                        end;
                    end;
                    local v55 = false;
                    if v47 ~= nil then
                        if table.find(v49, v53) == nil then
                            v55 = false;
                            if not (v50[v53] ~= nil) then
                                goto label1;
                            end;
                        end;
                        v55 = l_equals_0(v47[v53], v54, {
                            v33(l_v44_0)
                        });
                    end;
                    ::label1::;
                    l_v44_0[v54] = nil;
                    return v55;
                end);
            else
                return nil;
            end;
        end;
    end;
    if not v45 then
        return v45;
    else
        return v45(v31, v32);
    end;
end;
local v57 = {};
v57.__index = v57;
v57.new = function(v58, v59)
    table.sort(v59);
    local v60 = {
        ClassName = v58, 
        subset = v59
    };
    setmetatable(v60, v57);
    return v60;
end;
local function v61(v62, v63, v64)
    local v65 = v64 or {};
    local v66 = {};
    v65[v62] = v66;
    if not l_equals_0(v62, v63) then
        if typeof(v63) == "table" and not l_isAsymmetric_0(v63) then
            local v67 = {};
            for v68, v69 in pairs(v63) do
                if typeof(v69) ~= "table" then
                    v67[v68] = v69;
                end;
            end;
            local v70 = v21(v62.ClassName);
            for _, v72 in ipairs(v62:getChildren()) do
                table.insert(v70, v72.Name);
            end;
            for _, v75 in ipairs(l_Array_0.filter(v70, function(v73)
                return l_hasPropertyInObject_0(v63, v73);
            end)) do
                if v65[v62[v75]] ~= nil then
                    error("Circular reference passed into .toMatchInstance(subset)");
                else
                    local _ = nil;
                    local v77, v78 = v61(v62[v75], v63[v75], v65);
                    v66[v75] = v77;
                    v67[v75] = v78;
                end;
            end;
            local l_ClassName_0 = v62.ClassName;
            if not (not (typeof(v63) == "table") or not rawget(v63, "ClassName")) then
                l_ClassName_0 = rawget(v63, "ClassName");
            end;
            return v57.new(v62.ClassName, v66), v57.new(l_ClassName_0, v67);
        else
            return v62, v63;
        end;
    else
        return v63, v63;
    end;
end;
return {
    getRobloxProperties = v21, 
    getRobloxDefaults = v30, 
    instanceSubsetEquality = v56, 
    InstanceSubset = v57, 
    getInstanceSubset = v61
};
