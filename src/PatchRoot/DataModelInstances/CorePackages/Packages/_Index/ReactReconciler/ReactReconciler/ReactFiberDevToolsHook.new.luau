local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.LuauPolyfill);
local v3 = {};
local function _(v4)
    if typeof(v4) == "function" then
        return true;
    else
        if typeof(v4) == "table" then
            local v5 = getmetatable(v4);
            if not v5 or not rawget(v5, "__call") then
                if v4._isMockFunction then
                    return true;
                end;
            else
                return true;
            end;
        end;
        return false;
    end;
end;
local l_enableProfilerTimer_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableProfilerTimer;
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(l_Parent_0.Shared);
local l_DidCapture_0 = require(script.Parent.ReactFiberFlags).DidCapture;
local v11 = nil;
local v12 = nil;
local v13 = false;
v3.isDevToolsPresent = function()
    return _G.__REACT_DEVTOOLS_GLOBAL_HOOK__ ~= nil;
end;
v3.injectInternals = function(v14)
    if _G.__REACT_DEVTOOLS_GLOBAL_HOOK__ == nil then
        return false;
    else
        local l___REACT_DEVTOOLS_GLOBAL_HOOK___0 = _G.__REACT_DEVTOOLS_GLOBAL_HOOK__;
        if not l___REACT_DEVTOOLS_GLOBAL_HOOK___0.isDisabled then
            if l___REACT_DEVTOOLS_GLOBAL_HOOK___0.supportsFiber then
                local l_status_0, l_result_0 = pcall(function()
                    v11 = l___REACT_DEVTOOLS_GLOBAL_HOOK___0.inject(v14);
                    v12 = l___REACT_DEVTOOLS_GLOBAL_HOOK___0;
                end);
                if not (l_status_0 or not _G.__DEV__) then
                    l_console_0.error("React instrumentation encountered an error: %s.", l_result_0);
                end;
                return true;
            else
                if _G.__DEV__ then
                    l_console_0.error("The installed version of React DevTools is too old and will not work " .. "with the current version of React. Please update React DevTools. " .. "https://reactjs.org/link/react-devtools");
                end;
                return true;
            end;
        else
            return true;
        end;
    end;
end;
v3.onScheduleRoot = function(v18, v19)
    if not (not _G.__DEV__ or not v12) then
        local l_onScheduleFiberRoot_0 = v12.onScheduleFiberRoot;
        local v21;
        if typeof(l_onScheduleFiberRoot_0) == "function" then
            v21 = true;
        else
            if typeof(l_onScheduleFiberRoot_0) == "table" then
                local v22 = getmetatable(l_onScheduleFiberRoot_0);
                if not v22 or not rawget(v22, "__call") then
                    if l_onScheduleFiberRoot_0._isMockFunction then
                        v21 = true;
                        goto label0 --[[  true, true  ]];
                    end;
                else
                    v21 = true;
                    goto label0 --[[  true, true  ]];
                end;
            end;
            v21 = false;
        end;
        ::label0::;
        if v21 then
            v21, l_onScheduleFiberRoot_0 = pcall(v12.onScheduleFiberRoot, v11, v18, v19);
            if not ((v21 or not _G.__DEV__) or v13) then
                v13 = true;
                l_console_0.error("React instrumentation encountered an error: %s", l_onScheduleFiberRoot_0);
            end;
        end;
    end;
end;
v3.onCommitRoot = function(v23, v24)
    if v12 then
        local l_onCommitFiberRoot_0 = v12.onCommitFiberRoot;
        local v26;
        if typeof(l_onCommitFiberRoot_0) == "function" then
            v26 = true;
        else
            if typeof(l_onCommitFiberRoot_0) == "table" then
                local v27 = getmetatable(l_onCommitFiberRoot_0);
                if not v27 or not rawget(v27, "__call") then
                    if l_onCommitFiberRoot_0._isMockFunction then
                        v26 = true;
                        goto label1 --[[  true, true  ]];
                    end;
                else
                    v26 = true;
                    goto label1 --[[  true, true  ]];
                end;
            end;
            v26 = false;
        end;
        ::label1::;
        if v26 then
            v26, l_onCommitFiberRoot_0 = pcall(function()
                local v28 = bit32.band(v23.current.flags, l_DidCapture_0) == l_DidCapture_0;
                if not l_enableProfilerTimer_0 then
                    v12.onCommitFiberRoot(v11, v23, nil, v28);
                    return ;
                else
                    v12.onCommitFiberRoot(v11, v23, v24, v28);
                    return ;
                end;
            end);
            if not ((v26 or not _G.__DEV__) or v13) then
                v13 = true;
                l_console_0.error("React instrumentation encountered an error: %s", l_onCommitFiberRoot_0);
            end;
        end;
    end;
end;
v3.onCommitUnmount = function(v29)
    if v12 then
        local l_onCommitFiberUnmount_0 = v12.onCommitFiberUnmount;
        local v31;
        if typeof(l_onCommitFiberUnmount_0) == "function" then
            v31 = true;
        else
            if typeof(l_onCommitFiberUnmount_0) == "table" then
                local v32 = getmetatable(l_onCommitFiberUnmount_0);
                if not v32 or not rawget(v32, "__call") then
                    if l_onCommitFiberUnmount_0._isMockFunction then
                        v31 = true;
                        goto label2 --[[  true, true  ]];
                    end;
                else
                    v31 = true;
                    goto label2 --[[  true, true  ]];
                end;
            end;
            v31 = false;
        end;
        ::label2::;
        if v31 then
            v31, l_onCommitFiberUnmount_0 = pcall(v12.onCommitFiberUnmount, v11, v29);
            if not ((v31 or not _G.__DEV__) or v13) then
                v13 = true;
                l_console_0.error("React instrumentation encountered an error: %s", l_onCommitFiberUnmount_0);
            end;
        end;
    end;
end;
return v3;
