local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Shell.GlobalSettings);
local v4 = require(l_Modules_0.LuaApp.RoactMotion);
local v5 = require(l_Modules_0.Shell.SoundManager);
local l_Components_0 = l_Modules_0.Shell.Components;
local v7 = require(l_Modules_0.Shell.Components.Common.SoundComponent);
local v8 = require(l_Components_0.ContextActionEvent);
local v9 = require(l_Modules_0.Shell.Utility);
local v10 = v2.PureComponent:extend("SideBar");
v10.init = function(v11)
    v11.groupKey = "SideBar";
    v11.buttonImage = v3.Images.ButtonDefault;
    v11.selectionImageObject = v9.Create("ImageLabel")({
        Name = "SelectorImage", 
        BackgroundTransparency = 1, 
        Visible = false
    });
    v11.defaultProps = {
        buttonColor3 = v3.Colors.WhiteButton, 
        buttonTransparency = 1, 
        textColor3 = v3.Colors.WhiteText
    };
    v11.focusedProps = {
        buttonColor3 = v3.Colors.BlueButton, 
        buttonTransparency = 0, 
        textColor3 = v3.Colors.TextSelected
    };
end;
v10.render = function(v12)
    local l_props_0 = v12.props;
    local function v14()
        v12.buttons = {};
        v9.RemoveSelectionGroup(v12.groupKey);
        if l_props_0.onClose then
            l_props_0.onClose();
        end;
    end;
    local v15 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = l_props_0.paddingTop or UDim.new(0, 156), 
            PaddingBottom = l_props_0.paddingBottom or UDim.new(0, 39)
        })
    };
    if not l_props_0.buttons then
        v15.TextLabel = v2.createElement("TextLabel", {
            Size = UDim2.new(1, -165, 1, 0), 
            Position = UDim2.new(0, 65, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Text = l_props_0.text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = v3.WhiteTextColor, 
            Font = v3.RegularFont, 
            FontSize = v3.DescriptionSize, 
            TextWrapped = true
        });
    else
        local v16 = 0;
        for _, v18 in ipairs(l_props_0.buttons) do
            v16 = v16 + 1;
            local l_v16_0 = v16;
            local v20 = not not (v12.state.selectedIndex and v12.state.selectedIndex == l_v16_0) and v12.focusedProps or v12.defaultProps;
            v15["Button" .. l_v16_0] = v2.createElement("ImageButton", {
                Image = v12.buttonImage, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(1, -1, 0, 75), 
                LayoutOrder = l_v16_0, 
                ImageColor3 = v20.buttonColor3, 
                ImageTransparency = v20.buttonTransparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9), 
                SelectionImageObject = v12.selectionImageObject, 
                BackgroundTransparency = 1, 
                [v2.Event.SelectionGained] = function()
                    v12:setState({
                        selectedIndex = l_v16_0
                    });
                end, 
                [v2.Event.SelectionLost] = function()
                    v12:setState({
                        selectedIndex = v2.None
                    });
                end, 
                [v2.Event.Activated] = function()
                    v5:Play("ButtonPress");
                    v12.buttons = {};
                    v9.RemoveSelectionGroup(v12.groupKey);
                    if l_props_0.onClose then
                        l_props_0.onClose();
                    end;
                    v18.callback();
                end, 
                [v2.Ref] = function(v21)
                    v12.buttons = v12.buttons or {};
                    v12.buttons[l_v16_0] = v21;
                end
            }, {
                ButtonText = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, -65, 1, 0), 
                    Position = UDim2.new(0, 65, 0, 0), 
                    AnchorPoint = Vector2.new(0, 0), 
                    Text = v18.text, 
                    TextSize = v3.TextSizes.Medium, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = v20.textColor3, 
                    Font = v3.RegularFont, 
                    BackgroundTransparency = 1
                }), 
                MoveSelection = v2.createElement(v7, {
                    SoundName = "MoveSelection"
                })
            });
        end;
        if v16 > 0 then
            v15.UIListLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 0), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            });
        end;
    end;
    local l_inFocus_0 = l_props_0.inFocus;
    local v23 = not not l_inFocus_0 and v3.ModalBackgroundTransparency or 1;
    local v24 = not l_inFocus_0 and 1 or 0.7;
    if not l_inFocus_0 then
        v12.seenPressed = false;
    end;
    return v2.createElement(v4.SimpleMotion, {
        defaultStyle = {
            modalBackgroundTransparency = 1, 
            containerPositionXScale = 1
        }, 
        style = {
            modalBackgroundTransparency = v4.spring(v23, 600, 60), 
            containerPositionXScale = v4.spring(v24, 600, 60)
        }, 
        onRested = not l_inFocus_0 and v14, 
        render = function(v25)
            return v2.createElement(v2.Portal, {
                target = l_CoreGui_0
            }, {
                SideBarGui = v2.createElement("ScreenGui", {
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    DisplayOrder = l_props_0.displayOrder or 1
                }, {
                    BackConnector = l_inFocus_0 and v2.createElement(v8, {
                        name = "CloseSideBar", 
                        callback = function(_, v27, v28)
                            if v28.KeyCode == Enum.KeyCode.ButtonB then
                                if v27 == Enum.UserInputState.Begin then
                                    v12.seenPressed = true;
                                    return ;
                                elseif not (not (v27 == Enum.UserInputState.End) or not v12.seenPressed) then
                                    v12:setState({
                                        selectedIndex = v2.None
                                    });
                                    if l_props_0.onRemoveFocus then
                                        l_props_0.onRemoveFocus();
                                    end;
                                end;
                            end;
                        end, 
                        binds = {
                            Enum.UserInputType.Gamepad1, 
                            Enum.UserInputType.Gamepad2, 
                            Enum.UserInputType.Gamepad3, 
                            Enum.UserInputType.Gamepad4
                        }, 
                        actionPriority = l_props_0.actionPriority
                    }), 
                    ModalOverlay = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = v25.modalBackgroundTransparency, 
                        BackgroundColor3 = v3.ModalBackgroundColor, 
                        BorderSizePixel = 0
                    }, {
                        SideBarContainer = v2.createElement("Frame", {
                            Size = UDim2.new(0.3, 0, 1, 0), 
                            Position = UDim2.new(v25.containerPositionXScale, 0, 0, 0), 
                            BorderSizePixel = 0, 
                            BackgroundColor3 = v3.OverlayColor, 
                            [v2.Ref] = function(v29)
                                v12.container = v29;
                            end
                        }, v15)
                    })
                })
            });
        end
    });
end;
v10.didMount = function(v30)
    delay(0, function()
        if not (not v30.props.inFocus or not v30.container) then
            v9.RemoveSelectionGroup(v30.groupKey);
            v9.AddSelectionParent(v30.groupKey, v30.container);
            local v31 = v30.props.selectIndex or 1;
            if not v30.buttons or not v30.buttons[v31] then
                v9.SetSelectedCoreObject(nil);
            elseif not v30.state.selectedIndex then
                v9.SetSelectedCoreObject(v30.buttons[v31]);
                return ;
            end;
        end;
    end);
end;
v10.didUpdate = function(v32, v33, _)
    if v32.props.inFocus == v33.inFocus then
        return ;
    else
        if not v32.props.inFocus or not v32.container then
            v9.RemoveSelectionGroup(v32.groupKey);
        else
            v9.RemoveSelectionGroup(v32.groupKey);
            v9.AddSelectionParent(v32.groupKey, v32.container);
            local v35 = v32.props.selectIndex or 1;
            if not v32.buttons or not v32.buttons[v35] then
                v9.SetSelectedCoreObject(nil);
                return ;
            elseif not v32.state.selectedIndex then
                v9.SetSelectedCoreObject(v32.buttons[v35]);
                return ;
            end;
        end;
        return ;
    end;
end;
v10.willUnmount = function(v36)
    v9.RemoveSelectionGroup(v36.groupKey);
end;
return v10;
