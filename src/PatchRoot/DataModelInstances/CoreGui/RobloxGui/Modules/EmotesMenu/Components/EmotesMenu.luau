local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_CorePackages_0.Roact);
local v10 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Actions_0 = l_Parent_1.Actions;
local l_Thunks_0 = l_Parent_1.Thunks;
local v15 = require(l_Actions_0.HideMenu);
local v16 = require(l_Actions_0.SetLayout);
local v17 = require(l_Actions_0.ShowError);
local v18 = require(l_Actions_0.HideError);
local v19 = require(l_Thunks_0.OpenMenu);
local v20 = require(l_Parent_0.EmotesWheel);
local v21 = require(l_Parent_0.ErrorMessage);
local v22 = require(l_Parent_1.Constants);
local v23 = require(l_Parent_1.Parent.RobloxTranslator);
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFFlagFixMissingPlayerGuiCrash);
local v25 = game:DefineFastFlag("FixEmotesMenuVR", false) or game:GetEngineFeature("EnableMaquettesSupport");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v27 = nil;
local v28 = v9.PureComponent:extend("EmotesMenu");
v28.init = function(v29)
    v29.savedSelectedCoreObject = nil;
    v29.savedSelectedObject = nil;
end;
v28.displayVisitShopMessage = function(v30)
    v30.props.showError((v23:FormatByKeyForLocale(v22.LocalizationKeys.VisitShopToGetEmotes, v30.props.locale)));
    delay(v22.ErrorDisplayTimeSeconds, function()
        v30.props.hideError();
    end);
end;
v28.bindActions = function(v31)
    l_ContextActionService_0:BindAction(v22.ToggleMenuAction, function(_, v33, _)
        if not l_GuiService_0.MenuIsOpen then
            if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
                if v33 == Enum.UserInputState.Begin then
                    if not v31.props.displayOptions.menuVisible then
                        v31.props.openMenu();
                    else
                        v31.props.hideMenu();
                    end;
                end;
                return nil;
            else
                return Enum.ContextActionResult.Pass;
            end;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, v22.EmoteMenuOpenKey);
end;
v28.unbindActions = function(_)
    l_ContextActionService_0:UnbindAction(v22.ToggleMenuAction);
end;
v28.saveSelectedObject = function(v36)
    v36.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
    l_GuiService_0.SelectedCoreObject = nil;
    v36.savedSelectedObject = l_GuiService_0.SelectedObject;
    l_GuiService_0.SelectedObject = nil;
end;
v28.resetSelectedObject = function(v37)
    if l_GuiService_0.SelectedCoreObject == nil then
        local v38 = true;
        if v37.savedSelectedCoreObject ~= nil then
            v38 = v37.savedSelectedCoreObject:IsDescendantOf(l_CoreGui_0);
        end;
        if v38 then
            l_GuiService_0.SelectedCoreObject = v37.savedSelectedCoreObject;
        end;
    end;
    if l_GuiService_0.SelectedObject == nil then
        if not v24() then
            if v27 == nil then
                v27 = l_LocalPlayer_0:WaitForChild("PlayerGui");
            end;
        elseif v27 == nil then
            v27 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
        end;
        local v39;
        if not v27 then
            v39 = false;
        else
            v39 = true;
            if v37.savedSelectedObject ~= nil then
                v39 = v37.savedSelectedObject:IsDescendantOf(v27);
            end;
        end;
        if v39 then
            l_GuiService_0.SelectedObject = v37.savedSelectedObject;
        end;
    end;
end;
v28.viewPortSizeChanged = function(v40)
    if v40.props.layout == v22.Layout.TenFoot then
        return ;
    else
        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
        if l_CurrentCamera_0 then
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            if l_ViewportSize_0 == Vector2.new(1, 1) then
                return ;
            else
                local l_Large_0 = v22.Layout.Large;
                local v44 = l_ViewportSize_0.X < v22.SmallScreenMaxSize.X;
                local v45 = l_ViewportSize_0.Y < v22.SmallScreenMaxSize.Y;
                if not (not v44 and not v45) then
                    l_Large_0 = v22.Layout.Small;
                end;
                v40.props.setLayout(l_Large_0);
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v28.currentCameraChanged = function(v46)
    if v46.viewportSizeChangedConn then
        v46.viewportSizeChangedConn:Disconnect();
    end;
    local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
    if l_CurrentCamera_1 then
        v46.viewportSizeChangedConn = l_CurrentCamera_1:GetPropertyChangedSignal("ViewportSize"):Connect(function()
            v46:viewPortSizeChanged();
        end);
        v46:viewPortSizeChanged();
    end;
end;
v28.didMount = function(v48)
    v48.currentCameraChangedConn = l_Workspace_0:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        v48:currentCameraChanged();
    end);
    v48:currentCameraChanged();
    v48.menuOpenedConn = l_GuiService_0.MenuOpened:Connect(function()
        if not (not v48.props.displayOptions.menuVisible or l_VRService_0.VREnabled) then
            v48.props.hideMenu();
        end;
    end);
    v48.inputOutsideMenuConn = l_UserInputService_0.InputBegan:Connect(function(v49, v50)
        if not v50 then
            if v48.props.displayOptions.menuVisible then
                local l_UserInputType_0 = v49.UserInputType;
                if not (not (not (l_UserInputType_0 ~= Enum.UserInputType.MouseButton1) or l_UserInputType_0 == Enum.UserInputType.Touch) or not v25 and l_VRService_0.VREnabled) then
                    v48.props.hideMenu();
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end);
    v48:bindActions();
end;
v28.willUnmount = function(v52)
    v52.currentCameraChangedConn:Disconnect();
    v52.viewportSizeChangedConn:Disconnect();
    v52.menuOpenedConn:Disconnect();
    v52.inputOutsideMenuConn:Disconnect();
    v52.currentCameraChangedConn = nil;
    v52.viewportSizeChangedConn = nil;
    v52.menuOpenedConn = nil;
    v52.inputOutsideMenuConn = nil;
    v52:unbindActions();
end;
v28.didUpdate = function(v53, v54, _)
    if v53.props.displayOptions.menuVisible ~= v54.displayOptions.menuVisible then
        if not v53.props.displayOptions.menuVisible then
            v53:resetSelectedObject();
        else
            v53:saveSelectedObject();
            return ;
        end;
    end;
end;
v28.render = function(v56)
    local v57 = v22.Layouts[v56.props.layout];
    local l_guiInset_0 = v56.props.displayOptions.guiInset;
    return v9.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 0, -l_guiInset_0), 
        Size = UDim2.new(1, 0, 1, l_guiInset_0), 
        ZIndex = v22.EmotesMenuZIndex, 
        AutoLocalize = false
    }, {
        Main = v9.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = v22.ScreenAvailable, 
            BackgroundTransparency = 1
        }, {
            AsspectRatioConstraint = v9.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), 
            SizeConstraint = v9.createElement("UISizeConstraint", {
                MinSize = v57.EmotesWheelMinSize, 
                MaxSize = v57.EmotesWheelMaxSize
            }), 
            EmotesWheel = v9.createElement(v20)
        }), 
        ErrorMessage = v9.createElement(v21)
    });
end;
return v10.connect(function(v59)
    return {
        displayOptions = v59.displayOptions, 
        emotesInfo = v59.emotesPage.emotesInfo, 
        layout = v59.layout, 
        locale = v59.locale
    };
end, function(v60)
    return {
        openMenu = function()
            return v60(v19());
        end, 
        hideMenu = function()
            return v60(v15());
        end, 
        setLayout = function(v61)
            return v60(v16(v61));
        end, 
        showError = function(v62)
            return v60(v17(v62));
        end, 
        hideError = function()
            return v60(v18());
        end
    };
end)(v28);
