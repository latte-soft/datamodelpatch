local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_Images_0 = v2.App.ImageSet.Images;
return function(v6)
    local l_AbsoluteSize_0 = l_RobloxGui_0.AbsoluteSize;
    local v8 = (l_AbsoluteSize_0.X < l_AbsoluteSize_0.Y and l_AbsoluteSize_0.X or l_AbsoluteSize_0.Y) / 5;
    local v9, v10 = v3.useState(false);
    local function v13(v11, v12)
        table.insert(v6.annotationPoints, (Vector2.new(v12.X, v12.Y) - v11.AbsolutePosition) / v11.AbsoluteSize);
        v6.setAnnotationCircleRadius((v8 * 0.5) / if v11.AbsoluteSize.Y < v11.AbsoluteSize.X then v11.AbsoluteSize.X else v11.AbsoluteSize.Y);
        v6.setAnnotationAreaDimensions(v11.AbsoluteSize.X, v11.AbsoluteSize.Y);
        v6.handleAnnotationPoints(v6.annotationPoints);
    end;
    local function v19(v14, v15)
        local v16 = v15.UserInputState == Enum.UserInputState.Begin;
        local v17 = v15.UserInputType == Enum.UserInputType.Touch;
        local v18 = v15.UserInputType == Enum.UserInputType.MouseButton1;
        if not (not v16 or not v17 and not v18) and #v6.annotationPoints < 25 then
            v10(true);
            v13(v14, v15.Position);
        end;
    end;
    local function v22(_, _)
    end;
    local function v25(_, _)
        if v9 then
            v10(false);
        end;
    end;
    local v26 = {};
    for v27, v28 in ipairs(v6.annotationPoints) do
        v26["point" .. v27] = v3.createElement("Frame", {
            Position = UDim2.fromScale(v28.X, v28.Y), 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v8, v8)
        }, {
            Border = v3.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromOffset(v8, v8), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_Images_0["component_assets/circle_49_stroke_1"], 
                ImageColor3 = Color3.fromHex("#3CF3E9"), 
                ImageTransparency = 0, 
                BackgroundTransparency = 1
            }), 
            Background = v3.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromOffset(v8, v8), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_Images_0["component_assets/circle_49"], 
                ImageColor3 = Color3.fromHex("#3CF3E9"), 
                ImageTransparency = 0.6, 
                BackgroundTransparency = 1
            })
        });
    end;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        [v3.Event.InputBegan] = v19, 
        [v3.Event.InputChanged] = v22, 
        [v3.Event.InputEnded] = v25, 
        ZIndex = 3
    }, v26);
end;
