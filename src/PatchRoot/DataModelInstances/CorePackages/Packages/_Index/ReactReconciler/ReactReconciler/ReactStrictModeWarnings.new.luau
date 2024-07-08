local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v3 = require(script.Parent.ReactCurrentFiber);
local l_resetCurrentFiber_0 = v3.resetCurrentFiber;
local l_setCurrentFiber_0 = v3.setCurrentFiber;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_StrictMode_0 = require(script.Parent.ReactTypeOfMode).StrictMode;
local v12 = {
    recordUnsafeLifecycleWarnings = function(_, _)
    end, 
    flushPendingUnsafeLifecycleWarnings = function()
    end, 
    recordLegacyContextWarning = function(_, _)
    end, 
    flushLegacyContextWarning = function()
    end, 
    discardPendingWarnings = function()
    end
};
if _G.__DEV__ then
    local function _(v13)
        local v14 = nil;
        local l_v13_0 = v13;
        while l_v13_0 ~= nil do
            if bit32.band(l_v13_0.mode, l_StrictMode_0) ~= 0 then
                v14 = l_v13_0;
            end;
            l_v13_0 = l_v13_0.return_;
        end;
        return v14;
    end;
    local function v21(v17)
        local v18 = {};
        for v19, _ in v17, nil, nil do
            table.insert(v18, v19);
        end;
        table.sort(v18);
        return table.concat(v18, ", ");
    end;
    local v22 = {};
    local v23 = {};
    local v24 = {};
    local v25 = {};
    local v26 = {};
    local v27 = {};
    local v28 = {};
    v12.recordUnsafeLifecycleWarnings = function(v29, v30)
        if not v28[v29.type] then
            if typeof(v30.componentWillMount) == "function" then
                table.insert(v22, v29);
            end;
            if bit32.band(v29.mode, l_StrictMode_0) ~= 0 and typeof(v30.UNSAFE_componentWillMount) == "function" then
                table.insert(v23, v29);
            end;
            if typeof(v30.componentWillReceiveProps) == "function" then
                table.insert(v24, v29);
            end;
            if bit32.band(v29.mode, l_StrictMode_0) ~= 0 and typeof(v30.UNSAFE_componentWillReceiveProps) == "function" then
                table.insert(v25, v29);
            end;
            if typeof(v30.componentWillUpdate) == "function" then
                table.insert(v26, v29);
            end;
            if bit32.band(v29.mode, l_StrictMode_0) ~= 0 and typeof(v30.UNSAFE_componentWillUpdate) == "function" then
                table.insert(v27, v29);
            end;
            return ;
        else
            return ;
        end;
    end;
    v12.flushPendingUnsafeLifecycleWarnings = function()
        local v31 = {};
        if #v22 > 0 then
            for _, v33 in v22, nil, nil do
                v31[l_getComponentName_0(v33.type) or "Component"] = true;
                v28[v33.type] = true;
            end;
            table.clear(v22);
        end;
        local v34 = {};
        if #v23 > 0 then
            for _, v36 in v23, nil, nil do
                v34[l_getComponentName_0(v36.type) or "Component"] = true;
                v28[v36.type] = true;
            end;
            table.clear(v23);
        end;
        local v37 = {};
        if #v24 > 0 then
            for _, v39 in v24, nil, nil do
                v37[l_getComponentName_0(v39.type) or "Component"] = true;
                v28[v39.type] = true;
            end;
            table.clear(v24);
        end;
        local v40 = {};
        if #v25 > 0 then
            for _, v42 in v25, nil, nil do
                v40[l_getComponentName_0(v42.type) or "Component"] = true;
                v28[v42.type] = true;
            end;
            table.clear(v25);
        end;
        local v43 = {};
        if #v26 > 0 then
            for _, v45 in v26, nil, nil do
                v43[l_getComponentName_0(v45.type) or "Component"] = true;
                v28[v45.type] = true;
            end;
            table.clear(v26);
        end;
        local v46 = {};
        if #v27 > 0 then
            for _, v48 in v27, nil, nil do
                v46[l_getComponentName_0(v48.type) or "Component"] = true;
                v28[v48.type] = true;
            end;
            table.clear(v27);
        end;
        if next(v34) ~= nil then
            l_console_0.error("Using UNSAFE_componentWillMount in strict mode is not recommended and may indicate bugs in your code. " .. "See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n" .. "* Move code with side effects to componentDidMount, and set initial state in the constructor.\n" .. "\nPlease update the following components: %s", (v21(v34)));
        end;
        if next(v40) ~= nil then
            l_console_0.error("Using UNSAFE_componentWillReceiveProps in strict mode is not recommended " .. "and may indicate bugs in your code. " .. "See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n" .. "* Move data fetching code or side effects to componentDidUpdate.\n" .. "* If you're updating state whenever props change, " .. "refactor your code to use memoization techniques or move it to " .. "static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n" .. "\nPlease update the following components: %s", (v21(v40)));
        end;
        if next(v46) ~= nil then
            l_console_0.error("Using UNSAFE_componentWillUpdate in strict mode is not recommended " .. "and may indicate bugs in your code. " .. "See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n" .. "* Move data fetching code or side effects to componentDidUpdate.\n" .. "\nPlease update the following components: %s", (v21(v46)));
        end;
        if next(v31) ~= nil then
            l_console_0.warn("componentWillMount has been renamed, and is not recommended for use. " .. "See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n" .. "* Move code with side effects to componentDidMount, and set initial state in the constructor.\n" .. "* Rename componentWillMount to UNSAFE_componentWillMount to suppress " .. "this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n" .. "\nPlease update the following components: %s", (v21(v31)));
        end;
        if next(v37) ~= nil then
            l_console_0.warn("componentWillReceiveProps has been renamed, and is not recommended for use. " .. "See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n" .. "* Move data fetching code or side effects to componentDidUpdate.\n" .. "* If you're updating state whenever props change, refactor your " .. "code to use memoization techniques or move it to " .. "static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n" .. "* Rename componentWillReceiveProps to UNSAFE_componentWillReceiveProps to suppress " .. "this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n" .. "\nPlease update the following components: %s", (v21(v37)));
        end;
        if next(v43) ~= nil then
            l_console_0.warn("componentWillUpdate has been renamed, and is not recommended for use. " .. "See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n" .. "* Move data fetching code or side effects to componentDidUpdate.\n" .. "* Rename componentWillUpdate to UNSAFE_componentWillUpdate to suppress " .. "this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n" .. "\nPlease update the following components: %s", (v21(v43)));
        end;
    end;
    local v49 = {};
    local v50 = {};
    v12.recordLegacyContextWarning = function(v51, v52)
        local v53 = nil;
        local l_v51_0 = v51;
        while l_v51_0 ~= nil do
            if bit32.band(l_v51_0.mode, l_StrictMode_0) ~= 0 then
                v53 = l_v51_0;
            end;
            l_v51_0 = l_v51_0.return_;
        end;
        local l_v53_0 = v53;
        if l_v53_0 == nil then
            l_console_0.error("Expected to find a StrictMode component in a strict mode tree. " .. "This error is likely caused by a bug in React. Please file an issue.");
            return ;
        elseif not v50[v51.type] then
            v53 = v49[l_v53_0];
            if typeof(v51.type) ~= "function" and (not (v51.type.contextTypes == nil and v51.type.childContextTypes == nil) or v52 ~= nil and typeof(v52.getChildContext) == "function") then
                if v53 == nil then
                    v53 = {};
                    v49[l_v53_0] = v53;
                end;
                table.insert(v53, v51);
            end;
            return ;
        else
            return ;
        end;
    end;
    v12.flushLegacyContextWarning = function()
        for _, v57 in v49, nil, nil do
            if #v57 == 0 then
                return ;
            else
                local v58 = v57[1];
                local v59 = {};
                for _, v61 in v57, nil, nil do
                    v59[l_getComponentName_0(v61.type) or "Component"] = true;
                    v50[v61.type] = true;
                end;
                local v62 = v21(v59);
                local l_status_0, l_result_0 = pcall(function()
                    l_setCurrentFiber_0(v58);
                    l_console_0.error("Legacy context API has been detected within a strict-mode tree." .. "\n\nThe old API will be supported in all 16.x releases, but applications " .. "using it should migrate to the new version." .. "\n\nPlease update the following components: %s" .. "\n\nLearn more about this warning here: https://reactjs.org/link/legacy-context", v62);
                end);
                l_resetCurrentFiber_0();
                if not l_status_0 then
                    error(l_result_0);
                end;
            end;
        end;
    end;
    v12.discardPendingWarnings = function()
        table.clear(v22);
        table.clear(v23);
        table.clear(v24);
        table.clear(v25);
        table.clear(v26);
        table.clear(v27);
        table.clear(v49);
    end;
end;
return v12;
