local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_SendNotificationInfo_0 = l_RobloxGui_0:WaitForChild("SendNotificationInfo");
local l_RobloxTranslator_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("RobloxTranslator"));
local v8 = require(l_RobloxGui_0.Modules.Flags.GetFFlagFixMissingPlayerGuiCrash);
local v9 = nil;
local function _(v10, v11)
    pcall(function()
        v11 = l_RobloxTranslator_0:FormatByKey(v10);
    end);
    return v11;
end;
local function v22(_, v14, v15)
    if v14 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        local l_SelectedObject_0 = l_GuiService_0.SelectedObject;
        if l_SelectedObject_0 == nil then
            return Enum.ContextActionResult.Pass;
        else
            local v17 = nil;
            if l_SelectedObject_0.ClassName == "ScrollingFrame" then
                v17 = l_SelectedObject_0;
            else
                local l_l_SelectedObject_0_FirstAncestorOfClass_0 = l_SelectedObject_0:FindFirstAncestorOfClass("ScrollingFrame");
                if l_l_SelectedObject_0_FirstAncestorOfClass_0 ~= nil then
                    v17 = l_l_SelectedObject_0_FirstAncestorOfClass_0;
                end;
            end;
            if v17 == nil then
                return Enum.ContextActionResult.Pass;
            else
                local v19 = 0;
                if not (v15.KeyCode ~= Enum.KeyCode.PageUp) or v15.KeyCode == Enum.KeyCode.Home then
                    v19 = -100;
                elseif not (v15.KeyCode ~= Enum.KeyCode.PageDown) or v15.KeyCode == Enum.KeyCode.End then
                    v19 = 100;
                end;
                local l_X_0 = v17.CanvasPosition.X;
                local l_Y_0 = v17.CanvasPosition.Y;
                if not (v15.KeyCode ~= Enum.KeyCode.PageUp) or v15.KeyCode == Enum.KeyCode.PageDown then
                    l_Y_0 = math.max(0, (math.min(l_Y_0 + v19, v17.AbsoluteCanvasSize.Y)));
                elseif not (v15.KeyCode ~= Enum.KeyCode.Home) or v15.KeyCode == Enum.KeyCode.End then
                    l_X_0 = math.max(0, (math.min(l_X_0 + v19, v17.AbsoluteCanvasSize.X)));
                end;
                v17.CanvasPosition = Vector2.new(l_X_0, l_Y_0);
                return Enum.ContextActionResult.Pass;
            end;
        end;
    end;
end;
local function v34(_, v24, _)
    if l_GameSettings_0.UiNavigationKeyBindEnabled then
        if v24 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        elseif l_GuiService_0.AutoSelectGuiEnabled then
            if not l_GuiService_0.SelectedObject then
                if not v8() then
                    if v9 == nil then
                        v9 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
                    end;
                elseif v9 == nil then
                    v9 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
                end;
                l_GuiService_0:Select(v9);
                if l_GuiService_0.SelectedObject then
                    local v26 = nil;
                    local l_pcall_0 = pcall;
                    local v28 = "NotificationScript2.UINavigation.Title";
                    local v29;
                    do
                        local l_v26_0 = v26;
                        l_pcall_0(function()
                            l_v26_0 = l_RobloxTranslator_0:FormatByKey(v28);
                        end);
                        v29 = l_v26_0;
                    end;
                    l_pcall_0 = nil;
                    local l_pcall_1 = pcall;
                    local v32 = "NotificationScript2.UINavigation.Text";
                    do
                        local l_l_pcall_0_0 = l_pcall_0;
                        l_pcall_1(function()
                            l_l_pcall_0_0 = l_RobloxTranslator_0:FormatByKey(v32);
                        end);
                        v26 = l_l_pcall_0_0;
                    end;
                    l_SendNotificationInfo_0:Fire({
                        Title = v29, 
                        Text = v26, 
                        Duration = 3
                    });
                end;
                return Enum.ContextActionResult.Sink;
            else
                l_GuiService_0.SelectedObject = nil;
                return Enum.ContextActionResult.Sink;
            end;
        else
            return Enum.ContextActionResult.Pass;
        end;
    else
        return Enum.ContextActionResult.Pass;
    end;
end;
local v35 = {};
v35.__index = v35;
v35.new = function()
    local v36 = setmetatable({}, v35);
    l_ContextActionService_0:BindAction("EnableKeyboardUINavigation", v34, false, Enum.KeyCode.BackSlash);
    l_ContextActionService_0:BindAction("ScrollSelectedElement", v22, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown, Enum.KeyCode.Home, Enum.KeyCode.End);
    l_GameSettings_0:GetPropertyChangedSignal("UiNavigationKeyBindEnabled"):Connect(function()
        if not l_GameSettings_0.UiNavigationKeyBindEnabled then
            l_GuiService_0.SelectedObject = nil;
        end;
    end);
    return v36;
end;
return v35.new();
