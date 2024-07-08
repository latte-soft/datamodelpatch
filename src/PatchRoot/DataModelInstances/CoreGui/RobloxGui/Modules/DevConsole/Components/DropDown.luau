local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui").RobloxGui;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(script.Parent.Parent.Constants);
local l_UtilBar_0 = v3.Font.UtilBar;
local l_UtilBar_1 = v3.DefaultFontSize.UtilBar;
local l_DropDownArrowHeight_0 = v3.GeneralFormatting.DropDownArrowHeight;
local v7 = l_DropDownArrowHeight_0 / 2;
local l_DownArrow_0 = v3.Image.DownArrow;
local v9 = v2.Component:extend("DropDown");
v9.init = function(v10)
    v10.onMainButtonPressed = function(_, _)
        v10:setState({
            showDropDown = true
        });
    end;
    v10.nonDropDownSelection = function(_, v14)
        if not (v14.UserInputType ~= Enum.UserInputType.MouseButton1) or v14.UserInputType == Enum.UserInputType.Touch and v14.UserInputState == Enum.UserInputState.End then
            v10:setState({
                showDropDown = false
            });
        end;
    end;
    v10.state = {
        showDropDown = false
    };
    v10.ref = v2.createRef();
end;
v9.render = function(v15)
    local l_buttonSize_0 = v15.props.buttonSize;
    local l_dropDownList_0 = v15.props.dropDownList;
    local l_selectedIndex_0 = v15.props.selectedIndex;
    local l_onSelection_0 = v15.props.onSelection;
    local l_layoutOrder_0 = v15.props.layoutOrder;
    local l_dropDownTargetParent_0 = v15.props.dropDownTargetParent;
    local v22 = v15.ref.current and v15.state.showDropDown;
    local v23 = {};
    local v24 = nil;
    local v25 = nil;
    local v26 = 0;
    local v27 = 0;
    if not (not v15.ref.current or not v22) then
        local l_AbsolutePosition_0 = v15.ref.current.AbsolutePosition;
        local l_AbsoluteSize_0 = v15.ref.current.AbsoluteSize;
        v27 = l_AbsoluteSize_0.X;
        v23.UIListLayout = v2.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        });
        for v30, v31 in pairs(l_dropDownList_0) do
            v23[v31] = v2.createElement("TextButton", {
                Size = l_buttonSize_0, 
                Text = v31, 
                TextColor3 = v3.Color.Text, 
                TextSize = l_UtilBar_1, 
                Font = l_UtilBar_0, 
                AutoButtonColor = false, 
                BackgroundColor3 = v30 == l_selectedIndex_0 and v3.Color.SelectedGray or v3.Color.UnselectedGray, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                LayoutOrder = v30, 
                [v2.Event.Activated] = function()
                    l_onSelection_0(v30);
                    v15:setState({
                        showDropDown = false
                    });
                end
            });
            v26 = v26 + l_AbsoluteSize_0.Y;
        end;
        v25 = UDim2.new(0, v27 + 24, 0, v26 + 24);
        v24 = UDim2.new(0, l_AbsolutePosition_0.X, 0, l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y);
    end;
    return v2.createElement("TextButton", {
        Size = l_buttonSize_0, 
        Text = l_dropDownList_0[l_selectedIndex_0], 
        TextColor3 = v3.Color.Text, 
        TextSize = l_UtilBar_1, 
        Font = l_UtilBar_0, 
        AutoButtonColor = false, 
        BackgroundColor3 = v3.Color.UnselectedGray, 
        BackgroundTransparency = 0, 
        LayoutOrder = l_layoutOrder_0, 
        [v2.Event.Activated] = v15.onMainButtonPressed, 
        [v2.Ref] = v15.ref
    }, {
        arrow = v2.createElement("ImageLabel", {
            Image = l_DownArrow_0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_DropDownArrowHeight_0, 0, l_DropDownArrowHeight_0), 
            Position = UDim2.new(1, -l_DropDownArrowHeight_0 - v7, 0.5, -v7)
        }), 
        DropDown = v22 and v2.createElement(v2.Portal, {
            target = l_dropDownTargetParent_0 ~= nil and l_dropDownTargetParent_0 or game:GetService("CoreGui").DevConsoleMaster
        }, {
            InputCatcher = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                [v2.Event.InputEnded] = v15.nonDropDownSelection
            }, {
                OuterFrame = v2.createElement("ImageButton", {
                    Size = v25, 
                    AutoButtonColor = false, 
                    Position = v24, 
                    BackgroundColor3 = v3.Color.TextBoxGray, 
                    BackgroundTransparency = 0
                }, {
                    innerFrame = v2.createElement("Frame", {
                        Position = UDim2.new(0, 12, 0, 12), 
                        Size = UDim2.new(0, v27, 0, v26), 
                        BackgroundTransparency = 1
                    }, v23)
                })
            })
        })
    });
end;
return v9;
