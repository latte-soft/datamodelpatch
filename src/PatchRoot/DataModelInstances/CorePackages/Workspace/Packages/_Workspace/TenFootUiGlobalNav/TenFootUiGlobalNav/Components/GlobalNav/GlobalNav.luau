local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiGlobalNav");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Style);
local v6 = require(l_script_FirstAncestor_0.Components.GlobalNavOptionGroup);
local v7 = require(l_script_FirstAncestor_0.Components.utils.eraseKeys);
local l_IconTabGroup_0 = v4.App.Navigation.PrimaryNavBar.IconTabGroup;
local l_useDesignTokens_0 = v5.useDesignTokens;
local v12 = v3.forwardRef(function(v10, v11)
    return v3.createElement("CanvasGroup", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        GroupTransparency = v10.GroupTransparency, 
        ref = v11
    }, v3.createElement("Frame", v2.Dictionary.join({
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0, 0.5), 
        BackgroundTransparency = 1
    }, (v7({
        "children", 
        "GroupTransparency"
    }, v10))), v10.children));
end);
return (v3.forwardRef(function(v13, v14)
    local v16 = l_useDesignTokens_0(function(v15)
        return v15.Global.Space_800;
    end);
    local v18 = l_useDesignTokens_0(function(v17)
        return v17.Global.Size_100;
    end);
    local v19 = v7({
        "optionGroupProps", 
        "tabGroupProps", 
        "animationProps"
    }, v13);
    local v20 = nil;
    local v21 = nil;
    if v13.tabGroupProps then
        v20 = v3.createElement(v12, {
            GroupTransparency = v13.animationProps.tabGroupTransparency, 
            ref = v13.animationProps.tabGroupRef
        }, v3.createElement(l_IconTabGroup_0, v13.tabGroupProps));
    end;
    if v13.optionGroupProps then
        v21 = v3.createElement(v12, {
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            GroupTransparency = v13.animationProps.optionGroupTransparency, 
            ref = v13.animationProps.optionGroupRef
        }, v3.createElement(v6, v2.Dictionary.join(v13.optionGroupProps, {
            AnchorPoint = Vector2.new(1, 0), 
            spacing = v18
        })));
    end;
    return v3.createElement("Frame", v2.Dictionary.join({
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ref = v14
    }, v19), v3.createElement("UIPadding", {
        PaddingRight = UDim.new(0, v16), 
        PaddingLeft = UDim.new(0, v16)
    }), {
        TabGroup = v20, 
        OptionGroup = v21
    });
end));
