local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.React);
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local v4 = require(script.Parent.DetailList);
local l_White_0 = l_Colors_0.White;
local l_Flint_0 = l_Colors_0.Flint;
local l_ArialBold_0 = Enum.Font.ArialBold;
return function(v8)
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
            header = v1.createElement("TextLabel", {
                Text = "Reactions", 
                TextSize = 20, 
                TextColor3 = l_White_0, 
                Font = l_ArialBold_0, 
                Size = UDim2.new(1, 0, 0, 40), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
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
            detailList = v1.createElement(v4, {
                emoji = v2.useState("All"), 
                reactionData = v8.reactionData, 
                LayoutOrder = 4
            })
        })
    };
end;
