local l_UserInputService_0 = game:GetService("UserInputService");
if game:GetService("RunService"):IsStudio() then
    return function(v1)
        l_UserInputService_0.InputEnded:Connect(function(v2)
            local v3 = v2.UserInputType == Enum.UserInputType.Keyboard;
            local v4 = v2:isModifierKeyDown(Enum.ModifierKey.Shift);
            if not (not v3 or not v4) and v2.KeyCode == Enum.KeyCode.Backspace then
                v1();
            end;
        end);
    end;
else
    return function(_)
    end;
end;
