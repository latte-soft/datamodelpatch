local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_UIBlox_0 = v0.UIBlox;
local l_llama_0 = v0.llama;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_validateColorInfo_0 = l_UIBlox_0.Style.Validator.validateColorInfo;
local l_validateFontInfo_0 = l_UIBlox_0.Style.Validator.validateFontInfo;
local v8 = l_Roact_0.PureComponent:extend("StyledTextLabel");
v8.defaultProps = {
    BackgroundStyle = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 1
    }, 
    FontStyle = {
        Font = Enum.Font.Gotham, 
        RelativeSize = 1, 
        RelativeMinSize = 1
    }, 
    TextStyle = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 1
    }, 
    BorderSizePixel = 0, 
    Size = UDim2.new(1, 0, 1, 0), 
    Text = "Text"
};
v8.validateProps = l_t_0.interface({
    BackgroundStyle = l_t_0.optional(l_validateColorInfo_0), 
    FontStyle = l_t_0.optional(l_validateFontInfo_0), 
    TextStyle = l_t_0.optional(l_validateColorInfo_0), 
    Text = l_t_0.optional(l_t_0.string)
});
v8.render = function(v9)
    return l_withStyle_0(function(v10)
        return l_Roact_0.createElement("TextLabel", l_llama_0.Dictionary.join({
            BackgroundColor3 = v9.props.BackgroundStyle.Color, 
            BackgroundTransparency = v9.props.BackgroundStyle.Transparency, 
            Font = v9.props.FontStyle.Font, 
            TextSize = v9.props.FontStyle.RelativeSize * v10.Font.BaseSize, 
            TextColor3 = v9.props.TextStyle.Color, 
            TextTransparency = v9.props.TextStyle.Transparency
        }, v9.props, {
            BackgroundStyle = l_llama_0.None, 
            FontStyle = l_llama_0.None, 
            TextStyle = l_llama_0.None
        }));
    end);
end;
return v8;
