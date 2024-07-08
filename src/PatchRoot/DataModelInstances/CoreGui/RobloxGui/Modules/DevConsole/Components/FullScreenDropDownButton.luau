local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local v2 = require(l_CorePackages_0.Roact);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v4 = require(script.Parent.Parent.Constants);
local l_DropDownEntryHeight_0 = v4.GeneralFormatting.DropDownEntryHeight;
local l_DropDownArrowHeight_0 = v4.GeneralFormatting.DropDownArrowHeight;
local v7 = l_DropDownArrowHeight_0 / 2;
local l_DownArrow_0 = v4.Image.DownArrow;
local v9 = game:DefineFastFlag("DevConsoleFullScreenDropDownScrollFix", false);
local v10 = v2.Component:extend("FullScreenDropDownButton");
v10.init = function(v11)
    v11.startDropDownView = function()
        v11:setState({
            selectionScreenExpanded = true
        });
    end;
    v11.noSelection = function(_, v13)
        if not (v13.UserInputType ~= Enum.UserInputType.MouseButton1) or v13.UserInputType == Enum.UserInputType.Touch and v13.UserInputState == Enum.UserInputState.End then
            v11:setState({
                selectionScreenExpanded = false
            });
        end;
    end;
    v11.state = {
        selectionScreenExpanded = false, 
        guiSizeY = l_RobloxGui_0.AbsoluteSize.Y
    };
end;
v10.render = function(v14)
    local l_buttonSize_0 = v14.props.buttonSize;
    local l_dropDownList_0 = v14.props.dropDownList;
    local l_selectedIndex_0 = v14.props.selectedIndex;
    local l_onSelection_0 = v14.props.onSelection;
    local l_layoutOrder_0 = v14.props.layoutOrder;
    local l_selectionScreenExpanded_0 = v14.state.selectionScreenExpanded;
    local l_portalTarget_0 = v14.props.portalTarget;
    local v22 = {};
    local v23 = 16;
    if l_selectionScreenExpanded_0 then
        v22.UIListLayout = v2.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirection = Enum.FillDirection.Vertical
        });
        if l_dropDownList_0 then
            for v24, v25 in ipairs(l_dropDownList_0) do
                v22[v24] = v2.createElement("TextButton", {
                    Text = v25, 
                    Font = v4.Font.TabBar, 
                    TextSize = v4.DefaultFontSize.DropDownTabBar, 
                    TextColor3 = v4.Color.Text, 
                    AutoButtonColor = false, 
                    Size = UDim2.new(1, 0, 0, l_DropDownEntryHeight_0), 
                    BackgroundColor3 = v24 == l_selectedIndex_0 and v4.Color.SelectedGray or v4.Color.UnselectedGray, 
                    LayoutOrder = v24, 
                    BorderSizePixel = 0, 
                    [v2.Event.Activated] = function(_)
                        v14:setState({
                            selectionScreenExpanded = false
                        });
                        l_onSelection_0(v24);
                    end
                });
                v23 = v23 + l_DropDownEntryHeight_0;
            end;
        end;
    end;
    return v2.createElement("TextButton", {
        Size = l_buttonSize_0, 
        BackgroundColor3 = v4.Color.UnselectedGray, 
        Text = "", 
        AutoButtonColor = false, 
        LayoutOrder = l_layoutOrder_0, 
        [v2.Event.Activated] = v14.startDropDownView
    }, {
        SizeChangeEvent = if v9 then v2.createElement(l_ExternalEventConnection_0, {
            event = l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"), 
            callback = function()
                v14:setState({
                    guiSizeY = l_RobloxGui_0.AbsoluteSize.Y
                });
            end
        }) else nil, 
        text = v2.createElement("TextLabel", {
            Size = UDim2.new(1, -l_DropDownArrowHeight_0 - v7, 1, 0), 
            Text = l_dropDownList_0[l_selectedIndex_0], 
            Font = v4.Font.TabBar, 
            TextSize = v4.DefaultFontSize.DropDownTabBar, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextColor3 = v4.Color.Text, 
            BackgroundTransparency = 1
        }), 
        arrow = v2.createElement("ImageLabel", {
            Image = l_DownArrow_0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_DropDownArrowHeight_0, 0, l_DropDownArrowHeight_0), 
            Position = UDim2.new(1, -l_DropDownArrowHeight_0 - v7, 0.5, -v7)
        }), 
        selectionView = l_selectionScreenExpanded_0 and v2.createElement(v2.Portal, {
            target = l_portalTarget_0 ~= nil and l_portalTarget_0 or game:GetService("CoreGui").DevConsoleMaster
        }, {
            GreyOutFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v4.Color.Black, 
                BackgroundTransparency = 0.36, 
                Active = true, 
                [v2.Event.InputEnded] = v14.noSelection
            }, {
                BorderFrame = v2.createElement("Frame", {
                    Size = UDim2.new(0, 375, 0, v23), 
                    Position = UDim2.new(0.5, -187.5, 0, 0), 
                    BackgroundColor3 = v4.Color.UnselectedGray, 
                    BorderSizePixel = 0
                }, {
                    SelectionFrame = v2.createElement("ScrollingFrame", {
                        Size = UDim2.new(1, -30, 1, -16), 
                        Position = UDim2.new(0, 15, 0, 8), 
                        BackgroundTransparency = 1, 
                        CanvasSize = UDim2.new(1, -30, 1, if not v9 then l_DropDownEntryHeight_0 else (v23 - 16) - v14.state.guiSizeY), 
                        BorderSizePixel = 0, 
                        ScrollBarThickness = 0
                    }, v22)
                })
            })
        })
    });
end;
return v10;
