local l_Players_0 = game:GetService("Players");
local v1 = {
    ERR_RA_CHARACTER = "ERR_RA_CHARACTER", 
    ERR_RA_HUMPLAYER = "ERR_RA_HUMPLAYER", 
    ERR_RA_HUMOBJ = "ERR_RA_HUMOBJ", 
    ERR_RA_HUMDESC = "ERR_RA_HUMDESC", 
    OK = "OK"
};
return {
    getHumanoidDescription = function(v2)
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v2);
        local v4 = {
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
                return v4, v1.ERR_RA_CHARACTER;
            else
                local v6 = l_Character_0:WaitForChild("Humanoid", 1);
                if v6 then
                    local l_v6_AppliedDescription_0 = v6:GetAppliedDescription();
                    if l_v6_AppliedDescription_0 then
                        pcall(function()
                            for v8, _ in pairs(v4) do
                                if typeof(l_v6_AppliedDescription_0[v8]) == "Color3" then
                                    v4[v8] = {
                                        l_v6_AppliedDescription_0[v8].R, 
                                        l_v6_AppliedDescription_0[v8].G, 
                                        l_v6_AppliedDescription_0[v8].B
                                    };
                                else
                                    v4[v8] = l_v6_AppliedDescription_0[v8];
                                end;
                            end;
                        end);
                        return v4, v1.OK;
                    else
                        return v4, v1.ERR_RA_HUMDESC;
                    end;
                else
                    return v4, v1.ERR_RA_HUMOBJ;
                end;
            end;
        else
            return v4, v1.ERR_RA_HUMPLAYER;
        end;
    end
};
