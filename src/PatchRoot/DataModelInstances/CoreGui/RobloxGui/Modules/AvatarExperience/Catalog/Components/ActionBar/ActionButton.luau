local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v6 = require(l_CorePackages_0.UIBlox);
local l_FitTextLabel_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents.FitTextLabel;
local l_withStyle_0 = v6.Style.withStyle;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_ShimmerPanel_0 = v6.App.Loading.ShimmerPanel;
local l_ImageSetButton_0 = v6.Core.ImageSet.ImageSetButton;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v6.App.ImageSet.Images;
local v15 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixBuyActionBarLoadingHeight);
local v17 = game:DefineFastFlag("AXFixBuyActionBarHeight", false);
local v18 = l_Images_0["component_assets/circle_17"];
local v19 = v4.PureComponent:extend("ActionButton");
v19.validateProps = v2.strictInterface({
    NextSelectionLeft = v2.optional(v2.table), 
    NextSelectionDown = v2.optional(v2.table), 
    NextSelectionUp = v2.optional(v2.table), 
    NextSelectionRight = v2.optional(v2.table), 
    Size = v2.UDim2, 
    Position = v2.optional(v2.UDim2), 
    LayoutOrder = v2.optional(v2.number), 
    buttonProps = v2.table, 
    Font = v2.table, 
    forwardRef = v2.optional(v2.table)
});
v19.init = function(v20)
    v20.state = {
        isButtonPressed = false
    };
    v20.onInputBegan = function()
        v20:setState({
            isButtonPressed = true
        });
    end;
    v20.onInputEnded = function()
        v20:setState({
            isButtonPressed = false
        });
    end;
end;
v19.renderWithStyle = function(v21, v22, v23)
    local l_Size_0 = v21.props.Size;
    local l_Position_0 = v21.props.Position;
    local l_LayoutOrder_0 = v21.props.LayoutOrder;
    local l_Font_0 = v21.props.Font;
    local l_buttonProps_0 = v21.props.buttonProps;
    local l_isButtonPressed_0 = v21.state.isButtonPressed;
    local l_Theme_0 = v22.Theme;
    local v31 = 0;
    if not l_buttonProps_0.buttonIsDisabled then
        if l_isButtonPressed_0 then
            v31 = l_Theme_0.Overlay.Transparency;
        end;
    else
        v31 = v15.ActionBar.DisabledButtonTransparency;
    end;
    local _ = nil;
    return v4.createElement(l_Focusable_0[l_ImageSetButton_0], {
        Size = l_Size_0, 
        Position = l_Position_0, 
        LayoutOrder = l_LayoutOrder_0, 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        Image = v18, 
        ImageColor3 = l_buttonProps_0.buttonColor, 
        ImageTransparency = v31, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        ClipsDescendants = true, 
        [v4.Event.InputBegan] = v21.onInputBegan, 
        [v4.Event.InputEnded] = v21.onInputEnded, 
        [v4.Event.Activated] = function()
            if not (not (l_buttonProps_0.onActivated ~= nil) or l_buttonProps_0.buttonIsLoading) then
                l_buttonProps_0.onActivated();
            end;
        end, 
        NextSelectionLeft = v21.props.NextSelectionLeft, 
        NextSelectionDown = v21.props.NextSelectionDown, 
        NextSelectionUp = v21.props.NextSelectionUp, 
        NextSelectionRight = v21.props.NextSelectionRight, 
        [v4.Ref] = v21.props.forwardRef, 
        SelectionImageObject = v23(l_CursorKind_0.RoundedRectNoInset)
    }, {
        ButtonInfo = if not l_buttonProps_0.buttonIsLoading then v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_buttonProps_0.buttonIconPadding)
            }), 
            Icon = l_buttonProps_0.buttonIcon and v4.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, l_buttonProps_0.buttonIconSize, 0, l_buttonProps_0.buttonIconSize), 
                BackgroundTransparency = 1, 
                Image = l_buttonProps_0.buttonIcon, 
                ImageTransparency = v31, 
                ImageColor3 = l_buttonProps_0.buttonTextColor, 
                LayoutOrder = 1
            }), 
            Text = v4.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                Size = UDim2.new(0, 0, 0, l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize), 
                BackgroundTransparency = 1, 
                Text = l_buttonProps_0.buttonText or "", 
                Font = l_Font_0.Header1.Font, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextWrapped = false, 
                TextColor3 = l_buttonProps_0.buttonTextColor, 
                TextTransparency = v31, 
                LayoutOrder = 2
            })
        }) else v4.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(1, 0, (v16() or v17) and 1 or 2, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            shimmerSpeed = 1.5, 
            cornerRadius = if v16() or v17 then UDim.new(0, v22.Tokens.Semantic.Radius.Large) else nil
        })
    });
end;
v19.render = function(v33)
    return l_withStyle_0(function(v34)
        return l_withSelectionCursorProvider_0(function(v35)
            return v33:renderWithStyle(v34, v35);
        end);
    end);
end;
return v4.forwardRef(function(v36, v37)
    return v4.createElement(v19, v3.Dictionary.join(v36, {
        forwardRef = v37
    }));
end);
