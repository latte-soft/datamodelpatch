local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.t);
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(script.Parent.FriendCountLabel);
local v5 = v2.PureComponent:extend("SelectedMembersBar");
v5.defaultProps = {
    barBackgroundColor3 = Color3.fromRGB(245, 245, 245), 
    barBackgroundTransparency = 1, 
    maxSize = 0, 
    selectedUsers = {}, 
    LayoutOrder = nil, 
    renderEntry = nil
};
local v6 = v1.interface({
    displayName = v1.string, 
    id = v1.string, 
    thumbnail = v1.string, 
    presenceImage = v1.optional(v1.union(v1.table, v1.string))
});
v5.populateBar = function(v7, v8)
    local v9 = {
        layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 16)
        })
    };
    for v10 = 1, v7.props.maxSize do
        local v11 = v7.props.selectedUsers[v10];
        if not v11 then
            table.insert(v9, (v2.createElement("ImageLabel", {
                Size = UDim2.new(0, 48, 0, 48), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaChatV2/ic-friend-empty-border.png", 
                ImageColor3 = v8.Theme.UIEmphasis.Color, 
                ImageTransparency = v8.Theme.UIEmphasis.Transparency, 
                LayoutOrder = v10
            })));
        else
            assert(v6(v11));
            table.insert(v9, (v2.createElement("Frame", {
                Size = UDim2.new(0, 48, 0, 48), 
                BackgroundTransparency = 1, 
                LayoutOrder = v10
            }, {
                avatarContainer = v7.props.renderEntry(v11), 
                removeImageContainer = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    layout = v2.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    removeImage = v2.createElement("ImageLabel", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(0, 16, 0, 16), 
                        Image = "rbxasset://textures/ui/LuaChat/icons/ic-remove.png"
                    })
                })
            })));
        end;
    end;
    return v9;
end;
v5.render = function(v12)
    return v3.Style.withStyle(function(v13)
        return v2.createElement("Frame", {
            BackgroundColor3 = v12.props.barBackgroundColor3, 
            BackgroundTransparency = v12.props.barBackgroundTransparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 88), 
            LayoutOrder = v12.props.LayoutOrder
        }, {
            layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            barContainer = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10)
                }), 
                friendCountLabel = v2.createElement(v4, {
                    currentSize = #v12.props.selectedUsers, 
                    maxSize = v12.props.maxSize, 
                    LayoutOrder = 1
                }), 
                userScrollingBar = v2.createElement("ScrollingFrame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -60, 0, 88), 
                    ScrollBarThickness = 0, 
                    ScrollingDirection = Enum.ScrollingDirection.X, 
                    ElasticBehavior = Enum.ElasticBehavior.WhenScrollable, 
                    CanvasSize = UDim2.new(0, (18 + 64 * v12.props.maxSize) - 16, 1, 0), 
                    LayoutOrder = 2
                }, v12:populateBar(v13))
            })
        });
    end);
end;
return v5;
