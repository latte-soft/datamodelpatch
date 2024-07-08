local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Cryo);
local v5 = require(l_Parent_3.Roact);
local v6 = require(l_Parent_3.t);
local v7 = require(l_Parent_0.ToastIcon);
local v8 = require(l_Parent_0.ToastText);
local v9 = require(l_Parent_1.Button.Button);
local v10 = require(l_Parent_1.Button.Enum.ButtonType);
local v11 = require(l_Parent_2.Core.Button.Enum.StandardButtonSize);
local v12 = v5.PureComponent:extend("ToastFrame");
v12.validateProps = v6.strictInterface({
    anchorPoint = v6.optional(v6.Vector2), 
    buttonProps = v6.optional(v6.strictInterface({
        buttonDimensions = v6.Vector2, 
        buttonText = v6.string, 
        onActivated = v6.callback
    })), 
    iconProps = v6.optional(v7.validateProps), 
    iconChildren = v6.optional(v6.table), 
    isCompact = v6.optional(v6.boolean), 
    layoutOrder = v6.optional(v6.integer), 
    padding = v6.numberMin(0), 
    position = v6.optional(v6.UDim2), 
    size = v6.UDim2, 
    subtitleTextProps = v6.optional(v8.validateProps), 
    textFrameSize = v6.UDim2, 
    titleTextProps = v8.validateProps, 
    buttonType = v6.optional(v10.isEnumValue)
});
v12.defaultProps = {
    padding = 0, 
    size = UDim2.new(1, 0, 1, 0), 
    textFrameSize = UDim2.new(1, 0, 1, 0)
};
local function v15(v13, v14)
    if not v13 then
        return nil;
    elseif type(v13.Image) == "function" then
        return v13:Image();
    else
        return v5.createElement(v7, v4.Dictionary.join(v13, {
            LayoutOrder = 1
        }), v14);
    end;
end;
v12.render = function(v16)
    local l_buttonProps_0 = v16.props.buttonProps;
    local v18 = l_buttonProps_0 and l_buttonProps_0.buttonText;
    local v19 = l_buttonProps_0 and l_buttonProps_0.buttonDimensions.Y;
    local v20 = l_buttonProps_0 and l_buttonProps_0.buttonDimensions.X;
    local v21 = nil;
    if l_buttonProps_0 then
        v21 = l_buttonProps_0.buttonType or v10.PrimarySystem;
    end;
    local l_isCompact_0 = v16.props.isCompact;
    local l_iconProps_0 = v16.props.iconProps;
    local v24 = l_buttonProps_0 and l_buttonProps_0.onActivated;
    local l_padding_0 = v16.props.padding;
    local l_subtitleTextProps_0 = v16.props.subtitleTextProps;
    local v27 = nil;
    v27 = if l_subtitleTextProps_0 then if l_isCompact_0 then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Center;
    local l_createElement_0 = v5.createElement;
    local v29 = "Frame";
    local v30 = {
        AnchorPoint = v16.props.anchorPoint, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        LayoutOrder = v16.props.layoutOrder, 
        Position = v16.props.position, 
        Size = v16.props.size
    };
    local v31 = {
        UIListLayout = v5.createElement("UIListLayout", {
            FillDirection = if not l_isCompact_0 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, l_padding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = if not l_isCompact_0 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    local v32 = false;
    if l_padding_0 > 0 then
        v32 = v5.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, l_padding_0), 
            PaddingLeft = UDim.new(0, l_padding_0), 
            PaddingRight = UDim.new(0, l_padding_0), 
            PaddingTop = UDim.new(0, l_padding_0)
        });
    end;
    v31.UIPadding = v32;
    v31.ToastMessageFrame = v5.createElement("Frame", {
        AnchorPoint = v16.props.anchorPoint, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = false, 
        LayoutOrder = 1, 
        Position = v16.props.position, 
        Size = if l_buttonProps_0 then if l_isCompact_0 then UDim2.new(1, 0, 1, -v19) else UDim2.new(1, -v20, 1, 0) else v16.props.size
    }, {
        UIListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, l_padding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = v27 or if l_isCompact_0 then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center
        }), 
        ToastIcon = v15(l_iconProps_0, v16.props.iconChildren), 
        ToastTextFrame = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = v16.props.textFrameSize
        }, {
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ToastTitle = v5.createElement(v8, v4.Dictionary.join(v16.props.titleTextProps, {
                LayoutOrder = 1
            })), 
            ToastSubtitle = l_subtitleTextProps_0 and v5.createElement(v8, v4.Dictionary.join(l_subtitleTextProps_0, {
                LayoutOrder = 2
            }))
        })
    });
    v31.ToastButton = l_buttonProps_0 and v5.createElement(v9, {
        buttonType = v21, 
        fitContent = not l_isCompact_0, 
        layoutOrder = 2, 
        maxWidth = if l_isCompact_0 then nil else l_buttonProps_0.buttonDimensions.X, 
        onActivated = v24, 
        standardSize = v11.Small, 
        text = v18
    });
    return l_createElement_0(v29, v30, v31);
end;
return v12;
