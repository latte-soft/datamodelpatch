local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.ReactRoblox);
local l_GetFFlagSupportToastInVR_0 = require(l_Parent_0.SharedFlags).GetFFlagSupportToastInVR;
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v10 = game:DefineFastFlag("EnableToastNotificationsDeeplinkConfirmationModalHeightFix", false);
local v11 = nil;
local l_RobloxTranslator_0 = l_RobloxGui_0.Modules:FindFirstChild("RobloxTranslator");
if l_RobloxTranslator_0 then
    local l_status_0, l_result_0 = pcall(function()
        return require(l_RobloxTranslator_0);
    end);
    if l_status_0 then
        v11 = l_result_0;
    end;
end;
return function(v15)
    local v16, v17 = v3.useState(Vector2.new(800, 600));
    local v18 = "Leaving Experience";
    local v19 = "Are you sure you want to leave and join another experience?";
    local v20 = "Cancel";
    local v21 = "Confirm";
    if v11 then
        v18 = v11:FormatByKey("Notifications.ToastNotifications.Title.LeavingExperience") or v18;
        v19 = v11:FormatByKey("Notifications.ToastNotifications.Label.LeaveExperienceConfirmation") or v19;
        v20 = v11:FormatByKey("InGame.InspectMenu.Action.Cancel") or v20;
        v21 = v11:FormatByKey("InGame.InspectMenu.Action.Confirm") or v21;
    end;
    return v3.createElement("Frame", {
        Active = true, 
        BackgroundTransparency = if not not l_GetFFlagSupportToastInVR_0() and v15.backgroundTransparency then v15.backgroundTransparency else 0.5, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        Size = UDim2.new(1, 0, 1, not v10 and 0 or l_GuiService_0.TopbarInset.Height), 
        [v5.Change.AbsoluteSize] = function(v22)
            v17(v22.AbsoluteSize);
        end, 
        Position = if not v10 then nil else UDim2.fromOffset(0, -l_GuiService_0.TopbarInset.Height)
    }, {
        Alert = v3.createElement(l_InteractiveAlert_0, {
            screenSize = v16, 
            title = v18, 
            bodyText = v19, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = function()
                                v15.closeCallback(false);
                            end, 
                            text = v20
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function()
                                v15.closeCallback(true);
                            end, 
                            text = v21
                        }
                    }
                }
            }
        })
    });
end;
