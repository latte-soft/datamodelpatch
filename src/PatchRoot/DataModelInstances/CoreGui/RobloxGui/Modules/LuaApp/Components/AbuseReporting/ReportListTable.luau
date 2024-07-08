local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.UIBlox);
local _ = v4.App.Button.Enum.ButtonType;
local l_ScrollingListTable_0 = v4.App.Table.ScrollingListTable;
local l_CellTailDescription_0 = v4.App.Table.CellTailDescription;
local l_CellHeadDetail_0 = v4.App.Table.CellHeadDetail;
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local l_Cell_0 = v4.App.Table.Cell;
local v11 = require(l_CorePackages_0.Packages.Dash);
local v12 = require(l_CorePackages_0.Workspace.Packages.Style);
local l_useDesignTokens_0 = v12.useDesignTokens;
local l_mapTypographyVariantToFontEnum_0 = v12.mapTypographyVariantToFontEnum;
local l_GetFFlagLuafiedReportThumbnail_0 = v1.GetFFlagLuafiedReportThumbnail;
return function(v16)
    local v17 = l_useDesignTokens_0();
    local l_currentList_0 = v16.currentList;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v17.Global.Opacity_0
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Heading = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v17.Global.Size_700), 
            BackgroundTransparency = v17.Global.Opacity_0
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v17.Global.Space_300), 
                PaddingBottom = UDim.new(0, v17.Global.Space_300)
            }), 
            HeadingText = v3.createElement("TextLabel", {
                Text = l_currentList_0.heading, 
                Font = l_mapTypographyVariantToFontEnum_0(v17.Semantic.Typography.Subheader), 
                LayoutOrder = 1, 
                TextColor3 = v17.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = v17.Semantic.Color.Text.Emphasis.Transparency, 
                TextSize = v17.Semantic.Typography.Subheader.FontSize, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.new(1, 0, 0, v17.Semantic.Typography.Subheader.FontSize), 
                BackgroundTransparency = v17.Global.Opacity_0
            })
        }), 
        SelectionList = v3.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            ListTable = v3.createElement(l_ScrollingListTable_0, {
                cells = v11.map(l_currentList_0.listItems, function(v19)
                    return v3.createElement(l_Cell_0, {
                        size = UDim2.new(1, 0, 0, if not l_GetFFlagLuafiedReportThumbnail_0() then v17.Global.Size_700 else v17.Global.Size_500), 
                        head = v3.createElement(l_CellHeadDetail_0, {
                            labelText = v19.humanReadableText
                        }), 
                        tail = v3.createElement(l_CellTailDescription_0, {
                            text = "", 
                            showArrow = true
                        }), 
                        onActivated = function()
                            v16.onSelect(v19.tagValues, l_currentList_0.heading, v19.humanReadableText, v19.nextList);
                        end
                    });
                end)
            })
        })
    });
end;
