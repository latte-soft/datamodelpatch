local l_Players_0 = game:GetService("Players");
game:DefineFastFlag("EmoteMenuSupportScriptRunContext", false);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
if not l_LocalPlayer_0 then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v2 = {
    Value = false, 
    ChangedEvent = Instance.new("BindableEvent")
};
local function v5(v3)
    if v3 then
        local l_Animate_0 = v3:FindFirstChild("Animate");
        if not l_Animate_0 or not l_Animate_0:IsA("LocalScript") then
            if not ((not game:GetFastFlag("EmoteMenuSupportScriptRunContext") or not l_Animate_0) or not l_Animate_0:IsA("Script")) and l_Animate_0.RunContext == Enum.RunContext.Client then
                return l_Animate_0;
            else
                return nil;
            end;
        else
            return l_Animate_0;
        end;
    else
        return nil;
    end;
end;
local function _(v6)
    local v7 = v5(v6);
    if v7 then
        local l_PlayEmote_0 = v7:FindFirstChild("PlayEmote");
        if not l_PlayEmote_0 or not l_PlayEmote_0:IsA("BindableFunction") then
            return nil;
        else
            return l_PlayEmote_0;
        end;
    else
        return nil;
    end;
end;
local function _(v10)
    local v11 = v5(v10);
    local v12;
    if v11 then
        local l_PlayEmote_1 = v11:FindFirstChild("PlayEmote");
        v12 = if not not l_PlayEmote_1 and l_PlayEmote_1:IsA("BindableFunction") then l_PlayEmote_1 else nil;
    else
        v12 = nil;
    end;
    return v12 ~= nil;
end;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local function _()
    if v15 then
        v15:Disconnect();
        v15 = nil;
    end;
    if v16 then
        v16:Disconnect();
        v16 = nil;
    end;
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
end;
local v19 = nil;
local function _(v20)
    local v21 = v5(v20);
    local v22;
    if v21 then
        local l_PlayEmote_2 = v21:FindFirstChild("PlayEmote");
        v22 = if not not l_PlayEmote_2 and l_PlayEmote_2:IsA("BindableFunction") then l_PlayEmote_2 else nil;
    else
        v22 = nil;
    end;
    local v24 = v22 ~= nil;
    if v2.Value ~= v24 then
        v2.Value = v24;
        v2.ChangedEvent:Fire(v24);
    end;
    v19(v24, v20);
end;
local function _(v26)
    if not v5(v26) then
        v15 = v26.ChildAdded:Connect(function(v27)
            if not game:GetFastFlag("EmoteMenuSupportScriptRunContext") then
                if v27:IsA("LocalScript") and v27.Name == "Animate" then
                    local l_v26_0 = v26;
                    local v29 = v5(l_v26_0);
                    local v30;
                    if v29 then
                        local l_PlayEmote_3 = v29:FindFirstChild("PlayEmote");
                        v30 = if not not l_PlayEmote_3 and l_PlayEmote_3:IsA("BindableFunction") then l_PlayEmote_3 else nil;
                    else
                        v30 = nil;
                    end;
                    local v32 = v30 ~= nil;
                    if v2.Value ~= v32 then
                        v2.Value = v32;
                        v2.ChangedEvent:Fire(v32);
                    end;
                    v19(v32, l_v26_0);
                end;
            elseif (v27:IsA("LocalScript") or v27:IsA("Script") and v27.RunContext == Enum.RunContext.Client) and v27.Name == "Animate" then
                local l_v26_1 = v26;
                local v34 = v5(l_v26_1);
                local v35;
                if v34 then
                    local l_PlayEmote_4 = v34:FindFirstChild("PlayEmote");
                    v35 = if not not l_PlayEmote_4 and l_PlayEmote_4:IsA("BindableFunction") then l_PlayEmote_4 else nil;
                else
                    v35 = nil;
                end;
                local v37 = v35 ~= nil;
                if v2.Value ~= v37 then
                    v2.Value = v37;
                    v2.ChangedEvent:Fire(v37);
                end;
                v19(v37, l_v26_1);
                return ;
            end;
        end);
        return ;
    else
        local v38 = v5(v26);
        local v39;
        if v38 then
            local l_PlayEmote_5 = v38:FindFirstChild("PlayEmote");
            v39 = if not not l_PlayEmote_5 and l_PlayEmote_5:IsA("BindableFunction") then l_PlayEmote_5 else nil;
        else
            v39 = nil;
        end;
        local v41 = v39 ~= nil;
        if v2.Value ~= v41 then
            v2.Value = v41;
            v2.ChangedEvent:Fire(v41);
        end;
        v19(v41, v26);
        return ;
    end;
end;
local function _(v43, v44)
    local v45 = v5(v43);
    local v46;
    if v45 then
        local l_PlayEmote_6 = v45:FindFirstChild("PlayEmote");
        v46 = if not not l_PlayEmote_6 and l_PlayEmote_6:IsA("BindableFunction") then l_PlayEmote_6 else nil;
    else
        v46 = nil;
    end;
    if not v46 then
        v16 = v44.ChildAdded:Connect(function(v48)
            if v48:IsA("BindableFunction") and v48.Name == "PlayEmote" then
                local l_v43_0 = v43;
                local v50 = v5(l_v43_0);
                local v51;
                if v50 then
                    local l_PlayEmote_7 = v50:FindFirstChild("PlayEmote");
                    v51 = if not not l_PlayEmote_7 and l_PlayEmote_7:IsA("BindableFunction") then l_PlayEmote_7 else nil;
                else
                    v51 = nil;
                end;
                local v53 = v51 ~= nil;
                if v2.Value ~= v53 then
                    v2.Value = v53;
                    v2.ChangedEvent:Fire(v53);
                end;
                v19(v53, l_v43_0);
            end;
        end);
        return ;
    else
        local v54 = v5(v43);
        local v55;
        if v54 then
            local l_PlayEmote_8 = v54:FindFirstChild("PlayEmote");
            v55 = if not not l_PlayEmote_8 and l_PlayEmote_8:IsA("BindableFunction") then l_PlayEmote_8 else nil;
        else
            v55 = nil;
        end;
        v45 = v55 ~= nil;
        if v2.Value ~= v45 then
            v2.Value = v45;
            v2.ChangedEvent:Fire(v45);
        end;
        v19(v45, v43);
        return ;
    end;
end;
local _ = function(v58)
    local v59 = v5(v58);
    local v60;
    if v59 then
        local l_PlayEmote_9 = v59:FindFirstChild("PlayEmote");
        v60 = if not not l_PlayEmote_9 and l_PlayEmote_9:IsA("BindableFunction") then l_PlayEmote_9 else nil;
    else
        v60 = nil;
    end;
    if v60 then
        v17 = v60.AncestryChanged:Connect(function(_, v63)
            if not (v63 and v60:IsDescendantOf(v58)) then
                local l_v58_0 = v58;
                local v65 = v5(l_v58_0);
                local v66;
                if v65 then
                    local l_PlayEmote_10 = v65:FindFirstChild("PlayEmote");
                    v66 = if not not l_PlayEmote_10 and l_PlayEmote_10:IsA("BindableFunction") then l_PlayEmote_10 else nil;
                else
                    v66 = nil;
                end;
                local v68 = v66 ~= nil;
                if v2.Value ~= v68 then
                    v2.Value = v68;
                    v2.ChangedEvent:Fire(v68);
                end;
                v19(v68, l_v58_0);
            end;
        end);
        return ;
    else
        local v69 = v5(v58);
        local v70;
        if v69 then
            local l_PlayEmote_11 = v69:FindFirstChild("PlayEmote");
            v70 = if not not l_PlayEmote_11 and l_PlayEmote_11:IsA("BindableFunction") then l_PlayEmote_11 else nil;
        else
            v70 = nil;
        end;
        v59 = v70 ~= nil;
        if v2.Value ~= v59 then
            v2.Value = v59;
            v2.ChangedEvent:Fire(v59);
        end;
        v19(v59, v58);
        return ;
    end;
end;
v19 = function(v73, v74)
    if v15 then
        v15:Disconnect();
        v15 = nil;
    end;
    if v16 then
        v16:Disconnect();
        v16 = nil;
    end;
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
    if v74 then
        if not v73 then
            local v75 = v5(v74);
            if not v75 then
                if not v5(v74) then
                    v15 = v74.ChildAdded:Connect(function(v76)
                        if not game:GetFastFlag("EmoteMenuSupportScriptRunContext") then
                            if v76:IsA("LocalScript") and v76.Name == "Animate" then
                                local l_v74_0 = v74;
                                local v78 = v5(l_v74_0);
                                local v79;
                                if v78 then
                                    local l_PlayEmote_12 = v78:FindFirstChild("PlayEmote");
                                    v79 = if not not l_PlayEmote_12 and l_PlayEmote_12:IsA("BindableFunction") then l_PlayEmote_12 else nil;
                                else
                                    v79 = nil;
                                end;
                                local v81 = v79 ~= nil;
                                if v2.Value ~= v81 then
                                    v2.Value = v81;
                                    v2.ChangedEvent:Fire(v81);
                                end;
                                v19(v81, l_v74_0);
                            end;
                        elseif (v76:IsA("LocalScript") or v76:IsA("Script") and v76.RunContext == Enum.RunContext.Client) and v76.Name == "Animate" then
                            local l_v74_1 = v74;
                            local v83 = v5(l_v74_1);
                            local v84;
                            if v83 then
                                local l_PlayEmote_13 = v83:FindFirstChild("PlayEmote");
                                v84 = if not not l_PlayEmote_13 and l_PlayEmote_13:IsA("BindableFunction") then l_PlayEmote_13 else nil;
                            else
                                v84 = nil;
                            end;
                            local v86 = v84 ~= nil;
                            if v2.Value ~= v86 then
                                v2.Value = v86;
                                v2.ChangedEvent:Fire(v86);
                            end;
                            v19(v86, l_v74_1);
                            return ;
                        end;
                    end);
                    return ;
                else
                    local v87 = v5(v74);
                    local v88;
                    if v87 then
                        local l_PlayEmote_14 = v87:FindFirstChild("PlayEmote");
                        v88 = if not not l_PlayEmote_14 and l_PlayEmote_14:IsA("BindableFunction") then l_PlayEmote_14 else nil;
                    else
                        v88 = nil;
                    end;
                    local v90 = v88 ~= nil;
                    if v2.Value ~= v90 then
                        v2.Value = v90;
                        v2.ChangedEvent:Fire(v90);
                    end;
                    v19(v90, v74);
                    return ;
                end;
            else
                local v91 = v5(v74);
                local v92;
                if v91 then
                    local l_PlayEmote_15 = v91:FindFirstChild("PlayEmote");
                    v92 = if not not l_PlayEmote_15 and l_PlayEmote_15:IsA("BindableFunction") then l_PlayEmote_15 else nil;
                else
                    v92 = nil;
                end;
                if not v92 then
                    v16 = v75.ChildAdded:Connect(function(v94)
                        if v94:IsA("BindableFunction") and v94.Name == "PlayEmote" then
                            local l_v74_2 = v74;
                            local v96 = v5(l_v74_2);
                            local v97;
                            if v96 then
                                local l_PlayEmote_16 = v96:FindFirstChild("PlayEmote");
                                v97 = if not not l_PlayEmote_16 and l_PlayEmote_16:IsA("BindableFunction") then l_PlayEmote_16 else nil;
                            else
                                v97 = nil;
                            end;
                            local v99 = v97 ~= nil;
                            if v2.Value ~= v99 then
                                v2.Value = v99;
                                v2.ChangedEvent:Fire(v99);
                            end;
                            v19(v99, l_v74_2);
                        end;
                    end);
                    return ;
                else
                    local v100 = v5(v74);
                    local v101;
                    if v100 then
                        local l_PlayEmote_17 = v100:FindFirstChild("PlayEmote");
                        v101 = if not not l_PlayEmote_17 and l_PlayEmote_17:IsA("BindableFunction") then l_PlayEmote_17 else nil;
                    else
                        v101 = nil;
                    end;
                    v91 = v101 ~= nil;
                    if v2.Value ~= v91 then
                        v2.Value = v91;
                        v2.ChangedEvent:Fire(v91);
                    end;
                    v19(v91, v74);
                    return ;
                end;
            end;
        else
            local v103 = v5(v74);
            local v104;
            if v103 then
                local l_PlayEmote_18 = v103:FindFirstChild("PlayEmote");
                v104 = if not not l_PlayEmote_18 and l_PlayEmote_18:IsA("BindableFunction") then l_PlayEmote_18 else nil;
            else
                v104 = nil;
            end;
            if v104 then
                v17 = v104.AncestryChanged:Connect(function(_, v107)
                    if not (v107 and v104:IsDescendantOf(v74)) then
                        local l_v74_3 = v74;
                        local v109 = v5(l_v74_3);
                        local v110;
                        if v109 then
                            local l_PlayEmote_19 = v109:FindFirstChild("PlayEmote");
                            v110 = if not not l_PlayEmote_19 and l_PlayEmote_19:IsA("BindableFunction") then l_PlayEmote_19 else nil;
                        else
                            v110 = nil;
                        end;
                        local v112 = v110 ~= nil;
                        if v2.Value ~= v112 then
                            v2.Value = v112;
                            v2.ChangedEvent:Fire(v112);
                        end;
                        v19(v112, l_v74_3);
                    end;
                end);
                return ;
            else
                local v113 = v5(v74);
                local v114;
                if v113 then
                    local l_PlayEmote_20 = v113:FindFirstChild("PlayEmote");
                    v114 = if not not l_PlayEmote_20 and l_PlayEmote_20:IsA("BindableFunction") then l_PlayEmote_20 else nil;
                else
                    v114 = nil;
                end;
                v103 = v114 ~= nil;
                if v2.Value ~= v103 then
                    v2.Value = v103;
                    v2.ChangedEvent:Fire(v103);
                end;
                v19(v103, v74);
                return ;
            end;
        end;
    else
        return ;
    end;
end;
local function _(v116)
    if v15 then
        v15:Disconnect();
        v15 = nil;
    end;
    if v16 then
        v16:Disconnect();
        v16 = nil;
    end;
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
    local v117 = v5(v116);
    local v118;
    if v117 then
        local l_PlayEmote_21 = v117:FindFirstChild("PlayEmote");
        v118 = if not not l_PlayEmote_21 and l_PlayEmote_21:IsA("BindableFunction") then l_PlayEmote_21 else nil;
    else
        v118 = nil;
    end;
    local v120 = v118 ~= nil;
    if v2.Value ~= v120 then
        v2.Value = v120;
        v2.ChangedEvent:Fire(v120);
    end;
    v19(v120, v116);
end;
l_LocalPlayer_0:GetPropertyChangedSignal("Character"):Connect(function()
    local l_Character_0 = l_LocalPlayer_0.Character;
    if v15 then
        v15:Disconnect();
        v15 = nil;
    end;
    if v16 then
        v16:Disconnect();
        v16 = nil;
    end;
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
    local v123 = v5(l_Character_0);
    local v124;
    if v123 then
        local l_PlayEmote_22 = v123:FindFirstChild("PlayEmote");
        v124 = if not not l_PlayEmote_22 and l_PlayEmote_22:IsA("BindableFunction") then l_PlayEmote_22 else nil;
    else
        v124 = nil;
    end;
    local v126 = v124 ~= nil;
    if v2.Value ~= v126 then
        v2.Value = v126;
        v2.ChangedEvent:Fire(v126);
    end;
    v19(v126, l_Character_0);
end);
local l_Character_1 = l_LocalPlayer_0.Character;
if v15 then
    v15:Disconnect();
    v15 = nil;
end;
if v16 then
    v16:Disconnect();
    v16 = nil;
end;
if v17 then
    v17:Disconnect();
    v17 = nil;
end;
local v128 = v5(l_Character_1);
local v129;
if v128 then
    local l_PlayEmote_23 = v128:FindFirstChild("PlayEmote");
    v129 = if not not l_PlayEmote_23 and l_PlayEmote_23:IsA("BindableFunction") then l_PlayEmote_23 else nil;
else
    v129 = nil;
end;
local v131 = v129 ~= nil;
if v2.Value ~= v131 then
    v2.Value = v131;
    v2.ChangedEvent:Fire(v131);
end;
v19(v131, l_Character_1);
return v2;
