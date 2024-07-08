local l_UserInputService_0 = game:GetService("UserInputService");
return function()
    if l_UserInputService_0:GetPlatform() == Enum.Platform.OSX then
        return {
            Enum.KeyCode.LeftMeta, 
            Enum.KeyCode.RightMeta
        };
    else
        return {
            Enum.KeyCode.LeftAlt, 
            Enum.KeyCode.RightAlt
        };
    end;
end;
