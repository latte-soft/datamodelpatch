local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_ExpandableTextArea_0 = v5.App.Text.ExpandableTextArea;
local l_ShimmerPanel_0 = v5.App.Loading.ShimmerPanel;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local v14 = v7.wrap(v6.strictInterface({
    compactNumberOfLines = v6.optional(v6.integer), 
    descriptionText = v6.optional(v6.string), 
    width = v6.optional(v6.integer), 
    Position = v6.optional(v6.UDim2), 
    LayoutOrder = v6.optional(v6.integer), 
    forwardRef = v6.optional(v6.table), 
    NextSelectionUp = if not v13() then nil else v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table)
}));
local function v26(v15, v16, v17)
    local v18 = v17.compactNumberOfLines or 3;
    local l_descriptionText_0 = v17.descriptionText;
    local l_Position_0 = v17.Position;
    local l_LayoutOrder_0 = v17.LayoutOrder;
    local v22 = if not v13() then nil else v17.NextSelectionUp;
    local l_NextSelectionDown_0 = v17.NextSelectionDown;
    if not l_descriptionText_0 then
        local l_Font_0 = v15.Font;
        local v25 = v18 * (l_Font_0.BaseSize * l_Font_0.Body.RelativeSize) + 5;
        return v3.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v25 + 30), 
            NextSelectionUp = v22, 
            NextSelectionDown = l_NextSelectionDown_0, 
            SelectionImageObject = v16
        }, {
            ShimmerPanel = v3.createElement(l_ShimmerPanel_0, {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v25)
            })
        });
    else
        return v3.createElement(l_ExpandableTextArea_0, {
            LayoutOrder = l_LayoutOrder_0, 
            Position = l_Position_0, 
            Text = l_descriptionText_0, 
            compactNumberOfLines = v18, 
            NextSelectionUp = v22, 
            NextSelectionDown = l_NextSelectionDown_0
        });
    end;
end;
local function v32(v27)
    assert(v14(v27));
    local l_LayoutOrder_1 = v27.LayoutOrder;
    local l_forwardRef_0 = v27.forwardRef;
    local v30 = l_useStyle_0();
    local v31 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    return v3.createElement(l_Focusable_0.Frame, {
        LayoutOrder = l_LayoutOrder_1, 
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        [v3.Ref] = l_forwardRef_0, 
        NextSelectionDown = v27.NextSelectionDown, 
        SelectionImageObject = v31
    }, {
        v26(v30, v31, v27)
    });
end;
return v3.forwardRef(function(v33, v34)
    return v3.createElement(v32, v2.Dictionary.join(v33, {
        forwardRef = v34
    }));
end);
