local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local l_Images_0 = v3.App.ImageSet.Images;
local v6 = require(l_script_FirstAncestor_0.Components.Constants);
local v7 = require(l_script_FirstAncestor_0.Components.getMenuItemDimensions);
local l_TextButton_0 = v3.App.Button.TextButton;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local v11 = require(l_script_FirstAncestor_0.Flags.GetFFlagAbuseReportFullWidthCommentBox);
return function(v12)
    local v13 = v7(v12.menuWidth);
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, if not v11() then v6.MenuItemHeight else v6.MenuItemHeightTight), 
        BackgroundTransparency = 1
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        Label = v4.createElement("TextLabel", {
            Text = v12.label, 
            Font = l_AppFonts_0.default:getMedium(), 
            LayoutOrder = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextTransparency = 0, 
            TextSize = v13.TextSize, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(0, v13.LeftWidth, 0, v6.MenuItemHeight), 
            BackgroundTransparency = 1
        }), 
        MiddleWidthHolder = v4.createElement("Frame", {
            Size = UDim2.new(0, math.max(0, ((v12.menuWidth - v13.LeftWidth) - v13.RightWidth) - 100), 0, v6.MenuItemHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }), 
        Container = v4.createElement("Frame", {
            Size = UDim2.new(0, v13.RightWidth, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            LeftChevron = if not v12.isSelectionDisabled then v4.createElement(l_IconButton_0, {
                size = UDim2.fromOffset(32, 32), 
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/cycleLeft"], 
                onActivated = v12.onClickLeft, 
                layoutOrder = 1
            }) else nil, 
            ButtonContainer = v4.createElement("Frame", {
                Size = UDim2.new(0, v13.RightWidth - 64, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                ToggleButton = v4.createElement(l_TextButton_0, {
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v12.abuseType, 
                    onActivated = v12.onClickRight, 
                    layoutOrder = 2, 
                    isDisabled = v12.isSelectionDisabled
                })
            }), 
            RightChevron = if not v12.isSelectionDisabled then v4.createElement(l_IconButton_0, {
                size = UDim2.fromOffset(32, 32), 
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/cycleRight"], 
                onActivated = v12.onClickRight, 
                layoutOrder = 3
            }) else nil
        })
    });
end;
