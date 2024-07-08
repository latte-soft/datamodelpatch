local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
return {
    isDesktopDevice = function()
        local l_None_0 = Enum.Platform.None;
        pcall(function()
            l_None_0 = l_UserInputService_0:GetPlatform();
        end);
        local v3 = true;
        if l_None_0 ~= Enum.Platform.Windows then
            v3 = true;
            if l_None_0 ~= Enum.Platform.OSX then
                v3 = l_None_0 == Enum.Platform.UWP;
            end;
        end;
        return v3;
    end, 
    isConsole = function()
        return l_GuiService_0:IsTenFootInterface();
    end
};
