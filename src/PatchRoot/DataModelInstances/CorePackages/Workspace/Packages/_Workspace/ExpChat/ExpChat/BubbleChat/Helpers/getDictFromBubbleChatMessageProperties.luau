local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Config);
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagReplicateUIPaddingChildProperties);
return function(v3)
    local v4 = {};
    for v5, _ in pairs(v1.DefaultBubbleChatMessagePropertiesInstanceSettings) do
        v4[v5] = v3[v5];
    end;
    local l_ImageLabel_0 = v3:FindFirstChildOfClass("ImageLabel");
    if l_ImageLabel_0 then
        local v8 = {};
        for v9, _ in pairs(v1.DefaultBubbleChatChildrenCustomizationProperties.ImageLabel) do
            v8[v9] = l_ImageLabel_0[v9];
        end;
        v4.ImageLabel = v8;
    end;
    local l_UIGradient_0 = v3:FindFirstChildOfClass("UIGradient");
    if l_UIGradient_0 then
        local v12 = {};
        for v13, _ in pairs(v1.DefaultBubbleChatChildrenCustomizationProperties.UIGradient) do
            v12[v13] = l_UIGradient_0[v13];
        end;
        v4.UIGradient = v12;
    end;
    local l_UICorner_0 = v3:FindFirstChildOfClass("UICorner");
    if l_UICorner_0 then
        local v16 = {};
        for v17, _ in pairs(v1.DefaultBubbleChatChildrenCustomizationProperties.UICorner) do
            v16[v17] = l_UICorner_0[v17];
        end;
        v4.UICorner = v16;
    end;
    if v2() then
        local l_UIPadding_0 = v3:FindFirstChildOfClass("UIPadding");
        if l_UIPadding_0 then
            local v20 = {};
            for v21, _ in pairs(v1.DefaultBubbleChatChildrenCustomizationProperties.UIPadding) do
                v20[v21] = l_UIPadding_0[v21];
            end;
            v4.UIPadding = v20;
        end;
    end;
    return v4;
end;
