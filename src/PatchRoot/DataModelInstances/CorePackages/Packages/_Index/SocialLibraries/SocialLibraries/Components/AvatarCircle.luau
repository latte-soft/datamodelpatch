local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_ImageSetLabel_0 = v0.UIBlox.Core.ImageSet.ImageSetLabel;
local v3 = l_Roact_0.PureComponent:extend("AvatarCircle");
v3.PresetSize = {
    Size36x36 = "Size36x36", 
    Size48x48 = "Size48x48"
};
local v4 = {
    [v3.PresetSize.Size36x36] = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-36x36.png", 
    [v3.PresetSize.Size48x48] = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-48x48.png"
};
v3.defaultProps = {
    thumbnails = {}, 
    onActivated = nil, 
    circleColor3 = Color3.new(0.9, 0.9, 0.9), 
    circleTransparency = 0, 
    circleInteriorBackgroundColor3 = Color3.new(0.8, 0.8, 0.8), 
    circleInteriorBackgroundTransparency = 0, 
    circleDividerColor3 = Color3.new(0.7, 0.7, 0.7), 
    circleDividerTransparency = 0, 
    overlaySize = v3.PresetSize.Size48x48, 
    presenceImage = nil, 
    presenceIndicatorSize = 14
};
local function v6(v5)
    return {
        layout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = v5, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
end;
v3.generateThumbnails = function(v7, v8)
    local v9 = #v8;
    local v10 = v9 / 2;
    local v11 = not not (v9 % 2 == 0) and v10 or math.floor(v10);
    local v12 = v9 - v11;
    local v13 = nil;
    if v9 == 1 then
        v13 = if not v7.props.showNewPresenceImage then l_Roact_0.createElement("ImageLabel", {
            Size = UDim2.new(0, v7.props.presenceIndicatorSize, 0, v7.props.presenceIndicatorSize), 
            BackgroundTransparency = 1, 
            Image = v7.props.presenceImage
        }) else l_Roact_0.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, v7.props.presenceIndicatorSize, 0, v7.props.presenceIndicatorSize), 
            BackgroundTransparency = 1, 
            Image = v7.props.presenceImage, 
            ImageColor3 = v7.props.presenceImageColor3, 
            ImageTransparency = v7.props.presenceImageTransparency
        });
    end;
    local v14 = v6(Enum.HorizontalAlignment.Right);
    local v15 = v6(Enum.HorizontalAlignment.Left);
    local v16 = v6(Enum.HorizontalAlignment.Center);
    for v17, v18 in ipairs(v8) do
        local v19 = nil;
        local v20 = 0;
        local v21 = nil;
        local v22 = nil;
        if v9 == 1 then
            v19 = UDim2.new(1, 0, 1, 0);
            v21 = v16;
        elseif v17 <= v11 then
            v19 = UDim2.new(1 / v11, 0, 1 / v11, 0);
            v21 = v14;
            if v9 == 3 then
                v20 = 0.125;
            elseif v9 == 2 then
                v20 = 0.125;
            end;
            v22 = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }, {
                border = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 2), 
                    Position = UDim2.new(0, 0, 1, -1), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v7.props.circleDividerColor3, 
                    BackgroundTransparency = v7.props.circleDividerTransparency
                }), 
                borderVertical = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(0, 2, 1, 0), 
                    Position = UDim2.new(0, -1, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v7.props.circleDividerColor3, 
                    BackgroundTransparency = v7.props.circleDividerTransparency
                })
            });
        else
            v19 = UDim2.new(1 / v12, 0, 1 / v12, 0);
            v21 = v15;
            if v9 == 2 then
                v20 = -0.125;
            end;
            v22 = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }, {
                border = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 2), 
                    Position = UDim2.new(0, 0, 0, -1), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v7.props.circleDividerColor3, 
                    BackgroundTransparency = v7.props.circleDividerTransparency
                }), 
                borderVertical = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(0, 2, 1, 0), 
                    Position = UDim2.new(0, -1, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v7.props.circleDividerColor3, 
                    BackgroundTransparency = v7.props.circleDividerTransparency
                })
            });
        end;
        v21["thumbnail-" .. tostring(v17 + 1)] = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v19, 
            ClipsDescendants = true, 
            LayoutOrder = #v21 + 1
        }, {
            headshotContainer = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(v20, 0, 0, 0), 
                BackgroundTransparency = 1
            }, {
                headshot = l_Roact_0.createElement("ImageLabel", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = v18
                })
            }), 
            borderObject = v22
        });
    end;
    return {
        rightElements = v15, 
        leftElements = v14, 
        centerElements = v16, 
        presenceIndicator = v13
    };
end;
v3.render = function(v23)
    local l_thumbnails_0 = v23.props.thumbnails;
    local v25 = v4[v23.props.overlaySize];
    local v26 = v23:generateThumbnails(l_thumbnails_0);
    return l_Roact_0.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v23.props.circleInteriorBackgroundColor3, 
        BackgroundTransparency = v23.props.circleInteriorBackgroundTransparency, 
        BorderSizePixel = 0, 
        Image = "", 
        AutoButtonColor = false, 
        ClipsDescendants = true, 
        [l_Roact_0.Event.Activated] = v23.props.onActivated
    }, {
        imageMask = l_Roact_0.createElement("ImageLabel", {
            Image = v25, 
            ImageColor3 = v23.props.circleColor3, 
            ImageTransparency = v23.props.circleTransparency, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            presenceFrame = l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom
                }), 
                presenceIndicator = v26.presenceIndicator
            })
        }), 
        center = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            elementContainer = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, v26.centerElements)
        }), 
        left = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, -1, 1, 0), 
            Position = UDim2.new(-0.5, 0, 0, 0), 
            BackgroundTransparency = 1
        }, {
            elementContainer = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, v26.leftElements)
        }), 
        right = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, -1, 1, 0), 
            Position = UDim2.new(0.5, -2, 0, 0), 
            BackgroundTransparency = 1
        }, {
            elementContainer = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, v26.rightElements)
        })
    });
end;
return v3;
