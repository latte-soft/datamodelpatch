local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Packages.React);
local l_UIBlox_0 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList.dependencies).UIBlox;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local l_withTooltip_0 = l_UIBlox_0.App.Dialog.TooltipV2.withTooltip;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local function v10()
end;
return function(v11)
    local v12 = l_useStyle_0();
    local l_Theme_0 = v12.Theme;
    local l_Font_0 = v12.Font;
    local v15, v16 = v1.useState(false);
    return v1.createElement("Frame", {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(1, 0, 0, 24), 
        BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
        LayoutOrder = v11.layoutOrder
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 24)
        }), 
        HeaderText = v1.createElement("TextLabel", {
            Size = UDim2.new(1, -28, 1, 0), 
            BackgroundTransparency = 1, 
            Font = l_Font_0.Footer.Font, 
            Text = string.upper(v11.name), 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextSize = l_Font_0.Footer.RelativeSize * l_Font_0.BaseSize, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0)
        }), 
        Tooltip = l_withTooltip_0({
            headerText = v11.name, 
            bodyText = v11.description
        }, {
            preferredOrientation = l_TooltipOrientation_0.Right, 
            guiTarget = l_CoreGui_0, 
            DisplayOrder = 100, 
            active = v15
        }, function(v17)
            return v1.createElement(l_Interactable_0, {
                Position = UDim2.new(1, -28, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Size = UDim2.fromOffset(28, 28), 
                BackgroundTransparency = 1, 
                [v1.Change.AbsolutePosition] = v17, 
                [v1.Change.AbsoluteSize] = v17, 
                [v1.Event.Activated] = function(_)
                    v16(not v15);
                end, 
                onStateChanged = v10
            }, {
                Label = v1.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Image = l_Images_0["icons/actions/info"], 
                    ImageColor3 = l_Colors_0.White
                })
            });
        end)
    });
end;
