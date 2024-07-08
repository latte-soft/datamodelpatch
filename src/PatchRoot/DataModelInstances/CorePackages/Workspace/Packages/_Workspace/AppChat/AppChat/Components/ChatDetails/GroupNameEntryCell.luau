local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = if not v2.Flags.getFFlagDeprecatedSocialLibrariesCells() then v2.Components.Cells.IconWithTextCell else require(l_script_FirstAncestor_0.Components.Cells.IconWithTextCell);
local v7 = {
    groupNameText = "groupName", 
    iconImage = nil, 
    onActivated = nil, 
    LayoutOrder = 1, 
    iconCellWidth = 60, 
    isDisabled = false, 
    cellHeight = 36, 
    style = nil
};
GroupNameEntryCell = function(v8)
    local v9 = v3.Dictionary.join(v7, v8);
    local v10 = not v9.isDisabled and 0 or v9.style.Tokens.Global.Size_150;
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v9.LayoutOrder, 
        Size = UDim2.fromScale(1, 0)
    }, {
        padding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v10), 
            PaddingBottom = UDim.new(0, 12)
        })
    }, {
        IconWithText = v4.createElement(v6, {
            primaryIcon = if not v9.isDisabled then v9.iconImage else nil, 
            Text = v9.groupNameText, 
            iconCellWidth = v9.iconCellWidth, 
            showDivider = false, 
            isDisabled = v9.isDisabled, 
            onActivated = v9.onActivated, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, -v10, 0, v9.cellHeight), 
            style = v9.style
        })
    });
end;
return l_memo_0(GroupNameEntryCell);
