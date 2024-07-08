local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v6 = require(l_script_FirstAncestor_0.Components.Cells.IconWithTextCell);
local v7 = {
    bodyText = "Placeholder body", 
    iconImage = nil, 
    cellHeight = 64, 
    onActivated = function()
    end
};
return function(v8)
    local v9 = v3.Dictionary.join(v7, v8);
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v9.layoutOrder, 
        Size = UDim2.fromScale(1, 0)
    }, {
        CreateUnfilteredChatRow = v4.createElement(v6, {
            LayoutOrder = v9.layoutOrder, 
            onActivated = v9.onActivated, 
            primaryIcon = v9.iconImage, 
            showDivider = false, 
            Size = UDim2.new(1, 0, 0, v9.cellHeight), 
            style = v9.style or l_useStyle_0(), 
            Text = v9.bodyText, 
            iconCellWidth = 72
        })
    });
end;
