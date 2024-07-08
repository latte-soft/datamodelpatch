local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Misc.createSignal);
local v2 = require(l_Parent_0.strict);
local function _(v3, v4)
    return {
        Path = "rbxasset://textures/" .. v3, 
        SliceCenter = v4
    };
end;
local v6 = {
    __tostring = function()
        return "Service(LayoutValues)";
    end
};
v6.new = function(v7)
    local v8 = {};
    setmetatable(v8, {
        __index = v6
    });
    v8.signal = v1();
    v8.layout = v8:generate(v7);
    return v8;
end;
v6.update = function(v9, v10)
    v9.layout = v9:generate(v10);
    v9.signal:fire(v9.layout);
end;
v6.generate = function(_, v12)
    local v13 = not v12 and 1 or 3;
    local v14 = 44 * v13;
    local v15 = 30 * v13;
    local v16 = 6 * v13;
    local v17 = 16 * v13;
    local v18 = 18 * v13;
    local v19 = 210 * v13;
    local v20 = 106 * v13;
    local v21 = 96 * v13;
    local v22 = 20 * v13;
    local v23 = 25 * v13;
    local v24 = 2 * v13;
    local v25 = 64 * v13;
    local v26 = 64 * v13;
    local v27 = 3 * v13;
    local v28 = 2 * v13;
    local v29 = v25 + 2 * v24;
    local v30 = v26 + 2 * v24;
    local v31 = v29 + 2 * v23;
    local v32 = v30 + 2 * v23;
    return (v2({
        Size = v2({
            AdditionalDetailsLabel = UDim2.new(1, 0, 0, v15), 
            ItemPreview = UDim2.new(0, v25, 0, v26), 
            ItemPreviewWhiteFrame = UDim2.new(0, v29, 0, v30), 
            ItemPreviewContainerFrame = UDim2.new(0, v31, 0, v32), 
            HorizontalPadding = v23, 
            ProductDescription = UDim2.new(0, v19, 0, v20), 
            ProductDescriptionPaddingTop = v18, 
            RobuxIconContainerFrame = UDim2.new(0, v17 + v16, 0, v17 + 2 * v16), 
            RobuxIcon = UDim2.new(0, v17, 0, v17), 
            PriceTextLabel = UDim2.new(0, v19 - (v17 + v16), 0, v17), 
            PurchasingAnimation = UDim2.new(0, v21, 0, v22), 
            ButtonIconPadding = v27, 
            ButtonIconYOffset = v28, 
            ButtonHeight = v14, 
            Dialog = UDim2.new(0, v31 + v19, 0, (math.max(v32, v20) + v15) + v14)
        }, "LayoutValues.Size"), 
        TextSize = v2({
            Default = 18 * v13, 
            ProductDescription = 18 * v13, 
            Button = 24 * v13, 
            AdditionalDetails = 14 * v13, 
            Purchasing = 36 * v13
        }, "LayoutValues.TextSize"), 
        TextColor = v2({
            PriceLabel = Color3.new(1, 1, 1)
        }, "LayoutValues.TextColor"), 
        Image = v2({
            PromptBackground = not not v12 and {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/PurchasePromptBG@2x.png", 
                SliceCenter = Rect.new(17, 17, 19, 19)
            } or {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/PurchasePromptBG.png", 
                SliceCenter = Rect.new(8, 9, 10, 10)
            }, 
            InProgressBackground = not not v12 and {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/LoadingBG@2x.png", 
                SliceCenter = Rect.new(17, 17, 19, 19)
            } or {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/LoadingBG.png", 
                SliceCenter = Rect.new(9, 9, 11, 11)
            }, 
            ButtonUpLeft = not not v12 and {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/LeftButton@2x.png", 
                SliceCenter = Rect.new(18, 5, 20, 7)
            } or {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/LeftButton.png", 
                SliceCenter = Rect.new(8, 3, 10, 4)
            }, 
            ButtonDownLeft = not not v12 and {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/LeftButtonDown@2x.png", 
                SliceCenter = Rect.new(18, 5, 20, 7)
            } or {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/LeftButtonDown.png", 
                SliceCenter = Rect.new(8, 3, 10, 4)
            }, 
            ButtonUpRight = not not v12 and {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/RightButton@2x.png", 
                SliceCenter = Rect.new(3, 5, 5, 7)
            } or {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/RightButton.png", 
                SliceCenter = Rect.new(2, 3, 3, 4)
            }, 
            ButtonDownRight = not not v12 and {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/RightButtonDown@2x.png", 
                SliceCenter = Rect.new(3, 5, 5, 7)
            } or {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/RightButtonDown.png", 
                SliceCenter = Rect.new(2, 3, 3, 4)
            }, 
            ButtonUp = not not v12 and {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/SingleButton@2x.png", 
                SliceCenter = Rect.new(18, 5, 20, 7)
            } or {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/SingleButton.png", 
                SliceCenter = Rect.new(8, 3, 10, 4)
            }, 
            ButtonDown = not not v12 and {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/SingleButtonDown@2x.png", 
                SliceCenter = Rect.new(18, 5, 20, 7)
            } or {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/SingleButtonDown.png", 
                SliceCenter = Rect.new(8, 3, 10, 4)
            }, 
            PremiumIcon = {
                Path = "rbxasset://textures/" .. "ui/PurchasePrompt/Premium.png", 
                SliceCenter = nil
            }, 
            RobuxIcon = not not v12 and {
                Path = "rbxasset://textures/" .. "ui/common/robux_small@2x.png", 
                SliceCenter = nil
            } or {
                Path = "rbxasset://textures/" .. "ui/common/robux_small.png", 
                SliceCenter = nil
            }, 
            ErrorIcon = not not v12 and {
                Path = "rbxasset://textures/" .. "ui/ErrorIcon.png", 
                SliceCenter = nil
            } or {
                Path = "rbxasset://textures/" .. "ui/ErrorIcon.png", 
                SliceCenter = nil
            }, 
            ButtonA = not not v12 and {
                Path = "rbxasset://textures/" .. "ui/Settings/Help/AButtonDark@2x.png", 
                SliceCenter = nil
            } or {
                Path = "rbxasset://textures/" .. "ui/Settings/Help/AButtonDark.png", 
                SliceCenter = nil
            }, 
            ButtonB = not not v12 and {
                Path = "rbxasset://textures/" .. "ui/Settings/Help/BButtonDark@2x.png", 
                SliceCenter = nil
            } or {
                Path = "rbxasset://textures/" .. "ui/Settings/Help/BButtonDark.png", 
                SliceCenter = nil
            }
        }, "LayoutValues.Image")
    }, "LayoutValues"));
end;
return v6;
