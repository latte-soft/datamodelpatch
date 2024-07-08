local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v3 = require(l_CorePackages_0.UIBlox);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local l_useStyle_0 = v3.Core.Style.useStyle;
local v8 = require(l_script_FirstAncestor_0.Components.Constants);
local v9 = require(l_script_FirstAncestor_0.Components.getMenuItemDimensions);
local v10 = require(l_script_FirstAncestor_0.Flags.GetFFlagAbuseReportFullWidthCommentBox);
return function(v11)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v13 = v9(v11.menuContainerWidth);
    local v14 = {
        Layout = v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v6.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 20), 
            PaddingBottom = UDim.new(0, 20)
        })
    };
    v14 = if not not v10() and v11.isRightComponentFullWidth then v5.Dictionary.join(v14, {
        RightComponentWrapper = v6.createElement("Frame", {
            Size = UDim2.new(0, math.max(v11.menuContainerWidth - v8.MenuItemDynamicWidthOffset, v13.LeftWidth + v13.RightWidth), 0, v8.MenuItemHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Layout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            RightComponent = v11.rightComponent
        })
    }) else v5.Dictionary.join(v14, {
        Label = v6.createElement("TextLabel", {
            Text = v11.label, 
            Font = l_AppFonts_0.default:getMedium(), 
            LayoutOrder = 1, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextSize = v13.TextSize, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(0, v13.LeftWidth, 0, v8.MenuItemHeight), 
            BackgroundTransparency = 1
        }), 
        MiddleSpaceHolder = v6.createElement("Frame", {
            Size = UDim2.new(0, math.max(0, ((v11.menuContainerWidth - v13.LeftWidth) - v13.RightWidth) - v8.MenuItemDynamicWidthOffset), 0, v8.MenuItemHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }), 
        RightComponentWrapper = v6.createElement("Frame", {
            Size = UDim2.new(0, v13.RightWidth, 0, v8.MenuItemHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Layout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            RightComponent = v11.rightComponent
        })
    });
    local v15 = if not v10() then v8.MenuItemHeight else v8.MenuItemHeightTight;
    if v11.heightOverride then
        v15 = v11.heightOverride;
    end;
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v15), 
        BackgroundTransparency = 1, 
        LayoutOrder = v11.layoutOrder
    }, v14);
end;
