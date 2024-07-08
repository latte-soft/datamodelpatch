local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(script.Parent.Parent.Util.setMouseVisibility);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Constants);
local l_FrameHeight_0 = v8.TopBarFormatting.FrameHeight;
local l_WindowPadding_0 = v8.Padding.WindowPadding;
local l_MinSize_0 = v8.MainWindowInit.MinSize;
local v12 = require(l_Parent_0.Components.DevConsoleTopBar);
local l_Actions_0 = script.Parent.Parent.Actions;
local v14 = require(l_Actions_0.ChangeDevConsoleSize);
local v15 = require(l_Actions_0.SetDevConsoleVisibility);
local v16 = require(l_Actions_0.SetDevConsoleMinimized);
local v17 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRequestServerStatsFix);
local v18 = v5.PureComponent:extend("DevConsoleWindow");
v18.onMinimizeClicked = function(v19)
    v19.props.dispatchSetDevConsoleMinimized(true);
end;
v18.onMaximizeClicked = function(v20)
    v20.props.dispatchSetDevConsoleMinimized(false);
end;
v18.onCloseClicked = function(v21)
    if v17() then
        v21.props.onCloseCallback(false);
    end;
    v21.props.dispatchSetDevConsolVisibility(false);
end;
v18.init = function(v22)
    v22.setDevConsoleSize = function(v23, v24, v25)
        local v26 = v25.X - v24.X;
        local v27 = v25.Y - v24.Y;
        v23.props.dispatchChangeDevConsoleSize(UDim2.new(0, v26 < l_MinSize_0.X and l_MinSize_0.X or v26, 0, v27 < l_MinSize_0.Y and l_MinSize_0.Y or v27));
    end;
    v22.resizeInputBegan = function(_, v29)
        if v29.UserInputType == Enum.UserInputType.MouseButton1 then
            local v30 = nil;
            local v31 = nil;
            local function v33(v32)
                v22:setDevConsoleSize(v22.ref.current.AbsolutePosition, v32.Position);
            end;
            do
                local l_v30_0, l_v31_0 = v30, v31;
                local function v37(v36)
                    if v36.UserInputType == Enum.UserInputType.MouseButton1 then
                        l_v30_0:Disconnect();
                        l_v31_0:Disconnect();
                    end;
                end;
                l_v30_0 = l_UserInputService_0.InputChanged:Connect(v33);
                l_v31_0 = l_UserInputService_0.InputEnded:Connect(v37);
            end;
        end;
    end;
    v22.doGamepadMenuButton = function(v38)
        if v22.props.isVisible then
            local v39 = true;
            if v38.KeyCode ~= Enum.KeyCode.ButtonStart then
                v39 = v38.KeyCode == Enum.KeyCode.Escape;
            end;
            if v39 then
                v22.props.dispatchSetDevConsolVisibility(false);
            end;
        end;
    end;
    v22.ref = v5.createRef();
    v22.state = {
        resizing = false
    };
end;
v18.didMount = function(v40)
    delay(0, function()
        if v40.ref.current then
            v40:setDevConsoleSize(v40.ref.current.AbsolutePosition, v40.ref.current.ResizeButton.AbsolutePosition);
        end;
    end);
    v4(v40.props.isVisible);
    v40.gamepadMenuListener = l_UserInputService_0.InputBegan:Connect(v40.doGamepadMenuButton);
end;
v18.willUnmount = function(v41)
    if l_GuiService_0.SelectedCoreObject == v41.ref.current then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
    v41.gamepadMenuListener:Disconnect();
end;
v18.didUpdate = function(v42, v43, _)
    v4(v42.props.isVisible);
    if v42.props.isMinimized and l_GuiService_0.SelectedCoreObject == v42.ref.current then
        l_GuiService_0.SelectedCoreObject = nil;
        return ;
    else
        if not (v42.props.isVisible == v43.isVisible) or v42.props.currTabIndex ~= v43.currTabIndex then
            if not (Enum.UserInputType.Gamepad1 == l_UserInputService_0:GetLastInputType()) or not v42.props.isVisible then
                l_GuiService_0.SelectedCoreObject = nil;
            else
                l_GuiService_0.SelectedCoreObject = v42.ref.current;
                return ;
            end;
        end;
        return ;
    end;
end;
v18.render = function(v45)
    local l_isVisible_0 = v45.props.isVisible;
    local l_formFactor_0 = v45.props.formFactor;
    local l_isDeveloperView_0 = v45.props.isDeveloperView;
    local l_currTabIndex_0 = v45.props.currTabIndex;
    local l_tabList_0 = v45.props.tabList;
    local l_isMinimized_0 = v45.props.isMinimized;
    local l_position_0 = v45.props.position;
    local l_size_0 = v45.props.size;
    local _ = v45.state.resizing;
    local l_l_size_0_0 = l_size_0;
    local v56 = UDim2.new();
    local v57 = {};
    local v58 = 16;
    if l_formFactor_0 ~= v8.FormFactor.Large then
        local l_AbsoluteSize_0 = l_RobloxGui_0.AbsoluteSize;
        l_size_0 = UDim2.new(0, l_AbsoluteSize_0.X, 0, l_AbsoluteSize_0.Y);
        l_position_0 = UDim2.new(0, 0, 0, 0);
        v56 = UDim2.new(0, 16, 0, 0);
        l_l_size_0_0 = l_size_0 + UDim2.new(0, -32, 0, 0);
        v58 = 0;
    end;
    v57.UIListLayout = v5.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = UDim.new(0, l_WindowPadding_0)
    });
    if not l_isMinimized_0 then
        v57.TopBar = v5.createElement(v12, {
            LayoutOrder = 1, 
            formFactor = l_formFactor_0, 
            isMinimized = false, 
            onMinimizeClicked = function()
                v45:onMinimizeClicked();
            end, 
            onMaximizeClicked = function()
                v45:onMaximizeClicked();
            end, 
            onCloseClicked = function()
                v45:onCloseClicked();
            end
        });
        local v60 = l_l_size_0_0 - UDim2.new(0, 0, 0, l_FrameHeight_0 + 2 * l_WindowPadding_0);
        if not ((not v45.ref.current or not l_isVisible_0) or not l_tabList_0) then
            local v61 = l_tabList_0[l_currTabIndex_0];
            if v61 then
                v57.MainView = v5.createElement(v61.tab, {
                    size = v60, 
                    formFactor = l_formFactor_0, 
                    isDeveloperView = l_isDeveloperView_0, 
                    tabList = l_tabList_0
                });
            end;
        end;
        return v5.createElement("Frame", {
            Position = l_position_0, 
            Size = l_size_0, 
            Visible = l_isVisible_0, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Transparency = v8.MainWindowInit.Transparency, 
            BorderColor3 = v8.Color.BaseGray, 
            BorderSizePixel = v58, 
            Active = true, 
            AutoLocalize = false, 
            Selectable = false, 
            [v5.Ref] = v45.ref
        }, {
            DevConsoleUI = v5.createElement("Frame", {
                Size = l_l_size_0_0, 
                Position = v56, 
                BackgroundTransparency = 1
            }, v57), 
            ResizeButton = v5.createElement("ImageButton", {
                Position = UDim2.new(1, 0, 1, 0), 
                Size = UDim2.new(0, v58, 0, v58), 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                Modal = true, 
                [v5.Event.InputBegan] = v45.resizeInputBegan
            })
        });
    else
        v57.TopBar = v5.createElement(v12, {
            LayoutOrder = 1, 
            formFactor = l_formFactor_0, 
            isMinimized = true, 
            onMinimizeClicked = function()
                v45:onMinimizeClicked();
            end, 
            onMaximizeClicked = function()
                v45:onMaximizeClicked();
            end, 
            onCloseClicked = function()
                v45:onCloseClicked();
            end
        });
        return v5.createElement("Frame", {
            Position = UDim2.new(1, -500, 1, -2 * l_FrameHeight_0), 
            Size = UDim2.new(0, 500, 0, 2 * l_FrameHeight_0), 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Transparency = v8.MainWindowInit.Transparency, 
            Active = true, 
            AutoLocalize = false, 
            Visible = l_isVisible_0, 
            Selectable = true, 
            BorderColor3 = v8.Color.BaseGray, 
            [v5.Ref] = v45.ref
        }, v57);
    end;
end;
return v6.UNSTABLE_connect2(function(v62, _)
    return {
        isVisible = v62.DisplayOptions.isVisible, 
        isMinimized = v62.DisplayOptions.isMinimized, 
        position = v62.DisplayOptions.position, 
        size = v62.DisplayOptions.size, 
        isDeveloperView = v62.MainView.isDeveloperView, 
        currTabIndex = v62.MainView.currTabIndex, 
        tabList = v62.MainView.tabList
    };
end, function(v64)
    return {
        dispatchChangeDevConsoleSize = function(v65)
            v64(v14(v65));
        end, 
        dispatchSetDevConsolVisibility = function(v66)
            v64(v15(v66));
        end, 
        dispatchSetDevConsoleMinimized = function(v67)
            v64(v16(v67));
        end
    };
end)(v18);
