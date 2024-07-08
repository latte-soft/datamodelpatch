local l_UserInputService_0 = game:GetService("UserInputService");
return function(v1)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
        return "Android" .. v1;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
        return "IOS" .. v1;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
        return "Windows" .. v1;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
        return "OSX" .. v1;
    else
        if not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS4) or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5 then
            v1 = "PlayStation" .. v1;
        end;
        return v1;
    end;
end;
