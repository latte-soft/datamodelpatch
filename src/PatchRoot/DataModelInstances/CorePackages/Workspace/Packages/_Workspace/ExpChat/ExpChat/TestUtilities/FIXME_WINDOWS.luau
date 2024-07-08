local l_UserInputService_0 = game:GetService("UserInputService");
return function(v1, v2, v3, v4)
    if l_UserInputService_0:GetPlatform() == Enum.Platform.Windows then
        v2(v3 .. " TODO: EXPCHAT-812 Test disabled on Windows", v4);
        return ;
    else
        v1(v3, v4);
        return ;
    end;
end;
