local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local l_Images_0 = v4.App.ImageSet.Images;
return function(v7)
    local l_AbsoluteSize_0 = l_RobloxGui_0.AbsoluteSize;
    local v9 = (l_AbsoluteSize_0.X < l_AbsoluteSize_0.Y and l_AbsoluteSize_0.X or l_AbsoluteSize_0.Y) / 5;
    local v10, v11 = v3.useState(false);
    local function v14(v12, v13)
        v7.handleNewAnnotationPoint((Vector2.new(v13.X, v13.Y) - v12.AbsolutePosition) / v12.AbsoluteSize, (v9 * 0.5) / if v12.AbsoluteSize.Y < v12.AbsoluteSize.X then v12.AbsoluteSize.X else v12.AbsoluteSize.Y);
    end;
    local function v20(v15, v16)
        local v17 = v16.UserInputState == Enum.UserInputState.Begin;
        local v18 = v16.UserInputType == Enum.UserInputType.Touch;
        local v19 = v16.UserInputType == Enum.UserInputType.MouseButton1;
        if not (not v17 or not v18 and not v19) then
            if #v7.annotationPoints < 5 then
                v11(true);
                v14(v15, v16.Position);
                return ;
            else
                v7.onExceedMaxAnnotationLimit();
            end;
        end;
    end;
    local function v23(_, _)
    end;
    local function v26(_, _)
        if v10 then
            v11(false);
        end;
    end;
    local v27 = {};
    for v28, v29 in ipairs(v7.annotationPoints) do
        v27["point" .. v28] = v3.createElement("Frame", {
            Position = UDim2.fromScale(v29.X, v29.Y), 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v9, v9)
        }, {
            Border = v3.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromOffset(v9, v9), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_Images_0["component_assets/circle_49_stroke_1"], 
                ImageColor3 = Color3.fromHex("#3CF3E9"), 
                ImageTransparency = 0, 
                BackgroundTransparency = 1
            }), 
            Background = v3.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromOffset(v9, v9), 
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
        [v3.Event.InputBegan] = v20, 
        [v3.Event.InputChanged] = v23, 
        [v3.Event.InputEnded] = v26, 
        ZIndex = 3
    }, v27);
end;
