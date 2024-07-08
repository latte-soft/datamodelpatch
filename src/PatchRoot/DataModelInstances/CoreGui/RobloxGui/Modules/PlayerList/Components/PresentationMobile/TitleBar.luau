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
local v10 = v2.PureComponent:extend("TitleBar");
v10.validateProps = v4.strictInterface({
    Size = v4.UDim2, 
    Position = v4.optional(v4.UDim2), 
    LayoutOrder = v4.optional(v4.integer), 
    entrySize = v4.integer, 
    contentsVisible = v4.boolean, 
    isSmallTouchDevice = v4.boolean, 
    gameStats = v4.array(v4.strictInterface({
        name = v4.string, 
        text = v4.string, 
        addId = v4.integer, 
        isPrimary = v4.boolean, 
        priority = v4.number
    }))
});
v10.render = function(v11)
    return l_WithLayoutValues_0(function(v12)
        return l_withStyle_0(function(v13)
            local v14 = {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                PlayersHeader = v2.createElement("TextLabel", {
                    LayoutOrder = 0, 
                    Size = UDim2.new(0, v12.PlayerNameSizeXMobile, 1, 0), 
                    Text = v9:FormatByKey("InGame.PlayerList.Players"), 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v13.Font.Footer.Font, 
                    TextSize = v13.Font.BaseSize * v13.Font.Footer.RelativeSize, 
                    TextColor3 = v13.Theme.TextMuted.Color
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 14)
                    })
                })
            };
            local l_MaxLeaderstats_0 = v12.MaxLeaderstats;
            for v16, v17 in ipairs(v11.props.gameStats) do
                if l_MaxLeaderstats_0 >= v16 then
                    v14["Stat_" .. v17.name] = v2.createElement("TextLabel", {
                        LayoutOrder = v16, 
                        Size = UDim2.new(0, v12.StatEntrySizeX, 1, 0), 
                        Text = v8:TranslateGameText(l_CoreGui_0, v17.name), 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Font = v13.Font.Footer.Font, 
                        TextSize = v13.Font.BaseSize * v13.Font.Footer.RelativeSize, 
                        TextTransparency = 0, 
                        TextColor3 = Color3.fromRGB(255, 255, 255), 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    });
                else
                    break;
                end;
            end;
            return v2.createElement("Frame", {
                Size = v11.props.Size, 
                Position = v11.props.Position, 
                LayoutOrder = v11.props.LayoutOrder, 
                Visible = v11.props.contentsVisible, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, v14);
        end);
    end);
end;
return v3.connect(function(v18)
    return {
        isSmallTouchDevice = v18.displayOptions.isSmallTouchDevice
    };
end, nil)(v10);
