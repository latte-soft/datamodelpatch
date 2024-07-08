local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.FullViewIndicator);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Components.RobuxBalance);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v9 = require(l_Modules_0.AvatarExperience.Common.Hooks.useQuickMenuAvailable);
local v10 = require(script.Parent.QuickMenuButton);
local v11 = v4.PureComponent:extend("SceneUIContainer");
v11.defaultProps = {
    isVisible = true
};
v11.init = function(v12)
    v12.robuxBalanceRef = v4.createRef();
    v12.quickMenuRef = v4.createRef();
end;
v11.renderRobloxBalanceContainer = function(v13)
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        LayoutOrder = 2
    }, {
        RobuxBalance = v4.createElement(v7, {
            [v4.Ref] = v13.robuxBalanceRef, 
            NextSelectionLeft = v13.quickMenuRef
        })
    });
end;
v11.getRow1Children = function(v14)
    local l_row1ChildrenVisible_0 = v14.props.row1ChildrenVisible;
    return {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 5)
        }), 
        QuickMenuButton = if not not v14.props.showQuickMenuButton and l_row1ChildrenVisible_0 then v4.createElement(v10, {
            [v4.Ref] = v14.quickMenuRef, 
            NextSelectionRight = v14.robuxBalanceRef
        }) else nil, 
        RobuxBalanceContainer = l_row1ChildrenVisible_0 and v14:renderRobloxBalanceContainer()
    };
end;
v11.render = function(v16)
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 72), 
        Position = UDim2.new(0, -12, 0, 4), 
        Visible = v16.props.isVisible, 
        [v4.Ref] = v16.props.forwardRef, 
        restorePreviousChildFocus = true, 
        defaultChild = v16.quickMenuRef
    }, {
        Row1 = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 36)
        }, v16:getRow1Children()), 
        FullViewIndicator = v4.createElement(v6, {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 40)
        })
    });
end;
return v4.forwardRef(function(v17, v18)
    return v4.createElement(v11, v3.Dictionary.join(v17, {
        forwardRef = v18, 
        showQuickMenuButton = v9()
    }));
end);
