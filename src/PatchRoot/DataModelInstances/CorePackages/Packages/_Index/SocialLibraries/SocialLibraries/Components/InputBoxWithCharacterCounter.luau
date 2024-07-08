local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Cryo_0 = v1.Cryo;
local l_Roact_0 = v1.Roact;
local l_Text_0 = v1.Text;
local v5 = require(l_script_FirstAncestor_0.Components.Style.TestStyle);
local v6 = require(script.Parent.CallbackInputBox);
local v7 = l_Roact_0.PureComponent:extend("InputBoxWithCharacterCounter");
v7.defaultProps = {
    initialInputText = "", 
    validInputTextColor3 = Color3.fromRGB(0, 255, 0), 
    validInputTextTransparency = 0, 
    invalidInputTextColor3 = Color3.fromRGB(255, 0, 0), 
    invalidInputTextTransparency = 0, 
    counterTextPadding = 0, 
    characterLimit = 150, 
    style = v5
};
v7.init = function(v8)
    v8.state = {
        inputText = v8.props.initialInputText
    };
    v8.textChangedCallback = function(v9)
        v8:setState({
            inputText = v9
        });
    end;
end;
v7.render = function(v10)
    local l_style_0 = v10.props.style;
    local v12 = #v10.state.inputText;
    local v13 = v12 .. "/" .. v10.props.characterLimit;
    local l_Font_0 = l_style_0.Font.CaptionSubHeader.Font;
    local v15 = l_style_0.Font.BaseSize * l_style_0.Font.CaptionSubHeader.RelativeSize;
    local v16 = nil;
    local v17 = nil;
    local v18 = l_Text_0.GetTextHeight(v13, l_Font_0, v15, (l_Text_0.GetTextWidth(v13, l_Font_0, v15)));
    if v12 <= v10.props.characterLimit then
        v16 = v10.props.validInputTextColor3;
        v17 = v10.props.validInputTextTransparency;
    else
        v16 = v10.props.invalidInputTextColor3;
        v17 = v10.props.invalidInputTextTransparency;
    end;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        layout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        inputBoxContainer = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, -v18), 
            LayoutOrder = 1
        }, {
            border = l_Roact_0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(3, 3, 4, 4), 
                Image = "rbxasset://textures/ui/LuaChat/9-slice/input-default.png"
            }), 
            inputBox = l_Roact_0.createElement(v6, (l_Cryo_0.Dictionary.join(v10.props, {
                inputText = v10.state.inputText, 
                textChangedCallback = v10.textChangedCallback
            })))
        }), 
        characterCounter = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v18), 
            LayoutOrder = 2
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }), 
            padding = l_Roact_0.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v10.props.counterTextPadding)
            }), 
            characterCountLabel = l_Roact_0.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v13, 
                TextColor3 = v16, 
                TextTransparency = v17, 
                TextSize = v15, 
                TextXAlignment = Enum.TextXAlignment.Right, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Font = l_Font_0
            })
        })
    });
end;
return v7;
