local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_WithLayoutValues_0 = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v8 = require(l_RobloxGui_0.Modules.GameTranslator);
local v9 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v10 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local v11 = v2.PureComponent:extend("TitleBar");
v11.validateProps = v4.strictInterface({
    Size = v4.UDim2, 
    LayoutOrder = v4.integer, 
    entrySize = v4.integer, 
    contentsVisible = v4.boolean, 
    backgroundTransparency = v4.union(v4.number, v4.table), 
    isSmallTouchDevice = v4.boolean, 
    gameStats = v4.array(v4.strictInterface({
        name = v4.string, 
        text = v4.string, 
        addId = v4.integer, 
        isPrimary = v4.boolean, 
        priority = v4.number
    }))
});
v11.render = function(v12)
    return l_WithLayoutValues_0(function(v13)
        return l_withStyle_0(function(v14)
            local v15 = {
                layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                playersHeader = v2.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, v12.props.entrySize, 1, 0), 
                    Text = v9:FormatByKey("InGame.PlayerList.Players"), 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v14.Font.Footer.Font, 
                    TextSize = v14.Font.BaseSize * v14.Font.Footer.RelativeSize, 
                    TextTransparency = v14.Theme.TextMuted.Transparency, 
                    TextColor3 = v14.Theme.TextMuted.Color
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 15)
                    })
                })
            };
            local l_MaxLeaderstats_0 = v13.MaxLeaderstats;
            if v12.props.isSmallTouchDevice then
                l_MaxLeaderstats_0 = v13.MaxLeaderstatsSmallScreen;
            end;
            for v17, v18 in ipairs(v12.props.gameStats) do
                if l_MaxLeaderstats_0 >= v17 then
                    v15["stat_" .. v18.name] = v2.createElement("TextLabel", {
                        LayoutOrder = v17 + 1, 
                        Size = UDim2.new(0, v13.StatEntrySizeX, 1, 0), 
                        Text = v8:TranslateGameText(l_CoreGui_0, v18.name), 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Font = v14.Font.Footer.Font, 
                        TextSize = v14.Font.BaseSize * v14.Font.Footer.RelativeSize, 
                        TextTransparency = v14.Theme.TextMuted.Transparency, 
                        TextColor3 = v14.Theme.TextMuted.Color, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    });
                else
                    break;
                end;
            end;
            return v2.createElement("Frame", {
                Size = v12.props.Size, 
                LayoutOrder = v12.props.LayoutOrder, 
                BackgroundTransparency = v12.props.backgroundTransparency, 
                BackgroundColor3 = if not v10() then v14.Theme.BackgroundContrast.Color else v14.Theme.BackgroundUIContrast.Color, 
                BorderSizePixel = 0
            }, {
                Divider = v2.createElement("Frame", {
                    Visible = v12.props.contentsVisible, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = v14.Theme.Divider.Transparency, 
                    BackgroundColor3 = v14.Theme.Divider.Color, 
                    BorderSizePixel = 0
                }), 
                ChildrenFrame = v2.createElement("Frame", {
                    Visible = v12.props.contentsVisible, 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 0, 0, -2), 
                    Size = UDim2.new(1, 0, 1, 0)
                }, v15)
            });
        end);
    end);
end;
return v3.UNSTABLE_connect2(function(v19)
    return {
        isSmallTouchDevice = v19.displayOptions.isSmallTouchDevice
    };
end, nil)(v11);
