local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local l_Symbol_0 = v2.Symbol;
local l_instanceof_0 = v2.instanceof;
local _ = require(l_Parent_1.RegExp);
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v11 = {};
local l_pluralize_0 = require(l_Parent_1.JestUtil).pluralize;
local v13 = require(l_Parent_0.jasmineUtils);
local l_equals_0 = v13.equals;
local l_hasProperty_0 = v13.hasProperty;
local l_isA_0 = v13.isA;
local l_isUndefined_0 = v13.isUndefined;
local l_getState_0 = require(l_Parent_0.jestMatchersObject_extracted).getState;
local _ = require(l_Parent_0.types);
local v20 = require(l_Parent_0.utils);
local v21 = l_Object_0.freeze(l_Object_0.assign({}, v11, {
    iterableEquality = v20.iterableEquality, 
    subsetEquality = v20.subsetEquality
}));
local v22 = {};
v22.__index = v22;
v22.new = function(v23, v24)
    local v25 = if v24 ~= nil then v24 else false;
    local v26 = {
        sample = v23, 
        inverse = not (v25 == nil) and v25, 
        ["$$typeof"] = l_Symbol_0.for_("jest.asymmetricMatcher")
    };
    setmetatable(v26, v22);
    return v26;
end;
v22.getMatcherContext = function(v27)
    return l_Object_0.assign({}, l_getState_0(), {
        equals = l_equals_0, 
        isNot = v27.inverse, 
        utils = v21
    });
end;
local v28 = {};
v28.__index = v28;
setmetatable(v28, v22);
v28.new = function(v29)
    if typeof(v29) ~= "table" and typeof(v29) ~= "string" then
        error("any() expects to be passed a typename string or a prototype class. " .. "Please pass one or use anything() to match any object.");
    end;
    local v30 = v22.new(v29);
    setmetatable(v30, v28);
    return v30;
end;
v28.asymmetricMatch = function(v31, v32)
    local v33 = l_getType_0(v31.sample);
    local v34 = l_getType_0(v32);
    if not (not (v33 == "table") or v34 ~= "table") or v33 == "error" and v34 == "error" then
        return l_instanceof_0(v32, v31.sample);
    elseif v33 == "string" and v31.sample == v34 then
        return true;
    else
        return false;
    end;
end;
v28.toString = function(_)
    return "Any";
end;
v28.getExpectedType = function(v36)
    return (tostring(v36.sample));
end;
v28.toAsymmetricMatcher = function(v37)
    return "Any<" .. tostring(v37.sample) .. ">";
end;
local v38 = {};
v38.__index = v38;
setmetatable(v38, v22);
v38.new = function(v39)
    local v40 = v22.new(v39);
    setmetatable(v40, v38);
    return v40;
end;
v38.asymmetricMatch = function(_, v42)
    return not l_isUndefined_0(v42);
end;
v38.toString = function(_)
    return "Anything";
end;
v38.toAsymmetricMatcher = function(_)
    return "Anything";
end;
local v45 = {};
v45.__index = v45;
setmetatable(v45, v22);
v45.new = function(v46)
    local v47 = v22.new(v46);
    setmetatable(v47, v45);
    return v47;
end;
v45.asymmetricMatch = function(_, v49)
    return l_isUndefined_0(v49);
end;
v45.toString = function(_)
    return "Nothing";
end;
v45.getExpectedType = function(_)
    return "nil";
end;
v45.toAsymmetricMatcher = function(_)
    return "Nothing";
end;
local v53 = {};
v53.__index = v53;
setmetatable(v53, v22);
v53.new = function(v54, v55)
    if not (v55 ~= nil) then
        v55 = false;
    end;
    local v56 = v22.new(v54, v55);
    setmetatable(v56, v53);
    return v56;
end;
v53.asymmetricMatch = function(v57, v58)
    if not l_Array_0.isArray(v57.sample) then
        error(string.format("You must provide an array to %s, not '%s'.", v57:toString(), (typeof(v57.sample))));
    end;
    local v59 = false;
    if #v57.sample == 0 then
        v59 = true;
    elseif not (not l_Array_0.isArray(v58) or not l_Array_0.every(v57.sample, function(v60)
        return l_Array_0.some(v58, function(v61)
            return l_equals_0(v60, v61);
        end);
    end)) then
        v59 = true;
    end;
    if not v57.inverse then
        return v59;
    else
        return not v59;
    end;
end;
v53.toString = function(v62)
    if not v62.inverse then
        return "ArrayContaining";
    else
        return "ArrayNotContaining";
    end;
end;
v53.getExpectedType = function(_)
    return "array";
end;
local v64 = {};
v64.__index = v64;
setmetatable(v64, v22);
v64.new = function(v65, v66)
    if not (v66 ~= nil) then
        v66 = false;
    end;
    local v67 = v22.new(v65, v66);
    setmetatable(v67, v64);
    return v67;
end;
v64.asymmetricMatch = function(v68, v69)
    if typeof(v68.sample) ~= "table" then
        error(string.format("You must provide an object to %s, not '%s'.", v68:toString(), (typeof(v68.sample))));
    end;
    local v70 = true;
    for v71, v72 in pairs(v68.sample) do
        if not (l_hasProperty_0(v69, v71) and l_equals_0(v72, v69[v71])) then
            v70 = false;
            break;
        end;
    end;
    if not v68.inverse then
        return v70;
    else
        return not v70;
    end;
end;
v64.toString = function(v73)
    if not v73.inverse then
        return "ObjectContaining";
    else
        return "ObjectNotContaining";
    end;
end;
v64.getExpectedType = function(_)
    return "object";
end;
local v75 = {};
v75.__index = v75;
setmetatable(v75, v22);
v75.new = function(v76, v77)
    if not (v77 ~= nil) then
        v77 = false;
    end;
    if not l_isA_0("string", v76) then
        error("Expected is not a String");
    end;
    local v78 = v22.new(v76, v77);
    setmetatable(v78, v75);
    return v78;
end;
v75.asymmetricMatch = function(v79, v80)
    local v81 = l_isA_0("string", v80) and v80:find(v79.sample, 1, true);
    if not v79.inverse then
        return not not v81;
    else
        return not v81;
    end;
end;
v75.toString = function(v82)
    if not v82.inverse then
        return "StringContaining";
    else
        return "StringNotContaining";
    end;
end;
v75.getExpectedType = function(_)
    return "string";
end;
local v84 = {};
v84.__index = v84;
setmetatable(v84, v22);
v84.new = function(v85, v86)
    if not (v86 ~= nil) then
        v86 = false;
    end;
    if not (l_isA_0("string", v85) or l_isA_0("regexp", v85)) then
        error("Expected is not a String");
    end;
    local v87 = v22.new(v85, v86);
    setmetatable(v87, v84);
    return v87;
end;
v84.asymmetricMatch = function(v88, v89)
    local v90 = false;
    if l_isA_0("string", v89) then
        if not l_isA_0("string", v88.sample) then
            v90 = v88.sample:test(v89);
        else
            v88.sample = string.gsub(v88.sample, string.char(27) .. "%[", string.char(27) .. "%%[");
            v90 = v89:find(v88.sample);
        end;
    end;
    if not v88.inverse then
        return not not v90;
    else
        return not v90;
    end;
end;
v84.toString = function(v91)
    if not v91.inverse then
        return "StringMatching";
    else
        return "StringNotMatching";
    end;
end;
v84.getExpectedType = function(_)
    return "string";
end;
local v93 = setmetatable({}, {
    __index = v22
});
v93.__index = v93;
v93.new = function(v94, v95, v96)
    local v97 = if v95 ~= nil then v95 else 2;
    local v98 = if v96 ~= nil then v96 else false;
    if not l_Boolean_0.toJSBoolean(l_isA_0("number", v94)) then
        error(l_Error_0.new("Expected is not a Number"));
    end;
    if not l_Boolean_0.toJSBoolean(l_isA_0("number", v97)) then
        error(l_Error_0.new("Precision is not a Number"));
    end;
    local v99 = v22.new(v94);
    setmetatable(v99, v93);
    v99.inverse = v98;
    v99.precision = v97;
    return v99;
end;
v93.asymmetricMatch = function(v100, v101)
    if l_Boolean_0.toJSBoolean(l_isA_0("number", v101)) then
        local v102 = false;
        v102 = v101 == math.huge and v100.sample == math.huge or ((v101 == -math.huge and v100.sample == -math.huge) and true or math.abs(v100.sample - v101) < math.pow(10, -v100.precision) / 2);
        if not l_Boolean_0.toJSBoolean(v100.inverse) then
            return v102;
        else
            return not l_Boolean_0.toJSBoolean(v102);
        end;
    else
        return false;
    end;
end;
v93.toString = function(v103)
    return ("Number%sCloseTo"):format(not l_Boolean_0.toJSBoolean(v103.inverse) and "" or "Not");
end;
v93.getExpectedType = function(_)
    return "number";
end;
v93.toAsymmetricMatcher = function(v105)
    return l_Array_0.join({
        v105:toString(), 
        v105.sample, 
        ("(%s)"):format((tostring(l_pluralize_0("digit", v105.precision))))
    }, " ");
end;
return {
    AsymmetricMatcher = v22, 
    any = function(v106)
        return v28.new(v106);
    end, 
    anything = function()
        return v38.new();
    end, 
    nothing = function()
        return v45.new();
    end, 
    arrayContaining = function(v107)
        return v53.new(v107);
    end, 
    arrayNotContaining = function(v108)
        return v53.new(v108, true);
    end, 
    objectContaining = function(v109)
        return v64.new(v109);
    end, 
    objectNotContaining = function(v110)
        return v64.new(v110, true);
    end, 
    stringContaining = function(v111)
        return v75.new(v111);
    end, 
    stringNotContaining = function(v112)
        return v75.new(v112, true);
    end, 
    stringMatching = function(v113)
        return v84.new(v113);
    end, 
    stringNotMatching = function(v114)
        return v84.new(v114, true);
    end, 
    closeTo = function(v115, v116)
        return v93.new(v115, v116);
    end, 
    notCloseTo = function(v117, v118)
        return v93.new(v117, v118, true);
    end
};
