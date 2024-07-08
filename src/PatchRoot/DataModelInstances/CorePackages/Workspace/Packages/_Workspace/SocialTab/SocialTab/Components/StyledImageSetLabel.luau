local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_validateColorInfo_0 = l_UIBlox_0.Style.Validator.validateColorInfo;
local l_validateImage_0 = l_UIBlox_0.Core.ImageSet.Validator.validateImage;
local l_llama_0 = v0.llama;
local v8 = l_Roact_0.PureComponent:extend("StyledImageSetLabel");
v8.defaultProps = {
    BackgroundStyle = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 1
    }, 
    ImageStyle = {
        Color = Color3.fromRGB(255, 255, 255), 
        Transparency = 0
    }, 
    BorderSizePixel = 0, 
    Size = UDim2.new(1, 0, 1, 0), 
    Image = ""
};
v8.validateProps = l_t_0.interface({
    BackgroundStyle = l_t_0.optional(l_validateColorInfo_0), 
    ImageStyle = l_t_0.optional(l_validateColorInfo_0), 
    Image = l_t_0.optional(l_t_0.union(l_t_0.string, l_validateImage_0))
});
v8.render = function(v9)
    return l_Roact_0.createElement(l_ImageSetLabel_0, l_llama_0.Dictionary.join({
        BackgroundColor3 = v9.props.BackgroundStyle.Color, 
        BackgroundTransparency = v9.props.BackgroundStyle.Transparency, 
        ImageColor3 = v9.props.ImageStyle.Color, 
        ImageTransparency = v9.props.ImageStyle.Transparency
    }, v9.props, {
        BackgroundStyle = l_llama_0.None, 
        ImageStyle = l_llama_0.None, 
        [l_Roact_0.Children] = l_llama_0.None
    }), v9.props[l_Roact_0.Children]);
end;
return v8;
