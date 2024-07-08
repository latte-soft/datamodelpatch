local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_Symbol_0 = v2.Symbol;
local l_instanceof_0 = v2.instanceof;
local _ = require(l_Parent_1.RegExp);
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v9 = {};
local v10 = require(l_Parent_0.jasmineUtils);
local l_equals_0 = v10.equals;
local l_hasProperty_0 = v10.hasProperty;
local l_isA_0 = v10.isA;
local l_isUndefined_0 = v10.isUndefined;
local l_getState_0 = require(l_Parent_0.jestMatchersObject_extracted).getState;
local _ = require(l_Parent_0.types);
local v17 = require(l_Parent_0.utils);
local v18 = l_Object_0.freeze(l_Object_0.assign({}, v9, {
    iterableEquality = v17.iterableEquality, 
    subsetEquality = v17.subsetEquality
}));
local v19 = {};
v19.__index = v19;
v19.new = function(v20, v21)
    local v22 = {
        sample = v20, 
        inverse = not (v21 == nil) and v21, 
        ["$$typeof"] = l_Symbol_0.for_("jest.asymmetricMatcher")
    };
    setmetatable(v22, v19);
    return v22;
end;
v19.getMatcherContext = function(v23)
    return l_Object_0.assign({}, l_getState_0(), {
        equals = l_equals_0, 
        isNot = v23.inverse, 
        utils = v18
    });
end;
local v24 = {};
v24.__index = v24;
setmetatable(v24, v19);
v24.new = function(v25)
    if typeof(v25) ~= "table" and typeof(v25) ~= "string" then
        error("any() expects to be passed a typename string or a prototype class. " .. "Please pass one or use anything() to match any object.");
    end;
    local v26 = v19.new(v25);
    setmetatable(v26, v24);
    return v26;
end;
v24.asymmetricMatch = function(v27, v28)
    local v29 = l_getType_0(v27.sample);
    local v30 = l_getType_0(v28);
    if not (not (v29 == "table") or v30 ~= "table") or v29 == "error" and v30 == "error" then
        return l_instanceof_0(v28, v27.sample);
    elseif v29 == "string" and v27.sample == v30 then
        return true;
    else
        return false;
    end;
end;
v24.toString = function(_)
    return "Any";
end;
v24.getExpectedType = function(v32)
    return (tostring(v32.sample));
end;
v24.toAsymmetricMatcher = function(v33)
    return "Any<" .. tostring(v33.sample) .. ">";
end;
local v34 = {};
v34.__index = v34;
setmetatable(v34, v19);
v34.new = function(v35)
    local v36 = v19.new(v35);
    setmetatable(v36, v34);
    return v36;
end;
v34.asymmetricMatch = function(_, v38)
    return not l_isUndefined_0(v38);
end;
v34.toString = function(_)
    return "Anything";
end;
v34.toAsymmetricMatcher = function(_)
    return "Anything";
end;
local v41 = {};
v41.__index = v41;
setmetatable(v41, v19);
v41.new = function(v42, v43)
    if not (v43 ~= nil) then
        v43 = false;
    end;
    local v44 = v19.new(v42, v43);
    setmetatable(v44, v41);
    return v44;
end;
v41.asymmetricMatch = function(v45, v46)
    if not l_Array_0.isArray(v45.sample) then
        error(string.format("You must provide an array to %s, not '%s'.", v45:toString(), (typeof(v45.sample))));
    end;
    local v47 = false;
    if #v45.sample == 0 then
        v47 = true;
    elseif not (not l_Array_0.isArray(v46) or not l_Array_0.every(v45.sample, function(v48)
        return l_Array_0.some(v46, function(v49)
            return l_equals_0(v48, v49);
        end);
    end)) then
        v47 = true;
    end;
    if not v45.inverse then
        return v47;
    else
        return not v47;
    end;
end;
v41.toString = function(v50)
    if not v50.inverse then
        return "ArrayContaining";
    else
        return "ArrayNotContaining";
    end;
end;
v41.getExpectedType = function(_)
    return "array";
end;
local v52 = {};
v52.__index = v52;
setmetatable(v52, v19);
v52.new = function(v53, v54)
    if not (v54 ~= nil) then
        v54 = false;
    end;
    local v55 = v19.new(v53, v54);
    setmetatable(v55, v52);
    return v55;
end;
v52.asymmetricMatch = function(v56, v57)
    if typeof(v56.sample) ~= "table" then
        error(string.format("You must provide an object to %s, not '%s'.", v56:toString(), (typeof(v56.sample))));
    end;
    local v58 = true;
    for v59, v60 in pairs(v56.sample) do
        if not (l_hasProperty_0(v57, v59) and l_equals_0(v60, v57[v59])) then
            v58 = false;
            break;
        end;
    end;
    if not v56.inverse then
        return v58;
    else
        return not v58;
    end;
end;
v52.toString = function(v61)
    if not v61.inverse then
        return "ObjectContaining";
    else
        return "ObjectNotContaining";
    end;
end;
v52.getExpectedType = function(_)
    return "object";
end;
local v63 = {};
v63.__index = v63;
setmetatable(v63, v19);
v63.new = function(v64, v65)
    if not (v65 ~= nil) then
        v65 = false;
    end;
    if not l_isA_0("string", v64) then
        error("Expected is not a String");
    end;
    local v66 = v19.new(v64, v65);
    setmetatable(v66, v63);
    return v66;
end;
v63.asymmetricMatch = function(v67, v68)
    local v69 = l_isA_0("string", v68) and v68:find(v67.sample, 1, true);
    if not v67.inverse then
        return not not v69;
    else
        return not v69;
    end;
end;
v63.toString = function(v70)
    if not v70.inverse then
        return "StringContaining";
    else
        return "StringNotContaining";
    end;
end;
v63.getExpectedType = function(_)
    return "string";
end;
local v72 = {};
v72.__index = v72;
setmetatable(v72, v19);
v72.new = function(v73, v74)
    if not (v74 ~= nil) then
        v74 = false;
    end;
    if not (l_isA_0("string", v73) or l_isA_0("regexp", v73)) then
        error("Expected is not a String");
    end;
    local v75 = v19.new(v73, v74);
    setmetatable(v75, v72);
    return v75;
end;
v72.asymmetricMatch = function(v76, v77)
    local v78 = false;
    if l_isA_0("string", v77) then
        if not l_isA_0("string", v76.sample) then
            v78 = v76.sample:test(v77);
        else
            v76.sample = string.gsub(v76.sample, string.char(27) .. "%[", string.char(27) .. "%%[");
            v78 = v77:find(v76.sample);
        end;
    end;
    if not v76.inverse then
        return not not v78;
    else
        return not v78;
    end;
end;
v72.toString = function(v79)
    if not v79.inverse then
        return "StringMatching";
    else
        return "StringNotMatching";
    end;
end;
v72.getExpectedType = function(_)
    return "string";
end;
return {
    AsymmetricMatcher = v19, 
    any = function(v81)
        return v24.new(v81);
    end, 
    anything = function()
        return v34.new();
    end, 
    arrayContaining = function(v82)
        return v41.new(v82);
    end, 
    arrayNotContaining = function(v83)
        return v41.new(v83, true);
    end, 
    objectContaining = function(v84)
        return v52.new(v84);
    end, 
    objectNotContaining = function(v85)
        return v52.new(v85, true);
    end, 
    stringContaining = function(v86)
        return v63.new(v86);
    end, 
    stringNotContaining = function(v87)
        return v63.new(v87, true);
    end, 
    stringMatching = function(v88)
        return v72.new(v88);
    end, 
    stringNotMatching = function(v89)
        return v72.new(v89, true);
    end
};
