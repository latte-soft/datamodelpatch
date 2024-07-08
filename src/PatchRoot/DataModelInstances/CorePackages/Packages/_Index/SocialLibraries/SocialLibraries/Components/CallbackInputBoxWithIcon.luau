local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Config_0 = v1.UIBlox.Config;
local v4 = require(script.Parent.CallbackInputBox);
local v5 = l_Roact_0.PureComponent:extend("CallbackInputBoxWithIcon");
local v6 = require(l_script_FirstAncestor_0.Flags.GetFFlagFilteredScrollingListAdditionalCustomizationsEnabled);
v5.defaultProps = {
    backgroundTransparency = 0, 
    backgroundColor3 = Color3.new(1, 1, 1), 
    borderColor = nil, 
    borderThickness = if not v6() then nil else 0, 
    borderTransparency = if not v6() then nil else 1, 
    cornerRadius = if not v6() then nil else 0, 
    iconCellWidth = 60, 
    iconSize = 24, 
    iconColor3 = Color3.new(1, 1, 1), 
    iconTransparency = 0, 
    iconImage = "rbxasset://textures/ui/LuaChat/icons/ic-search.png", 
    inputTextFont = if not l_Config_0.enableFontNameMapping then Enum.Font.Gotham else Enum.Font.BuilderSans, 
    inputTextColor3 = Color3.new(1, 0, 1), 
    inputTextSize = 14, 
    inputTextYAlignment = Enum.TextYAlignment.Center, 
    inputTextXAlignment = Enum.TextXAlignment.Left, 
    inputTextTransparency = 0, 
    placeholderTextTransparency = 0.6, 
    placeholderTextColor3 = Color3.new(1, 0, 0), 
    placeholderText = "Test placeholder text", 
    clearIconColor3 = Color3.new(1, 1, 0), 
    clearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png", 
    clearButtonDisabled = nil, 
    textChangedCallback = nil
};
v5.render = function(v7)
    local l_iconCellWidth_0 = v7.props.iconCellWidth;
    local l_iconSize_0 = v7.props.iconSize;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = v7.props.backgroundTransparency, 
        BackgroundColor3 = v7.props.backgroundColor3, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIStroke = if not v6() then nil else l_Roact_0.createElement("UIStroke", {
            Thickness = v7.props.borderThickness, 
            Color = v7.props.borderColor, 
            Transparency = v7.props.borderTransparency
        }), 
        UICorner = if not v6() then nil else l_Roact_0.createElement("UICorner", {
            CornerRadius = UDim.new(0, v7.props.cornerRadius)
        }), 
        layout = l_Roact_0.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_iconCellWidth_0 / 4)
        }), 
        padding = l_Roact_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_iconCellWidth_0 / 4)
        }), 
        icon = l_Roact_0.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_iconSize_0, 0, l_iconSize_0), 
            ImageColor3 = v7.props.iconColor3, 
            ImageTransparency = v7.props.iconTransparency, 
            Image = v7.props.iconImage, 
            LayoutOrder = 1
        }), 
        inputBoxContainer = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -l_iconSize_0 - l_iconCellWidth_0 / 4, 1, 0), 
            LayoutOrder = 2
        }, {
            padding = l_Roact_0.createElement("UIPadding", {
                PaddingRight = UDim.new(0, l_iconCellWidth_0 / 4)
            }), 
            inputBox = l_Roact_0.createElement(v4, v7.props)
        })
    });
end;
return v5;
