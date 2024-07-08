local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.GameTranslator);
local l_WithLayoutValues_0 = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues;
local v7 = require(script.Parent.StatEntry);
local v8 = v2.PureComponent:extend("TeamEntry");
v8.render = function(v9)
    return l_WithLayoutValues_0(function(v10)
        return l_withStyle_0(function(v11)
            local v12 = nil;
            local v13 = nil;
            if not v9.props.teamName then
                v12 = v10.NeutralTeamName;
                v13 = v10.NeutralTeamColor.Color;
            else
                v12 = v5:TranslateGameText(l_CoreGui_0, v9.props.teamName);
                v13 = v9.props.teamColor.Color;
            end;
            local l_Settings_0 = v11.Settings;
            local l_TextEmphasis_0 = v11.Theme.TextEmphasis;
            local v16 = {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                NameFrame = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, v10.PlayerNameSizeXMobile, 1, 0), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = v11.Font.CaptionHeader.Font, 
                    TextSize = v11.Font.CaptionHeader.RelativeSize * v11.Font.BaseSize, 
                    LayoutOrder = 0, 
                    TextColor3 = l_TextEmphasis_0.Color, 
                    TextStrokeTransparency = l_TextEmphasis_0.StrokeTransparency, 
                    TextStrokeColor3 = l_TextEmphasis_0.StrokeColor, 
                    BackgroundTransparency = 1, 
                    Text = v12, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }, {
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v10.TeamEntryTextPaddingMobile)
                    })
                })
            };
            for v17, v18 in ipairs(v9.props.gameStats) do
                if v10.MaxLeaderstats >= v17 then
                    v16["GameStat_" .. v18.name] = v2.createElement(v7, {
                        statValue = v9.props.leaderstats[v18.name], 
                        isTitleEntry = false, 
                        isTeamEntry = true, 
                        textStyle = l_TextEmphasis_0, 
                        layoutOrder = v17
                    });
                else
                    break;
                end;
            end;
            return v2.createElement("Frame", {
                LayoutOrder = v9.props.layoutOrder, 
                Size = UDim2.new(1, 0, 0, v10.TeamEntrySizeY), 
                Position = v9.props.Position, 
                BackgroundTransparency = l_Settings_0.PreferredTransparency * 0.5, 
                BackgroundColor3 = v13, 
                BorderSizePixel = 0
            }, v16);
        end);
    end);
end;
return v3.connect(function(v19)
    return {
        isSmallTouchDevice = v19.displayOptions.isSmallTouchDevice
    };
end, nil)(v8);
