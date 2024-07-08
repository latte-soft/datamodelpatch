local v0 = require(script:FindFirstAncestor("AbuseReportMenu").Flags.GetFFlagGetHumanoidDescriptionUpdates);
local l_Players_0 = game:GetService("Players");
local v2 = {
    ERR_RA_CHARACTER = "ERR_RA_CHARACTER", 
    ERR_RA_HUMPLAYER = "ERR_RA_HUMPLAYER", 
    ERR_RA_HUMOBJ = "ERR_RA_HUMOBJ", 
    ERR_RA_HUMDESC = "ERR_RA_HUMDESC", 
    OK = "OK"
};
local function v7(v3)
    local v4 = {};
    for _, v6 in ipairs(v3) do
        table.insert(v4, {
            AccessoryType = v6.AccessoryType.Value, 
            AssetId = v6.AssetId, 
            IsLayered = v6.IsLayered, 
            Order = v6.Order, 
            Puffiness = v6.Puffiness
        });
    end;
    return v4;
end;
return {
    getHumanoidDescription = function(v8)
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v8);
        local v10 = {
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
                return v10, v2.ERR_RA_CHARACTER;
            else
                local v12 = l_Character_0:WaitForChild("Humanoid", 1);
                if v12 then
                    local v13 = nil;
                    if not v0() then
                        v13 = v12:GetAppliedDescription();
                    else
                        local v14 = nil;
                        local l_status_0, l_result_0 = pcall(function()
                            return (v12:GetAppliedDescription());
                        end);
                        v14 = l_status_0;
                        v13 = l_result_0;
                        if not v14 then
                            return v10, v2.ERR_RA_HUMOBJ;
                        end;
                    end;
                    if v13 then
                        local v17 = 0;
                        do
                            local l_v13_0 = v13;
                            if not v0() then
                                pcall(function()
                                    for v19, _ in pairs(v10) do
                                        if typeof(l_v13_0[v19]) == "Color3" then
                                            v10[v19] = {
                                                l_v13_0[v19].R, 
                                                l_v13_0[v19].G, 
                                                l_v13_0[v19].B
                                            };
                                        else
                                            v10[v19] = l_v13_0[v19];
                                        end;
                                    end;
                                end);
                            else
                                local function v22(v21)
                                    if typeof(l_v13_0[v21]) == "Color3" then
                                        v10[v21] = {
                                            l_v13_0[v21].R, 
                                            l_v13_0[v21].G, 
                                            l_v13_0[v21].B
                                        };
                                        return ;
                                    else
                                        v10[v21] = l_v13_0[v21];
                                        return ;
                                    end;
                                end;
                                for v23, _ in pairs(v10) do
                                    if not pcall(v22, v23) then
                                        v17 = v17 + 1;
                                    end;
                                end;
                                local l_status_1, l_result_1 = pcall(l_v13_0.GetAccessories, l_v13_0, false);
                                if not l_status_1 then
                                    v17 = v17 + 1;
                                else
                                    local l_status_2, l_result_2 = pcall(v7, l_result_1);
                                    if not l_status_2 then
                                        v17 = v17 + 1;
                                    else
                                        v10.AccessoryBlob = l_result_2;
                                    end;
                                end;
                                v10.FieldErrorCount = v17;
                            end;
                        end;
                        return v10, v2.OK;
                    else
                        return v10, v2.ERR_RA_HUMDESC;
                    end;
                else
                    return v10, v2.ERR_RA_HUMOBJ;
                end;
            end;
        else
            return v10, v2.ERR_RA_HUMPLAYER;
        end;
    end
};
