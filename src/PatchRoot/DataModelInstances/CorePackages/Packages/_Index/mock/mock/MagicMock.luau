local v0 = require(script.Parent.symbols);
local v1 = require(script.Parent.Spy);
local v2 = require(script.Parent.setReturnValue);
local v3 = require(script.Parent.setSideEffect);
local function _(v4, v5)
    local v6 = v4[v0.Spec];
    if not v6 then
        return true;
    else
        local l_status_0, l_result_0 = pcall(function()
            return v6[v5];
        end);
        return l_status_0 and l_result_0;
    end;
end;
local v10 = {
    is = require(script.Parent.isAMagicMock)
};
local v31 = {
    __tostring = function(v11)
        local v12 = getmetatable(v11);
        local v13 = {
            "id=" .. v12[v0.Address]
        };
        local v14 = v12[v0.Name];
        if v14 ~= nil and v14 ~= "mock" then
            table.insert(v13, "name=" .. v14);
        end;
        return "<MagicMock " .. table.concat(v13, " ") .. ">";
    end, 
    __index = function(v15, v16)
        local v17 = getmetatable(v15);
        local v18 = v17[v0.Spec];
        local v19;
        if not v18 then
            v19 = true;
        else
            local l_status_1, l_result_1 = pcall(function()
                return v18[v16];
            end);
            v19 = l_status_1 and l_result_1;
        end;
        if not v19 then
            error(string.format("MagicMock Error: Cannot index key %q since it is out of spec.", (tostring(v16))));
        end;
        v19 = v17[v0.Children][v16];
        if v19 == nil then
            v19 = v10.new({
                name = v17[v0.Name] .. "." .. tostring(v16)
            });
            v17[v0.Children][v16] = v19;
            return v19;
        elseif v19 == v0.None then
            return nil;
        else
            return v19;
        end;
    end, 
    __newindex = function(v22, v23, v24)
        local v25 = getmetatable(v22);
        local v26 = v25[v0.Spec];
        local v27;
        if not v26 then
            v27 = true;
        else
            local l_v26_0 = v26 --[[ copy: 5 -> 8 ]];
            local l_status_2, l_result_2 = pcall(function()
                return l_v26_0[v23];
            end);
            v27 = l_status_2 and l_result_2;
        end;
        if not v27 then
            error(string.format("MagicMock Error: Cannot write key %q since it is out of spec", (tostring(v23))));
        end;
        if type(v24) == "function" then
            v27, v26 = v1.new(v24);
            v24 = v26;
        elseif v24 == nil then
            v24 = v0.None;
        end;
        if v23 == v0.ReturnValue then
            v25[v0.ReturnValue] = {
                v24; 
                n = 1
            };
            return ;
        else
            v25[v0.Children][v23] = v24;
            return ;
        end;
    end
};
local function _(v32)
    if not (type(v32) == "table") or not v32[v0.isTuple] then
        return ;
    else
        return not v10.is(v32);
    end;
end;
local function v39(v34, ...)
    if not v34[v0.ReturnValue] then
        local v35 = v34[v0.SideEffect];
        if v35 then
            v35.calls = v35.calls + 1;
            if type(v35.value) ~= "function" and not v1.is(v35.value) then
                if type(v35.value) == "table" then
                    local l_calls_0 = v35.calls;
                    local v37 = nil;
                    local l_value_0 = v35.value;
                    v37 = if not if type(l_value_0) == "table" and l_value_0[v0.isTuple] then not v10.is(l_value_0) else nil then v35.value[l_calls_0] else v35.value.values[l_calls_0];
                    if not v37 then
                        error("MagicMock Error: SideEffect iteration reached");
                    else
                        return {
                            v37
                        };
                    end;
                else
                    error("MagicMock Error: Invalid SideEffect");
                end;
            else
                return {
                    v35.value(...)
                };
            end;
        end;
        return nil;
    else
        return v34[v0.ReturnValue];
    end;
end;
v31.__call = function(v40, ...)
    local v41 = getmetatable(v40);
    local v42 = {
        args = table.pack(...), 
        result = v39(v41, ...)
    };
    if v42.result == nil then
        v42.result = {
            v10.new({
                name = v41[v0.Name] .. "()"
            }); 
            n = 1
        };
        v41[v0.ReturnValue] = v42.result;
    elseif v42.result == v0.None then
        v42.result = {
            n = 1
        };
    else
        local v43 = v42.result[1];
        if if type(v43) == "table" and v43[v0.isTuple] then not v10.is(v43) else nil then
            v42.result = v42.result[1].values;
        end;
    end;
    table.insert(v41[v0.Calls], v42);
    return table.unpack(v42.result);
end;
local function _(v44)
    return function(v45, v46)
        local v47 = nil;
        local v48 = nil;
        if not (type(v45) ~= "string") or not getmetatable(v45) then
            v47 = getmetatable(v46);
            v48 = string.format("__r_%s()", v44);
        else
            v47 = getmetatable(v45);
            v48 = string.format("__%s()", v44);
        end;
        local v49 = v47[v0.Operations][v48];
        if v49 == nil then
            local v50 = v10.new({
                name = v47[v0.Name] .. "." .. v48
            });
            v47[v0.Operations][v48] = v50;
            return v50;
        else
            return v49;
        end;
    end;
end;
local v52 = "add";
local l_v52_0 = v52 --[[ copy: 11 -> 12 ]];
v31.__add = function(v54, v55)
    local v56 = nil;
    local v57 = nil;
    if not (type(v54) ~= "string") or not getmetatable(v54) then
        v56 = getmetatable(v55);
        v57 = string.format("__r_%s()", l_v52_0);
    else
        v56 = getmetatable(v54);
        v57 = string.format("__%s()", l_v52_0);
    end;
    local v58 = v56[v0.Operations][v57];
    if v58 == nil then
        local v59 = v10.new({
            name = v56[v0.Name] .. "." .. v57
        });
        v56[v0.Operations][v57] = v59;
        return v59;
    else
        return v58;
    end;
end;
v52 = "sub";
local l_v52_1 = v52 --[[ copy: 11 -> 13 ]];
v31.__sub = function(v61, v62)
    local v63 = nil;
    local v64 = nil;
    if not (type(v61) ~= "string") or not getmetatable(v61) then
        v63 = getmetatable(v62);
        v64 = string.format("__r_%s()", l_v52_1);
    else
        v63 = getmetatable(v61);
        v64 = string.format("__%s()", l_v52_1);
    end;
    local v65 = v63[v0.Operations][v64];
    if v65 == nil then
        local v66 = v10.new({
            name = v63[v0.Name] .. "." .. v64
        });
        v63[v0.Operations][v64] = v66;
        return v66;
    else
        return v65;
    end;
end;
v52 = "div";
local l_v52_2 = v52 --[[ copy: 11 -> 14 ]];
v31.__div = function(v68, v69)
    local v70 = nil;
    local v71 = nil;
    if not (type(v68) ~= "string") or not getmetatable(v68) then
        v70 = getmetatable(v69);
        v71 = string.format("__r_%s()", l_v52_2);
    else
        v70 = getmetatable(v68);
        v71 = string.format("__%s()", l_v52_2);
    end;
    local v72 = v70[v0.Operations][v71];
    if v72 == nil then
        local v73 = v10.new({
            name = v70[v0.Name] .. "." .. v71
        });
        v70[v0.Operations][v71] = v73;
        return v73;
    else
        return v72;
    end;
end;
v52 = "mul";
local l_v52_3 = v52 --[[ copy: 11 -> 15 ]];
v31.__mul = function(v75, v76)
    local v77 = nil;
    local v78 = nil;
    if not (type(v75) ~= "string") or not getmetatable(v75) then
        v77 = getmetatable(v76);
        v78 = string.format("__r_%s()", l_v52_3);
    else
        v77 = getmetatable(v75);
        v78 = string.format("__%s()", l_v52_3);
    end;
    local v79 = v77[v0.Operations][v78];
    if v79 == nil then
        local v80 = v10.new({
            name = v77[v0.Name] .. "." .. v78
        });
        v77[v0.Operations][v78] = v80;
        return v80;
    else
        return v79;
    end;
end;
v52 = "mod";
local l_v52_4 = v52 --[[ copy: 11 -> 16 ]];
v31.__mod = function(v82, v83)
    local v84 = nil;
    local v85 = nil;
    if not (type(v82) ~= "string") or not getmetatable(v82) then
        v84 = getmetatable(v83);
        v85 = string.format("__r_%s()", l_v52_4);
    else
        v84 = getmetatable(v82);
        v85 = string.format("__%s()", l_v52_4);
    end;
    local v86 = v84[v0.Operations][v85];
    if v86 == nil then
        local v87 = v10.new({
            name = v84[v0.Name] .. "." .. v85
        });
        v84[v0.Operations][v85] = v87;
        return v87;
    else
        return v86;
    end;
end;
v52 = "pow";
local l_v52_5 = v52 --[[ copy: 11 -> 17 ]];
v31.__pow = function(v89, v90)
    local v91 = nil;
    local v92 = nil;
    if not (type(v89) ~= "string") or not getmetatable(v89) then
        v91 = getmetatable(v90);
        v92 = string.format("__r_%s()", l_v52_5);
    else
        v91 = getmetatable(v89);
        v92 = string.format("__%s()", l_v52_5);
    end;
    local v93 = v91[v0.Operations][v92];
    if v93 == nil then
        local v94 = v10.new({
            name = v91[v0.Name] .. "." .. v92
        });
        v91[v0.Operations][v92] = v94;
        return v94;
    else
        return v93;
    end;
end;
v52 = "neg";
local l_v52_6 = v52 --[[ copy: 11 -> 18 ]];
v31.__unm = function(v96, v97)
    local v98 = nil;
    local v99 = nil;
    if not (type(v96) ~= "string") or not getmetatable(v96) then
        v98 = getmetatable(v97);
        v99 = string.format("__r_%s()", l_v52_6);
    else
        v98 = getmetatable(v96);
        v99 = string.format("__%s()", l_v52_6);
    end;
    local v100 = v98[v0.Operations][v99];
    if v100 == nil then
        local v101 = v10.new({
            name = v98[v0.Name] .. "." .. v99
        });
        v98[v0.Operations][v99] = v101;
        return v101;
    else
        return v100;
    end;
end;
v52 = "concat";
v31.__concat = function(v102, v103)
    local v104 = nil;
    local v105 = nil;
    if not (type(v102) ~= "string") or not getmetatable(v102) then
        v104 = getmetatable(v103);
        v105 = string.format("__r_%s()", v52);
    else
        v104 = getmetatable(v102);
        v105 = string.format("__%s()", v52);
    end;
    local v106 = v104[v0.Operations][v105];
    if v106 == nil then
        local v107 = v10.new({
            name = v104[v0.Name] .. "." .. v105
        });
        v104[v0.Operations][v105] = v107;
        return v107;
    else
        return v106;
    end;
end;
v10.new = function(v108)
    v108 = v108 or {};
    local function _()
        if not v108.name then
            if not v108.spec then
                return "mock";
            else
                return (tostring(v108.spec));
            end;
        else
            return v108.name;
        end;
    end;
    local v110 = {};
    local v111 = {
        [v0.isMagicMock] = true, 
        [v0.Address] = tostring(v110), 
        [v0.Name] = if not v108.name then if v108.spec then tostring(v108.spec) else "mock" else v108.name, 
        [v0.Operations] = {}, 
        [v0.Calls] = {}, 
        [v0.Children] = {}, 
        [v0.Spec] = v108.spec or nil, 
        [v0.ReturnValue] = nil, 
        [v0.SideEffect] = nil
    };
    for v112, v113 in pairs(v31) do
        v111[v112] = v113;
    end;
    local v114 = setmetatable(v110, v111);
    if v108.returnValue then
        v2(v114, v108.returnValue);
    end;
    if v108.sideEffect then
        v3(v114, v108.sideEffect);
    end;
    return v114;
end;
v10.is = function(v115)
    local v116 = getmetatable(v115);
    if not v116 then
        return false;
    else
        return v116[v0.isMagicMock] ~= nil;
    end;
end;
return v10;
