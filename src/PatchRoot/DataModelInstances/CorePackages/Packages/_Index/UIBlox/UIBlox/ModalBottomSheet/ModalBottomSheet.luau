local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Otter);
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.t);
local v5 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v6 = require(script.Parent.ModalBottomSheetButton);
local v7 = v2.PureComponent:extend("ModalBottomSheet");
local v8 = {
    frequency = 4, 
    dampingRatio = 1
};
v7.validateProps = v4.strictInterface({
    buttonModels = v4.array(v4.table), 
    screenWidth = v4.number, 
    onDismiss = v4.callback, 
    showImages = v4.optional(v4.boolean), 
    bottomGap = v4.optional(v4.number), 
    sheetContentXSize = v4.optional(v4.UDim), 
    sheetContentXPosition = v4.optional(v4.UDim)
});
v7.defaultProps = {
    bottomGap = 0, 
    showImages = true, 
    sheetContentXSize = UDim.new(1, 0), 
    sheetContentXPosition = UDim.new(0, 0)
};
v7.init = function(v9)
    v9.motor = v1.createSingleMotor(0);
    v9.ref = v2.createRef();
    v9.active = true;
end;
v7.render = function(v10)
    local l_sheetContentXPosition_0 = v10.props.sheetContentXPosition;
    local l_sheetContentXSize_0 = v10.props.sheetContentXSize;
    v10.sheetHeight = #v10.props.buttonModels * 56;
    if #v10.props.buttonModels >= 7 then
        v10.sheetHeight = 420;
    end;
    local v13 = {};
    for v14, v15 in ipairs(v10.props.buttonModels) do
        v13["button " .. v14] = v2.createElement(v6, (v3.Dictionary.join(v15, {
            hasRoundTop = v14 == 1, 
            hasRoundBottom = v14 == #v10.props.buttonModels, 
            isFixed = v10.props.screenWidth > 600, 
            elementHeight = 56, 
            showImage = v10.props.showImages, 
            LayoutOrder = v14, 
            onActivatedAndDismissed = function(v16)
                if v15.onActivated then
                    v15.onActivated(v16);
                end;
                if not v15.stayOnActivated then
                    v10.props.onDismiss();
                end;
            end
        })));
    end;
    v13.layout = v2.createElement("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        FillDirection = Enum.FillDirection.Vertical, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    return v5(function(v17)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Background = v2.createElement("TextButton", {
                ZIndex = 0, 
                AutoButtonColor = false, 
                BackgroundColor3 = v17.Theme.Overlay.Color, 
                BackgroundTransparency = v17.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "", 
                [v2.Event.Activated] = function()
                    v10.active = false;
                    v10.motor:setGoal(v1.spring(0, v8));
                end
            }), 
            SheetContent = v2.createElement("ScrollingFrame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(l_sheetContentXSize_0.Scale, l_sheetContentXSize_0.Offset, 0, v10.sheetHeight), 
                Position = UDim2.new(l_sheetContentXPosition_0.Scale, l_sheetContentXPosition_0.Offset, 1, 0), 
                ScrollBarThickness = 0, 
                CanvasSize = UDim2.new(l_sheetContentXSize_0.Scale, l_sheetContentXSize_0.Offset, 0, #v10.props.buttonModels * 56), 
                ClipsDescendants = true, 
                [v2.Ref] = v10.ref
            }, v13)
        });
    end);
end;
v7.didMount = function(v18)
    local l_sheetContentXPosition_1 = v18.props.sheetContentXPosition;
    v18.motor:onStep(function(v20)
        if v18.ref.current then
            v18.ref.current.Position = UDim2.new(l_sheetContentXPosition_1.Scale, l_sheetContentXPosition_1.Offset, 1, -(v18.sheetHeight + v18.props.bottomGap) * v20);
        end;
    end);
    v18.motor:setGoal(v1.spring(1, v8));
    v18.motor:onComplete(function()
        if not v18.active then
            v18.props.onDismiss();
        end;
    end);
    v18.motor:start();
end;
v7.wilUnmount = function(v21)
    v21.motor:destroy();
end;
return v7;
