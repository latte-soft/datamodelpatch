local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_mockableWarn_0 = require(script.Parent.Parent.FocusNavigationUtils).mockableWarn;
local _ = require(script.Parent.types);
local l_status_0, l_result_0 = pcall(function()
    return l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject");
end);
local l_status_1, l_result_1 = pcall(function()
    return game:GetService("CoreGui");
end);
return {
    CoreGui = {
        getSelection = function()
            return l_GuiService_0.SelectedCoreObject;
        end, 
        setSelection = function(v8)
            if not (not (not (not _G.__DEV__ or not l_status_1) and v8 ~= nil) or v8:IsDescendantOf(l_result_1)) then
                l_mockableWarn_0(string.format("Attempting to focus non-CoreGui descendant '%s' from a CoreGui FocusNavigationService " .. "instance. Consider creating this FocusNavigationService with " .. "`FocusNavigation.EnginInterface.PlayerGui` instead", v8:GetFullName()));
            end;
            if not v8 or v8.Selectable then
                l_GuiService_0.SelectedCoreObject = v8;
                return ;
            else
                l_GuiService_0:Select(v8);
                return ;
            end;
        end, 
        SelectionChanged = if not l_status_0 then {
            Connect = function()
                error("Could not access SelectedCoreObject signal; you may not have the correct permissions");
            end
        } else l_result_0, 
        InputBegan = l_UserInputService_0.InputBegan, 
        InputChanged = l_UserInputService_0.InputChanged, 
        InputEnded = l_UserInputService_0.InputEnded, 
        LastInputTypeChanged = l_UserInputService_0.LastInputTypeChanged
    }, 
    PlayerGui = {
        getSelection = function()
            return l_GuiService_0.SelectedObject;
        end, 
        setSelection = function(v9)
            if not (not (not (not _G.__DEV__ or not l_status_1) and v9 ~= nil) or not v9:IsDescendantOf(l_result_1)) then
                l_mockableWarn_0(string.format("Attempting to focus CoreGui descendant '%s' from a non-CoreGui FocusNavigationService instance." .. "Consider creating this FocusNavigationService with " .. "`FocusNavigation.EnginInterface.CoreGui` instead", v9:GetFullName()));
            end;
            if not v9 or v9.Selectable then
                l_GuiService_0.SelectedObject = v9;
                return ;
            else
                l_GuiService_0:Select(v9);
                return ;
            end;
        end, 
        SelectionChanged = l_GuiService_0:GetPropertyChangedSignal("SelectedObject"), 
        InputBegan = l_UserInputService_0.InputBegan, 
        InputChanged = l_UserInputService_0.InputChanged, 
        InputEnded = l_UserInputService_0.InputEnded, 
        LastInputTypeChanged = l_UserInputService_0.LastInputTypeChanged
    }
};
