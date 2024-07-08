local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = if not v2.Flags.getFFlagDeprecatedSocialLibrariesCells() then v2.Components.Cells.IconWithTextCell else require(l_script_FirstAncestor_0.Components.Cells.IconWithTextCell);
local l_RoactFitComponents_0 = require(l_Parent_0.LuaSocialLibrariesDeps).RoactFitComponents;
local v8 = {
    leaveGroupText = "leaveGroupText", 
    onActivated = nil, 
    iconImage = nil, 
    cellHeight = 64, 
    iconCellWidth = 60, 
    marginTop = 12, 
    LayoutOrder = 0, 
    style = nil
};
LeaveGroupCell = function(v9)
    local v10 = v3.Dictionary.join(v8, v9);
    return v4.createElement(l_RoactFitComponents_0.FitFrameVertical, {
        BackgroundTransparency = 1, 
        LayoutOrder = v10.LayoutOrder, 
        width = UDim.new(1, 0), 
        margin = {
            top = v10.marginTop, 
            left = 0, 
            right = 0, 
            bottom = 0
        }
    }, {
        LeaveGroupRow = v4.createElement(v6, {
            LayoutOrder = v10.LayoutOrder, 
            onActivated = v10.onActivated, 
            primaryIcon = v10.iconImage, 
            showDivider = false, 
            Size = UDim2.new(1, 0, 0, v10.cellHeight), 
            style = v10.style, 
            Text = v10.leaveGroupText, 
            iconCellWidth = v10.iconCellWidth
        })
    });
end;
return l_memo_0(LeaveGroupCell);
