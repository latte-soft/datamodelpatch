local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportAnalytics);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_ScrollingListTable_0 = v3.App.Table.ScrollingListTable;
local l_CellHeadDetail_0 = v3.App.Table.CellHeadDetail;
local l_Cell_0 = v3.App.Table.Cell;
local v10 = require(l_CorePackages_0.Packages.Dash);
local v11 = require(l_CorePackages_0.Workspace.Packages.Style);
local l_useDesignTokens_0 = v11.useDesignTokens;
local l_mapTypographyVariantToFontEnum_0 = v11.mapTypographyVariantToFontEnum;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_isSelectedDataDSAIllegalContent_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isSelectedDataDSAIllegalContent;
local l_isShowEUDSAIllegalContentReportingLink_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink;
local l_GetFFlagDSAIllegalContentReporting_0 = v4.GetFFlagDSAIllegalContentReporting;
local l_GetFFlagDSAVRSkipFrontendGeoCheck_0 = v4.GetFFlagDSAVRSkipFrontendGeoCheck;
return function(v19)
    local v20 = l_useDesignTokens_0();
    local l_selectionData_0 = v19.selectionData;
    local v22 = l_useStyle_0();
    v2.useEffect(function()
        v19.onSummaryPageMounted();
    end, {});
    local v23 = false;
    local v24 = false;
    if v19.dsaText ~= nil then
        v24 = l_isSelectedDataDSAIllegalContent_0(v19.selectionData);
    end;
    v23 = if not l_GetFFlagDSAVRSkipFrontendGeoCheck_0() then v24 and l_isShowEUDSAIllegalContentReportingLink_0() else v24 and l_GetFFlagDSAIllegalContentReporting_0();
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 460), 
        BackgroundTransparency = v20.Global.Opacity_0
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Heading = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v20.Global.Space_600), 
            BackgroundTransparency = v20.Global.Opacity_0
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v20.Global.Space_200), 
                PaddingBottom = UDim.new(0, v20.Global.Space_200)
            }), 
            Prompt = v2.createElement("TextLabel", {
                Text = v19.heading, 
                Font = l_mapTypographyVariantToFontEnum_0(v20.Semantic.Typography.Subheader), 
                LayoutOrder = 1, 
                TextColor3 = v20.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = v20.Semantic.Color.Text.Emphasis.Transparency, 
                TextSize = v20.Semantic.Typography.Subheader.FontSize, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.new(1, 0, 0, v20.Semantic.Typography.Subheader.FontSize), 
                BackgroundTransparency = v20.Global.Opacity_0
            })
        }), 
        SelectionList = v2.createElement("Frame", {
            LayoutOrder = 2, 
            Size = if not v23 then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 0, 120), 
            BackgroundTransparency = v20.Global.Opacity_0
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ListTable = v2.createElement(l_ScrollingListTable_0, {
                cells = v10.map(l_selectionData_0, function(v25)
                    return v2.createElement(l_Cell_0, {
                        size = UDim2.new(1, 0, 0, v20.Global.Size_800), 
                        head = v2.createElement(l_CellHeadDetail_0, {
                            labelText = v25.heading, 
                            labelTextColor = v22.Theme.TextMuted, 
                            labelTextFont = v22.Font.SubHeader1, 
                            subLabelText = v25.humanReadableText, 
                            subLabelTextColor = v22.Theme.TextEmphasis, 
                            subLabelTextFont = v22.Font.Body
                        }), 
                        userInteractionEnabled = false
                    });
                end)
            })
        }), 
        DSANotice = if not v23 then nil else v2.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 120), 
            BackgroundTransparency = v20.Global.Opacity_0
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Content = v2.createElement(l_StyledTextLabel_0, {
                layoutOrder = 2, 
                size = UDim2.new(1, 0, 0, 60), 
                lineHeight = 1, 
                text = v19.dsaText, 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Top, 
                fontStyle = v22.Font.Body, 
                colorStyle = v22.Theme.TextEmphasis, 
                fluidSizing = true, 
                richText = false
            })
        })
    });
end;
