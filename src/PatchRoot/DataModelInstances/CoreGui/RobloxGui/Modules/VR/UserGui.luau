local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_VRService_0 = game:GetService("VRService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("GamepadService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local _ = l_RobloxGui_0:WaitForChild("Modules");
local v8 = require(l_RobloxGui_0.Modules.VR.Panel3D);
local v9 = require(l_RobloxGui_0.Modules.VR.VRHub);
local v10 = require(l_RobloxGui_0.Modules.VR.VirtualKeyboard);
local v11 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GetFFlagSupportToastInVR_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSupportToastInVR;
local l_VRConstants_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).VRConstants;
local _ = game:GetService("UserInputService");
local _ = game:GetService("RunService");
local v17 = game:DefineFastFlag("VRShowUIOnGuiSelection", false);
local v18 = (require(l_RobloxGui_0.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01;
if l_VRService_0.VREnabled then
    if game:GetEngineFeature("ExposeOpenXrAPI1") then
        l_VRService_0.QuestDisplayRefreshRate = 90;
    end;
    local v19 = {
        ModuleName = "UserGui", 
        KeepVRTopbarOpen = false, 
        VRIsExclusive = false, 
        VRClosesNonExclusive = false, 
        SetVisible = nil
    };
    v9:RegisterModule(v19);
    local _ = Vector2.new(4, 3);
    local v21 = Vector2.new(2.66 * v18, 2 * v18);
    local v22 = false;
    local v23 = v8.Get(v19.ModuleName);
    v23:SetType(v8.Type.NewStandard);
    v23:GetPart().CanQuery = false;
    local v24 = Vector2.new(2.7978, 2.09835);
    v23:ResizeStuds(v24.x, v24.y, 128);
    v23:SetVisible(false);
    local v25 = v8.Get(not l_GetFFlagSupportToastInVR_0() and "PositionLocked" or l_VRConstants_0.PositionLockedPanelName);
    v25:SetType(v8.Type.PositionLocked);
    v25:GetPart().CanQuery = false;
    v25:ResizeStuds(v21.x, v21.y, 128);
    v25:SetVisible(false);
    v25.showCursor = true;
    v9.ModuleOpened.Event:connect(function(v26)
        if not ((not (v26 ~= v19.ModuleName) or not v9:GetModule(v26).VRClosesNonExclusive) or not v23:IsVisible()) then
            v19:SetVisible(false, nil);
        end;
    end);
    local v27 = false;
    local v28 = false;
    v19.SetVisible = function(_, v30, v31)
        v28 = v30;
        if v31 then
            v31:SetVisible(v28);
        end;
        if not v28 then
            v9:FireModuleClosed(v19.ModuleName);
        else
            v9:FireModuleOpened(v19.ModuleName);
        end;
        l_CoreGui_0:SetUserGuiRendering(true, (not not (v28 and not v27) and v31) and v31:GetPart() or nil, Enum.NormalId.Front);
    end;
    v19.IsVisible = function(_)
        return v28;
    end;
    v19.Update = function(v33)
        v33:SetVisible(v28);
    end;
    local function v34()
        v9.LaserPointer:updateInputUserCFrame();
        if not v9.ShowTopBar then
            v25:StartLerp(v21 * 0.25);
            v19:SetVisible(false, v25);
            l_GuiService_0.SelectedObject = nil;
            v22 = false;
        else
            v19:SetVisible(true, v25);
            v25.initialCFLerp = 1;
            v25:ForcePositionUpdate(true);
            v25.distance = 2.5 * v18;
            if not v22 then
                v25:StartLerp(v21);
                v22 = true;
                return ;
            end;
        end;
    end;
    v9.ShowTopBarChanged.Event:connect(v34);
    l_GuiService_0:GetPropertyChangedSignal("MenuIsOpen"):Connect(v34);
    l_VRService_0.UserCFrameEnabled:Connect(v34);
    l_GuiService_0.PurchasePromptShown:Connect(function()
        if not v9.ShowTopBar then
            v9:SetShowTopBar(true);
        end;
    end);
    if v17 then
        local function v36(_)
            if not (not l_GuiService_0.SelectedObject and not l_GuiService_0.SelectedCoreObject or v9.ShowTopBar) then
                v9:SetShowTopBar(true);
            end;
            l_GuiService_0.SelectedObject = nil;
            l_GuiService_0.SelectedCoreObject = nil;
        end;
        l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(v36);
        l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(v36);
    end;
    local v37 = require(l_RobloxGui_0.Modules.InGameMenu);
    local function v41(v38, v39, _)
        if v38 == "OpenVRMenu" and v39 == Enum.UserInputState.Begin then
            if v9.ShowTopBar then
                v9:SetShowTopBar(false);
                v37.closeInGameMenu();
                l_RbxAnalyticsService_0:ReportCounter("VR-BindAction-ToggleGui-Off");
            else
                v9:SetShowTopBar(true);
                l_RbxAnalyticsService_0:ReportCounter("VR-BindAction-ToggleGui-On");
            end;
        end;
        if v38 == "OpenIGMenu" and v39 == Enum.UserInputState.Begin then
            if not v9.ShowTopBar then
                v9:SetShowTopBar(true);
            end;
            if not v37.getOpen() then
                v37.openInGameMenu(v11.MainPagePageKey);
            end;
        end;
    end;
    l_ContextActionService_0:BindAction("OpenVRMenu", v41, false, Enum.KeyCode.ButtonSelect);
    l_ContextActionService_0:BindAction("OpenIGMenu", v41, false, Enum.KeyCode.ButtonStart);
    local function v42()
        if l_VRService_0.VREnabled then
            v19:SetVisible(false, v23);
            v19:SetVisible(true, v25);
            v9:SetShowTopBar(true);
            return ;
        else
            v23:SetVisible(false);
            l_CoreGui_0:SetUserGuiRendering(false, nil, Enum.NormalId.Front);
            return ;
        end;
    end;
    l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v42);
    v42();
    v10.OpenedEvent:connect(function()
        v27 = true;
        v19:Update();
    end);
    v10.ClosedEvent:connect(function()
        v27 = false;
        v19:Update();
    end);
    v9:SetShowTopBar(true);
    v34();
    v19.getPanel = function(_)
        return v25;
    end;
    return v19;
else
    warn("UserGui should not be required while not in VR");
    return nil;
end;
