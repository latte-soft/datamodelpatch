local l_Parent_0 = script.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.Shared);
local l_ReactCurrentDispatcher_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactCurrentDispatcher;
local function _()
    local l_current_0 = l_ReactCurrentDispatcher_0.current;
    if _G.__DEV__ and l_current_0 == nil then
        l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
    end;
    return l_current_0;
end;
return {
    useContext = function(v8, v9, ...)
        local l_current_1 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_1 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        local l_l_current_1_0 = l_current_1;
        if _G.__DEV__ then
            if v9 ~= nil then
                l_console_0.error("useContext() second argument is reserved for future " .. "use in React. Passing it is not supported. " .. "You passed: %s.%s", v9, (typeof(v9) == "number" and l_Array_0.isArray({
                    ...
                })) and "\n\nDid you call Array.map(useContext)? " .. "Calling Hooks inside a loop is not supported. " .. "Learn more at https://reactjs.org/link/rules-of-hooks" or "");
            end;
            if v8._context ~= nil then
                l_current_1 = v8._context;
                if l_current_1.Consumer == v8 then
                    l_console_0.error("Calling useContext(Context.Consumer) is not supported, may cause bugs, and will be " .. "removed in a future major release. Did you mean to call useContext(Context) instead?");
                elseif l_current_1.Provider == v8 then
                    l_console_0.error("Calling useContext(Context.Provider) is not supported. " .. "Did you mean to call useContext(Context) instead?");
                end;
            end;
        end;
        return l_l_current_1_0.useContext(v8, v9);
    end, 
    useState = function(v12, ...)
        local l_current_2 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_2 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_2.useState(v12, ...);
    end, 
    useReducer = function(v14, v15, v16)
        local l_current_3 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_3 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_3.useReducer(v14, v15, v16);
    end, 
    useRef = function(v18)
        local l_current_4 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_4 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_4.useRef(v18);
    end, 
    useBinding = function(v20)
        local l_current_5 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_5 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_5.useBinding(v20);
    end, 
    useEffect = function(v22, v23)
        local l_current_6 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_6 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_6.useEffect(v22, v23);
    end, 
    useLayoutEffect = function(v25, v26)
        local l_current_7 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_7 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_7.useLayoutEffect(v25, v26);
    end, 
    useCallback = function(v28, v29)
        local l_current_8 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_8 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_8.useCallback(v28, v29);
    end, 
    useMemo = function(v31, v32)
        local l_current_9 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_9 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_9.useMemo(v31, v32);
    end, 
    useImperativeHandle = function(v34, v35, v36)
        local l_current_10 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_10 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_10.useImperativeHandle(v34, v35, v36);
    end, 
    useDebugValue = function(v38, v39)
        if not _G.__DEV__ then
            return nil;
        else
            local l_current_11 = l_ReactCurrentDispatcher_0.current;
            if _G.__DEV__ and l_current_11 == nil then
                l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
            end;
            return l_current_11.useDebugValue(v38, v39);
        end;
    end, 
    emptyObject = {}, 
    useOpaqueIdentifier = function()
        local l_current_12 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_12 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_12.useOpaqueIdentifier();
    end, 
    useMutableSource = function(v42, v43, v44)
        local l_current_13 = l_ReactCurrentDispatcher_0.current;
        if _G.__DEV__ and l_current_13 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_13.useMutableSource(v42, v43, v44);
    end
};
