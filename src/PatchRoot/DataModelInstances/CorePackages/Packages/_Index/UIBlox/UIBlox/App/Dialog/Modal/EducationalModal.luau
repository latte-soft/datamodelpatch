local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local l_FitFrameVertical_0 = require(l_Parent_3.FitFrame).FitFrameVertical;
local l_Label_0 = require(l_Parent_2.Core.ImageSet.ImageSetComponent).Label;
local v8 = require(l_Parent_2.Core.Text.GenericTextLabel.GenericTextLabel);
local v9 = require(l_Parent_2.Core.Style.withStyle);
local v10 = require(l_Parent_2.App.Button.Enum.ButtonType);
local v11 = require(l_Parent_1.ImageSet.getIconSize);
local v12 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v13 = require(l_Parent_2.App.InputButton.Checkbox);
local v14 = require(l_Parent_0.PartialPageModal);
local v15 = v4.PureComponent:extend("EducationalModal");
v15.validateProps = v5.strictInterface({
    bodyContents = v5.array(v5.strictInterface({
        icon = v5.optional(v5.union(v5.string, v5.table)), 
        text = v5.string, 
        layoutOrder = v5.optional(v5.integer), 
        isSystemMenuIcon = v5.optional(v5.boolean)
    })), 
    hasDoNotShow = v5.optional(v5.boolean), 
    cancelText = v5.string, 
    confirmText = v5.string, 
    doNotShowText = v5.optional(v5.string), 
    titleText = v5.optional(v5.string), 
    titleBackgroundImageProps = v5.strictInterface({
        image = v5.string, 
        imageHeight = v5.number, 
        text = v5.optional(v5.string)
    }), 
    screenSize = v5.Vector2, 
    onDismiss = v5.callback, 
    onCancel = v5.callback, 
    onConfirm = v5.callback
});
local function v23(v16)
    local v17 = Vector2.new(16, 16);
    local v18 = v16.isSystemMenuIcon or false;
    local v19 = v18 or v16.icon;
    local l_stylePalette_0 = v16.stylePalette;
    local l_Theme_0 = l_stylePalette_0.Theme;
    local l_Font_0 = l_stylePalette_0.Font;
    return v4.createElement("Frame", {
        Size = not not v19 and UDim2.new(0, 253, 0, v17.Y) or UDim2.new(1, 0, 0, v17.Y), 
        AutomaticSize = not not v19 and Enum.AutomaticSize.None or Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v16.layoutOrder
    }, {
        HorizontalLayout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = not not v18 and UDim.new(0, 10) or UDim.new(0, 8), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = not not v18 and UDim.new(0, 2) or UDim.new(0, 0)
        }), 
        Icon = (not not v18 and v4.createElement(l_Label_0, {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(32, 32), 
            Image = "rbxasset://textures/ui/TopBar/iconBase.png", 
            LayoutOrder = 1
        }, {
            Icon = v4.createElement(l_Label_0, {
                ZIndex = 1, 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.fromOffset(24, 24), 
                Image = "rbxasset://textures/ui/TopBar/coloredlogo.png"
            })
        }) or v19 and v4.createElement(l_Label_0, {
            Image = v16.icon, 
            Size = UDim2.fromOffset(v11(v12.Medium), v11(v12.Medium)), 
            ImageColor3 = l_Theme_0.IconDefault.Color, 
            ImageTransparency = l_Theme_0.IconDefault.Transparency, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        })) or nil, 
        Text = v16.text and v4.createElement(v8, {
            Size = UDim2.new(1, 0, 0, v17.Y), 
            AutomaticSize = not not v19 and Enum.AutomaticSize.None or Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Text = v16.text, 
            TextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize, 
            colorStyle = l_Theme_0.TextDefault, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            fontStyle = l_Font_0.Body, 
            TextXAlignment = not not v19 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
            TextWrapped = true, 
            LayoutOrder = 2
        })
    });
end;
v15.init = function(v24)
    v24.state = {
        shouldNotShowAgain = false
    };
    local v25, v26 = v4.createBinding(Vector2.new(0, 0));
    v24.contentSize = v25;
    v24.changeContentSize = v26;
    v24.toggleDoNotShow = function()
        v24:setState(function(v27)
            return {
                shouldNotShowAgain = not v27.shouldNotShowAgain
            };
        end);
    end;
    v24.onDismiss = function()
        v24.props.onDismiss(v24.state.shouldNotShowAgain);
    end;
    v24.onCancel = function()
        v24.props.onCancel(v24.state.shouldNotShowAgain);
    end;
    v24.onConfirm = function()
        v24.props.onConfirm(v24.state.shouldNotShowAgain);
    end;
end;
v15.render = function(v28)
    local l_props_0 = v28.props;
    local l_hasDoNotShow_0 = l_props_0.hasDoNotShow;
    return v9(function(v31)
        local v32 = 0;
        local v33 = {};
        for v34, v35 in ipairs(l_props_0.bodyContents) do
            table.insert(v33, (v4.createElement(v23, {
                key = tostring(v34), 
                icon = v35.icon, 
                text = v35.text, 
                layoutOrder = v34, 
                isSystemMenuIcon = v35.isSystemMenuIcon, 
                stylePalette = v31
            })));
            v32 = v32 + 1;
        end;
        local l_Theme_1 = v31.Theme;
        if l_hasDoNotShow_0 then
            table.insert(v33, (v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 50), 
                LayoutOrder = v32 + 1, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 21), 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Divider = v4.createElement("Frame", {
                    LayoutOrder = 1, 
                    BackgroundColor3 = l_Theme_1.Divider.Color, 
                    BackgroundTransparency = l_Theme_1.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 1)
                }), 
                DoNotShowCheckbox = v4.createElement(v13, {
                    text = l_props_0.doNotShowText, 
                    onActivated = v28.toggleDoNotShow, 
                    isSelected = v28.state.shouldNotShowAgain, 
                    layoutOrder = 2
                })
            })));
        end;
        return v4.createElement(v14, {
            title = l_props_0.titleText, 
            titleBackgroundImageProps = l_props_0.titleBackgroundImageProps, 
            screenSize = l_props_0.screenSize, 
            bottomPadding = 50, 
            buttonStackProps = {
                buttons = {
                    {
                        props = {
                            isDisabled = false, 
                            onActivated = if not l_hasDoNotShow_0 then l_props_0.onCancel else v28.onCancel, 
                            text = l_props_0.cancelText
                        }
                    }, 
                    {
                        buttonType = v10.PrimarySystem, 
                        props = {
                            isDisabled = false, 
                            onActivated = if not l_hasDoNotShow_0 then l_props_0.onConfirm else v28.onConfirm, 
                            text = l_props_0.confirmText
                        }
                    }
                }
            }, 
            onCloseClicked = if not l_hasDoNotShow_0 then l_props_0.onDismiss else v28.onDismiss
        }, {
            BodyContents = v4.createElement(l_FitFrameVertical_0, {
                BackgroundTransparency = 1, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 28), 
                margin = {
                    top = 36, 
                    bottom = 36
                }, 
                [v4.Change.AbsoluteSize] = function(v37)
                    v28.changeContentSize(v37.AbsoluteSize);
                end
            }, v33)
        });
    end);
end;
return v15;
