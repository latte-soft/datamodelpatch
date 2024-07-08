local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Roact);
local l_Components_0 = script.Parent.Parent.Components;
local v4 = require(l_Components_0.CheckBox);
local v5 = require(l_Components_0.CheckBoxDropDown);
local v6 = require(script.Parent.Parent.Constants);
local l_CheckBoxHeight_0 = v6.UtilityBarFormatting.CheckBoxHeight;
local v8 = v6.UtilityBarFormatting.CheckBoxInnerPadding * 2;
local l_FilterUnfilled_0 = v6.Image.FilterUnfilled;
local l_FilterFilled_0 = v6.Image.FilterFilled;
local v11 = v2.PureComponent:extend("CheckBoxContainer");
v11.init = function(v12)
    v12.onCheckBoxClicked = function(v13, v14)
        v12.props.onCheckBoxChanged(v13, v14);
    end;
    v12.onCheckBoxExpanded = function(_, v16)
        if not (v16.UserInputType ~= Enum.UserInputType.MouseButton1) or v16.UserInputType == Enum.UserInputType.Touch and v16.UserInputState == Enum.UserInputState.End then
            v12:setState({
                expanded = true
            });
        end;
    end;
    v12.onCloseCheckBox = function(_, v18)
        if not (v18.UserInputType ~= Enum.UserInputType.MouseButton1) or v18.UserInputType == Enum.UserInputType.Touch and v18.UserInputState == Enum.UserInputState.End then
            v12:setState({
                expanded = false
            });
        end;
    end;
    if not v12.props.orderedCheckBoxState then
        warn("CheckBoxContainer must be passed a list of Box Names or else it only creates an empty frame");
    end;
    local v19 = {};
    local v20 = 0;
    local v21 = 0;
    for v22, v23 in ipairs(v12.props.orderedCheckBoxState) do
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v23.name, v6.DefaultFontSize.UtilBar, v6.Font.UtilBar, Vector2.new(0, 0));
        v19[v22] = l_l_TextService_0_TextSize_0.X;
        v20 = ((v20 + l_l_TextService_0_TextSize_0.X) + l_CheckBoxHeight_0) + v8;
        v21 = v21 + 1;
    end;
    v12.ref = v2.createRef();
    v12.state = {
        expanded = false, 
        textWidths = v19, 
        numCheckBoxes = v21, 
        minFullLength = v20
    };
end;
v11.render = function(v25)
    local v26 = {};
    local l_frameWidth_0 = v25.props.frameWidth;
    local l_frameHeight_0 = v25.props.frameHeight;
    local l_pos_0 = v25.props.pos;
    local l_layoutOrder_0 = v25.props.layoutOrder;
    local l_orderedCheckBoxState_0 = v25.props.orderedCheckBoxState;
    local l_minFullLength_0 = v25.state.minFullLength;
    local l_expanded_0 = v25.state.expanded;
    local l_numCheckBoxes_0 = v25.state.numCheckBoxes;
    local v35 = false;
    for v36, v37 in ipairs(l_orderedCheckBoxState_0) do
        v26[v37.name] = v2.createElement(v4, {
            name = v37.name, 
            font = v6.Font.UtilBar, 
            fontSize = v6.DefaultFontSize.UtilBar, 
            checkBoxHeight = l_CheckBoxHeight_0, 
            frameHeight = l_frameHeight_0, 
            layoutOrder = v36, 
            isSelected = v37.state, 
            selectedColor = v6.Color.SelectedBlue, 
            unselectedColor = v6.Color.UnselectedGray, 
            onCheckBoxClicked = v25.onCheckBoxClicked
        });
        v35 = v35 or v37.state;
    end;
    if l_frameWidth_0 < l_minFullLength_0 then
        v26.CheckBoxLayout = v2.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirection = Enum.FillDirection.Vertical
        });
        local v38 = v25.ref.current and l_expanded_0;
        local v39 = nil;
        if v38 then
            local l_AbsolutePosition_0 = v25.ref.current.AbsolutePosition;
            v39 = UDim2.new(0, l_AbsolutePosition_0.X, 0, (l_AbsolutePosition_0.Y + l_frameHeight_0) + 3);
        end;
        return v2.createElement("ImageButton", {
            Size = UDim2.new(0, l_frameHeight_0, 0, l_frameHeight_0), 
            LayoutOrder = l_layoutOrder_0, 
            Image = not not v38 and l_FilterFilled_0 or l_FilterUnfilled_0, 
            BackgroundTransparency = 1, 
            BorderColor3 = v6.Color.Text, 
            [v2.Event.InputEnded] = v25.onCheckBoxExpanded, 
            [v2.Ref] = v25.ref
        }, {
            DropDown = v38 and v2.createElement(v5, {
                absolutePosition = v39, 
                frameWidth = l_frameWidth_0, 
                elementHeight = l_frameHeight_0, 
                numElements = l_numCheckBoxes_0, 
                onCloseCheckBox = v25.onCloseCheckBox
            }, v26)
        });
    else
        v26.CheckBoxLayout = v2.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirection = Enum.FillDirection.Horizontal
        });
        return v2.createElement("Frame", {
            Size = UDim2.new(0, l_frameWidth_0, 0, l_frameHeight_0), 
            Position = l_pos_0, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        }, v26);
    end;
end;
return v11;
