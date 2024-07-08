local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.SharedFlags);
local v6 = require(l_Parent_0.DsaIllegalContentReporting);
local v7 = require(l_script_FirstAncestor_0.Hooks.useAbuseReportingDesignTokens);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(script.Parent.ReportStep);
local _ = require(script.Parent.Parent.Common.Types);
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_GetFFlagDSAIllegalContentReporting_0 = v5.GetFFlagDSAIllegalContentReporting;
local l_isSelectedDataDSAIllegalContent_0 = v6.isSelectedDataDSAIllegalContent;
local l_isInDSAFeaturesOverrideList_0 = v6.isInDSAFeaturesOverrideList;
local v15 = UDim2.new(1, 0, 0, 100);
local v16 = UDim.new(0, 5);
return function(v17)
    local l_ReportSubmission_0 = v7().ReportSubmission;
    local l_params_0 = v17.params;
    v2.useEffect(v2.useCallback(v17.onMounted), {});
    local v20 = l_useLocalization_0({
        cancelText = "Feature.Chat.Action.Cancel"
    });
    local v21 = l_ReportSubmission_0.entrySize or v15;
    local v22 = l_ReportSubmission_0.entryInnerVerticalPadding or v16;
    local v23 = l_ReportSubmission_0.dividerVerticalPadding or 5;
    local v24 = l_ReportSubmission_0.dividerHeight or 2;
    local v25 = not not l_ReportSubmission_0.dividerColor and l_ReportSubmission_0.dividerColor.Transparency or 0.8;
    local v26 = {};
    for _, v28 in v17.report, nil, nil do
        table.insert(v26, (v2.createElement("Frame", {
            Size = v21, 
            BackgroundTransparency = 1, 
            LayoutOrder = v28.index, 
            AutomaticSize = Enum.AutomaticSize.None
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = v22
            }), 
            Title = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1, 
                Text = v28.heading, 
                Font = l_ReportSubmission_0.entryFontStyle and l_ReportSubmission_0.entryFontStyle.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_ReportSubmission_0.entryTitleColor and l_ReportSubmission_0.entryTitleColor.Color3, 
                TextSize = l_ReportSubmission_0.entryFontStyle and l_ReportSubmission_0.entryFontStyle.FontSize, 
                LineHeight = l_ReportSubmission_0.entryFontStyle and l_ReportSubmission_0.entryFontStyle.LineHeight, 
                LayoutOrder = 1
            }), 
            Subtitle = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1, 
                Text = v28.humanReadableText, 
                Font = l_ReportSubmission_0.entryFontStyle and l_ReportSubmission_0.entryFontStyle.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_ReportSubmission_0.entryTextColor and l_ReportSubmission_0.entryTextColor.Color3, 
                TextSize = l_ReportSubmission_0.entryFontStyle and l_ReportSubmission_0.entryFontStyle.FontSize, 
                LineHeight = l_ReportSubmission_0.entryFontStyle and l_ReportSubmission_0.entryFontStyle.LineHeight, 
                LayoutOrder = 2
            }), 
            Decoration = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v23), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, {
                Divider = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v24), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    BackgroundColor3 = l_ReportSubmission_0.dividerColor and l_ReportSubmission_0.dividerColor.Color3, 
                    BackgroundTransparency = v25
                })
            })
        })));
    end;
    local v29 = {
        {
            text = v20.cancelText, 
            onActivated = function()
                v17.onCancel(v17);
            end
        }
    };
    local v30;
    if not l_GetFFlagDSAIllegalContentReporting_0() then
        v30 = l_isInDSAFeaturesOverrideList_0();
        if not v30 then
            goto label0;
        end;
    end;
    v30 = false;
    if l_params_0.text ~= "" then
        v30 = l_isSelectedDataDSAIllegalContent_0(v17.report);
    end;
    ::label0::;
    if not v30 then
        table.insert(v29, {
            text = l_params_0.buttonText, 
            buttonType = l_ButtonType_0.PrimarySystem, 
            onActivated = function()
                v17.onSubmit(v17);
            end
        });
    else
        table.insert(v26, (v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 10, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            Text = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(0, 800, 0, 100), 
                BackgroundTransparency = 1, 
                Text = l_params_0.text, 
                TextWrapped = true, 
                Font = l_ReportSubmission_0.entryFontStyle and l_ReportSubmission_0.entryFontStyle.Font, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextColor3 = l_ReportSubmission_0.entryTitleColor and l_ReportSubmission_0.entryTitleColor.Color3, 
                TextSize = l_ReportSubmission_0.entryFontStyle and l_ReportSubmission_0.entryFontStyle.FontSize, 
                LineHeight = l_ReportSubmission_0.entryFontStyle and l_ReportSubmission_0.entryFontStyle.LineHeight, 
                LayoutOrder = 1
            })
        })));
    end;
    return v2.createElement(v9, {
        title = l_params_0.heading, 
        buttons = v29
    }, v4.Dictionary.join({
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    }, v26 or {}));
end;
