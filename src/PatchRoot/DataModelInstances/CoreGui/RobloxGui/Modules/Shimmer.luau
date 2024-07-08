local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = require(l_RobloxGui_0.Modules.Common.Create);
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_RobloxGui_0.Modules.Common.Constants);
local v4 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false, 0);
local v5 = {};
v5.__index = v5;
local v7 = {
    PrimaryButton = function(v6)
        return v1("ImageLabel")({
            Name = "ShimmerFrame", 
            BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
            BackgroundTransparency = 0.7, 
            ClipsDescendants = true, 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            Visible = false, 
            Parent = v6, 
            ZIndex = 8; 
            v1("ImageLabel")({
                Name = "Shimmer", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 2, 0), 
                Position = UDim2.new(-1, 0, 0, 0), 
                Image = v3.SHIMMER_TEXTURE, 
                BorderSizePixel = 0, 
                ZIndex = 8
            }), 
            v1("ImageLabel")({
                Name = "ShimmerOverlay", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9), 
                ImageColor3 = v3.COLORS.FLINT, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v3.OVERLAY_TEXTURE, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 9
            })
        });
    end
};
v5.new = function(v8, v9)
    if v9 and v7[v9] then
        local v10 = setmetatable({}, v5);
        v10._shimmer = v7[v9](v8);
        v10._shimmerAnimation = l_TweenService_0:Create(v10._shimmer.Shimmer, v4, {
            Position = UDim2.new(1, 0, 0, 0)
        });
        return v10;
    else
        return ;
    end;
end;
v5.play = function(v11)
    v11._shimmer.Visible = true;
    v11._shimmerAnimation:Play();
end;
v5.stop = function(v12)
    v12._shimmerAnimation:Cancel();
    v12._shimmer.Visible = false;
end;
return v5;
