local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactRoblox);
local v4 = {
    anchorPoint = Vector2.new(), 
    position = UDim2.new(), 
    color = Color3.fromHex("#fff"), 
    font = Enum.Font.Gotham, 
    size = UDim2.fromScale(1, 0), 
    automaticSize = Enum.AutomaticSize.XY
};
return function(v5)
    local v6 = v1.Dictionary.join(v4, v5);
    if v6.children then
        assert(v2.Children.count(v6.children) <= 1, "EmojiWrapper can only contain one child");
    end;
    if v6.emoji == "" then
        return v6.children;
    else
        local v7, v8 = v2.useState(0);
        local v9, v10 = v2.useState(-1);
        return v2.createElement("Frame", {
            LayoutOrder = v6.layoutOrder, 
            AnchorPoint = v6.anchorPoint, 
            Position = v6.position, 
            Size = v6.size, 
            AutomaticSize = v6.automaticSize, 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = v6.horizontalAlignment, 
                VerticalAlignment = v6.verticalAlignment, 
                Padding = UDim.new(0, -v7)
            }), 
            ChildrenWrapper = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                [v3.Change.AbsoluteSize] = v2.useCallback(function(v11)
                    local l_Y_0 = v11.AbsoluteSize.Y;
                    if l_Y_0 ~= v9 then
                        v10(v7);
                        v8(l_Y_0);
                    end;
                end, {
                    v7, 
                    v9
                })
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, v7)
                }), 
                Children = v2.createElement(v2.Fragment, nil, v6.children)
            }), 
            Emoji = v2.createElement("TextLabel", {
                LayoutOrder = 2, 
                Text = v6.emoji, 
                Font = v6.font, 
                TextColor3 = v6.color, 
                TextSize = v7, 
                BackgroundTransparency = 1, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                Size = UDim2.fromOffset(v7, v7)
            }, {
                Button = v5.onActivated and v2.createElement("ImageButton", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    [v3.Event.Activated] = v5.onActivated
                })
            })
        });
    end;
end;
