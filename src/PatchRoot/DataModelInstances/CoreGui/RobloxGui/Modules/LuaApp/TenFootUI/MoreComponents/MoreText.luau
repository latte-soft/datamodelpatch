local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local function v11(v5)
    local v6 = l_useDesignTokens_0();
    local v7 = UDim.new(0, v6.Global.Space_300);
    local v8 = v6.Semantic.Typography[v5.type];
    local v9 = if not v5.emphasis then v6.Semantic.Color.Text.Default else v6.Semantic.Color.Text.Emphasis;
    local v10 = v5.padding or v7;
    return v3.createElement("Frame", {
        LayoutOrder = v5.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = v10, 
            PaddingRight = v10
        }), 
        Text = v3.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v5.text, 
            Font = v8.Font, 
            LayoutOrder = 1, 
            TextColor3 = v9.Color3, 
            TextTransparency = v9.Transparency, 
            TextSize = v8.FontSize, 
            TextWrapped = true, 
            TextXAlignment = v5.TextXAlignment or Enum.TextXAlignment.Left, 
            TextYAlignment = v5.TextYAlignment or Enum.TextYAlignment.Center, 
            Size = v5.size or UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v6.Global.Opacity_0
        })
    });
end;
return {
    HeaderText = function(v12)
        return v3.createElement(v11, v2.join(v12, {
            type = "Header", 
            emphasis = true, 
            padding = UDim.new(0, 0)
        }));
    end, 
    SubheaderText = function(v13)
        return v3.createElement(v11, v2.join(v13, {
            type = "Subheader", 
            emphasis = true
        }));
    end, 
    BodyText = function(v14)
        return v3.createElement(v11, v2.join(v14, {
            type = "Body", 
            emphasis = false
        }));
    end, 
    BoldBodyText = function(v15)
        return v3.createElement(v11, v2.join(v15, {
            type = "Header", 
            emphasis = false
        }));
    end
};
