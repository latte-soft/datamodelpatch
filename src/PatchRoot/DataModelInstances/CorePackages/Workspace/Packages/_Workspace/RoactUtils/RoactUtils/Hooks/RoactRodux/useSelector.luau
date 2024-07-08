local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(script.Parent.useStore);
local function v7(v5, v6)
    return v5 == v6;
end;
useSelectorWithStore = function(v8, v9, v10)
    local _, v13 = v2.useReducer(function(v11)
        return v11 + 1;
    end, 0);
    local v14 = v2.useRef(nil);
    local v15 = v2.useRef(nil);
    local v16 = v2.useRef(nil);
    local v17 = v2.useRef(nil);
    local v18 = v10:getState();
    local v19 = nil;
    local l_status_0, l_result_0 = pcall(function()
        if (v8 == v15.current and v18 == v16.current) and not v14.current then
            v19 = v17.current;
            return ;
        else
            local v20 = v8(v18);
            if v17.current ~= nil and v9(v20, v17.current) then
                v19 = v17.current;
                return ;
            else
                v19 = v20;
                return ;
            end;
        end;
    end);
    if not l_status_0 then
        if v14.current then
            l_result_0 = string.format("%s\nThe error may be correlated with this previous error:\n%s\n\n", tostring(l_result_0), (tostring(v14.current)));
        end;
        error(l_result_0);
    end;
    v2.useLayoutEffect(function()
        v15.current = v8;
        v16.current = v18;
        v17.current = v19;
        v14.current = nil;
    end);
    v2.useLayoutEffect(function()
        local v27 = v10.changed:connect(function(v23)
            local l_status_1, l_result_1 = pcall(function()
                if v23 == v16.current then
                    return false;
                else
                    assert(v15.current, "latestSelector");
                    local v24 = v15.current(v23);
                    if not v9(v24, v17.current) then
                        v17.current = v24;
                        v16.current = v23;
                        return true;
                    else
                        return false;
                    end;
                end;
            end);
            if not l_status_1 then
                l_result_1 = l_result_1 or "Error";
                v14.current = l_result_1;
            end;
            if l_result_1 then
                v13(nil);
            end;
        end);
        local v28 = v10:getState();
        local l_status_2, l_result_2 = pcall(function()
            if v28 == v16.current then
                return false;
            else
                assert(v15.current, "latestSelector");
                local v29 = v15.current(v28);
                if not v9(v29, v17.current) then
                    v17.current = v29;
                    v16.current = v28;
                    return true;
                else
                    return false;
                end;
            end;
        end);
        if not l_status_2 then
            l_result_2 = l_result_2 or "Error";
            v14.current = l_result_2;
        end;
        if l_result_2 then
            v13(nil);
        end;
        return function()
            v27:disconnect();
        end;
    end, {
        v10
    });
    return v19;
end;
useSelector = function(v32, v33)
    v1.isNotNil(v32, "selector");
    v1.assert(v3.isCallable(v32), "useSelector expects 'selector' to be callable");
    v1.isTypeOrNil(v33, "function", "equalityFn");
    return (useSelectorWithStore(v32, v33 or v7, (v4())));
end;
return useSelector;
