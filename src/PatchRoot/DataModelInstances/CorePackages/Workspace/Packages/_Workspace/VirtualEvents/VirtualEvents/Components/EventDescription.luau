local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local l_ExperienceTileV3_0 = v2.App.Tile.ExperienceTileV3;
local l_ShimmerPanel_0 = v2.App.Loading.ShimmerPanel;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local v8 = UDim2.new(0, 150, 0, 210);
return function(v9)
    local v10 = l_useStyle_0();
    return v1.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 32)
        }), 
        DescriptionHeader = v1.createElement(l_StyledTextLabel_0, {
            layoutOrder = 0, 
            text = l_useLocalization_0({
                header = "Feature.VirtualEvents.DescriptionLabel"
            }).header, 
            automaticSize = Enum.AutomaticSize.XY, 
            fontStyle = v10.Font.Header1, 
            colorStyle = v10.Theme.TextEmphasis
        }), 
        Description = if not v9.description then v1.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(1, 0, 0, v10.Font.BaseSize)
        }) else v1.createElement(l_StyledTextLabel_0, {
            layoutOrder = 1, 
            text = v9.description, 
            automaticSize = Enum.AutomaticSize.XY, 
            fontStyle = v10.Font.Body, 
            colorStyle = v10.Theme.TextDefault
        }), 
        ExperienceTileWrapper = v1.createElement("Frame", {
            LayoutOrder = 2, 
            Size = v8, 
            BackgroundTransparency = 1
        }, {
            ExperienceTile = v1.createElement(l_ExperienceTileV3_0, {
                experienceName = v9.experienceName, 
                thumbnail = v9.experienceThumbnail, 
                onActivated = v9.onExperienceTileActivated, 
                styleProps = {
                    overlayColors = {
                        Hover = v10.Theme.BackgroundOnHover
                    }
                }
            })
        })
    });
end;
