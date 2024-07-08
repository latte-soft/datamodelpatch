local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script:FindFirstAncestor("Impressions").Parent.Cryo);
local v3 = require(script.Parent.Constants);
local v4 = game:DefineFastFlag("DebugEnableImpressionsVisualizer", false);
local v5 = {
    Color3.new(0.941176, 0.941176, 0.015686), 
    Color3.new(0.890196, 0.058823, 0.058823), 
    Color3.new(0.031372, 0.870588, 0.031372), 
    Color3.new(0.866666, 0.039215, 0.647058), 
    Color3.new(0.035294, 0.631372, 0.866666), 
    Color3.new(0.882352, 0.556862, 0.035294), 
    Color3.new(0.729411, 0.043137, 0.835294)
};
local v6 = 1;
local v7 = {
    None = "None", 
    Highlight = "Highlight", 
    FadeOut = "FadeOut"
};
local v8 = {
    BackgroundColor3 = Color3.new(1, 1, 1), 
    BorderColor3 = Color3.new(1, 1, 1), 
    BackgroundTransparency = 0, 
    BorderMode = Enum.BorderMode.Outline, 
    BorderSizePixel = 15, 
    ZIndex = 100
};
local v9 = {
    BackgroundTransparency = 0.65, 
    BorderSizePixel = 8
};
local v10 = {};
v10.__index = v10;
local function v16(v11)
    local v12 = {};
    for _, v14 in ipairs((l_CollectionService_0:GetTagged(v11))) do
        local l_v14_Attribute_0 = v14:GetAttribute(v3.ItemIndex);
        if not (not l_v14_Attribute_0 or not v14:isA("GuiObject")) then
            v12[l_v14_Attribute_0] = v14;
        end;
    end;
    return v12;
end;
v10.new = function(v17, v18)
    local v20 = {
        impressionsTag = v17, 
        highlightedInstances = {}, 
        originalInstances = {}, 
        highlightColor = v5[v6], 
        customKeyMapper = v18 or function(v19)
            return v19;
        end
    };
    setmetatable(v20, v10);
    if v4 then
        v6 = v6 + 1;
        if #v5 < v6 then
            v6 = v6 % #v5;
        end;
        if v17 then
            local v21 = nil;
            do
                local l_v21_0 = v21;
                l_v21_0 = l_RunService_0.RenderStepped:Connect(function(v23)
                    if not v20 then
                        if l_v21_0 then
                            l_v21_0:Disconnect();
                        end;
                        return ;
                    else
                        v20:_step(v23);
                        return ;
                    end;
                end);
                v20.renderConnection = l_v21_0;
            end;
        end;
    end;
    return v20;
end;
v10.destroy = function(v24)
    if v24.renderConnection then
        v24.renderConnection:Disconnect();
    end;
end;
v10._startHighlightState = function(v25, v26, v27, v28, v29, v30)
    local v31 = v25.highlightedInstances[v26];
    if v31 == nil then
        v25.highlightedInstances[v26] = {
            highlightState = v27, 
            currentFields = {}
        };
        v31 = v25.highlightedInstances[v26];
    else
        v31.highlightState = v27;
    end;
    v31.totalDuration = v28;
    v31.duration = v28;
    v31.doLerp = v30;
    if not v30 then
        v31.startFields = nil;
        v31.targetFields = nil;
        for v32, v33 in pairs(v29) do
            v31.currentFields[v32] = v33;
        end;
    else
        local v34 = {};
        local v35 = {};
        for v36, v37 in pairs(v29) do
            v34[v36] = v31.currentFields[v36];
            v35[v36] = v37;
        end;
        v31.startFields = v34;
        v31.targetFields = v35;
    end;
    v25.highlightedInstances[v26] = v31;
end;
v10._step = function(v38, v39)
    assert(v38.impressionsTag, "impressionsTag is nil");
    for v40, v41 in pairs(v38.highlightedInstances) do
        if (v41.doLerp and v41.duration ~= nil) and v41.totalDuration ~= nil then
            assert(v41.startFields, "startFields is nil");
            assert(v41.targetFields, "targetFields is nil");
            if v41.duration <= 0 then
                v41.doLerp = nil;
                v41.duration = nil;
                for v42, v43 in pairs(v41.targetFields) do
                    v41.currentFields[v42] = v43;
                end;
            else
                local v44 = math.clamp((v41.totalDuration - v41.duration) / v41.totalDuration, 0, 1);
                for v45, v46 in pairs(v41.targetFields) do
                    local v47 = v41.startFields[v45];
                    v41.currentFields[v45] = v47 + (v46 - v47) * v44;
                end;
            end;
        end;
        if v41.highlightState == v7.Highlight then
            assert(v41.duration ~= nil, "duration is nil");
            if v41.duration <= 0 then
                v38:_startHighlightState(v40, v7.FadeOut, 2.5, v9, true);
            end;
        end;
        if v41.duration then
            v41.duration = v41.duration - v39;
        end;
    end;
    for v48, v49 in pairs((v16(v38.impressionsTag))) do
        if v49 ~= nil then
            if v38.originalInstances[v49] == nil then
                v38.originalInstances[v49] = {};
                for v50, _ in pairs(v8) do
                    v38.originalInstances[v49][v50] = v49[v50];
                end;
            end;
            local v52 = v38.customKeyMapper(v48);
            local v53 = v38.highlightedInstances[v52];
            if v53 == nil then
                v53 = {
                    highlightState = v7.None, 
                    currentFields = {}
                };
                assert(v38.originalInstances[v49], "self.originalInstances[instance] is nil");
                for v54, v55 in pairs(v38.originalInstances[v49]) do
                    v53.currentFields[v54] = v55;
                end;
                v38.highlightedInstances[v52] = v53;
            end;
            assert(v53 ~= nil, "stateData is nil");
            if v53.currentFields then
                for v56, v57 in pairs(v53.currentFields) do
                    v49[v56] = v57;
                end;
            end;
        end;
    end;
end;
v10._highlightImpression = function(v58, v59)
    if v58.highlightedInstances[v59] ~= nil and v58.highlightedInstances[v59].highlightState ~= v7.None then
        return ;
    else
        v58:_startHighlightState(v59, v7.Highlight, 1, v2.Dictionary.join(v8, {
            BackgroundColor3 = v58.highlightColor, 
            BorderColor3 = v58.highlightColor
        }), false);
        return ;
    end;
end;
v10._clearImpression = function(v60, v61)
    v60.highlightedInstances[v61] = nil;
end;
v10.onSendImpressions = function(v62, v63)
    if v4 then
        if not (v62.impressionsTag and v63 ~= nil) or #v63 <= 0 then
            return ;
        else
            for _, v65 in ipairs(v63) do
                v62:_highlightImpression((v62.customKeyMapper(v65)));
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v10.onClearImpressions = function(v66, v67)
    if v4 then
        if not (v66.impressionsTag and v67 ~= nil) or #v67 <= 0 then
            return ;
        else
            for _, v69 in ipairs(v67) do
                v66:_clearImpression((v66.customKeyMapper(v69)));
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v10.onClearAllImpressions = function(v70)
    if v4 then
        if v70.impressionsTag then
            for v71, v72 in pairs(v70.originalInstances) do
                for v73, v74 in pairs(v72) do
                    v71[v73] = v74;
                end;
            end;
            v70.highlightedInstances = {};
            v70.originalInstances = {};
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v10.setCustomKeyMapper = function(v75, v76)
    v75.customKeyMapper = v76 or function(v77)
        return v77;
    end;
end;
v10.setImpressionsTag = function(v78, v79)
    v78.impressionsTag = v79;
end;
return v10;
