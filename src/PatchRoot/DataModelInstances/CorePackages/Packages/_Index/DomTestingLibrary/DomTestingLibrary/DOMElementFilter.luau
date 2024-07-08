local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_instanceof_0 = v1.instanceof;
local v5 = {};
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local l_RobloxInstance_0 = require(l_Parent_0.RobloxShared).RobloxInstance;
local l_getRobloxProperties_0 = l_RobloxInstance_0.getRobloxProperties;
local l_InstanceSubset_0 = l_RobloxInstance_0.InstanceSubset;
local function v25(v10, v11, v12, v13, v14, v15, v16)
    local v17 = v16 or ": ";
    local v18 = "";
    local v21 = l_Array_0.sort(l_Object_0.keys(v10), if v11.compareKeys ~= nil and v11.compareKeys ~= l_Object_0.None then v11.compareKeys else function(v19, v20)
        if type(v19) .. tostring(v19) < type(v20) .. tostring(v20) then
            return -1;
        elseif type(v19) .. tostring(v19) == type(v20) .. tostring(v20) then
            return 0;
        else
            return 1;
        end;
    end);
    if #v21 > 0 then
        v18 = v18 .. v11.spacingOuter;
        local v22 = v12 .. v11.indent;
        for v23 = 1, #v21 do
            local v24 = v21[v23];
            v18 = v18 .. v22 .. v15(v24, v11, v22, v13, v14) .. v17 .. v15(v10[v24], v11, v22, v13, v14);
            if v23 < #v21 then
                v18 = v18 .. "," .. v11.spacingInner;
            elseif not v11.min then
                v18 = v18 .. ",";
            end;
        end;
        v18 = v18 .. v11.spacingOuter .. v12;
    end;
    return v18;
end;
local function v49(v26, v27, v28, v29, v30, v31, v32)
    local v33 = "";
    local l_v26_Children_0 = v26:GetChildren();
    table.sort(l_v26_Children_0, function(v35, v36)
        return v35.Name < v36.Name;
    end);
    local v37 = l_getRobloxProperties_0(v26.ClassName);
    if not (#v37 <= 0) or #l_v26_Children_0 > 0 then
        v33 = v33 .. v27.spacingOuter;
        local v38 = v28 .. v27.indent;
        local v39 = nil;
        for _, v41 in ipairs(v37) do
            v39 = v26[v41];
        end;
        v39 = nil;
        for v42, v43 in ipairs(v37) do
            local v44 = v31(v43, v27, v38, v29, v30);
            local v45 = v26[v43];
            v33 = string.format("%s%s%s: %s", v33, v38, v44, if l_getType_0(v45) == "Instance" then v31(v45, v27, v38, math.huge, v30) else v31(v45, v27, v38, v29, v30));
            if not (v42 >= #v37) or #l_v26_Children_0 > 0 then
                v33 = v33 .. "," .. v27.spacingInner;
            elseif not v27.min then
                v33 = v33 .. ",";
            end;
        end;
        local v46 = l_Array_0.filter(l_v26_Children_0, v32);
        for v47, v48 in ipairs(v46) do
            v33 = string.format("%s%s%s: %s", v33, v38, v31(v48.Name, v27, v38, v29, v30), (v31(v48, v27, v38, v29, v30)));
            if v47 < #v46 then
                v33 = v33 .. "," .. v27.spacingInner;
            elseif not v27.min then
                v33 = v33 .. ",";
            end;
        end;
        v33 = v33 .. v27.spacingOuter .. v28;
    end;
    return v33;
end;
local function _(v50)
    return function(v51, v52, v53, v54, v55, v56)
        v54 = v54 + 1;
        if v52.maxDepth <= v54 then
            return string.format("\"%s\" [%s]", v51.Name, v51.ClassName);
        elseif not l_instanceof_0(v51, l_InstanceSubset_0) then
            return v51.ClassName .. " {" .. v49(v51, v52, v53, v54, v55, v56, v50) .. "}";
        else
            return v51.ClassName .. " {" .. v25(v51.subset, v52, v53, v54, v55, v56) .. "}";
        end;
    end;
end;
local function v60(v58)
    local v59 = true;
    if l_getType_0(v58) ~= "Instance" then
        v59 = l_instanceof_0(v58, l_InstanceSubset_0);
    end;
    return v59;
end;
v5.default = function(v61)
    return {
        test = v60, 
        serialize = function(v62, v63, v64, v65, v66, v67)
            v65 = v65 + 1;
            if v63.maxDepth <= v65 then
                return string.format("\"%s\" [%s]", v62.Name, v62.ClassName);
            elseif not l_instanceof_0(v62, l_InstanceSubset_0) then
                return v62.ClassName .. " {" .. v49(v62, v63, v64, v65, v66, v67, v61) .. "}";
            else
                return v62.ClassName .. " {" .. v25(v62.subset, v63, v64, v65, v66, v67) .. "}";
            end;
        end
    };
end;
return v5;
