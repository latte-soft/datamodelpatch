local l___DEV___0 = _G.__DEV__;
local l___COMPAT_WARNINGS___0 = _G.__COMPAT_WARNINGS__;
local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local v6 = require(script.Parent.ReactNoopUpdateQueue);
local v7 = {};
if l___DEV___0 then
    l_Object_0.freeze(v7);
end;
local l_UninitializedState_0 = require(l_Parent_0.Shared).UninitializedState;
local v9 = {
    isReactComponent = true
};
local function _(v10)
    local v11 = string.match(v10, "%.%u[%.%w]-$");
    if not v11 then
        return v10;
    else
        return string.gsub(v11, "^%.", "");
    end;
end;
local function _(v13, v14, v15)
    l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", v13, v15, v14, v13);
end;
local function _(v17, v18, v19)
    if not (not l___DEV___0 or not l___COMPAT_WARNINGS___0) then
        local v20, v21 = debug.info(3, "sln");
        local l_warn_0 = l_console_0.warn;
        local v23 = "%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s";
        local l_v17_0 = v17;
        local l_v18_0 = v18;
        local l_v19_0 = v19;
        local v27 = string.match(v20, "%.%u[%.%w]-$");
        l_warn_0(v23, l_v17_0, l_v18_0, l_v19_0, if not v27 then v20 else string.gsub(v27, "^%.", ""), (tostring(v21)));
    end;
end;
local v29 = {
    didMount = "componentDidMount", 
    shouldUpdate = "shouldComponentUpdate", 
    willUpdate = "UNSAFE_componentWillUpdate", 
    didUpdate = "componentDidUpdate", 
    willUnmount = "componentWillUnmount"
};
local function v46(v30, v31, v32)
    if v29[v31] ~= nil then
        if v30[v29[v31]] ~= nil then
            local l___componentName_0 = v30.__componentName;
            l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", l___componentName_0, v29[v31], v31, l___componentName_0);
        elseif not (v31 == "willUpdate") or not v30.componentWillUpdate then
            local l___componentName_1 = v30.__componentName;
            local l_v31_0 = v31;
            local v36 = v29[v31];
            if not (not l___DEV___0 or not l___COMPAT_WARNINGS___0) then
                local v37, v38 = debug.info(3, "sln");
                local l_warn_1 = l_console_0.warn;
                local v40 = "%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s";
                local l_l___componentName_1_0 = l___componentName_1;
                local l_l_v31_0_0 = l_v31_0;
                local l_v36_0 = v36;
                local v44 = string.match(v37, "%.%u[%.%w]-$");
                l_warn_1(v40, l_l___componentName_1_0, l_l_v31_0_0, l_v36_0, if not v44 then v37 else string.gsub(v44, "^%.", ""), (tostring(v38)));
            end;
        else
            local l___componentName_2 = v30.__componentName;
            l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", l___componentName_2, "UNSAFE_componentWillUpdate", v31, l___componentName_2);
        end;
        v31 = v29[v31];
    end;
    rawset(v30, v31, v32);
end;
local v48 = setmetatable({
    __componentName = "Component"
}, {
    __newindex = v46, 
    __index = v9, 
    __tostring = function(v47)
        return v47.__componentName;
    end
});
local v49 = _G.__TESTEZ_RUNNING_TEST__ and 0 or 900;
local v50 = 1;
local v51 = table.create(v49);
for _ = 1, v49 do
    table.insert(v51, {
        props = nil, 
        context = nil, 
        state = l_UninitializedState_0, 
        __refs = v7, 
        __updater = v6
    });
end;
local function v59(v53, v54, v55)
    if l___DEV___0 and v55 ~= nil then
        l_console_0.warn("Received a `callback` argument to `setState` during initialization of " .. "\"%s\". The callback behavior is not supported when using `setState` " .. "in `init`.\n\nConsider defining similar behavior in a " .. "`compontentDidMount` method instead.", v53.__componentName);
    end;
    local v56 = v54 and type(v54);
    if not (v54 ~= nil) or v56 ~= "table" and v56 ~= "function" then
        error("setState(...): takes an object of state variables to update or a " .. "function which returns an object of state variables.");
    end;
    local l_state_0 = v53.state;
    local _ = nil;
    v53.state = l_Object_0.assign({}, l_state_0, if v56 == "function" then v54(l_state_0, v53.props) else v54);
end;
v48.extend = function(v60, v61)
    if v61 == nil then
        if l___COMPAT_WARNINGS___0 then
            l_console_0.warn("Component:extend() accepting no arguments is deprecated, and will " .. "not be supported in a future version of Roact. Please provide an explicit name.");
        end;
        v61 = "";
    elseif type(v61) ~= "string" then
        error("Component class name must be a string");
    end;
    local v62 = {
        __componentName = v61, 
        setState = v60.setState, 
        forceUpdate = v60.forceUpdate, 
        init = nil
    };
    v62.__index = v62;
    v62.__ctor = function(v63, v64, v65)
        local v66 = nil;
        if v50 <= v49 then
            v66 = v51[v50];
            v66.props = v63;
            v66.context = v64;
            v51[v50] = nil;
            v50 = v50 + 1;
        else
            v66 = {
                props = v63, 
                context = v64, 
                state = l_UninitializedState_0, 
                __refs = v7, 
                __updater = v65 or v6
            };
        end;
        v66 = setmetatable(v66, v62);
        if v62.init and type(v62.init) == "function" then
            v66.setState = v59;
            v62.init(v66, v63, v64);
            v66.setState = nil;
        end;
        return v66;
    end;
    setmetatable(v62, (getmetatable(v60)));
    return v62;
end;
v48.setState = function(v67, v68, v69)
    if (v68 ~= nil and type(v68) ~= "table") and type(v68) ~= "function" then
        error("setState(...): takes an object of state variables to update or a " .. "function which returns an object of state variables.");
    end;
    v67.__updater.enqueueSetState(v67, v68, v69, "setState");
end;
v48.forceUpdate = function(v70, v71)
    v70.__updater.enqueueForceUpdate(v70, v71, "forceUpdate");
end;
if l___DEV___0 then
    local v72 = {
        isMounted = {
            "isMounted", 
            "Instead, make sure to clean up subscriptions and pending requests in " .. "componentWillUnmount to prevent memory leaks."
        }, 
        replaceState = {
            "replaceState", 
            "Refactor your code to use setState instead (see " .. "https://github.com/facebook/react/issues/3236)."
        }
    };
    local function _(v73, v74)
        v48[v73] = function()
            l_console_0.warn("%s(...) is deprecated in plain JavaScript React classes. %s", v74[1], v74[2]);
            return nil;
        end;
    end;
    for v76, _ in v72, nil, nil do
        if v72[v76] ~= nil then
            local v78 = v72[v76];
            v48[v76] = function()
                l_console_0.warn("%s(...) is deprecated in plain JavaScript React classes. %s", v78[1], v78[2]);
                return nil;
            end;
        end;
    end;
end;
local v79 = v48:extend("PureComponent");
v79.extend = v48.extend;
setmetatable(v79, {
    __newindex = v46, 
    __index = {
        isReactComponent = true, 
        isPureReactComponent = true
    }, 
    __tostring = function(v80)
        return v80.__componentName;
    end
});
return {
    Component = v48, 
    PureComponent = v79
};
