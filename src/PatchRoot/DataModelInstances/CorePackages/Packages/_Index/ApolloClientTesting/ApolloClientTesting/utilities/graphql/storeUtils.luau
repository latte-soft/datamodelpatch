local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_HttpService_0 = game:GetService("HttpService");
local v6 = {};
local v7 = nil;
local v8 = nil;
local v9 = nil;
local _ = require(script.Parent.types);
local _ = require(l_Parent_1.GraphQL);
local l_InvariantError_0 = require(l_Parent_0.jsutils.invariant).InvariantError;
local l_isNonNullObject_0 = require(script.Parent.Parent.common.objects).isNonNullObject;
local v14 = require(script.Parent.fragments);
local v15 = require(l_Parent_0.luaUtils.objectKeysForEach);
local l_getFragmentFromSelection_0 = v14.getFragmentFromSelection;
v6.makeReference = function(v17)
    return {
        __ref = tostring(v17)
    };
end;
v6.isReference = function(v18)
    local v19 = false;
    if type(v18) == "table" then
        v19 = type(v18.__ref) == "string";
    end;
    return v19;
end;
v6.isDocumentNode = function(v20)
    local v21 = l_isNonNullObject_0(v20);
    if v21 then
        v21 = false;
        if v20.kind == "Document" then
            v21 = l_Array_0.isArray(v20.definitions);
        end;
    end;
    return v21;
end;
local function _(v22)
    return v22.kind == "StringValue";
end;
local function _(v24)
    return v24.kind == "BooleanValue";
end;
local function _(v26)
    return v26.kind == "IntValue";
end;
local function _(v28)
    return v28.kind == "FloatValue";
end;
local function _(v30)
    return v30.kind == "Variable";
end;
local function _(v32)
    return v32.kind == "ObjectValue";
end;
local function _(v34)
    return v34.kind == "ListValue";
end;
local function _(v36)
    return v36.kind == "EnumValue";
end;
local function _(v38)
    return v38.kind == "NullValue";
end;
local function v40(v41, v42, v43, v44)
    if not (v43.kind == "IntValue") and not (v43.kind == "FloatValue") then
        if not (v43.kind == "BooleanValue") and not (v43.kind == "StringValue") then
            if not (v43.kind == "ObjectValue") then
                if not (v43.kind == "Variable") then
                    if not (v43.kind == "ListValue") then
                        if not (v43.kind == "EnumValue") then
                            if not (v43.kind == "NullValue") then
                                error(l_InvariantError_0.new(tostring(("The inline argument \"%s\" of kind \"%s\""):format(v42.value, v43.kind)) .. "is not supported. Use variables instead of inline arguments to " .. "overcome this limitation."));
                                return ;
                            else
                                v41[v42.value] = nil;
                                return ;
                            end;
                        else
                            v41[v42.value] = v43.value;
                            return ;
                        end;
                    else
                        v41[v42.value] = l_Array_0.map(v43.values, function(v45)
                            local v46 = {};
                            v40(v46, v42, v45, v44);
                            return v46[v42.value];
                        end);
                        return ;
                    end;
                else
                    v41[v42.value] = (v44 or {})[v43.name.value];
                    return ;
                end;
            else
                local v47 = {};
                l_Array_0.map(v43.fields, function(v48)
                    v40(v47, v48.name, v48.value, v44);
                    return nil;
                end);
                v41[v42.value] = v47;
                return ;
            end;
        else
            v41[v42.value] = v43.value;
            return ;
        end;
    else
        v41[v42.value] = tonumber(v43.value);
        return ;
    end;
end;
v6.valueToObjectRepresentation = v40;
v6.storeKeyNameFromField = function(v49, v50)
    local v51 = nil;
    if v49.directives then
        v51 = {};
        l_Array_0.forEach(v49.directives, function(v52)
            v51[v52.name.value] = {};
            if v52.arguments then
                l_Array_0.forEach(v52.arguments, function(v53)
                    v40(v51[v52.name.value], v53.name, v53.value, v50);
                end);
            end;
        end);
    end;
    local v54 = nil;
    if v49.arguments and #v49.arguments > 0 then
        v54 = {};
        l_Array_0.forEach(v49.arguments, function(v55)
            v40(v54, v55.name, v55.value, v50);
        end);
    end;
    return v7(v49.name.value, v54, v51);
end;
local v56 = {
    "connection", 
    "include", 
    "skip", 
    "client", 
    "rest", 
    "export"
};
v7 = l_Object_0.assign(setmetatable({}, {
    __call = function(_, v58, v59, v60)
        if ((not v59 or not v60) or not v60.connection) or not v60.connection.key then
            local l_v58_0 = v58;
            if v59 then
                l_v58_0 = l_v58_0 .. ("(%s)"):format((v8(v59)));
            end;
            if v60 then
                v15(v60, function(v62)
                    if l_Array_0.indexOf(v56, v62) ~= -1 then
                        return ;
                    elseif v60[v62] and next(v60[v62]) ~= nil then
                        l_v58_0 = l_v58_0 .. ("@%s(%s)"):format(v62, v8(v60[v62]));
                        return ;
                    else
                        l_v58_0 = l_v58_0 .. ("@%s"):format(v62);
                        return ;
                    end;
                end);
            end;
            return l_v58_0;
        elseif v60.connection.filter and #v60.connection.filter > 0 then
            local v63 = nil;
            v63 = if not v60.connection.filter then {} else v60.connection.filter;
            l_Array_0.sort(v63, nil);
            local v64 = {};
            l_Array_0.forEach(v63, function(v65)
                v64[v65] = v59[v65];
            end);
            return ("%s(%s)"):format(v60.connection.key, v8(v64));
        else
            return v60.connection.key;
        end;
    end
}), {
    setStringify = function(_, v67)
        local l_v8_0 = v8;
        v8 = v67;
        return l_v8_0;
    end
});
v6.getStoreKeyName = v7;
v8 = function(v69)
    if l_isNonNullObject_0(v69) then
        local v71 = l_Array_0.map(l_Array_0.sort(l_Object_0.keys(v69), nil), function(v70)
            return {
                v70, 
                v8(v69[v70])
            };
        end);
        if not l_Array_0.isArray(v69) then
            return ("{%s}"):format(l_Array_0.join(l_Array_0.map(v71, function(v72)
                return ("\"%s\":%s"):format(v72[1], v72[2]);
            end), ","));
        else
            return ("[%s]"):format(l_Array_0.join(l_Array_0.map(v71, function(v73)
                return v73[2];
            end), ","));
        end;
    else
        return l_HttpService_0:JSONEncode(v69);
    end;
end;
v6.argumentsObjectFromField = function(v74, v75)
    if v74.arguments and #v74.arguments > 0 then
        local v76 = {};
        l_Array_0.forEach(v74.arguments, function(v77)
            v40(v76, v77.name, v77.value, v75);
        end);
        return v76;
    else
        return nil;
    end;
end;
v6.resultKeyNameFromField = function(v78)
    if not v78.alias then
        return v78.name.value;
    else
        return v78.alias.value;
    end;
end;
local function v79(v80, v81, v82)
    if typeof(v80.__typename) == "string" then
        return v80.__typename;
    else
        for _, v84 in ipairs(v81.selections) do
            if not v9(v84) then
                local v85 = v79(v80, l_getFragmentFromSelection_0(v84, v82).selectionSet, v82);
                if typeof(v85) == "string" then
                    return v85;
                end;
            elseif v84.name.value == "__typename" then
                return v80[if not v84.alias then v84.name.value else v84.alias.value];
            end;
        end;
        return nil;
    end;
end;
v6.getTypenameFromResult = v79;
v9 = function(v86)
    return v86.kind == "Field";
end;
v6.isField = v9;
v6.isInlineFragment = function(v87)
    return v87.kind == "InlineFragment";
end;
return v6;
