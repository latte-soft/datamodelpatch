local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.AppCommonLib);
local v4 = require(l_script_FirstAncestor_0.HoverTileCoordinator);
return function(v5, v6, v7, v8)
    local v9 = v8 or v4.default;
    local v10, v11 = v2.useState(false);
    v2.useEffect(function()
        if v7 then
            local function _(v12)
                local v13 = false;
                if v12 ~= nil then
                    v13 = v12 == v6;
                end;
                v11(v13);
            end;
            local l_hoveredKey_0 = v9.hoveredKey;
            local v16 = false;
            if l_hoveredKey_0 ~= nil then
                v16 = l_hoveredKey_0 == v6;
            end;
            v11(v16);
            l_hoveredKey_0 = v9.changed:connect(function(v17)
                local v18 = false;
                if v17 ~= nil then
                    v18 = v17 == v6;
                end;
                v11(v18);
            end);
            return function()
                if l_hoveredKey_0 ~= nil then
                    l_hoveredKey_0:disconnect();
                    l_hoveredKey_0 = nil;
                end;
            end;
        else
            return ;
        end;
    end, {
        v7, 
        v6, 
        v9
    });
    v2.useEffect(function()
        if v7 then
            local v19 = {};
            if v5.current ~= nil then
                table.insert(v19, v5.current.MouseLeave:Connect(function()
                    v9:cancelHover(v6);
                end));
                table.insert(v19, v5.current.MouseEnter:Connect(function()
                    v9:requestHover(v6);
                end));
            end;
            return function()
                for _, v21 in v19, nil, nil do
                    v21:Disconnect();
                end;
            end;
        else
            return ;
        end;
    end, {
        v6, 
        v5, 
        v7, 
        v9
    });
    v2.useEffect(function()
        return function()
            if v6 then
                v9:cancelHover(v6);
            end;
        end;
    end, {
        v6, 
        v9
    });
    return v7 and v10;
end;
