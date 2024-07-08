local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
return function()
    return l_UIBlox_0.Style.withStyle(function(v3)
        return l_Roact_0.createElement("ImageButton", {
            AutoButtonColor = false, 
            BackgroundColor3 = v3.Theme.TextEmphasis.Color, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            visibleFrame = l_Roact_0.createElement("Frame", {
                BackgroundTransparency = v3.Theme.BackgroundUIContrast.Transparency, 
                BackgroundColor3 = v3.Theme.BackgroundUIContrast.Color, 
                Size = UDim2.fromOffset(120, 120), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                ZIndex = 10
            }, {
                corner = l_Roact_0.createElement("UICorner"), 
                spinner = l_Roact_0.createElement(l_UIBlox_0.App.Loading.LoadingSpinner, {
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    position = UDim2.fromScale(0.5, 0.5), 
                    size = UDim2.fromOffset(48, 48)
                })
            })
        });
    end);
end;
