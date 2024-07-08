local l_Players_0 = game:GetService("Players");
local v1 = {
    ERR_RA_CHARACTER = "ERR_RA_CHARACTER", 
    ERR_RA_HUMPLAYER = "ERR_RA_HUMPLAYER", 
    ERR_RA_HUMOBJ = "ERR_RA_HUMOBJ", 
    ERR_RA_HUMDESC = "ERR_RA_HUMDESC", 
    OK = "OK"
};
local function v6(v2)
    local v3 = {};
    for _, v5 in ipairs(v2) do
        table.insert(v3, {
            AccessoryType = v5.AccessoryType.Value, 
            AssetId = v5.AssetId, 
            IsLayered = v5.IsLayered, 
            Order = v5.Order, 
            Puffiness = v5.Puffiness
        });
    end;
    return v3;
end;
return function(v7)
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v7);
    local v9 = {
        BackAccessory = "", 
        BodyTypeScale = 0, 
        ClimbAnimation = 0, 
        DepthScale = 0, 
        Face = 0, 
        FaceAccessory = "", 
        FallAnimation = 0, 
        FrontAccessory = "", 
        GraphicTShirt = 0, 
        HairAccessory = "", 
        HatAccessory = "", 
        Head = 0, 
        HeadColor = {
            0, 
            0, 
            0
        }, 
        HeadScale = 0, 
        HeightScale = 0, 
        IdleAnimation = 0, 
        JumpAnimation = 0, 
        LeftArm = 0, 
        LeftArmColor = {
            0, 
            0, 
            0
        }, 
        LeftLeg = 0, 
        LeftLegColor = {
            0, 
            0, 
            0
        }, 
        MoodAnimation = 0, 
        NeckAccessory = "", 
        Pants = 0, 
        ProportionScale = 0, 
        RightArm = 0, 
        RightArmColor = {
            0, 
            0, 
            0
        }, 
        RightLeg = 0, 
        RightLegColor = {
            0, 
            0, 
            0
        }, 
        RunAnimation = 0, 
        Shirt = 0, 
        ShouldersAccessory = "", 
        SwimAnimation = 0, 
        Torso = 0, 
        TorsoColor = {
            0, 
            0, 
            0
        }, 
        WaistAccessory = "", 
        WalkAnimation = 0, 
        WidthScale = 0
    };
    if l_l_Players_0_PlayerByUserId_0 then
        local l_Character_0 = l_l_Players_0_PlayerByUserId_0.Character;
        if not l_Character_0 then
            return v9, v1.ERR_RA_CHARACTER;
        else
            local v11 = l_Character_0:WaitForChild("Humanoid", 1);
            if v11 then
                local v12 = nil;
                local v13 = nil;
                local l_status_0, l_result_0 = pcall(function()
                    return (v11:GetAppliedDescription());
                end);
                v13 = l_status_0;
                v12 = l_result_0;
                if v13 then
                    if v12 then
                        l_status_0 = 0;
                        do
                            local l_v12_0 = v12;
                            l_result_0 = function(v17)
                                if typeof(l_v12_0[v17]) == "Color3" then
                                    v9[v17] = {
                                        l_v12_0[v17].R, 
                                        l_v12_0[v17].G, 
                                        l_v12_0[v17].B
                                    };
                                    return ;
                                else
                                    v9[v17] = l_v12_0[v17];
                                    return ;
                                end;
                            end;
                            for v18, _ in pairs(v9) do
                                if not pcall(l_result_0, v18) then
                                    l_status_0 = l_status_0 + 1;
                                end;
                            end;
                            local l_status_1, l_result_1 = pcall(l_v12_0.GetAccessories, l_v12_0, false);
                            if not l_status_1 then
                                l_status_0 = l_status_0 + 1;
                            else
                                local l_status_2, l_result_2 = pcall(v6, l_result_1);
                                if not l_status_2 then
                                    l_status_0 = l_status_0 + 1;
                                else
                                    v9.AccessoryBlob = l_result_2;
                                end;
                            end;
                            v9.FieldErrorCount = l_status_0;
                        end;
                        return v9, v1.OK;
                    else
                        return v9, v1.ERR_RA_HUMDESC;
                    end;
                else
                    return v9, v1.ERR_RA_HUMOBJ;
                end;
            else
                return v9, v1.ERR_RA_HUMOBJ;
            end;
        end;
    else
        return v9, v1.ERR_RA_HUMPLAYER;
    end;
end;
