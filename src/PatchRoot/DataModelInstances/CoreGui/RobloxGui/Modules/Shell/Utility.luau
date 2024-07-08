local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_TextService_0 = game:GetService("TextService");
local l_Players_0 = game:GetService("Players");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v5 = nil;
pcall(function()
    v5 = game:GetService("PlatformService");
end);
local v8 = {
    IsFinite = function(v6)
        local v7 = false;
        if v6 == v6 then
            v7 = false;
            if v6 ~= math.huge then
                v7 = v6 ~= -math.huge;
            end;
        end;
        return v7;
    end
};
v8.FindAncestorOfType = function(v9, v10)
    local v11 = v9 and v9.Parent;
    if not v11 then
        return nil;
    elseif not v11:IsA(v10) then
        return v8.FindAncestorOfType(v11, v10);
    else
        return v11;
    end;
end;
v8.CalculateRelativeDimensions = function(v12, v13, v14, _)
    local l_l_GuiService_0_ScreenResolution_0 = l_GuiService_0:GetScreenResolution();
    local v17 = v8.FindAncestorOfType(v12, "SurfaceGui");
    if v17 then
        l_l_GuiService_0_ScreenResolution_0 = v17.CanvasSize;
    end;
    local v18 = v13 / v14;
    if v14.y > 0 and l_l_GuiService_0_ScreenResolution_0.y > 0 then
        v18 = v18 * ((v14.x / v14.y) / (l_l_GuiService_0_ScreenResolution_0.x / l_l_GuiService_0_ScreenResolution_0.y));
        local l_Parent_0 = v12.Parent;
        if l_Parent_0 then
            local v20 = 1 / (l_Parent_0.AbsoluteSize / l_l_GuiService_0_ScreenResolution_0);
            if not (not v8.IsFinite(v20.x) or not v8.IsFinite(v20.y)) then
                return UDim2.new(v20.x * v18.x, 0, v20.y * v18.y, 0);
            end;
        end;
    end;
    return UDim2.new(v18.x, 0, v18.y, 0);
end;
v8.Enum = {
    Anchor = {
        TopLeft = 1, 
        TopMiddle = 2, 
        TopRight = 3, 
        CenterLeft = 4, 
        Center = 5, 
        CenterRight = 6, 
        BottomLeft = 7, 
        BottomMiddle = 8, 
        BottomRight = 9
    }
};
v8.CalculateFit = function(v21, v22)
    local v23 = v21.AbsoluteSize / v22;
    local v24 = v22 * math.min(v23.X, v23.Y);
    return UDim2.new(0, v24.X, 0, v24.Y);
end;
v8.CalculateFill = function(v25, v26)
    local v27 = v25.AbsoluteSize / v26;
    local v28 = v26 * math.max(v27.X, v27.Y);
    return UDim2.new(0, v28.X, 0, v28.Y);
end;
v8.Create = function(v29)
    return function(v30)
        local v31 = Instance.new(v29);
        for v32, v33 in pairs(v30) do
            if type(v32) == "number" then
                v33.Parent = v31;
            else
                v31[v32] = v33;
            end;
        end;
        return v31;
    end;
end;
local v34 = {};
local function _(v35, v36)
    return v34[v35] and v34[v35][v36];
end;
local function _(v38, v39, v40)
    if not v34[v38] then
        v34[v38] = {};
    end;
    v34[v38][v39] = v40;
end;
v8.Linear = function(v42, v43, v44, v45)
    if v45 <= v42 then
        return v43 + v44;
    else
        return (v44 * v42) / v45 + v43;
    end;
end;
v8.EaseOutQuad = function(v46, v47, v48, v49)
    if v49 <= v46 then
        return v47 + v48;
    else
        v46 = v46 / v49;
        return (-v48 * v46) * (v46 - 2) + v47;
    end;
end;
v8.EaseInOutQuad = function(v50, v51, v52, v53)
    if v53 <= v50 then
        return v51 + v52;
    else
        v50 = v50 / (v53 / 2);
        if v50 < 1 then
            return ((v52 / 2) * v50) * v50 + v51;
        else
            v50 = v50 - 1;
            return (-v52 / 2) * (v50 * (v50 - 2) - 1) + v51;
        end;
    end;
end;
v8.SCurveUDim2 = function(v54, v55, v56, v57)
    if v57 <= v54 then
        return v55 + v56;
    else
        v54 = v54 / v57;
        if v54 < 0 then
            v54 = 0;
        end;
        if v54 > 1 then
            v54 = 1;
        end;
        local v58 = (3 * v54) * v54 - ((2 * v54) * v54) * v54;
        return UDim2.new(v58 * v56.X.Scale, v58 * v56.X.Offset, v58 * v56.Y.Scale, v58 * v56.Y.Offset) + v55;
    end;
end;
v8.SCurveVector2 = function(v59, v60, v61, v62)
    if v62 <= v59 then
        return v60 + v61;
    else
        v59 = v59 / v62;
        if v59 < 0 then
            v59 = 0;
        end;
        if v59 > 1 then
            v59 = 1;
        end;
        local v63 = (3 * v59) * v59 - ((2 * v59) * v59) * v59;
        return Vector2.new(v63 * v61.X, v63 * v61.Y) + v60;
    end;
end;
v8.PropertyTweener = function(v64, v65, v66, v67, v68, v69, v70, v71)
    v69 = v69 or v8.Linear;
    v70 = v70 or false;
    local v72 = {
        StartTime = tick()
    };
    v72.EndTime = v72.StartTime + v68;
    v72.Cancelled = false;
    local v73 = false;
    local v74 = 0;
    local function _(v75)
        if v64 then
            v64[v65] = v75;
        end;
    end;
    local function v79()
        local v77 = v69(1, v66, v67 - v66, 1);
        if v64 then
            v64[v65] = v77;
        end;
        v73 = true;
        v74 = 1;
        local l_v65_0 = v65;
        if (v34[l_v65_0] and v34[l_v65_0][v64]) == v72 then
            v77 = v65;
            l_v65_0 = v64;
            if not v34[v77] then
                v34[v77] = {};
            end;
            v34[v77][l_v65_0] = nil;
        end;
        if v71 then
            v71();
        end;
    end;
    if not v70 and (v34[v65] and v34[v65][v64]) then
        v73 = true;
    else
        if v34[v65] and v34[v65][v64] then
            (v34[v65] and v34[v65][v64]):Cancel();
        end;
        if not v34[v65] then
            v34[v65] = {};
        end;
        v34[v65][v64] = v72;
        local v80 = v69(0, v66, v67 - v66, v68);
        if v64 then
            v64[v65] = v80;
        end;
        spawn(function()
            local v81 = tick();
            while not ((not (v81 < v72.EndTime) or not v64) or v72.Cancelled) do
                local v82 = v69(v81 - v72.StartTime, v66, v67 - v66, v68);
                if v64 then
                    v64[v65] = v82;
                end;
                v74 = v8.Clamp(0, 1, (v81 - v72.StartTime) / v68);
                l_RunService_0.RenderStepped:wait();
                v81 = tick();
            end;
            if not (not (v72.Cancelled == false) or not v64) then
                v79();
            end;
            local l_v65_1 = v65;
            if (v34[l_v65_1] and v34[l_v65_1][v64]) == v72 then
                local l_v65_2 = v65;
                l_v65_1 = v64;
                if not v34[l_v65_2] then
                    v34[l_v65_2] = {};
                end;
                v34[l_v65_2][l_v65_1] = nil;
            end;
        end);
    end;
    v72.GetFinal = function(_)
        return v67;
    end;
    v72.GetPercentComplete = function(_)
        return v74;
    end;
    v72.IsFinished = function(_)
        return v73;
    end;
    v72.Finish = function(v88)
        if not v73 then
            v88:Cancel();
            v79();
        end;
    end;
    v72.Cancel = function(_)
        v72.Cancelled = true;
        v73 = true;
        local l_v65_3 = v65;
        if (v34[l_v65_3] and v34[l_v65_3][v64]) == v72 then
            local l_v65_4 = v65;
            l_v65_3 = v64;
            if not v34[l_v65_4] then
                v34[l_v65_4] = {};
            end;
            v34[l_v65_4][l_v65_3] = nil;
        end;
    end;
    return v72;
end;
v8.CancelTweens = function(v92)
    for v93, v94 in pairs(v92) do
        v94:Finish();
        v92[v93] = nil;
    end;
end;
v8.Signal = function()
    local v95 = {};
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v97 = nil;
    local v98 = nil;
    v95.fire = function(_, ...)
        v97 = {
            ...
        };
        v98 = select("#", ...);
        l_BindableEvent_0:Fire();
    end;
    v95.connect = function(_, v101)
        if not v101 then
            error("connect(nil)", 2);
        end;
        return l_BindableEvent_0.Event:connect(function()
            v101(unpack(v97, 1, v98));
        end);
    end;
    v95.wait = function(_)
        l_BindableEvent_0.Event:wait();
        assert(v97, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
        return unpack(v97, 1, v98);
    end;
    return v95;
end;
v8.DisconnectEvent = function(v103)
    if v103 then
        v103:disconnect();
    end;
    return nil;
end;
v8.DisconnectEvents = function(v104)
    if v104 and type(v104) == "table" then
        for _, v106 in pairs(v104) do
            v106:disconnect();
        end;
    end;
end;
v8.Clamp = function(v107, v108, v109)
    return (math.max(v107, (math.min(v108, v109))));
end;
v8.ClampVector2 = function(v110, v111, v112)
    return Vector2.new(v8.Clamp(v110.x, v111.x, v112.x), v8.Clamp(v110.y, v111.y, v112.y));
end;
v8.TweenPositionOrSet = function(v113, ...)
    if not v113:IsDescendantOf(game) then
        v113.Position = select(1, ...);
        return ;
    else
        v113:TweenPosition(...);
        return ;
    end;
end;
v8.ClampCanvasPosition = function(v114, v115)
    local v116 = not not v114.Parent and v114.Parent.AbsoluteSize or Vector2.new(0, 0);
    local v117 = Vector2.new(v114.CanvasSize.X.Scale * v116.X + v114.CanvasSize.X.Offset, v114.CanvasSize.Y.Scale * v116.Y + v114.CanvasSize.Y.Offset);
    return Vector2.new(v8.Clamp(0, v117.X - v114.AbsoluteWindowSize.X, v115.X), (v8.Clamp(0, v117.Y - v114.AbsoluteWindowSize.Y, v115.Y)));
end;
v8.Round = function(v118, v119)
    v119 = v119 or 1;
    return math.floor((v118 + v119 / 2) / v119) * v119;
end;
v8.ChompString = function(v120)
    return tostring(v120):gsub("^%s+", ""):gsub("%s+$", "");
end;
v8.SpaceNormalizeString = function(v121)
    return tostring(v121):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "");
end;
local function v124()
    local v122 = l_LocalizationService_0.RobloxLocaleId:lower();
    local v123 = {
        ["en-us"] = ",", 
        ["zh-hk"] = "", 
        ["zh-tw"] = "", 
        ["nb-no"] = "\194\160", 
        ["es-es"] = " ", 
        ["nl-nl"] = ".", 
        ["it-it"] = ".", 
        ["tr-tr"] = ".", 
        ["ru-ru"] = " ", 
        ["fi-fi"] = "\194\160", 
        ["da-dk"] = ".", 
        ["de-de"] = ".", 
        ["fr-fr"] = "\194\160", 
        ["pt-br"] = ".", 
        ["pt-pt"] = ".", 
        ["pl-pl"] = " ", 
        ["sv-se"] = " "
    };
    if not v123[v122] then
        return v123["en-us"];
    else
        return v123[v122];
    end;
end;
v8.FormatNumberString = function(v125)
    local v126 = v124();
    local v127 = v8.ChompString(v125);
    local v128 = string.format("%%1%s%%2", v126);
    local _ = nil;
    while true do
        local v130, v131 = string.gsub(v127, "^(-?%d+)(%d%d%d)", v128);
        v127 = v130;
        if not (v131 ~= 0) then
            break;
        end;
    end;
    return v127;
end;
v8.PrettyPrint = function(v132)
    if type(v132) == "table" then
        local v133 = "{";
        for v134, v135 in pairs(v132) do
            v133 = v133 == "{" and v133 or v133 .. ", ";
            if type(v134) == "string" then
                v133 = v133 .. v134 .. " = ";
            elseif not (type(v134) == "number") then
                v133 = v133 .. "[" .. v134 .. "] = ";
            end;
            v133 = v133 .. v8.PrettyPrint(v135);
        end;
        return v133 .. "}";
    elseif type(v132) == "string" then
        return "'" .. v132 .. "'";
    else
        return (tostring(v132));
    end;
end;
local v136 = nil;
do
    local l_v136_0 = v136;
    v8.DebugLog = function(...)
        if l_v136_0 == nil then
            l_v136_0 = v5 and v5:IsSandboxed();
        end;
        if l_v136_0 or v5 == nil then
            print(...);
        end;
    end;
    local function _(v138, v139, v140)
        v139 = v139 or 0.35;
        v140 = v140 or 0.8;
        v138 = v8.Clamp(-1, 1, v138);
        if v138 >= 0 then
            return (v139 * v138) / ((v139 - v138) + 1);
        else
            return -((v140 * -v138) / ((v140 + v138) + 1));
        end;
    end;
    local function _(v142, v143)
        v143 = v143 or 0.1;
        return (1 + v143) * (2 * math.abs(v142) - 1) - v143;
    end;
    local function _(v145)
        return v145 / 2 + 0.5;
    end;
    v8.GamepadLinearToCurve = function(v147, v148, _, _)
        local function v156(v151)
            local v152 = v151 < 0 and -1 or 1;
            local v153 = math.abs(v151);
            local v154 = v148 or 0.1;
            local v155 = (1 + v154) * (2 * math.abs(v153) - 1) - v154;
            v153 = nil;
            v154 = nil;
            v153 = v153 or 0.35;
            v154 = v154 or 0.8;
            v155 = v8.Clamp(-1, 1, v155);
            return v8.Clamp(-1, 1, (if v155 >= 0 then (v153 * v155) / ((v153 - v155) + 1) else -((v154 * -v155) / ((v154 + v155) + 1)) / 2 + 0.5) * v152);
        end;
        local l_new_0 = Vector2.new;
        local l_x_0 = v147.x;
        local v159 = l_x_0 < 0 and -1 or 1;
        local v160 = math.abs(l_x_0);
        local v161 = v148 or 0.1;
        local v162 = (1 + v161) * (2 * math.abs(v160) - 1) - v161;
        v160 = nil;
        v161 = nil;
        v160 = v160 or 0.35;
        v161 = v161 or 0.8;
        v162 = v8.Clamp(-1, 1, v162);
        return l_new_0(v8.Clamp(-1, 1, (if v162 >= 0 then (v160 * v162) / ((v160 - v162) + 1) else -((v161 * -v162) / ((v161 + v162) + 1)) / 2 + 0.5) * v159), v156(v147.y));
    end;
    v8.IsFastFlagEnabled = function(v163)
        local l_status_0, l_result_0 = pcall(function()
            return settings():GetFFlag(v163);
        end);
        if not l_status_0 or l_result_0 then
            if not l_status_0 then
                v8.DebugLog("GetFFlag failed for flag:", v163);
            end;
        else
            v8.DebugLog("Fast Flag:", v163, "is currently not enabled.");
        end;
        return l_status_0 and l_result_0;
    end;
    v8.GetFastVariable = function(v166)
        local l_status_1, l_result_1 = pcall(function()
            return settings():GetFVariable(v166);
        end);
        return l_status_1 and l_result_1;
    end;
    local function _()
        while l_Players_0.LocalPlayer == nil do
            wait();
        end;
        return l_Players_0.LocalPlayer;
    end;
    v8.IsFeatureNonZero = function(v170)
        return (tonumber(v8.GetFastVariable(v170)) or 0) ~= 0;
    end;
    v8.IsFeatureRolledOut = function(v171)
        while l_Players_0.LocalPlayer == nil do
            wait();
        end;
        return l_Players_0.LocalPlayer.UserId % 100 < (tonumber(v8.GetFastVariable(v171)) or 0);
    end;
    v8.ExponentialRepeat = function(v172, v173, v174)
        v174 = v174 or 6;
        local v175 = 1;
        local l_v174_0 = v174;
        while true do
            if not (v175 <= l_v174_0) or not v172() then
                return ;
            elseif not v173() then
                wait(v175 ^ 2);
                v175 = v175 + 1;
            else
                return ;
            end;
        end;
    end;
    v8.SplitString = function(v177, v178)
        local v179 = {};
        if not (not v177 or not v178) then
            for v180 in string.gmatch(v177, "([^" .. v178 .. "]+)") do
                table.insert(v179, v180);
            end;
        end;
        return v179;
    end;
    local function v181(v182, v183, v184)
        if v182 then
            if not v182:IsA("CharacterMesh") then
                if not v182:IsA("FileMesh") then
                    if not v182:IsA("Decal") then
                        if not v182:IsA("Pants") then
                            if v182:IsA("Shirt") then
                                table.insert(v183, v182.ShirtTemplate);
                            end;
                        else
                            table.insert(v183, v182.PantsTemplate);
                        end;
                    else
                        table.insert(v183, v182.Texture);
                    end;
                else
                    table.insert(v183, v182.MeshId);
                    table.insert(v183, v182.TextureId);
                end;
            else
                if v182.MeshId > 0 then
                    table.insert(v183, v184 .. tostring(v182.MeshId));
                end;
                if v182.BaseTextureId > 0 then
                    table.insert(v183, v184 .. tostring(v182.BaseTextureId));
                end;
                if v182.OverlayTextureId > 0 then
                    table.insert(v183, v184 .. tostring(v182.OverlayTextureId));
                end;
            end;
            for _, v186 in pairs(v182:GetChildren()) do
                v181(v186, v183, v184);
            end;
            return ;
        else
            return ;
        end;
    end;
    v8.FindAssetsInModel = function(v187, v188)
        v188 = v188 or "https://assetgame.roblox.com/asset/?id=";
        local v189 = {};
        v181(v187, v189, v188);
        return v189;
    end;
    v8.ConvertFontSizeEnumToInt = function(v190)
        return string.match(v190.Name, "%d+") or 10;
    end;
    v8.Upper = function(v191)
        if not v5 then
            return string.upper(v191);
        else
            return v5:Upper(v191);
        end;
    end;
    v8.SetSelectedCoreObject = function(v192)
        l_GuiService_0.SelectedCoreObject = v192;
    end;
    v8.AddSelectionParent = function(v193, v194)
        l_GuiService_0:AddSelectionParent(v193, v194);
    end;
    v8.RemoveSelectionGroup = function(v195)
        l_GuiService_0:RemoveSelectionGroup(v195);
    end;
    v8.GetTextBounds = function(v196)
        local v197 = false;
        local v198 = nil;
        if v196 then
            if not v196.TextFits then
                if not v196.TextWrapped then
                    v198 = l_TextService_0:GetTextSize(v196.Text, v196.TextSize, v196.Font, Vector2.new(0, 0));
                    v197 = true;
                end;
            else
                return true, v196.TextBounds;
            end;
        end;
        return v197, v198;
    end;
    v8.ResizeButtonWithText = function(v199, v200, v201, v202)
        local v203 = false;
        local v204, v205 = v8.GetTextBounds(v200);
        if (v204 and v199.Size.X.Scale == 0) and v199.Size.Y.Scale == 0 then
            local v206 = Vector2.new(v199.Size.X.Offset, v199.Size.Y.Offset);
            local l_X_0 = v206.X;
            local l_Y_0 = v206.Y;
            if v201 and v206.X < v205.X + v201 * 2 then
                l_X_0 = v205.X + v201 * 2;
                v203 = true;
            end;
            if v202 and v206.Y < v205.Y + v202 * 2 then
                l_Y_0 = v205.Y + v202 * 2;
                v203 = true;
            end;
            if v203 then
                v199.Size = UDim2.new(0, l_X_0, 0, l_Y_0);
            end;
        end;
        return v203;
    end;
    v8.ResizeButtonWithDynamicText = function(v209, v210, v211, v212, v213)
        local v214 = v8.ResizeButtonWithText(v209, v210, v212, v213) or false;
        local l_Text_0 = v210.Text;
        if v211 and #v211 > 0 then
            for v216 = 1, #v211 do
                v210.Text = v211[v216];
                v214 = v8.ResizeButtonWithText(v209, v210, v212, v213) or v214;
            end;
        end;
        v210.Text = l_Text_0;
        return v214;
    end;
end;
return v8;
