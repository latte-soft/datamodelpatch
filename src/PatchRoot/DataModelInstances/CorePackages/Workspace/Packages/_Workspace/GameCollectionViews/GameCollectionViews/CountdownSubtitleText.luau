local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v5 = require(l_script_FirstAncestor_0.calculateCountdownTime);
local function _(v6)
    if v6.days < 0 then
        return false;
    elseif not (v6.hours >= 0) or v6.hours > 23 then
        return false;
    elseif not (v6.minutes >= 0) or v6.minutes > 59 then
        return false;
    else
        return true;
    end;
end;
local function _(v8)
    if v8 < 15 then
        return 1;
    else
        return 15;
    end;
end;
return function(v10)
    local l_endTimestamp_0 = v10.endTimestamp;
    local l_formatStringHoursMinutes_0 = v10.formatStringHoursMinutes;
    local l_defaultString_0 = v10.defaultString;
    local v14, v15 = v3.useState("");
    local v19 = v3.useCallback(function()
        local l_l_defaultString_0_0 = l_defaultString_0;
        local v17 = l_endTimestamp_0 - DateTime.now().UnixTimestamp;
        local v18 = v5(v17);
        if (((v18.days >= 0 and v18.hours >= 0) and v18.hours <= 23) and v18.minutes >= 0) and v18.minutes <= 59 then
            l_l_defaultString_0_0 = if v18.days > 0 then l_defaultString_0 else l_formatStringHoursMinutes_0:gsub("{hours}", (tostring(v18.hours))):gsub("{minutes}", (tostring(v18.minutes)));
        end;
        if l_l_defaultString_0_0 ~= v14 then
            v15(l_l_defaultString_0_0);
        end;
        return v17;
    end, {
        l_defaultString_0, 
        l_endTimestamp_0, 
        l_formatStringHoursMinutes_0
    });
    v3.useEffect(function()
        v19();
    end, {
        v19
    });
    v3.useEffect(function()
        local v20 = l_endTimestamp_0 - DateTime.now().UnixTimestamp;
        local v21 = nil;
        if v20 > 0 then
            local v22 = 0;
            local v23 = v20 < 15 and 1 or 15;
            do
                local l_v22_0, l_v23_0 = v22, v23;
                v21 = l_RunService_0.Heartbeat:Connect(function()
                    local v26 = os.clock();
                    if v26 - l_v22_0 < l_v23_0 then
                        return ;
                    else
                        l_v22_0 = v26;
                        v20 = v19();
                        l_v23_0 = v20 < 15 and 1 or 15;
                        if not (not (v20 <= 0) or not v21) then
                            v21:Disconnect();
                            v21 = nil;
                        end;
                        return ;
                    end;
                end);
            end;
        end;
        return function()
            if v21 ~= nil then
                v21:Disconnect();
                v21 = nil;
            end;
        end;
    end, {
        l_endTimestamp_0, 
        v19
    });
    local v27 = l_useDesignTokens_0();
    local l_Subheader_0 = v27.Semantic.Typography.Subheader;
    local l_Default_0 = v27.Semantic.Color.Text.Default;
    local l_FontSize_0 = l_Subheader_0.FontSize;
    return v3.createElement("TextLabel", {
        TextSize = l_FontSize_0, 
        Size = UDim2.new(1, 0, 0, l_FontSize_0), 
        Text = v14, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        LayoutOrder = v10.LayoutOrder, 
        BackgroundTransparency = 1, 
        Font = l_Subheader_0.Font, 
        TextColor3 = l_Default_0.Color3
    });
end;
