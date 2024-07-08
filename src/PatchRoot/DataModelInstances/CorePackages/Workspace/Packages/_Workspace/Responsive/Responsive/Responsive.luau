local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local v3 = require(script.Parent.CommonConfigs.StandardBreakpoints);
local v4 = require(script.Parent.InputMode);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v6 = require(script.Parent.FindFirstAncestorWithTag);
local v7 = setmetatable({}, {
    __mode = "k"
});
local v8 = {};
v8.__index = v8;
local l_rules_0 = v3.rules;
local v10 = {};
v10.__index = v10;
v10.new = function(v11)
    local v12 = {
        _hasSizeRules = false, 
        _hasInputRules = false, 
        _config = v11 or {}, 
        _currentRule = {
            Key = "Default"
        }, 
        _currentKey = "Default"
    };
    local v13 = false;
    local v14 = false;
    for _, v16 in v11, nil, nil do
        local l_v13_0 = v13;
        if not l_v13_0 then
            l_v13_0 = true;
            if v16.minWidth == nil then
                l_v13_0 = true;
                if v16.maxWidth == nil then
                    l_v13_0 = true;
                    if v16.minHeight == nil then
                        l_v13_0 = true;
                        if v16.maxHeight == nil then
                            l_v13_0 = true;
                            if v16.maxRatio == nil then
                                l_v13_0 = v16.minRatio ~= nil;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        v13 = l_v13_0;
        l_v13_0 = v14;
        if not l_v13_0 then
            l_v13_0 = true;
            if v16.preferredInput == nil then
                l_v13_0 = v16.lastInput ~= nil;
            end;
        end;
        v14 = l_v13_0;
    end;
    v12._hasSizeRules = v13;
    v12._hasInputRules = v14;
    return (setmetatable(v12, v10));
end;
v10.hasSizeRules = function(v18)
    return v18._hasSizeRules;
end;
v10.hasInputRules = function(v19)
    return v19._hasInputRules;
end;
v10.currentRule = function(v20)
    return v20._currentRule;
end;
v10.currentKey = function(v21)
    return v21._currentKey;
end;
v10.resolve = function(v22, v23, v24, v25, v26, v27)
    local v28 = "Default";
    local v29 = {};
    local v30 = v23 / v24;
    for _, v32 in v22._config, nil, nil do
        local v33;
        if v32.minWidth ~= nil then
            v33 = false;
            if not (v32.minWidth <= v23) then
                goto label0;
            end;
        end;
        if v32.maxWidth ~= nil then
            v33 = false;
            if not (v23 <= v32.maxWidth) then
                goto label0;
            end;
        end;
        if v32.minHeight ~= nil then
            v33 = false;
            if not (v32.minHeight <= v24) then
                goto label0;
            end;
        end;
        if v32.maxHeight ~= nil then
            v33 = false;
            if not (v24 <= v32.maxHeight) then
                goto label0;
            end;
        end;
        if v32.minRatio ~= nil then
            v33 = false;
            if not (v32.minRatio <= v30) then
                goto label0;
            end;
        end;
        if v32.maxRatio ~= nil then
            v33 = false;
            if not (v30 <= v32.maxRatio) then
                goto label0;
            end;
        end;
        if v32.preferredInput ~= nil then
            v33 = false;
            if not (v25 == v32.preferredInput) then
                goto label0;
            end;
        end;
        if v32.lastInput ~= nil then
            v33 = false;
            if not (v26 == v32.lastInput) then
                goto label0;
            end;
        end;
        v33 = true;
        if v32.spatial ~= nil then
            v33 = v27 == v32.spatial;
        end;
        ::label0::;
        if v33 then
            v29 = v32;
            v28 = v32.Key;
            break;
        end;
    end;
    if v28 ~= v22._currentKey then
        v22._currentKey = v28;
        v22._currentRule = v29;
        return true;
    else
        return false;
    end;
end;
v8.new = function()
    local v34 = {
        _layerCollectorSizeConnection = nil, 
        _inputModeConnection = nil, 
        _vrEnabledConnection = nil, 
        _vrEnabled = l_VRService_0.VREnabled, 
        _changed = l_Signal_0.new(), 
        _absoluteSize = Vector2.zero, 
        _hasInputRules = false, 
        _hasSizeRules = false, 
        _refCount = 1, 
        _configResolvers = {
            default = {}
        }
    };
    local v35 = setmetatable(v34, v8);
    v34._inputModeConnection = v4.connect(function()
        if v34._hasInputRules then
            v35:resolve();
        end;
    end);
    v34._vrEnabledConnection = l_VRService_0:GetPropertyChangedSignal("VREnabled"):Connect(function()
        v34._vrEnabled = l_VRService_0.VREnabled;
        v35:resolve();
    end);
    return v35;
end;
v8.incRef = function(v36)
    v36._refCount = v36._refCount + 1;
end;
v8.destroy = function(v37)
    if v37._refCount > 1 then
        v37._refCount = v37._refCount - 1;
        return ;
    else
        if v37._layerCollectorSizeConnection then
            v37._layerCollectorSizeConnection:Disconnect();
            v37._layerCollectorSizeConnection = nil;
        end;
        if v37._inputModeConnection then
            v37._inputModeConnection:disconnect();
            v37._inputModeConnection = nil;
        end;
        if v37._vrEnabledConnection then
            v37._vrEnabledConnection:Disconnect();
            v37._vrEnabledConnection = nil;
        end;
        v37._changed = nil;
        for v38, v39 in v7, nil, nil do
            if v39 == v37 then
                v7[v38] = nil;
            end;
        end;
        return ;
    end;
end;
v8.connect = function(v40, v41)
    if v40._changed == nil then
        error("Connecting to dead signal");
    end;
    return v40._changed:connect(v41);
end;
v8.currentRule = function(v42, v43)
    return v42._configResolvers[v43 or "default"]:currentRule();
end;
v8.currentKey = function(v44, v45)
    return v44._configResolvers[v45 or "default"]:currentKey();
end;
v8.updateAbsoluteSize = function(v46, v47)
    local l_AbsoluteSize_0 = v47.AbsoluteSize;
    if v47:isA("LayerCollector") then
        local l_status_0, l_result_0 = pcall(function()
            return v47.IgnoreGuiInset;
        end);
        if not (not l_status_0 or not l_result_0) then
            local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
            l_AbsoluteSize_0 = l_AbsoluteSize_0 + l_l_GuiService_0_GuiInset_0;
        end;
    end;
    if not (l_AbsoluteSize_0.X == v46._absoluteSize.X) or l_AbsoluteSize_0.Y ~= v46._absoluteSize.Y then
        v46._absoluteSize = l_AbsoluteSize_0;
        if v46._hasSizeRules then
            v46:resolve();
        end;
    end;
end;
v8.resolve = function(v53)
    if v53._configResolvers then
        local v54 = v53._absoluteSize.X or 1;
        local v55 = v53._absoluteSize.Y or 1;
        local v56 = v4.preferred();
        local v57 = v4.last();
        local l__vrEnabled_0 = v53._vrEnabled;
        local v59 = false;
        for _, v61 in v53._configResolvers, nil, nil do
            if v61:resolve(v54, v55, v56, v57, l__vrEnabled_0) then
                v59 = true;
            end;
        end;
        if v59 then
            v53._changed:fire();
        end;
        return ;
    else
        return ;
    end;
end;
is_array = function(v62)
    local v63 = false;
    if type(v62) == "table" then
        v63 = v62[1] ~= nil;
    end;
    return v63;
end;
v8.setConfig = function(v64, v65)
    if is_array(v65) then
        v65 = {
            default = v65
        };
    end;
    local v66 = false;
    local v67 = false;
    local v68 = {};
    if v65 then
        for v69, v70 in v65, nil, nil do
            v68[v69] = v10.new(v70);
            v66 = v66 or v68[v69]:hasSizeRules();
            v67 = v67 or v68[v69]:hasInputRules();
        end;
    end;
    v64._hasInputRules = v67;
    v64._hasSizeRules = v66;
    v64._configResolvers = v68;
    v64:resolve();
end;
v8.setLocalInstance = function(v71, v72, v73)
    if typeof(v72) ~= "Instance" then
        error("setLocalInstance arg1 expects Instance");
        return ;
    else
        local v74 = nil;
        v74 = if typeof(v73) == "string" then v6(v72, v73) or v72 else if typeof(v73) == "Instance" then v73 else v72:FindFirstAncestorWhichIsA("LayerCollector");
        if v74 == nil then
            v74 = v72;
        end;
        if v71._layerCollectorSizeConnection then
            v71._layerCollectorSizeConnection:Disconnect();
            v71._layerCollectorSizeConnection = nil;
        end;
        if v74 then
            v71._layerCollectorSizeConnection = v74:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                v71:updateAbsoluteSize(v74);
            end);
            v71:updateAbsoluteSize(v74);
        end;
        return ;
    end;
end;
return {
    DefaultKey = "Default", 
    bindContainer = function(v75, v76)
        local v77 = v7[v75];
        local v78 = v76 == nil;
        if not v78 or not v77 then
            v77 = v8.new();
            v77:setLocalInstance(v75, v75);
            v77:setConfig(v76 or l_rules_0);
            if v78 then
                v7[v75] = v77;
            end;
            return v77;
        else
            v77:incRef();
            return v77;
        end;
    end
};
