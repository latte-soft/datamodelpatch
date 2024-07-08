local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_inspect_0 = v1.util.inspect;
local _ = require(l_Parent_0.Shared);
local l_isValidElementType_0 = require(l_Parent_0.Shared).isValidElementType;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_getIteratorFn_0 = l_ReactSymbols_0.getIteratorFn;
local _ = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local _ = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_warnAboutSpreadingKeyToJSX_0 = require(l_Parent_0.Shared).ReactFeatureFlags.warnAboutSpreadingKeyToJSX;
local l_checkPropTypes_0 = require(l_Parent_0.Shared).checkPropTypes;
local l_ReactCurrentOwner_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactCurrentOwner;
local v19 = require(script.Parent.ReactElement);
local l_isValidElement_0 = v19.isValidElement;
local l_createElement_0 = v19.createElement;
local l_cloneElement_0 = v19.cloneElement;
local l_jsxDEV_0 = v19.jsxDEV;
local l_setExtraStackFrame_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactDebugCurrentFrame.setExtraStackFrame;
local l_describeUnknownElementTypeFrameInDEV_0 = require(l_Parent_0.Shared).ReactComponentStackFrame.describeUnknownElementTypeFrameInDEV;
local v26 = {};
local function _(v27)
    if _G.__DEV__ then
        if not v27 then
            l_setExtraStackFrame_0(nil);
        else
            local l__owner_0 = v27._owner;
            local v29 = nil;
            if l__owner_0 then
                v29 = l__owner_0.type;
            end;
            l_setExtraStackFrame_0((l_describeUnknownElementTypeFrameInDEV_0(v27.type, v27._source, v29)));
            return ;
        end;
    end;
end;
local v31 = nil;
if _G.__DEV__ then
    v31 = false;
end;
local function _(v32, v33)
    return v32[v33] ~= nil;
end;
local function _()
    if l_ReactCurrentOwner_0.current then
        local v35 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if v35 then
            return "\n\nCheck the render method of `" .. v35 .. "`.";
        end;
    end;
    return "";
end;
local function _(v37)
    if v37 ~= nil then
        return "\n\nCheck your code at " .. string.gsub(v37.fileName, "^.*[\\/]", "") .. ":" .. v37.lineNumber .. ".";
    else
        return "";
    end;
end;
local function _(v39)
    if v39 ~= nil then
        local l___source_0 = v39.__source;
        if l___source_0 ~= nil then
            return "\n\nCheck your code at " .. string.gsub(l___source_0.fileName, "^.*[\\/]", "") .. ":" .. l___source_0.lineNumber .. ".";
        else
            return "";
        end;
    else
        return "";
    end;
end;
local v42 = {};
local function v48(v43)
    local v44;
    if l_ReactCurrentOwner_0.current then
        local v45 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if v45 then
            v44 = "\n\nCheck the render method of `" .. v45 .. "`.";
            goto label0 --[[  true, true  ]];
        end;
    end;
    v44 = "";
    ::label0::;
    if not l_Boolean_0.toJSBoolean(v44) then
        local v46 = if typeof(v43) == "string" then v43 else if typeof(v43) == "table" then v43.displayName or v43.name else nil;
        if not v46 and typeof(v43) == "function" then
            local v47 = debug.info(v43, "n");
            v46 = if v47 ~= "" then v47 else nil;
        end;
        if v46 then
            v44 = string.format("\n\nCheck the top-level render call using <%s>.", v46);
        end;
    end;
    return v44;
end;
local function v56(v49, v50, v51)
    if v49._store ~= nil and not v49._store.validated then
        v49._store.validated = true;
        if (v49.key ~= nil) ~= (v51 ~= nil) then
            return ;
        else
            local v52 = v48(v50);
            if not v42[v52] then
                v42[v52] = true;
                local v53 = "";
                if not (not v49 or not v49._owner) and v49._owner ~= l_ReactCurrentOwner_0.current then
                    v53 = string.format(" It was passed a child from %s.", (tostring(l_getComponentName_0(v49._owner.type))));
                end;
                if _G.__DEV__ then
                    if _G.__DEV__ then
                        if not v49 then
                            l_setExtraStackFrame_0(nil);
                        else
                            local l__owner_1 = v49._owner;
                            local v55 = nil;
                            if l__owner_1 then
                                v55 = l__owner_1.type;
                            end;
                            l_setExtraStackFrame_0((l_describeUnknownElementTypeFrameInDEV_0(v49.type, v49._source, v55)));
                        end;
                    end;
                    if v49.key ~= nil and v51 ~= nil then
                        l_console_0.error("Child element received a \"key\" prop (\"%s\") in addition to a key in " .. "the \"children\" table of its parent (\"%s\"). Please provide only " .. "one key definition. When both are present, the \"key\" prop " .. "will take precedence." .. "%s%s See https://reactjs.org/link/warning-keys for more information.", tostring(v49.key), tostring(v51), v52, v53);
                    else
                        l_console_0.error("Each child in a list should have a unique \"key\" prop." .. "%s%s See https://reactjs.org/link/warning-keys for more information.", v52, v53);
                    end;
                    if _G.__DEV__ then
                        l_setExtraStackFrame_0(nil);
                    end;
                end;
                return ;
            else
                return ;
            end;
        end;
    else
        return ;
    end;
end;
local function v64(v57, v58)
    if typeof(v57) ~= "table" then
        return ;
    elseif not l_Array_0.isArray(v57) then
        if not l_isValidElement_0(v57) then
            if v57 then
                local v59 = l_getIteratorFn_0(v57);
                if typeof(v59) == "function" and v59 ~= v57.entries then
                    local v60 = v59(v57);
                    local v61 = v60.next();
                    while not v61.done do
                        if l_isValidElement_0(v61.value) then
                            v56(v61.value, v58, v61.key);
                        end;
                        v61 = v60.next();
                    end;
                end;
            end;
        elseif v57._store then
            v57._store.validated = true;
            return ;
        end;
        return ;
    else
        for v62 = 1, #v57 do
            local v63 = v57[v62];
            if l_isValidElement_0(v63) then
                v56(v63, v58);
            end;
        end;
        return ;
    end;
end;
local function v69(v65)
    if not (not _G.__DEV__ and not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) then
        local l_type_0 = v65.type;
        if not (l_type_0 ~= nil) or typeof(l_type_0) == "string" then
            return ;
        else
            local v67 = nil;
            local v68 = nil;
            if typeof(l_type_0) == "function" then
                return ;
            elseif typeof(l_type_0) == "table" then
                v67 = l_type_0.propTypes;
                v68 = l_type_0.validateProps;
                if not v67 and not v68 then
                    if not (not (l_type_0.PropTypes ~= nil) or v31) then
                        v31 = true;
                        l_console_0.error("Component %s declared `PropTypes` instead of `propTypes`. Did you misspell the property assignment?", l_getComponentName_0(l_type_0) or "Unknown");
                    end;
                else
                    l_checkPropTypes_0(v67, v68, v65.props, "prop", l_getComponentName_0(l_type_0), v65);
                end;
                if l_type_0.getDefaultProps ~= nil then
                    l_console_0.error("getDefaultProps is only used on classic React.createClass " .. "definitions. Use a static property named `defaultProps` instead.");
                end;
            else
                return ;
            end;
        end;
    end;
end;
local function v78(v70)
    if _G.__DEV__ then
        local v71 = l_Object_0.keys(v70.props);
        for v72 = 1, #v71 do
            local v73 = v71[v72];
            if v73 ~= "children" and v73 ~= "key" then
                if _G.__DEV__ then
                    if not v70 then
                        l_setExtraStackFrame_0(nil);
                    else
                        local l__owner_2 = v70._owner;
                        local v75 = nil;
                        if l__owner_2 then
                            v75 = l__owner_2.type;
                        end;
                        l_setExtraStackFrame_0((l_describeUnknownElementTypeFrameInDEV_0(v70.type, v70._source, v75)));
                    end;
                end;
                l_console_0.error("Invalid prop `%s` supplied to `React.Fragment`. " .. "React.Fragment can only have `key` and `children` props.", v73);
                if _G.__DEV__ then
                    l_setExtraStackFrame_0(nil);
                    break;
                else
                    break;
                end;
            end;
        end;
        if v70.ref ~= nil then
            if _G.__DEV__ then
                if not v70 then
                    l_setExtraStackFrame_0(nil);
                else
                    local l__owner_3 = v70._owner;
                    local v77 = nil;
                    if l__owner_3 then
                        v77 = l__owner_3.type;
                    end;
                    l_setExtraStackFrame_0((l_describeUnknownElementTypeFrameInDEV_0(v70.type, v70._source, v77)));
                end;
            end;
            l_console_0.error("Invalid attribute `ref` supplied to `React.Fragment`.");
            if _G.__DEV__ then
                l_setExtraStackFrame_0(nil);
            end;
        end;
    end;
end;
local function v95(v79, v80, v81, v82, v83, v84)
    local v85 = l_isValidElementType_0(v79);
    if not v85 then
        local v86 = "";
        if not (v79 ~= nil) or typeof(v79) == "table" and #l_Object_0.keys(v79) == 0 then
            v86 = v86 .. " You likely forgot to export your component from the file " .. "it's defined in, or you might have mixed up default and named imports.";
        end;
        local v87 = if v83 ~= nil then "\n\nCheck your code at " .. string.gsub(v83.fileName, "^.*[\\/]", "") .. ":" .. v83.lineNumber .. "." else "";
        if not v87 then
            local l_v86_0 = v86;
            local v89;
            if l_ReactCurrentOwner_0.current then
                local v90 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
                if v90 then
                    v89 = "\n\nCheck the render method of `" .. v90 .. "`.";
                    goto label1 --[[  true, true  ]];
                end;
            end;
            v89 = "";
            ::label1::;
            v86 = l_v86_0 .. v89;
        else
            v86 = v86 .. v87;
        end;
        local v91 = nil;
        if v79 == nil then
            v91 = "nil";
        elseif not l_Array_0.isArray(v79) then
            if typeof(v79) == "table" and v79["$$typeof"] == l_REACT_ELEMENT_TYPE_0 then
                v91 = string.format("<%s />", l_getComponentName_0(v79.type) or "Unknown");
                v86 = v86 .. " Did you accidentally export a JSX literal or Element instead of a component?";
            else
                v91 = typeof(v79);
                v86 = v86 .. "\n" .. l_inspect_0(v79);
            end;
        else
            v91 = "array";
        end;
        if _G.__DEV__ then
            l_console_0.error("React.jsx: type is invalid -- expected a string (for " .. "built-in components) or a class/function (for composite " .. "components) but got: %s.%s", v91, v86);
        end;
    end;
    local v92 = l_jsxDEV_0(v79, v80, v81, v83, v84);
    if v92 == nil then
        return v92;
    else
        if v85 then
            local l_children_0 = v80.children;
            if l_children_0 ~= nil then
                if not v82 then
                    v64(l_children_0, v79);
                elseif not l_Array_0.isArray(l_children_0) then
                    if _G.__DEV__ then
                        l_console_0.error("React.jsx: Static children should always be an array. " .. "You are likely explicitly calling React.jsxs or React.jsxDEV. " .. "Use the Babel transform instead.");
                    end;
                else
                    for v94 = 1, #l_children_0 do
                        v64(l_children_0[v94], v79);
                    end;
                    l_Object_0.freeze(l_children_0);
                end;
            end;
        end;
        if not ((not _G.__DEV__ or not l_warnAboutSpreadingKeyToJSX_0) or not (v80.key ~= nil)) then
            l_console_0.error("React.jsx: Spreading a key to JSX is a deprecated pattern. " .. "Explicitly pass a key after spreading props in your JSX call. " .. "E.g. <%s {...props} key={key} />", l_getComponentName_0(v79) or "ComponentName");
        end;
        if v79 == l_REACT_FRAGMENT_TYPE_0 then
            v78(v92);
            return v92;
        else
            v69(v92);
            return v92;
        end;
    end;
end;
v26.jsxWithValidation = v95;
v26.jsxWithValidationStatic = function(v96, v97, v98)
    return (v95(v96, v97, v98, true));
end;
v26.jsxWithValidationDynamic = function(v99, v100, v101)
    return (v95(v99, v100, v101, false));
end;
v26.createElementWithValidation = function(v102, v103, ...)
    local v104 = l_isValidElementType_0(v102);
    if not v104 then
        local v105 = "";
        if not (v102 ~= nil) or typeof(v102) == "table" and #l_Object_0.keys(v102) == 0 then
            v105 = v105 .. " You likely forgot to export your component from the file " .. "it's defined in, or you might have mixed up default and named imports.";
        end;
        local v106;
        if v103 ~= nil then
            local l___source_1 = v103.__source;
            v106 = if l___source_1 ~= nil then "\n\nCheck your code at " .. string.gsub(l___source_1.fileName, "^.*[\\/]", "") .. ":" .. l___source_1.lineNumber .. "." else "";
        else
            v106 = "";
        end;
        if not v106 then
            local l_v105_0 = v105;
            local v109;
            if l_ReactCurrentOwner_0.current then
                local v110 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
                if v110 then
                    v109 = "\n\nCheck the render method of `" .. v110 .. "`.";
                    goto label2 --[[  true, true  ]];
                end;
            end;
            v109 = "";
            ::label2::;
            v105 = l_v105_0 .. v109;
        else
            v105 = v105 .. v106;
        end;
        local v111 = nil;
        if v102 == nil then
            v111 = "nil";
        elseif not l_Array_0.isArray(v102) then
            if (v102 ~= nil and typeof(v102) == "table") and v102["$$typeof"] == l_REACT_ELEMENT_TYPE_0 then
                v111 = string.format("<%s />", l_getComponentName_0(v102.type) or "Unknown");
                v105 = v105 .. " Did you accidentally export a JSX literal or Element instead of a component?";
            else
                v111 = typeof(v102);
                if v102 ~= nil then
                    v105 = v105 .. "\n" .. l_inspect_0(v102);
                end;
            end;
        else
            v111 = "array";
        end;
        if _G.__DEV__ then
            l_console_0.error("React.createElement: type is invalid -- expected a string (for " .. "built-in components) or a class/function (for composite " .. "components) but got: %s.%s", v111, v105);
        end;
    end;
    local v112 = l_createElement_0(v102, v103, ...);
    if v112 == nil then
        return v112;
    else
        if v104 then
            for v113 = 1, select("#", ...) do
                v64(select(v113, ...), v102);
            end;
        end;
        if v102 == l_REACT_FRAGMENT_TYPE_0 then
            v78(v112);
            return v112;
        else
            v69(v112);
            return v112;
        end;
    end;
end;
v26.cloneElementWithValidation = function(v114, v115, ...)
    local v116 = {
        v114, 
        v115, 
        ...
    };
    local v117 = l_cloneElement_0(v114, v115, ...);
    for v118 = 3, #v116 do
        v64(v116[v118], v117.type);
    end;
    v69(v117);
    return v117;
end;
return v26;
