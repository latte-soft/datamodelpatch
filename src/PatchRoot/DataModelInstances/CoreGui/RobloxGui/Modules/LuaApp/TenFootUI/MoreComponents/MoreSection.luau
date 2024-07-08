local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_HeaderText_0 = require(script.Parent.MoreText).HeaderText;
local v6 = {
    withDivider = true
};
return function(v7)
    local v8 = l_useDesignTokens_0();
    local l_Divider_0 = v8.Semantic.Color.Common.Divider;
    return v3.createElement("Frame", {
        LayoutOrder = v7.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, v2.assign({
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v8.Global.Space_200)
        }), 
        Title = v3.createElement(l_HeaderText_0, {
            layoutOrder = -1, 
            text = v7.title
        }), 
        Divider = if not if type(v7.withDivider) == "boolean" then v7.withDivider else v6.withDivider then nil else v3.createElement("Frame", {
            LayoutOrder = 10000000, 
            BackgroundColor3 = l_Divider_0.Color3, 
            BackgroundTransparency = l_Divider_0.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1)
        })
    }, v7.children));
end;
