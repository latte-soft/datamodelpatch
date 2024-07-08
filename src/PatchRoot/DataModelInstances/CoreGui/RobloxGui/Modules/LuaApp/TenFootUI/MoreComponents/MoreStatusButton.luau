local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.UIBlox);
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_Interactable_0 = v4.Core.Control.Interactable;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v10 = require(script.Parent.MoreText);
local l_SubheaderText_0 = v10.SubheaderText;
local l_BodyText_0 = v10.BodyText;
return (v3.forwardRef(function(v13, v14)
    local v15 = l_useDesignTokens_0();
    local l_Space_300_0 = v15.Global.Space_300;
    local l_Size_400_0 = v15.Global.Size_400;
    return v3.createElement(l_Interactable_0, {
        ref = v14, 
        LayoutOrder = v13.layoutOrder, 
        Size = UDim2.new(1, 0, 0, v15.Global.Size_700), 
        BackgroundTransparency = 1, 
        SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect), 
        [v3.Event.Activated] = v13.onActivated, 
        onStateChanged = v2.noop
    }, {
        TitleFrame = v3.createElement("Frame", {
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            Title = v3.createElement(l_SubheaderText_0, {
                layoutOrder = 1, 
                text = v13.title
            })
        }), 
        StatusFrame = v3.createElement("Frame", {
            Position = UDim2.new(1, -l_Space_300_0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            Icon = if not v13.icon then nil else v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v13.icon, 
                ImageColor3 = v15.Semantic.Color.Icon.Default.Color3, 
                ImageTransparency = v15.Semantic.Color.Icon.Default.Transparency, 
                Size = UDim2.fromOffset(l_Size_400_0, l_Size_400_0)
            }), 
            Status = if not v13.status then nil else v3.createElement(l_BodyText_0, {
                text = v13.status, 
                TextXAlignment = Enum.TextXAlignment.Right
            })
        })
    });
end));
