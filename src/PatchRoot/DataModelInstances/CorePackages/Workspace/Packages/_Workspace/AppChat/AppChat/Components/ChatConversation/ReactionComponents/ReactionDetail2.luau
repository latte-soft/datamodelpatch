local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local v5 = require(script.Parent.ReactionMap);
local v6 = require(script.Parent.ReactionList);
local v7 = require(script.Parent.DetailList);
local l_White_0 = l_Colors_0.White;
local l_Flint_0 = l_Colors_0.Flint;
local l_ArialBold_0 = Enum.Font.ArialBold;
local function v20(v11)
    local v12 = {};
    local v13 = 0;
    local v14 = 1;
    for _, v16 in v11.reactionData, nil, nil do
        v13 = v13 + #v16;
    end;
    for v17 in v6, nil, nil do
        if v11.reactionData[v6[v17]] ~= nil then
            v12[v14] = v6[v17];
            v14 = v14 + 1;
        end;
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 80), 
        BackgroundTransparency = 1, 
        LayoutOrder = v11.LayoutOrder
    }, {
        verticalLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }, {
        header = v1.createElement("TextLabel", {
            Text = "Reactions", 
            TextSize = 20, 
            TextColor3 = l_White_0, 
            Font = l_ArialBold_0, 
            Size = UDim2.fromScale(1, 0.5), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        scroller = v1.createElement("ScrollingFrame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0.5), 
            ScrollBarThickness = 5, 
            CanvasSize = UDim2.new(0, 54 * (#v12 + 1) + 10, 0, 0), 
            LayoutOrder = 2
        }, {
            horizontalLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        }, {
            padding = v1.createElement("Frame", {
                Size = UDim2.new(0, 5, 0, 5), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            allFilter = v1.createElement("TextButton", {
                Size = UDim2.new(0, 54, 0, 28), 
                BackgroundColor3 = l_Flint_0, 
                BorderSizePixel = 0, 
                Text = "All  " .. v13, 
                Font = l_ArialBold_0, 
                TextColor3 = l_White_0, 
                TextSize = 15, 
                TextWrapped = true, 
                LayoutOrder = 2, 
                [v2.Event.Activated] = function()
                    v11.setEmoji("All");
                end
            }, {
                corner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0.4, 0)
                })
            })
        }, (v2.useMemo(function()
            return v3.List.map(v12, function(v18, v19)
                return v1.createElement("TextButton", {
                    Size = UDim2.new(0, 54, 0, 28), 
                    BackgroundColor3 = l_Flint_0, 
                    BorderSizePixel = 0, 
                    Text = "", 
                    LayoutOrder = v19 + 2, 
                    [v2.Event.Activated] = function()
                        v11.setEmoji(v18);
                    end
                }, {
                    corner = v1.createElement("UICorner", {
                        CornerRadius = UDim.new(0.4, 0)
                    }), 
                    emoji = v1.createElement("ImageLabel", {
                        Size = UDim2.new(0, 18, 0, 18), 
                        Position = UDim2.new(0.16, 0, 0.5, -9), 
                        BackgroundTransparency = 1, 
                        Image = v5[v18]
                    }), 
                    count = v1.createElement("TextLabel", {
                        Size = UDim2.new(0.5, 0, 1, 0), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        Name = v18 .. "Filter", 
                        Text = #v11.reactionData[v18], 
                        Font = l_ArialBold_0, 
                        TextColor3 = l_White_0, 
                        TextSize = 15, 
                        TextWrapped = true
                    })
                });
            end);
        end, {
            v12
        })))
    });
end;
return function(v21)
    local v22, v23 = v2.useState("All");
    return {
        ReactionDetail = v1.createElement("Frame", {
            Size = UDim2.new(0, 300, 0, 375), 
            BackgroundColor3 = l_Flint_0
        }, {
            corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.05, 0)
            }), 
            layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        }, {
            navigator = v1.createElement(v20, {
                setEmoji = v23, 
                reactionData = v21.reactionData, 
                LayoutOrder = 1
            }), 
            bar = v1.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                v1.createElement("Frame", {
                    Size = UDim2.new(0.97, 0, 0, 0), 
                    BackgroundColor3 = l_Colors_0.White, 
                    BorderColor3 = l_Colors_0.White, 
                    Position = UDim2.new(0.015, 0, 0, 0)
                })
            }), 
            padding = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 10), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 3
            }), 
            detailList = v1.createElement(v7, {
                emoji = v22, 
                reactionData = v21.reactionData, 
                LayoutOrder = 4
            })
        })
    };
end;
