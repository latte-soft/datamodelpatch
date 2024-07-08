local l_GuiService_0 = game:GetService("GuiService");
local v1 = require(script:FindFirstAncestor("RoactUtils").Parent.React);
local function _(v2)
    if v2.current == nil then
        return false;
    else
        local v3 = true;
        if l_GuiService_0.SelectedCoreObject ~= v2.current then
            v3 = l_GuiService_0.SelectedObject == v2.current;
        end;
        return v3;
    end;
end;
return function(v5)
    local v8, v9 = v1.useState(function()
        local l_v5_0 = v5;
        if l_v5_0.current == nil then
            return false;
        else
            local v7 = true;
            if l_GuiService_0.SelectedCoreObject ~= l_v5_0.current then
                v7 = l_GuiService_0.SelectedObject == l_v5_0.current;
            end;
            return v7;
        end;
    end);
    v1.useEffect(function()
        local l_v9_0 = v9;
        local l_v5_1 = v5;
        local v12;
        if l_v5_1.current == nil then
            v12 = false;
        else
            v12 = true;
            if l_GuiService_0.SelectedCoreObject ~= l_v5_1.current then
                v12 = l_GuiService_0.SelectedObject == l_v5_1.current;
            end;
        end;
        l_v9_0(v12);
    end, {
        v5
    });
    v1.useEffect(function()
        local v13 = {};
        local l_current_0 = v5.current;
        if l_current_0 then
            table.insert(v13, l_current_0.SelectionGained:Connect(function()
                v9(true);
            end));
            table.insert(v13, l_current_0.SelectionLost:Connect(function()
                v9(false);
            end));
        end;
        return function()
            for _, v16 in ipairs(v13) do
                v16:Disconnect();
            end;
        end;
    end, {
        v5
    });
    return v8;
end;
