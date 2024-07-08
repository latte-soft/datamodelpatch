local v0 = {
    "ClimbAnimation", 
    "Face", 
    "FallAnimation", 
    "GraphicTShirt", 
    "Head", 
    "IdleAnimation", 
    "JumpAnimation", 
    "LeftArm", 
    "LeftLeg", 
    "Pants", 
    "RightArm", 
    "RightLeg", 
    "RunAnimation", 
    "Shirt", 
    "SwimAnimation", 
    "Torso", 
    "WalkAnimation"
};
return function(v1)
    local v2 = {};
    for _, v4 in ipairs(v0) do
        local v5 = v1[v4];
        if typeof(v5) == "number" and v5 > 0 then
            table.insert(v2, v5);
        elseif typeof(v5) == "string" and v5 ~= "" then
            for v6 in v5:gmatch("([%d]+),?") do
                table.insert(v2, (tonumber(v6)));
            end;
        end;
    end;
    for _, v8 in ipairs((v1:GetAccessories(true))) do
        table.insert(v2, v8.AssetId);
    end;
    local l_v1_Emotes_0 = v1:GetEmotes();
    for _, v11 in ipairs((v1:GetEquippedEmotes())) do
        local v12 = l_v1_Emotes_0[v11.Name];
        if v12 then
            for _, v14 in ipairs(v12) do
                table.insert(v2, v14);
            end;
        end;
    end;
    return v2;
end;
