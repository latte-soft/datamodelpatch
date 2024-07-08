local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactUtils");
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local l_LUAU_ANALYZE_ERROR_0 = l_script_FirstAncestor_0.LUAU_ANALYZE_ERROR;
return function(v4, v5, v6)
    local v7 = v2.useRef(v4);
    local v8 = v2.useRef({});
    local v9 = v2.useRef({});
    v2.useEffect(function()
        local v15 = l_ChangeHistoryService_0.OnUndo:Connect(function(v10)
            local l_current_0 = v8.current;
            local l_current_1 = v9.current;
            assert(l_current_0 ~= nil, l_LUAU_ANALYZE_ERROR_0);
            assert(l_current_1 ~= nil, l_LUAU_ANALYZE_ERROR_0);
            if not l_current_0[v10] or #l_current_0[v10] == 0 then
                return ;
            else
                if not l_current_1[v10] then
                    l_current_1[v10] = {};
                end;
                local v13 = #l_current_0[v10];
                local v14 = l_current_0[v10][v13];
                table.insert(l_current_1[v10], v7.current);
                table.remove(l_current_0[v10], v13);
                v7.current = v14;
                v5(v14);
                v8.current = l_current_0;
                v9.current = l_current_1;
                return ;
            end;
        end);
        local v21 = l_ChangeHistoryService_0.OnRedo:Connect(function(v16)
            local l_current_2 = v8.current;
            local l_current_3 = v9.current;
            assert(l_current_2 ~= nil, l_LUAU_ANALYZE_ERROR_0);
            assert(l_current_3 ~= nil, l_LUAU_ANALYZE_ERROR_0);
            if not l_current_3[v16] or #l_current_3[v16] == 0 then
                return ;
            else
                local v19 = #l_current_3[v16];
                local v20 = l_current_3[v16][v19];
                table.insert(l_current_2[v16], v7.current);
                table.remove(l_current_3[v16], v19);
                assert(v20 ~= nil, l_LUAU_ANALYZE_ERROR_0);
                v7.current = v20;
                v5(v20);
                v8.current = l_current_2;
                v9.current = l_current_3;
                return ;
            end;
        end);
        return function()
            v15:Disconnect();
            v21:Disconnect();
        end;
    end, v6);
    v2.useEffect(function()
        v8.current = {};
        v9.current = {};
    end, v6);
    return (v2.useCallback(function(v22, v23)
        local l_current_4 = v8.current;
        assert(l_current_4 ~= nil, l_LUAU_ANALYZE_ERROR_0);
        if not l_current_4[v22] then
            l_current_4[v22] = {};
        end;
        v9.current = {};
        l_ChangeHistoryService_0:SetWaypoint(v22);
        if typeof(v7.current) == "table" then
            table.insert(l_current_4[v22], table.clone(v7.current));
        else
            table.insert(l_current_4[v22], v7.current);
        end;
        v7.current = v23;
        v8.current = l_current_4;
    end, v6));
end;
