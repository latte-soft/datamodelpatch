local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.UIBlox);
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v9 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local function v29(v10)
    local l_ZIndex_0 = v10.ZIndex;
    local l_Position_0 = v10.Position;
    local l_AnchorPoint_0 = v10.AnchorPoint;
    local l_Size_0 = v10.Size;
    local l_LayoutOrder_0 = v10.LayoutOrder;
    local l_onActivated_0 = v10.onActivated;
    local l_icon_0 = v10.icon;
    local l_iconSize_0 = v10.iconSize;
    local v19 = v10.iconPosition or UDim2.new(0.5, 0, 0.5, 0);
    local v20 = v10.iconAnchorPoint or Vector2.new(0.5, 0.5);
    local l_iconColor_0 = v10.iconColor;
    local l_iconTransparency_0 = v10.iconTransparency;
    local l_useUIBloxImageSet_0 = v10.useUIBloxImageSet;
    local v24 = v10[v3.Children];
    local v25 = v10[v3.Change.AbsolutePosition];
    local v26 = not not l_useUIBloxImageSet_0 and l_ImageSetLabel_0 or v9;
    local l_forwardRef_0 = v10.forwardRef;
    return l_withSelectionCursorProvider_0(function(v28)
        return v3.createElement(l_Focusable_0.TextButton, {
            ZIndex = l_ZIndex_0, 
            Position = l_Position_0, 
            AnchorPoint = l_AnchorPoint_0, 
            Size = l_Size_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            Text = "", 
            [v3.Event.Activated] = l_onActivated_0, 
            [v3.Change.AbsolutePosition] = v25, 
            [v3.Ref] = l_forwardRef_0, 
            NextSelectionLeft = v10.NextSelectionLeft, 
            NextSelectionRight = v10.NextSelectionRight, 
            NextSelectionUp = v10.NextSelectionUp, 
            NextSelectionDown = v10.NextSelectionDown, 
            inputBindings = v10.inputBindings, 
            SelectionImageObject = v28(l_CursorKind_0.RoundedRectNoInset)
        }, {
            NavigationButton = v3.createElement(v26, {
                Size = UDim2.new(0, l_iconSize_0, 0, l_iconSize_0), 
                Position = v19, 
                AnchorPoint = v20, 
                Image = l_icon_0, 
                ImageColor3 = l_iconColor_0, 
                ImageTransparency = l_iconTransparency_0, 
                BackgroundTransparency = 1
            }, v24)
        });
    end);
end;
return v3.forwardRef(function(v30, v31)
    return v3.createElement(v29, v2.Dictionary.join(v30, {
        forwardRef = v31
    }));
end);
