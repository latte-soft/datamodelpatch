local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local l_Parent_0 = script.Parent.Parent;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v7 = require(l_Parent_0.Components.AssetImage);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v9 = require(l_Parent_0.Components.getGameIconRequestSize);
local v10 = l_Roact_0.PureComponent:extend("GameIcon");
v10.validateProps = l_t_0.strictInterface({
    gameId = l_t_0.number, 
    iconSize = l_t_0.numberMin(0), 
    layoutOrder = l_t_0.optional(l_t_0.number), 
    cornerRadius = l_t_0.optional(l_t_0.UDim), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2)
});
v10.render = function(v11)
    local l_iconSize_0 = v11.props.iconSize;
    local v13 = v9(l_iconSize_0);
    local l_gameId_0 = v11.props.gameId;
    local l_cornerRadius_0 = v11.props.cornerRadius;
    local v16 = ("rbxthumb://type=GameIcon&id=%d&w=%d&h=%d"):format(l_gameId_0, v13, v13);
    if not (l_gameId_0 == 0) then
        return l_Roact_0.createElement("ImageLabel", {
            Image = v16, 
            Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v11.props.layoutOrder, 
            Position = v11.props.Position, 
            AnchorPoint = v11.props.AnchorPoint
        }, {
            UICorner = (not not l_cornerRadius_0 and l_cornerRadius_0 ~= UDim.new(0, 0)) and l_Roact_0.createElement("UICorner", {
                CornerRadius = l_cornerRadius_0
            }) or nil
        });
    else
        local v17 = 44;
        if l_iconSize_0 <= 44 then
            v17 = l_iconSize_0;
        end;
        return l_withStyle_0(function(v18)
            return l_Roact_0.createElement(v7.Label, {
                imageKey = "RoundedRect", 
                Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
                ImageColor3 = v18.Theme.PlaceHolder.Color, 
                ImageTransparency = v18.Theme.PlaceHolder.Transparency, 
                LayoutOrder = v11.props.layoutOrder, 
                Position = v11.props.Position, 
                AnchorPoint = v11.props.AnchorPoint
            }, {
                PlaceholderIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(v17, v17), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Image = l_Images_0["icons/imageUnavailable"], 
                    ImageColor3 = v18.Theme.UIDefault.Color, 
                    ImageTransparency = v18.Theme.UIDefault.Transparency, 
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, {
                    UICorner = (not not l_cornerRadius_0 and l_cornerRadius_0 ~= UDim.new(0, 0)) and l_Roact_0.createElement("UICorner", {
                        CornerRadius = l_cornerRadius_0
                    }) or nil
                })
            });
        end);
    end;
end;
return v10;
