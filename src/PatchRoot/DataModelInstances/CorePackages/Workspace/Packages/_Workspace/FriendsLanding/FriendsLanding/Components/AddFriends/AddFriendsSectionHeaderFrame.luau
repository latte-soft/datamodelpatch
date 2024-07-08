local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_IconSize_0 = l_UIBlox_0.App.ImageSet.Enum.IconSize;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_validateImage_0 = l_UIBlox_0.Core.ImageSet.Validator.validateImage;
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagAddFriendsComponentsTransparent);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAddFriendsPageUseToken);
local v11 = l_Roact_0.PureComponent:extend("AddFriendsSectionHeaderFrame");
v11.validateProps = l_t_0.strictInterface({
    title = l_t_0.string, 
    icon = l_validateImage_0, 
    iconVisible = l_t_0.boolean, 
    onIconActivated = l_t_0.optional(l_t_0.callback), 
    layoutOrder = l_t_0.optional(l_t_0.integer)
});
v11.defaultProps = {
    layoutOrder = 1
};
v11.render = function(v12)
    return l_withStyle_0(function(v13)
        return l_Roact_0.createElement("Frame", {
            ZIndex = 2, 
            Position = UDim2.new(0, 24, 0, 0), 
            Size = UDim2.new(1, 0, 0, v13.Tokens.Global.Space_600), 
            LayoutOrder = v12.props.layoutOrder, 
            BackgroundColor3 = if v9 then nil else v13.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = if not v9 then nil else 1, 
            BorderSizePixel = 0
        }, {
            HeaderLabel = l_Roact_0.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = v13.Font.Header1.Font, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(0.8, 0, 1, 0), 
                Text = v12.props.title, 
                TextColor3 = if not v10 then v13.Theme.TextEmphasis.Color else v13.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                TextSize = if not v10 then v13.Font.BaseSize * v13.Font.Header1.RelativeSize else v13.Tokens.Semantic.Typography.Header.FontSize, 
                TextTransparency = if not v10 then v13.Theme.TextEmphasis.Transparency else v13.Tokens.Semantic.Color.Text.Emphasis.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            HeaderImageButton = not not v12.props.iconVisible and l_Roact_0.createElement(l_IconButton_0, {
                size = UDim2.fromOffset(l_IconSize_0.Medium, l_IconSize_0.Medium), 
                position = UDim2.new(1, 0, 0, 6), 
                anchorPoint = Vector2.new(1, 0), 
                icon = v12.props.icon, 
                iconTransparency = if not v10 then v13.Theme.IconEmphasis.Transparency else v13.Tokens.Semantic.Color.Icon.Emphasis.Transparency, 
                iconColor3 = if not v10 then v13.Theme.IconEmphasis.Color else v13.Tokens.Semantic.Color.Icon.Emphasis.Color3, 
                onActivated = v12.props.onIconActivated
            }) or nil
        });
    end);
end;
return v11;
