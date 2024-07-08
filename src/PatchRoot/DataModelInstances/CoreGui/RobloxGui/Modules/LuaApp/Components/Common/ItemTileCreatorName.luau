local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = require(l_Modules_0.Common.Text);
local v6 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v7 = v2.PureComponent:extend("ItemTileCreatorName");
v7.defaultProps = {
    textYAlignment = Enum.TextYAlignment.Top
};
v7.render = function(v8)
    local l_name_0 = v8.props.name;
    local l_hasVerifiedBadge_0 = v8.props.hasVerifiedBadge;
    local l_textYAlignment_0 = v8.props.textYAlignment;
    return l_withStyle_0(function(v12)
        local l_Theme_0 = v12.Theme;
        local l_Font_0 = v12.Font;
        local v15 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
        return v4({
            creatorByLabel = "Feature.GameDetails.Label.By"
        })(function(v16)
            local l_creatorByLabel_0 = v16.creatorByLabel;
            local v18 = v5.GetTextWidth(l_creatorByLabel_0, l_Font_0.Body.Font, v15);
            local v19 = v2.createElement("TextLabel", {
                Size = if not l_hasVerifiedBadge_0 then UDim2.new(1, -v18, 1, 0) else UDim2.new(0, 0, 1, 0), 
                AutomaticSize = if not l_hasVerifiedBadge_0 then Enum.AutomaticSize.None else Enum.AutomaticSize.X, 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                TextSize = v15, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                Font = l_Font_0.Header2.Font, 
                Text = l_name_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = l_textYAlignment_0
            });
            return v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 6)
                }), 
                {
                    Label = v2.createElement("TextLabel", {
                        Size = UDim2.new(0, 0, 1, 0), 
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        TextSize = v15, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextTransparency = l_Theme_0.TextDefault.Transparency, 
                        Font = l_Font_0.Header2.Font, 
                        Text = l_creatorByLabel_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = l_textYAlignment_0, 
                        AutomaticSize = Enum.AutomaticSize.X
                    }), 
                    CreatorName = not l_hasVerifiedBadge_0 and v19, 
                    VerifiedCreatorName = l_hasVerifiedBadge_0 and v2.createElement(v6.EmojiWrapper, {
                        emoji = v6.emoji.verified, 
                        font = l_Font_0.Body.Font, 
                        size = UDim2.new(1, -v18, 1, 0), 
                        automaticSize = Enum.AutomaticSize.None, 
                        horizontalAlignment = Enum.HorizontalAlignment.Left, 
                        verticalAlignment = Enum.VerticalAlignment.Center, 
                        layoutOrder = 2
                    }, {
                        CreatorName = v19
                    })
                }
            });
        end);
    end);
end;
return v7;
