local l_AppStorageService_0 = game:GetService("AppStorageService");
return {
    getShouldShowMenuNavigationPrompt = function()
        local l_status_0, l_result_0 = pcall(function()
            return l_AppStorageService_0:GetItem("GamepadMenuVirtualCursorPromptShown") == "false";
        end);
        if l_status_0 then
            return l_result_0;
        else
            return false;
        end;
    end, 
    setMenuNavigationPromptShown = function()
        pcall(function()
            l_AppStorageService_0:SetItem("GamepadMenuVirtualCursorPromptShown", "true");
        end);
    end
};
