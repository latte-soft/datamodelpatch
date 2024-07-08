local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Resources.FTUXConstants);
local _ = require(l_Parent_0.Enums.PlatformEnum);
return function(v8)
    local v9 = l_useStyle_0();
    local l_Theme_0 = v9.Theme;
    local l_Font_0 = v9.Font;
    local l_PanelConstants_0 = v6[v8.platform].PanelConstants;
    local l_Color_0 = l_Theme_0.BackgroundContrast.Color;
    local l_HEADER_HEIGHT_RATIO_0 = l_PanelConstants_0.HEADER_HEIGHT_RATIO;
    local v15 = l_PanelConstants_0.CONTENT_PADDING / l_PanelConstants_0.SLIDESHOW_FRAME_WIDTH;
    local v16 = 1 - 2 * v15;
    return l_withLocalization_0({
        headerText = "CoreScripts.VRFTUX.Heading.Header"
    })(function(v17)
        return v1.createElement("Frame", {
            BackgroundColor3 = l_Color_0, 
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, l_HEADER_HEIGHT_RATIO_0, 0), 
            LayoutOrder = 1
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.26, 0)
            }), 
            HeaderFrame = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1
            }, {
                Box = v1.createElement("Frame", {
                    Size = UDim2.new(v16, 0, 1, 0), 
                    Position = UDim2.new(v15, 0, 0, 0), 
                    BackgroundTransparency = 1
                }, {
                    HeaderText = v1.createElement(v2.App.Text.StyledTextLabel, {
                        text = v17.headerText, 
                        fontStyle = l_Font_0.Header1, 
                        colorStyle = l_Theme_0.TextEmphasis, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        size = UDim2.new(1, 0, 1, 0), 
                        fluidSizing = true, 
                        automaticSize = Enum.AutomaticSize.XY
                    })
                })
            })
        });
    end);
end;
