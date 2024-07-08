local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
return function()
    if _G.__TESTEZ_RUNNING_TEST__ then
        return 0;
    else
        local l_Y_0 = l_UserInputService_0.BottomBarSize.Y;
        return l_Y_0 == 0 and l_GuiService_0:GetSafeZoneOffsets().bottom or l_Y_0;
    end;
end;
