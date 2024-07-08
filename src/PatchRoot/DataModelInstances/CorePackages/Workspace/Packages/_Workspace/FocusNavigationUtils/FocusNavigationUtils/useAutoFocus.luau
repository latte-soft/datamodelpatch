local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script:FindFirstAncestor("FocusNavigationUtils").Parent;
local v2 = require(l_Parent_0.React);
local l_FocusNavigationContext_0 = require(l_Parent_0.ReactFocusNavigation).FocusNavigationContext;
local function v32(v4, v5, v6)
    local v7 = #v5 == 0;
    local v8 = {};
    local v9 = {};
    local _ = function()
        if not v7 then
            v7 = true;
            for _, v11 in v8, nil, nil do
                v11:Disconnect();
            end;
        end;
    end;
    local function v18(_, _, v15)
        if not (not v15 or v7) then
            v7 = true;
            for _, v17 in v8, nil, nil do
                v17:Disconnect();
            end;
        end;
    end;
    local function v19(v20)
        table.insert(v9, (task.delay(v4, function()
            if not v7 then
                local v21 = v5[v20];
                if not (not v21 or not v21:IsDescendantOf(l_CoreGui_0)) then
                    v6:focusGuiObject(v21, false);
                end;
                v19(#v5 < v20 and 1 or v20 % #v5 + 1);
            end;
        end)));
    end;
    for _, v23 in v5, nil, nil do
        table.insert(v8, v23.SelectionChanged:Connect(v18));
    end;
    local l_delay_0 = task.delay;
    local l_v4_0 = v4;
    local v26 = 1;
    table.insert(v9, (l_delay_0(l_v4_0, function()
        if not v7 then
            local v27 = v5[v26];
            if not (not v27 or not v27:IsDescendantOf(l_CoreGui_0)) then
                v6:focusGuiObject(v27, false);
            end;
            v19(#v5 < v26 and 1 or v26 % #v5 + 1);
        end;
    end)));
    return {
        cancel = function()
            for _, v29 in v9, nil, nil do
                task.cancel(v29);
            end;
            table.clear(v9);
            if not v7 then
                v7 = true;
                for _, v31 in v8, nil, nil do
                    v31:Disconnect();
                end;
            end;
        end
    };
end;
return function(v33, v34)
    local v35 = v2.useContext(l_FocusNavigationContext_0);
    return v2.useCallback(function()
        if not v35 then
            return nil;
        else
            return (v32(v34, v33, v35));
        end;
    end, {
        v35, 
        v33, 
        v34
    });
end;
