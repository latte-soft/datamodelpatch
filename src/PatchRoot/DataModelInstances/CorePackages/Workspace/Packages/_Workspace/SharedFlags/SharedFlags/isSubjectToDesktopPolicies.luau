local l_Platform_0 = game:GetService("UserInputService"):GetPlatform();
return function()
    local v1 = true;
    if l_Platform_0 ~= Enum.Platform.Windows then
        v1 = true;
        if l_Platform_0 ~= Enum.Platform.OSX then
            v1 = l_Platform_0 == Enum.Platform.UWP;
        end;
    end;
    return v1;
end;
