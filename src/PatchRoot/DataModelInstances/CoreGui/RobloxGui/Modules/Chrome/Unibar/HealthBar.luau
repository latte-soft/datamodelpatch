local v0 = require(game:GetService("CorePackages").Packages.React);
local v1 = require(script.Parent.Constants);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Hooks.useHealthBinding);
local v4 = require(l_Parent_0.Hooks.useCoreGuiEnabled);
local v5 = require(l_Parent_0.Hooks.useChromeMenuStatus);
local v6 = require(l_Parent_0.Service);
local function _(v7)
    return (Vector3.new(v7.R, v7.G, v7.B));
end;
local v9 = {};
local l_RED_0 = v1.HEALTH.RED;
v9[Vector3.new(l_RED_0.R, l_RED_0.G, l_RED_0.B)] = v1.HEALTH.RED_THRESHOLD;
l_RED_0 = v1.HEALTH.YELLOW;
v9[Vector3.new(l_RED_0.R, l_RED_0.G, l_RED_0.B)] = v1.HEALTH.YELLOW_THRESHOLD;
l_RED_0 = v1.HEALTH.GREEN;
v9[Vector3.new(l_RED_0.R, l_RED_0.G, l_RED_0.B)] = v1.HEALTH.GREEN_THRESHOLD;
local function v19(v11)
    if v11 <= v1.HEALTH.RED_THRESHOLD then
        return v1.HEALTH.RED;
    elseif v1.HEALTH.GREEN_THRESHOLD <= v11 then
        return v1.HEALTH.GREEN;
    else
        local v12 = Vector3.new(0, 0, 0);
        local v13 = 0;
        for v14, v15 in pairs(v9) do
            local v16 = v11 - v15;
            if v16 == 0 then
                return Color3.new(v14.X, v14.Y, v14.Z);
            else
                local v17 = 1 / (v16 * v16);
                v12 = v12 + v17 * v14;
                v13 = v13 + v17;
            end;
        end;
        local v18 = v12 / v13;
        return Color3.new(v18.X, v18.Y, v18.Z);
    end;
end;
HealthBar = function(v20)
    local v21 = v3();
    return v0.createElement("Frame", {
        Name = "HealthBar", 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.new(0, 0, 1, -1), 
        Size = v21:map(function(v22)
            return UDim2.new(v22, (v1.ICON_CELL_WIDTH / 4) * ((0.5 - v22) * 2), 0, 2);
        end), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Visible = v21:map(function(v23)
            return v23 < 1;
        end)
    }, {
        v0.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = v20.size, 
            BackgroundColor3 = v21:map(v19)
        }, {
            v0.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        })
    });
end;
HealthBarToggled = function(v24)
    local v25 = v5() == v6.MenuStatus.Open;
    if not v4(Enum.CoreGuiType.Health) or not v25 then
        return nil;
    else
        return v0.createElement(HealthBar, v24);
    end;
end;
return HealthBarToggled;
