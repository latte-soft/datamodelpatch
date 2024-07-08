local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_RoactRodux_0 = v0.RoactRodux;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.GlobalConfig);
local v10 = require(script.Parent.Parent.ThemedTextLabel);
local v11 = require(script.Parent.Parent.Divider);
local v12 = require(l_Parent_0.Actions.NavigateBack);
local v13 = require(l_Parent_0.Localization.withLocalization);
local v14 = require(l_Parent_0.Resources.Assets);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v17 = l_t_0.strictInterface({
    titleText = l_t_0.string, 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table), 
    onClosed = l_t_0.callback, 
    closeButtonRef = l_t_0.optional(l_t_0.table)
});
local function v22(v18, v19)
    if v9.propValidation then
        assert(v17(v18));
    end;
    return v13({
        titleText = v18.titleText
    })(function(v20)
        return l_withStyle_0(function(v21)
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v21.Theme.Overlay.Color, 
                BackgroundTransparency = 0, 
                Active = true
            }, {
                PageContent = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, -132), 
                    Position = UDim2.new(0, 0, 0, 132), 
                    ClipsDescendants = true
                }, v18[l_Roact_0.Children]), 
                HeaderContainer = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 132), 
                    BackgroundTransparency = 1
                }, {
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 95), 
                        PaddingRight = UDim.new(0, 95)
                    }), 
                    CloseButton = l_Roact_0.createElement(l_ImageSetButton_0, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 0, 0, 100), 
                        Size = UDim2.new(0, 36, 0, 36), 
                        Image = v14.Images.CloseModal, 
                        BackgroundTransparency = 1, 
                        SelectionImageObject = v19(l_CursorKind_0.RoundedRect), 
                        [l_Roact_0.Event.Activated] = v18.onClosed, 
                        [l_Roact_0.Ref] = v18.closeButtonRef
                    }), 
                    HeaderTextLabel = l_Roact_0.createElement(v10, {
                        fontKey = "Header1", 
                        themeKey = "TextEmphasis", 
                        Size = UDim2.new(0, 250, 0, 28), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0, 100), 
                        Text = v20.titleText
                    }), 
                    HeaderDivider = l_Roact_0.createElement(v11, {
                        Size = UDim2.new(1, 0, 0, 2), 
                        AnchorPoint = Vector2.new(0.5, 1), 
                        Position = UDim2.new(0.5, 0, 1, 0)
                    })
                }), 
                RadialGlowBig = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v14.Images.RadialGlow, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    Size = UDim2.new(1, 0, 1, 0)
                }), 
                RadialGlowSquashed = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v14.Images.RadialGlow, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 1, 0), 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    Size = UDim2.new(1, 0, 0.6, 0)
                })
            });
        end);
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v23)
    return {
        onClosed = function()
            v23(v12());
        end
    };
end)(function(v24)
    return l_withSelectionCursorProvider_0(function(v25)
        return v22(v24, v25);
    end);
end);
