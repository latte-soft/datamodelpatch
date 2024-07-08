local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactLazy);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_REACT_ELEMENT_TYPE_0 = require(l_Parent_0.Shared).ReactSymbols.REACT_ELEMENT_TYPE;
local l_ReactCurrentOwner_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactCurrentOwner;
local v9 = {
    key = true, 
    ref = true, 
    __self = true, 
    __source = true
};
local v10 = nil;
local v11 = nil;
local v12 = nil;
if l___DEV___0 then
    v12 = {};
end;
local v13 = {};
local function _(v14)
    if not ((l___DEV___0 and v14.ref ~= nil) and type(v14.ref) == "table") or not v14.ref.isReactWarning then
        return v14.ref ~= nil;
    else
        return false;
    end;
end;
local function _(v16)
    if not ((l___DEV___0 and v16.key ~= nil) and type(v16.key) == "table") or not v16.key.isReactWarning then
        return v16.key ~= nil;
    else
        return false;
    end;
end;
local v18 = {
    isReactWarning = true
};
local function v24(v19, v20)
    local function _()
        if not (not l___DEV___0 or v10) then
            v10 = true;
            l_console_0.error("%s: `key` is not a prop. Trying to access it will result " .. "in `nil` being returned. If you need to access the same " .. "value within the child component, you should pass it as a different " .. "prop. (https://reactjs.org/link/special-props)", v20);
        end;
    end;
    v19.key = nil;
    setmetatable(v19, {
        __index = function(_, v23)
            if v23 == "key" then
                if not (not l___DEV___0 or v10) then
                    v10 = true;
                    l_console_0.error("%s: `key` is not a prop. Trying to access it will result " .. "in `nil` being returned. If you need to access the same " .. "value within the child component, you should pass it as a different " .. "prop. (https://reactjs.org/link/special-props)", v20);
                end;
                return v18;
            else
                return nil;
            end;
        end
    });
end;
local function v30(v25, v26)
    local function _()
        if not (not l___DEV___0 or v11) then
            v11 = true;
            l_console_0.error("%s: `ref` is not a prop. Trying to access it will result " .. "in `nil` being returned. If you need to access the same " .. "value within the child component, you should pass it as a different " .. "prop. (https://reactjs.org/link/special-props)", v26);
        end;
    end;
    v25.ref = nil;
    setmetatable(v25, {
        __index = function(_, v29)
            if v29 == "ref" then
                if not (not l___DEV___0 or v11) then
                    v11 = true;
                    l_console_0.error("%s: `ref` is not a prop. Trying to access it will result " .. "in `nil` being returned. If you need to access the same " .. "value within the child component, you should pass it as a different " .. "prop. (https://reactjs.org/link/special-props)", v26);
                end;
                return v18;
            else
                return nil;
            end;
        end
    });
end;
local function v33(v31)
    if not (not (l___DEV___0 and type(v31.ref) == "string") or not l_ReactCurrentOwner_0.current) then
        local v32 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if not v12[v32] then
            error(string.format("Component \"%s\" contains the string ref \"%s\". " .. "Support for string refs has been removed. " .. "We recommend using useRef() or createRef() instead. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-string-ref", v32 or "Unknown", v31.ref));
        end;
    end;
end;
local function v46(v34, v35, v36, v37, v38, v39, v40)
    local v41 = {
        type = v34, 
        key = v35, 
        ref = v36, 
        props = v40, 
        _owner = v39, 
        ["$$typeof"] = l_REACT_ELEMENT_TYPE_0
    };
    if l___DEV___0 then
        local v42 = {
            validated = false
        };
        v41._store = setmetatable({}, {
            __index = v42, 
            __newindex = function(v43, v44, v45)
                if v44 == "validated" then
                    v42.validated = v45;
                    return ;
                else
                    rawset(v43, v44, v45);
                    return ;
                end;
            end
        });
        setmetatable(v41, {
            __index = {
                _self = v37, 
                _source = v38
            }
        });
    end;
    return v41;
end;
v13.jsx = function(_, _, _)
    error("JSX is currently unsupported");
end;
v13.jsxDEV = function(_, _, _, _, _)
    error("JSX is currently unsupported");
    return nil;
end;
v13.createElement = function(v55, v56, ...)
    local v57 = if v56 ~= nil then table.clone(v56) else {};
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    if v56 ~= nil then
        if (not ((not not l___DEV___0 and v56.ref ~= nil) and type(v56.ref) == "table") or not v56.ref.isReactWarning) and v56.ref ~= nil then
            v59 = v56.ref;
            if l___DEV___0 then
                v33(v56);
            end;
        end;
        if (not ((not not l___DEV___0 and v56.key ~= nil) and type(v56.key) == "table") or not v56.key.isReactWarning) and v56.key ~= nil then
            local l_key_0 = v56.key;
            v58 = if type(l_key_0) == "number" then l_key_0 else tostring(l_key_0);
        end;
        v60 = if v56.__source == nil then nil else v56.__source;
        if v57.key ~= nil then
            v57.key = nil;
        end;
        if v57.ref ~= nil then
            v57.ref = nil;
        end;
        if v57.__self ~= nil then
            v57.__self = nil;
        end;
        if v57.__source ~= nil then
            v57.__source = nil;
        end;
    end;
    local v62 = select("#", ...);
    if v62 == 1 then
        v57.children = select(1, ...);
    elseif v62 > 1 then
        local v63 = table.create(v62);
        for v64 = 1, v62 do
            table.insert(v63, (select(v64, ...)));
        end;
        if l___DEV___0 then
            table.freeze(v63);
        end;
        v57.children = v63;
    end;
    if not (not (type(v55) == "table") or not v55.defaultProps) then
        local l_defaultProps_0 = v55.defaultProps;
        for v66, _ in l_defaultProps_0, nil, nil do
            if v57[v66] == nil then
                v57[v66] = l_defaultProps_0[v66];
            end;
        end;
    end;
    if l___DEV___0 then
        if not (not v58 and not v59) then
            local v68 = nil;
            v68 = if type(v55) == "function" then debug.info(v55, "n") or "<function>" else if type(v55) == "table" then (v55.displayName or v55.name) or "Unknown" else v55;
            if v58 then
                v24(v57, v68);
            end;
            if v59 then
                v30(v57, v68);
            end;
        end;
        if v60 == nil then
            v60 = {
                fileName = debug.info(3, "s"), 
                lineNumber = debug.info(3, "l")
            };
        end;
    end;
    return (v46(v55, v58, v59, nil, v60, l_ReactCurrentOwner_0.current, v57));
end;
v13.cloneAndReplaceKey = function(v69, v70)
    return (v46(v69.type, v70, v69.ref, v69._self, v69._source, v69._owner, v69.props));
end;
v13.cloneElement = function(v71, v72, ...)
    if v71 == nil then
        error(l_Error_0.new("React.cloneElement(...): The argument must be a React element, but you passed " .. tostring(v71)));
    end;
    local l_props_0 = v71.props;
    local v74 = if l_props_0 ~= nil then table.clone(l_props_0) else {};
    local l_key_1 = v71.key;
    local l_ref_0 = v71.ref;
    local l__source_0 = v71._source;
    local l__owner_0 = v71._owner;
    if v72 ~= nil then
        local l_ref_1 = v72.ref;
        if l_ref_1 ~= nil then
            l_ref_0 = l_ref_1;
            l__owner_0 = l_ReactCurrentOwner_0.current;
        elseif not ((l___DEV___0 and v72.ref ~= nil) and type(v72.ref) == "table") or not v72.ref.isReactWarning then
            local _ = v72.ref ~= nil;
        end;
        local l_key_2 = v72.key;
        if l_key_2 ~= nil then
            l_key_1 = if type(l_key_2) == "number" then l_key_2 else l_key_2 or "nil";
        elseif not ((l___DEV___0 and v72.key ~= nil) and type(v72.key) == "table") or not v72.key.isReactWarning then
            local _ = v72.key ~= nil;
        end;
    end;
    local l_type_0 = v71.type;
    local v84 = if type(l_type_0) == "table" then l_type_0.defaultProps else nil;
    if v72 ~= nil then
        for v85, _ in v72, nil, nil do
            if not (not (v72[v85] ~= nil) or v9[v85]) then
                if v72[v85] == nil and v84 ~= nil then
                    v74[v85] = v84[v85];
                else
                    v74[v85] = v72[v85];
                end;
            end;
        end;
    end;
    local v87 = select("#", ...);
    if v87 == 1 then
        v74.children = select(1, ...);
    elseif v87 > 1 then
        v74.children = {
            ...
        };
    end;
    return (v46(v71.type, l_key_1, l_ref_0, nil, l__source_0, l__owner_0, v74));
end;
v13.isValidElement = function(v88)
    local v89 = false;
    if type(v88) == "table" then
        v89 = v88["$$typeof"] == l_REACT_ELEMENT_TYPE_0;
    end;
    return v89;
end;
return v13;
