local l_UserInputService_0 = game:GetService("UserInputService");
return function(v1, v2, v3)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
        v2 = "Android" .. v2;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
        v2 = "IOS" .. v2;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
        v2 = "Windows" .. v2;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
        v2 = "OSX" .. v2;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
        v2 = "Xbox" .. v2;
    end;
    v1.Diag:reportStats(v2, v3);
end;
