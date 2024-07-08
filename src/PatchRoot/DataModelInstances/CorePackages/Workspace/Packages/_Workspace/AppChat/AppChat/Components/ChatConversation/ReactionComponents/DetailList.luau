local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local v5 = require(script.Parent.ReactionMap);
local v6 = require(script.Parent.ReactionList);
local l_White_0 = l_Colors_0.White;
local l_ArialBold_0 = Enum.Font.ArialBold;
return function(v9)
    local v10 = {};
    local v11 = {};
    if v9.emoji == "All" then
        local v12 = 1;
        for v13 in v6, nil, nil do
            if v9.reactionData[v6[v13]] ~= nil then
                for v14 in v9.reactionData[v6[v13]], nil, nil do
                    v11[v12] = {
                        v9.reactionData[v6[v13]][v14], 
                        v6[v13]
                    };
                    v12 = v12 + 1;
                end;
            end;
        end;
    else
        local v15 = 1;
        for v16 in v9.reactionData[v9.emoji], nil, nil do
            v11[v15] = {
                v9.reactionData[v9.emoji][v16], 
                v9.emoji
            };
            v15 = v15 + 1;
        end;
    end;
    v10 = v2.useMemo(function()
        return v3.List.map(v11, function(v17, _)
            return v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 36), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 25), 
                    PaddingRight = UDim.new(0, 25)
                }), 
                profilePic = v1.createElement("ImageLabel", {
                    Size = UDim2.new(0, 36, 0, 36), 
                    BorderSizePixel = 0, 
                    Image = "rbxthumb://type=AvatarHeadShot&id=505306092&w=150&h=150&filters=circular", 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Fit
                }), 
                userInfo = v1.createElement("TextLabel", {
                    Size = UDim2.new(0.5, 0, 0, 36), 
                    BorderSizePixel = 0, 
                    TextColor3 = l_White_0, 
                    TextSize = 15, 
                    Text = v17[1], 
                    Font = l_ArialBold_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 56, 0, 0)
                }), 
                emoji = v1.createElement("ImageLabel", {
                    Size = UDim2.new(0, 25, 0, 25), 
                    BorderSizePixel = 0, 
                    Image = v5[v17[2]], 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Position = UDim2.new(1, -25, 0.5, -12.5)
                })
            });
        end);
    end, {
        v9.reactionData, 
        v9.emoji
    });
    return v1.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 0, 285), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ScrollBarThickness = 0, 
        CanvasSize = UDim2.new(0, 0, 0, (53 * #v10 - 17) + 5), 
        LayoutOrder = v9.LayoutOrder
    }, {
        layout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, 17)
        })
    }, v10);
end;
