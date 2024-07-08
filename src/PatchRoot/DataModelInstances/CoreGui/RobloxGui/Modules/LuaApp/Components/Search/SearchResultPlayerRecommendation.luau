local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_withStyle_0 = require(game:GetService("CorePackages").UIBlox).Style.withStyle;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.FitTextButton);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local v5 = require(l_Modules_0.LuaApp.Components.LocalizedFitTextLabel);
local v6 = require(l_Modules_0.LuaApp.Components.Search.DoPlayerSearch);
local v7 = v2.PureComponent:extend("GamesSearchForPlayers");
v7.init = function(v8)
    v8.onPlayerSearchButtonActivated = function()
        v6(v8.props.analytics, v8.props.guiService, v8.props.keyword, v8.props.openWebview, v8.props.localization, "CommonUI.Features.Label.Players");
    end;
end;
v7.render = function(v9)
    local l_keyword_0 = v9.props.keyword;
    local l_layoutOrder_0 = v9.props.layoutOrder;
    return l_withStyle_0(function(v12)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 18), 
            LayoutOrder = l_layoutOrder_0
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 2)
            }), 
            PlayerSearchTitleText = v2.createElement(v5, {
                Text = "Feature.GamePage.LabelSearchInsteadForPlayersNamed", 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 0, 1, 0), 
                BackgroundTransparency = 1, 
                TextSize = v12.Font.Body.RelativeSize * v12.Font.BaseSize, 
                Font = v12.Font.Body.Font, 
                TextColor3 = v12.Theme.TextDefault.Color, 
                TextTransparency = v12.Theme.TextDefault.Transparency, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                fitAxis = v4.FitAxis.Width
            }), 
            PlayerSearchKeyword = v2.createElement(v3, {
                Text = l_keyword_0, 
                LayoutOrder = 2, 
                Size = UDim2.new(0, 0, 1, 0), 
                BackgroundTransparency = 1, 
                TextSize = v12.Font.Body.RelativeSize * v12.Font.BaseSize, 
                Font = v12.Font.Body.Font, 
                TextColor3 = v12.Theme.TextEmphasis.Color, 
                TextTransparency = v12.Theme.TextEmphasis.Transparency, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                fitAxis = v4.FitAxis.Width, 
                [v2.Event.Activated] = v9.onPlayerSearchButtonActivated
            }, {
                Underline = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, -1), 
                    BackgroundColor3 = v12.Theme.TextEmphasis.Color, 
                    BackgroundTransparency = v12.Theme.TextEmphasis.Transparency
                })
            })
        });
    end);
end;
return v7;
