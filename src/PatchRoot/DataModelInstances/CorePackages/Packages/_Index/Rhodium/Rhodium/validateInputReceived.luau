return function(v0, v1)
    local v2 = {};
    local v3 = false;
    if not v0:IsA("GuiButton") then
        if not v0:IsA("TextBox") or v0:IsFocused() then
            local v4 = false;
            do
                local l_v4_0 = v4;
                table.insert(v2, v0.InputBegan:Connect(function(v6)
                    if v6.UserInputState ~= Enum.UserInputState.Cancel then
                        l_v4_0 = true;
                    end;
                end));
                table.insert(v2, v0.InputEnded:Connect(function(v7)
                    if not (not (v7.UserInputState ~= Enum.UserInputState.Cancel) or not l_v4_0) then
                        v3 = true;
                    end;
                end));
            end;
        else
            table.insert(v2, v0.Focused:Connect(function()
                v3 = true;
            end));
        end;
    else
        table.insert(v2, v0.Activated:Connect(function(v8)
            if v8.UserInputState ~= Enum.UserInputState.Cancel then
                v3 = true;
            end;
        end));
    end;
    v1();
    for _, v10 in v2, nil, nil do
        v10:Disconnect();
    end;
    return v3;
end;
