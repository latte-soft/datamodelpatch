local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadBottomBarElement);
local v7 = {
    [Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", 
    [Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", 
    [Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", 
    [Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY.png", 
    [Enum.KeyCode.ButtonL3] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonL3.png", 
    [Enum.KeyCode.ButtonR3] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonR3.png", 
    [Enum.KeyCode.Thumbstick1] = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Directional.png", 
    [Enum.KeyCode.Thumbstick2] = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Directional.png"
};
local v8 = {
    [Enum.KeyCode.Thumbstick1] = {
        vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Vertical.png", 
        horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Horizontal.png"
    }, 
    [Enum.KeyCode.Thumbstick2] = {
        vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Vertical.png", 
        horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Horizontal.png"
    }
};
local v9 = {
    ["Feature.Catalog.Action.ItemOptions"] = 1, 
    ["CommonUI.Messages.Action.Apply"] = 1, 
    ["CommonUI.Messages.Action.Reset"] = 2, 
    ["Feature.Catalog.Action.OpenDetails"] = 2, 
    ["Feature.Catalog.Action.CloseDetails"] = 2, 
    ["Feature.Catalog.Action.Buy"] = 3, 
    ["Feature.Avatar.Heading.WearConfirmation"] = 4, 
    ["CommonUI.Controls.Action.Confirm"] = 5, 
    ["Feature.Catalog.Action.Remove"] = 6, 
    ["Feature.Avatar.Title.Move"] = 7, 
    ["Feature.Avatar.Action.Pan"] = 1, 
    ["Feature.Avatar.Action.Zoom"] = 2, 
    ["Feature.Avatar.Action.Rotate"] = 3, 
    ["Feature.Avatar.Action.DefaultView"] = 4
};
local v10 = v3.PureComponent:extend("GamepadBottomBarContent");
v10.validateProps = v5.strictInterface({
    boundInputs = v5.table, 
    width = v5.number
});
v10.renderElements = function(v11, v12, v13)
    local l_width_0 = v11.props.width;
    local v15 = {};
    local v16 = #v12;
    if v16 > 0 and l_width_0 > 0 then
        local v17 = ((l_width_0 - 36 * (v16 - 1)) - 24) / v16;
        for v18 = 1, v16 do
            local v19 = v12[v18];
            local v20 = v13[v18];
            v15[v18] = v3.createElement(v6, {
                elementIcon = v20.elementIcon, 
                elementText = v19, 
                layoutOrder = v20.layoutOrder, 
                disabled = v20.disabled, 
                width = v17
            });
        end;
    end;
    return v3.createFragment(v15);
end;
v10.render = function(v21)
    local l_boundInputs_0 = v21.props.boundInputs;
    local v23 = {};
    local v24 = {};
    if l_boundInputs_0 then
        for v25, v26 in l_boundInputs_0, nil, nil do
            if typeof(v26) == "table" and v25 ~= Enum.KeyCode.ButtonB then
                if not v26.axes then
                    if v26.key then
                        table.insert(v23, v26.key);
                        table.insert(v24, {
                            elementIcon = v7[v25], 
                            layoutOrder = v9[v26.key] or 0, 
                            disabled = v26.disabled
                        });
                    end;
                else
                    local l_vertical_0 = v26.axes.vertical;
                    local l_horizontal_0 = v26.axes.horizontal;
                    local v29 = v8[v25];
                    if l_vertical_0 then
                        table.insert(v23, l_vertical_0.key);
                        table.insert(v24, {
                            elementIcon = v29.vertical, 
                            layoutOrder = v9[l_vertical_0.key] or 0, 
                            disabled = l_vertical_0.disabled
                        });
                    end;
                    if l_horizontal_0 then
                        table.insert(v23, l_horizontal_0.key);
                        table.insert(v24, {
                            elementIcon = v29.horizontal, 
                            layoutOrder = v9[l_horizontal_0.key] or 0, 
                            disabled = l_horizontal_0.disabled
                        });
                    end;
                end;
            end;
        end;
    end;
    return l_withLocalization_0(v23)(function(v30)
        return v21:renderElements(v30, v24);
    end);
end;
return v10;
