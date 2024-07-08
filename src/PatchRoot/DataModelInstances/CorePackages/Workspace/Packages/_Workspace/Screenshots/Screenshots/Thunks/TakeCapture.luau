local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_0.Experimentation.getIsFeatureVisibleToDesktopUser);
local v5 = require(l_Parent_0.Utils.getScreenshotHud);
local v6 = require(l_Parent_0.Actions.OverlayActivated);
local v7 = require(l_Parent_0.Actions.OverlayDeactivated);
local v8 = require(l_Parent_0.Actions.OverlayFlashActivated);
local v9 = require(l_Parent_0.Actions.OverlayFlashDeactivated);
local v10 = require(l_Parent_0.Utils.removeCoreUI);
local v11 = require(l_Parent_0.Enums.ShotsToastType);
local v12 = require(l_Parent_0.Actions.ToastTriggered);
local v13 = require(l_Parent_0.Flags.FFlagDecomposeDesktopCapturesEligibilityCheck);
local function _(v14)
    if l_GuiService_0:GetGuiIsVisible(v14) then
        l_GuiService_0:ToggleGuiIsVisibleForCaptures(v14);
    end;
end;
local function _(v16)
    if not l_GuiService_0:GetGuiIsVisible(v16) then
        l_GuiService_0:ToggleGuiIsVisibleForCaptures(v16);
    end;
end;
local function _()
    if l_GuiService_0:GetGuiIsVisible(Enum.GuiType.Custom) then
        l_GuiService_0:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom);
    end;
end;
local function _()
    if not l_GuiService_0:GetGuiIsVisible(Enum.GuiType.Custom) then
        l_GuiService_0:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom);
    end;
end;
return function()
    return function(v20)
        local v21 = false;
        local v22 = false;
        v20:dispatch(v12(v11.None));
        local l_OverrideMouseIconBehavior_0 = l_UserInputService_0.OverrideMouseIconBehavior;
        if not (not v13 and not v4()) then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
        end;
        local v24 = v5();
        if not (v24 and not v24.HidePlayerGuiForCaptures) then
            if l_GuiService_0:GetGuiIsVisible(Enum.GuiType.Custom) then
                l_GuiService_0:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom);
            end;
            v22 = true;
        end;
        local v25 = nil;
        if not (v24 and not v24.HideCoreGuiForCaptures) then
            v25 = v10();
            v21 = true;
        end;
        local l_CustomBillboards_0 = Enum.GuiType.CustomBillboards;
        if l_GuiService_0:GetGuiIsVisible(l_CustomBillboards_0) then
            l_GuiService_0:ToggleGuiIsVisibleForCaptures(l_CustomBillboards_0);
        end;
        l_CustomBillboards_0 = Enum.GuiType.PlayerNameplates;
        if l_GuiService_0:GetGuiIsVisible(l_CustomBillboards_0) then
            l_GuiService_0:ToggleGuiIsVisibleForCaptures(l_CustomBillboards_0);
        end;
        v20:dispatch(v6());
        l_CaptureService_0:OnCaptureBegan();
        task.wait(0.1);
        l_CaptureService_0:SaveScreenshotCapture();
        task.wait();
        v20:dispatch(v8());
        task.wait(0.5);
        l_CaptureService_0:OnCaptureEnded();
        v20:dispatch(v9());
        v20:dispatch(v7());
        if not (not v13 and not v4()) then
            l_UserInputService_0.OverrideMouseIconBehavior = l_OverrideMouseIconBehavior_0;
        end;
        if not (not v22 or l_GuiService_0:GetGuiIsVisible(Enum.GuiType.Custom)) then
            l_GuiService_0:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom);
        end;
        if v21 then
            v25();
        end;
        l_CustomBillboards_0 = Enum.GuiType.CustomBillboards;
        if not l_GuiService_0:GetGuiIsVisible(l_CustomBillboards_0) then
            l_GuiService_0:ToggleGuiIsVisibleForCaptures(l_CustomBillboards_0);
        end;
        l_CustomBillboards_0 = Enum.GuiType.PlayerNameplates;
        if not l_GuiService_0:GetGuiIsVisible(l_CustomBillboards_0) then
            l_GuiService_0:ToggleGuiIsVisibleForCaptures(l_CustomBillboards_0);
        end;
    end;
end;
