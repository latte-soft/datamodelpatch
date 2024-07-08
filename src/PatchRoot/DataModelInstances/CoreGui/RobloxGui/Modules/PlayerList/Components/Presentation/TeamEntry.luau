local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.GameTranslator);
local l_WithLayoutValues_0 = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues;
local v7 = require(script.Parent.EntryFrame);
local v8 = require(script.Parent.StatEntry);
local v9 = require(script.Parent.CellExtender);
local v10 = v2.PureComponent:extend("TeamEntry");
v10.render = function(v11)
    return l_WithLayoutValues_0(function(v12)
        return l_withStyle_0(function(v13)
            local l_NeutralTeamName_0 = v12.NeutralTeamName;
            local l_Color_0 = v12.NeutralTeamColor.Color;
            if v11.props.teamName then
                l_NeutralTeamName_0 = v5:TranslateGameText(l_CoreGui_0, v11.props.teamName);
                l_Color_0 = v11.props.teamColor.Color;
            end;
            local v16 = nil;
            v16 = if v12.IsTenFoot then {
                Color = l_Color_0, 
                Transparency = v12.BackgroundStyle.Default.Transparency
            } else if v11.props.teamColor then {
                Color = v11.props.teamColor.Color, 
                Transparency = v12.TeamEntryBackgroundTransparency * v13.Settings.PreferredTransparency
            } else v13.Theme.Divider;
            local v17 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            local v18 = nil;
            v18 = if not v12.IsTenFoot then v13.Theme.TextEmphasis else v12.DefaultTextStyle;
            local l_entrySize_0 = v11.props.entrySize;
            local v20 = nil;
            local v21 = nil;
            if v12.IsTenFoot then
                v20 = v12.PlayerNameTextSize;
                v21 = v12.TeamEntryFont;
            else
                v20 = v13.Font.CaptionHeader.RelativeSize * v13.Font.BaseSize;
                v21 = v13.Font.CaptionHeader.Font;
            end;
            local v22 = {};
            local v23 = nil;
            if v12.IsTenFoot then
                v23 = UDim.new(0, v12.PlayerEntryPadding);
            end;
            v22.Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = v23
            });
            v22.NameFrame = v2.createElement("Frame", {
                LayoutOrder = 0, 
                Size = UDim2.new(0, l_entrySize_0, 0, v12.TeamEntrySizeY), 
                BackgroundTransparency = 1
            }, {
                Shadow = v2.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v12.ShadowImage, 
                    Position = UDim2.new(0, -v12.ShadowSize, 0, 0), 
                    Size = UDim2.new(1, v12.ShadowSize * 2, 1, v12.ShadowSize), 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v12.ShadowSliceRect, 
                    Visible = v12.IsTenFoot
                }), 
                BGFrame = v2.createElement(v7, {
                    sizeX = l_entrySize_0, 
                    sizeY = v12.TeamEntrySizeY, 
                    isTeamFrame = true, 
                    backgroundStyle = v16, 
                    overlayStyle = v17, 
                    doubleOverlay = false
                }, {
                    TeamName = v2.createElement("TextLabel", {
                        Position = UDim2.new(0, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Font = v21, 
                        TextSize = v20, 
                        TextColor3 = v18.Color, 
                        TextStrokeTransparency = v18.StrokeTransparency, 
                        TextStrokeColor3 = v18.StrokeColor, 
                        BackgroundTransparency = 1, 
                        Text = l_NeutralTeamName_0, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    }, {
                        v2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v12.TeamEntryTextPadding)
                        })
                    })
                })
            });
            local l_MaxLeaderstats_0 = v12.MaxLeaderstats;
            if v11.props.isSmallTouchDevice then
                l_MaxLeaderstats_0 = v12.MaxLeaderstatsSmallScreen;
            end;
            for v25, v26 in ipairs(v11.props.gameStats) do
                if l_MaxLeaderstats_0 >= v25 then
                    v22["gameStat_" .. v26.name] = v2.createElement(v8, {
                        statName = v26.name, 
                        statValue = v11.props.leaderstats[v26.name], 
                        isTitleEntry = false, 
                        isTeamEntry = true, 
                        layoutOrder = v25, 
                        backgroundStyle = v16, 
                        overlayStyle = v17, 
                        doubleOverlay = false, 
                        textStyle = v18
                    });
                else
                    break;
                end;
            end;
            if not v12.IsTenFoot then
                v22.BackgroundExtender = v2.createElement(v9, {
                    layoutOrder = 100, 
                    size = UDim2.new(0, v12.ExtraContainerPadding, 1, 0), 
                    backgroundStyle = v16, 
                    overlayStyle = v17, 
                    doubleOverlay = false
                });
            end;
            return v2.createFragment(v22);
        end);
    end);
end;
return v3.UNSTABLE_connect2(function(v27)
    return {
        isSmallTouchDevice = v27.displayOptions.isSmallTouchDevice
    };
end, nil)(v10);
