local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_RoactRodux_0 = v0.RoactRodux;
local l_UIBlox_0 = v0.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Thunks.NavigateUp);
local v9 = require(l_Parent_0.Resources.Assets);
local v10 = require(l_Parent_0.Resources.Constants);
local v11 = require(l_Parent_0.Components.ZonePortal);
local v12 = require(l_Parent_0.Enums.Direction);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v14 = require(script.Parent.ThemedTextLabel);
local function v18(v15, v16)
    return l_withStyle_0(function(v17)
        return l_Roact_0.createElement("TextButton", {
            AutoButtonColor = false, 
            Text = "", 
            BackgroundColor3 = v17.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v17.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            Position = v15.position, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = v15.visible and not v15.pageIsModal, 
            ZIndex = v15.zIndex, 
            Selectable = false
        }, {
            PageTitle = l_Roact_0.createElement(v14, {
                fontKey = "Header1", 
                themeKey = "TextEmphasis", 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 28), 
                Size = UDim2.new(1, -48, 0, 28), 
                Text = v15.pageTitle
            }, {
                ExtraChildren = v15.titleChildren, 
                BackButton = l_Roact_0.createElement(l_ImageSetButton_0, {
                    BackgroundTransparency = 1, 
                    Image = v9.Images.NavigateBack, 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    ImageColor3 = v17.Theme.IconEmphasis.Color, 
                    ImageTransparency = v17.Theme.IconEmphasis.Transparency, 
                    Position = UDim2.new(0, 4, 0.5, 0), 
                    Size = UDim2.new(0, 36, 0, 36), 
                    NextSelectionDown = v15.NextSelectionDown, 
                    [l_Roact_0.Event.Activated] = v15.navigateUp, 
                    [l_Roact_0.Ref] = v15.buttonRef, 
                    SelectionImageObject = v16(l_CursorKind_0.RoundedRect)
                })
            }), 
            PageContainer = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, v10.Zone.ContentOffset, 1, 0), 
                Size = UDim2.new(1, -v10.Zone.ContentOffset, 1, -68)
            }, v15[l_Roact_0.Children]), 
            ZonePortal = l_Roact_0.createElement(v11, {
                targetZone = 0, 
                direction = v12.Left
            })
        });
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v19)
    return {
        navigateUp = function()
            v19(v8);
        end
    };
end)(function(v20)
    return l_withSelectionCursorProvider_0(function(v21)
        return v18(v20, v21);
    end);
end);
