local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local l_StyledTextLabel_0 = require(l_CorePackages_0.UIBlox).App.Text.StyledTextLabel;
local _ = require(l_Modules_0.LuaApp.Components.Moderation.ModerationContentSection);
return function(v5)
    local l_badUtterances_0 = v5.badUtterances;
    local l_localizationTable_0 = v5.localizationTable;
    local l_stylePalette_0 = v5.stylePalette;
    local l_LayoutOrder_0 = v5.LayoutOrder;
    local l_Font_0 = l_stylePalette_0.Font;
    local l_Theme_0 = l_stylePalette_0.Theme;
    if #l_badUtterances_0 ~= 0 then
        local v12 = {
            uiListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 24)
            })
        };
        for v13, v14 in l_badUtterances_0, nil, nil do
            table.insert(v12, (v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v13
            }, {
                UtteranceListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 12)
                }), 
                AbuseTypeTitle = v2.createElement(l_StyledTextLabel_0, {
                    text = l_localizationTable_0.ReasonTitle, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextDefault, 
                    layoutOrder = 1, 
                    size = UDim2.fromScale(1, 0), 
                    automaticSize = Enum.AutomaticSize.Y
                }), 
                AbuseTypeText = v2.createElement(l_StyledTextLabel_0, {
                    text = l_localizationTable_0[v14.abuseType] or l_localizationTable_0.ABUSE_TYPE_OTHER, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    layoutOrder = 2, 
                    size = UDim2.fromScale(1, 0), 
                    automaticSize = Enum.AutomaticSize.Y
                }), 
                UtteranceTextTitle = v2.createElement(l_StyledTextLabel_0, {
                    text = l_localizationTable_0.OffensiveItemTitle, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextDefault, 
                    layoutOrder = 3, 
                    size = UDim2.fromScale(1, 0), 
                    automaticSize = Enum.AutomaticSize.Y
                }), 
                UtteranceText = v2.createElement(l_StyledTextLabel_0, {
                    text = v14.utteranceText, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    layoutOrder = 4, 
                    size = UDim2.fromScale(1, 0), 
                    automaticSize = Enum.AutomaticSize.Y
                })
            })));
        end;
        return v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0
        }, v12);
    else
        return nil;
    end;
end;
