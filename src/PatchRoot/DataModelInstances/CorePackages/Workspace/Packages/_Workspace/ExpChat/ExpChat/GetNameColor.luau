local l_Players_0 = game:GetService("Players");
local v1 = {
    Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157), 
    Color3.new(0.00392156862745098, 0.6352941176470588, 1), 
    Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353), 
    BrickColor.new("Alder").Color, 
    BrickColor.new("Bright orange").Color, 
    BrickColor.new("Bright yellow").Color, 
    BrickColor.new("Light reddish violet").Color, 
    BrickColor.new("Brick yellow").Color
};
local function v7(v2)
    local v3 = 0;
    for v4 = 1, #v2 do
        local v5 = string.byte((string.sub(v2, v4, v4)));
        local v6 = (#v2 - v4) + 1;
        if #v2 % 2 == 1 then
            v6 = v6 - 1;
        end;
        if v6 % 4 >= 2 then
            v5 = -v5;
        end;
        v3 = v3 + v5;
    end;
    return v3;
end;
local function _(v8)
    return v1[(v7(v8) + 0) % #v1 + 1];
end;
return function(v10)
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v10);
    if not l_l_Players_0_PlayerByUserId_0 then
        return Color3.fromRGB(255, 255, 255);
    elseif l_l_Players_0_PlayerByUserId_0.Team ~= nil then
        return l_l_Players_0_PlayerByUserId_0.TeamColor.Color;
    else
        return v1[(v7(l_l_Players_0_PlayerByUserId_0.Name) + 0) % #v1 + 1];
    end;
end;
