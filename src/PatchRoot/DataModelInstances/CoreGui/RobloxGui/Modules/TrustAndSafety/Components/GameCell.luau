local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.t);
local l_Cell_0 = v2.App.Table.Cell;
local l_CursorKind_0 = v2.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v2.App.SelectionImage.withSelectionCursorProvider;
local v7 = require(script.Parent.Parent.Dependencies);
local v8 = require(v7.GameIcon);
local v9 = require(v7.ThemedTextLabel);
local v10 = require(v7.withLocalization);
local v11 = v1.PureComponent:extend("GameCell");
v11.validateProps = v3.strictInterface({
    gameId = v3.number, 
    layoutOrder = v3.optional(v3.union(v3.integer, v3.table)), 
    onActivated = v3.optional(v3.callback)
});
v11.renderWithSelectionCursor = function(v12, v13)
    local l_props_0 = v12.props;
    return v10({
        labelText = "CoreScripts.InGameMenu.Report.ReportExperience"
    })(function(v15)
        return v1.createElement(l_Cell_0, {
            onActivated = l_props_0.onActivated, 
            SelectionImageObject = v13(l_CursorKind_0.Square), 
            layoutOrder = l_props_0.layoutOrder, 
            size = UDim2.new(1, 0, 0, 72), 
            head = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 72)
            }, {
                GameIcon = v1.createElement(v8, {
                    gameId = l_props_0.gameId, 
                    iconSize = 48, 
                    cornerRadius = UDim.new(0, 8), 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5)
                }), 
                Label = v1.createElement(v9, {
                    fontKey = "Header2", 
                    themeKey = "TextEmphasis", 
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v15.labelText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Position = UDim2.new(0, 54, 0.5, 0)
                })
            }), 
            tail = v1.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, 0, 0, 0), 
                Size = UDim2.new(0, 0, 1, 0)
            })
        });
    end);
end;
v11.render = function(v16)
    return l_withSelectionCursorProvider_0(function(v17)
        return v16:renderWithSelectionCursor(v17);
    end);
end;
return v11;
