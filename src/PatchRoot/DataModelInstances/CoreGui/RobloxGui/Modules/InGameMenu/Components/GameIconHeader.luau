local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_RoactRodux_0 = v0.RoactRodux;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Components.ThemedTextLabel);
local v5 = require(l_Parent_0.Components.GameIcon);
return l_RoactRodux_0.UNSTABLE_connect2(function(v6)
    return {
        gameName = v6.gameInfo.name
    };
end)(function(v7)
    return l_Roact_0.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 148)
    }, {
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 24), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24), 
            PaddingTop = UDim.new(0, 24)
        }), 
        GameIcon = l_Roact_0.createElement(v5, {
            gameId = game.GameId, 
            iconSize = 100
        }), 
        GameName = l_Roact_0.createElement(v4, {
            fontKey = "Title", 
            themeKey = "TextEmphasis", 
            Position = UDim2.new(0, 112, 0, 0), 
            Size = UDim2.new(1, -112, 1, 0), 
            Text = v7.gameName, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top
        })
    });
end);
