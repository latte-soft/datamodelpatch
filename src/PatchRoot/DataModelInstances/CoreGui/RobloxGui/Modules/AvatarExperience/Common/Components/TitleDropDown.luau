local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local v7 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_TextButton_0 = v5.App.Button.TextButton;
local l_Focusable_0 = v6.Focusable;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_withStyle_0 = v5.Style.withStyle;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ControlState_0 = v5.Core.Control.Enum.ControlState;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v5.Core.Control.Interactable;
local v17 = l_Images_0["icons/actions/truncationExpand"];
local v18 = v3.PureComponent:extend("TitleDropDown");
v18.validateProps = v4.strictInterface({
    onActivated = v4.callback, 
    Text = v4.string, 
    NextSelectionRight = v4.optional(v4.table), 
    forwardRef = v4.optional(v4.table), 
    inputBindings = v4.optional(v4.table)
});
v18.init = function(v19)
    v19:setState({
        wrappingFrameAbsoluteSizeX = 0
    });
    v19.absoluteSizeChanged = function(v20)
        v19:setState({
            wrappingFrameAbsoluteSizeX = v20.AbsoluteSize.X
        });
    end;
    v19.wrappingFrameRef = v3.createRef();
    local v21, v22 = v3.createBinding(false);
    v19.useBackgroundTransparency = v21;
    v19.updateUseBackgroundTransparency = v22;
    v19.onStateChanged = function(_, v24)
        if not (v24 ~= l_ControlState_0.Pressed) or v24 == l_ControlState_0.Hover then
            v19.updateUseBackgroundTransparency(true);
            return ;
        else
            v19.updateUseBackgroundTransparency(false);
            return ;
        end;
    end;
end;
v18.render = function(v25)
    return l_withStyle_0(function(v26)
        return l_withSelectionCursorProvider_0(function(v27)
            return v25:renderWithProviders(v26, v27);
        end);
    end);
end;
v18.renderLabel = function(v28, _, _)
    return v3.createElement(l_TextButton_0, {
        size = UDim2.fromScale(0, 1), 
        layoutOrder = 1, 
        onActivated = v28.props.onActivated, 
        text = v28.props.Text, 
        fontStyle = "Header1"
    });
end;
v18.renderButton = function(v31, v32, v33)
    local l_Text_0 = v31.props.Text;
    local l_TextEmphasis_0 = v32.TextEmphasis;
    local l_Header1_0 = v33.Header1;
    local v37 = 28 * l_Header1_0.RelativeSize;
    local v38 = v33.BaseSize * l_Header1_0.RelativeSize;
    local l_Color_0 = v32.BackgroundOnHover.Color;
    local l_wrappingFrameAbsoluteSizeX_0 = v31.state.wrappingFrameAbsoluteSizeX;
    local v41 = l_wrappingFrameAbsoluteSizeX_0 > 0;
    local v42, v43 = v7.getLargestPossibleOneLineTextSize(l_Text_0, v38, l_Header1_0, (math.max(l_wrappingFrameAbsoluteSizeX_0 - v37, 0)));
    if v42 == nil then
        return nil;
    else
        local v44 = UDim2.fromOffset(v42.X, v42.Y);
        local v45 = {};
        if v41 then
            v45 = {
                {
                    Padding = v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 8), 
                        PaddingRight = UDim.new(0, 8)
                    }), 
                    Corner = v3.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    UIListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    TextLabel = v3.createElement("TextLabel", {
                        TextColor3 = l_TextEmphasis_0.Color, 
                        TextTransparency = l_TextEmphasis_0.Transparency, 
                        Font = l_Header1_0.Font, 
                        LayoutOrder = 1, 
                        TextWrapped = 1, 
                        Text = l_Text_0, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Size = v44, 
                        TextSize = v43, 
                        BackgroundTransparency = 1
                    }), 
                    Icon = v3.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Image = v17, 
                        ImageColor3 = l_TextEmphasis_0.Color, 
                        LayoutOrder = 2, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = UDim2.fromOffset(v37, v37)
                    })
                }
            };
        end;
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            [v3.Change.AbsoluteSize] = v31.absoluteSizeChanged, 
            [v3.Ref] = v31.wrappingFrameRef
        }, {
            Interactable = v3.createElement(l_Interactable_0, {
                onStateChanged = v31.onStateChanged, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Selectable = false, 
                [v3.Event.Activated] = v31.props.onActivated, 
                Size = UDim2.fromScale(1, 1)
            }, {
                ButtonContentFrame = v3.createElement("Frame", {
                    BackgroundColor3 = l_Color_0, 
                    BackgroundTransparency = v31.useBackgroundTransparency:map(function(v46)
                        if not v46 then
                            return 1;
                        else
                            return v32.BackgroundOnHover.Transparency;
                        end;
                    end), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                }, v45)
            })
        });
    end;
end;
v18.didUpdate = function(v47)
    if v47.wrappingFrameRef.current then
        local _ = v47.wrappingFrameRef.current.AbsoluteSize;
    end;
end;
v18.renderWithProviders = function(v49, v50, v51)
    return v3.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        SelectionImageObject = v51(l_CursorKind_0.RoundedRectNoInset), 
        NextSelectionRight = v49.props.NextSelectionRight, 
        [v3.Ref] = v49.props.forwardRef, 
        inputBindings = {
            ActivateTitleDropDown = v6.Input.onBegin(Enum.KeyCode.ButtonA, function()
                v49.props.onActivated();
            end)
        }
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 2), 
            PaddingRight = UDim.new(0, 8)
        }), 
        Button = v49:renderButton(v50.Theme, v50.Font)
    });
end;
return v3.forwardRef(function(v52, v53)
    return v3.createElement(v18, v2.Dictionary.join(v52, {
        forwardRef = v53
    }));
end);
