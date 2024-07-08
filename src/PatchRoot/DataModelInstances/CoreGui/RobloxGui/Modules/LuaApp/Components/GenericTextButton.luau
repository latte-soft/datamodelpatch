local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v5 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v6 = require(l_Modules_0.LuaApp.Components.ShimmerAnimation);
local v7 = v3.PureComponent:extend("GenericTextButton");
local v8 = require(l_CorePackages_0.UIBlox);
local l_withSelectionCursorProvider_0 = v8.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v8.App.SelectionImage.CursorKind;
local l_GetFFlagLuaAppFixSelectionCursor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppFixSelectionCursor;
v7.init = function(v12)
    v12.state = {
        isButtonPressed = false
    };
    v12.onInputBegan = function()
        v12:setState({
            isButtonPressed = true
        });
    end;
    v12.onInputEnded = function()
        v12:setState({
            isButtonPressed = false
        });
    end;
end;
local function _(v13, v14)
    return 1 - (1 - v13) * (1 - v14);
end;
v7.render = function(v16)
    if not l_GetFFlagLuaAppFixSelectionCursor_0() then
        return v16:renderWithSelectionCursor(nil);
    else
        return l_withSelectionCursorProvider_0(function(v17)
            return v16:renderWithSelectionCursor(v17);
        end);
    end;
end;
v7.renderWithSelectionCursor = function(v18, v19)
    local l_themeSettings_0 = v18.props.themeSettings;
    local l_Size_0 = v18.props.Size;
    local l_Position_0 = v18.props.Position;
    local l_AnchorPoint_0 = v18.props.AnchorPoint;
    local l_LayoutOrder_0 = v18.props.LayoutOrder;
    local l_Text_0 = v18.props.Text;
    local l_Font_0 = v18.props.Font;
    local l_TextSize_0 = v18.props.TextSize;
    local l_onActivated_0 = v18.props.onActivated;
    local l_isLoading_0 = v18.props.isLoading;
    local l_isDisabled_0 = v18.props.isDisabled;
    local l_isButtonPressed_0 = v18.state.isButtonPressed;
    local v32 = l_themeSettings_0.Border.Hidden == false;
    local l_NextSelectionDown_0 = v18.props.NextSelectionDown;
    local l_NextSelectionLeft_0 = v18.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v18.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v18.props.NextSelectionUp;
    local l_Color_0 = l_themeSettings_0.Color;
    local v38 = 0;
    if not l_isLoading_0 and not l_isDisabled_0 then
        if l_isButtonPressed_0 then
            l_Color_0 = l_themeSettings_0.OnPressColor;
            v38 = l_themeSettings_0.OnPressTransparency;
        end;
    else
        l_Color_0 = l_themeSettings_0.DisabledColor;
        v38 = l_themeSettings_0.DisabledTransparency;
    end;
    local v39 = 1 - (1 - v38) * (1 - l_themeSettings_0.Transparency);
    local v40 = not not v32 and 1 - (1 - v38) * (1 - l_themeSettings_0.Border.Transparency) or 0;
    local v41 = 1 - (1 - v38) * (1 - l_themeSettings_0.Text.Transparency);
    local l_forwardRef_0 = v18.props.forwardRef;
    local v43 = nil;
    if l_GetFFlagLuaAppFixSelectionCursor_0() then
        v43 = v19(l_CursorKind_0.InputButton);
    end;
    return v3.createElement(v4, {
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1, 
        Image = "LuaApp/buttons/buttonFill", 
        ImageColor3 = l_Color_0, 
        ImageTransparency = v39, 
        BorderSizePixel = 0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        NextSelectionDown = l_NextSelectionDown_0, 
        NextSelectionLeft = l_NextSelectionLeft_0, 
        NextSelectionRight = l_NextSelectionRight_0, 
        NextSelectionUp = l_NextSelectionUp_0, 
        SelectionImageObject = v43, 
        [v3.Ref] = l_forwardRef_0, 
        [v3.Event.InputBegan] = v18.onInputBegan, 
        [v3.Event.InputEnded] = v18.onInputEnded, 
        [v3.Event.Activated] = l_onActivated_0
    }, {
        Border = v32 and v3.createElement(v5, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Image = "LuaApp/buttons/buttonStroke", 
            ImageColor3 = l_themeSettings_0.Border.Color, 
            ImageTransparency = v40, 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9)
        }), 
        Text = v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, l_TextSize_0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = l_Text_0, 
            Font = l_Font_0, 
            TextSize = l_TextSize_0, 
            TextColor3 = l_themeSettings_0.Text.Color, 
            TextTransparency = v41, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1
        }), 
        ShimmerAnimation = l_isLoading_0 and v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true
        }, {
            Shimmer = v3.createElement(v6, {
                Size = UDim2.new(1, 0, 2, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                shimmerSpeed = 1.5
            })
        })
    });
end;
return v3.forwardRef(function(v44, v45)
    return v3.createElement(v7, v2.Dictionary.join(v44, {
        forwardRef = v45
    }));
end);
