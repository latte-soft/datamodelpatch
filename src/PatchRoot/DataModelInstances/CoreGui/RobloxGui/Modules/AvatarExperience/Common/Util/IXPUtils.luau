local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Symbol_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol;
local v6 = require(l_CorePackages_0.Packages.Dash);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_useUserExperiment_0 = v8.useUserExperiment;
local v10 = require(l_Modules_0.LuaApp.Util.ExperimentCacheManager);
local v11 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.ixp");
local v12 = l_Symbol_0.named("NO_VALUE");
local l_l_IXPService_0_0 = l_IXPService_0;
local l_connectUserLayer_0 = v8.connectUserLayer;
local l_default_0 = v10.default;
local v20 = {
    defineIXPTest = function(v16)
        local v17 = {
            name = v16.name, 
            layer = v16.layer, 
            recordExposure = v16.recordExposure ~= false, 
            isEnabled = function()
                return v16.getDependentFlagsEnabled() and (v16.getEnabledFlag() or v16.getEnabledForAllFlag());
            end, 
            isEnabledForAll = function()
                return v16.getDependentFlagsEnabled() and v16.getEnabledForAllFlag();
            end
        };
        v11:info("[Define IXP Test] {}, layer: {}, isEnabled: {}, isEnabledForAll: {}", v17.name, v17.layer, v17.isEnabled(), v17.isEnabledForAll());
        for v18, v19 in v16.variables, nil, nil do
            v17[v18] = {
                name = v18, 
                ixpTest = v17, 
                mapLayerToValue = v19, 
                lastValue = v12
            };
        end;
        return v17;
    end
};
local function v22(v21)
    v21.usedExperimentCacheManager = v21.usedExperimentCacheManager or l_l_IXPService_0_0:GetUserStatusForLayer(v21.layer) ~= Enum.IXPLoadingStatus.Initialized;
    return if not v21.usedExperimentCacheManager then l_l_IXPService_0_0:GetUserLayerVariables(v21.layer) else l_default_0:getLayerVariables(v21.layer) or {};
end;
local function v27(v23, v24)
    local l_ixpTest_0 = v23.ixpTest;
    if not v24 then
        v24 = v22(l_ixpTest_0);
    end;
    local v26 = v23.mapLayerToValue(v24, l_ixpTest_0.isEnabledForAll());
    if v26 ~= v23.lastValue then
        v11:info("[Read IXP Variable] {} {} = {}", l_ixpTest_0.name, v23.name, v26);
        v23.lastValue = v26;
    end;
    return v26;
end;
local function _(v28, v29)
    if not v28.usedExperimentCacheManager then
        return v29[v28.layer];
    else
        return nil;
    end;
end;
local function v39(v31, v32, v33)
    return l_connectUserLayer_0(v32, function(v34)
        local v35 = {};
        for v36, v37 in v31, nil, nil do
            local l_ixpTest_1 = v37.ixpTest;
            if l_ixpTest_1.isEnabled() then
                v35[v36] = v27(v37, if not l_ixpTest_1.usedExperimentCacheManager then v34[l_ixpTest_1.layer] else nil);
            end;
        end;
        return v35;
    end, v33);
end;
v20.connectTestVariables = function(v40)
    local v41 = {};
    local v42 = {};
    local v43 = {};
    local v44 = {};
    for v45, v46 in v40, nil, nil do
        local l_ixpTest_2 = v46.ixpTest;
        if not l_ixpTest_2.recordExposure then
            v41[l_ixpTest_2.layer] = true;
            v43[v45] = v46;
        else
            v42[l_ixpTest_2.layer] = true;
            v44[v45] = v46;
        end;
    end;
    local v48 = {};
    local v49 = v6.keys(v41);
    if #v49 > 0 then
        table.sort(v49);
        table.insert(v48, v39(v43, v49, false));
    end;
    local v50 = v6.keys(v42);
    if #v50 > 0 then
        table.sort(v50);
        table.insert(v48, v39(v44, v50, true));
    end;
    return v6.compose(table.unpack(v48));
end;
v20.useTestVariables = function(...)
    local v51 = {
        ...
    };
    local v52 = nil;
    for _, v54 in v51, nil, nil do
        if not v52 then
            v52 = v54.ixpTest;
        else
            v4.assert(v54.ixpTest == v52, "All test variables passed to IXPUtils.useTestVariables must belong to same IXP test.");
        end;
    end;
    return l_useUserExperiment_0({
        v52.layer
    }, function(v55)
        local l_v52_0 = v52;
        local v57 = if not l_v52_0.usedExperimentCacheManager then v55[l_v52_0.layer] else nil;
        l_v52_0 = {};
        for v58, v59 in v51, nil, nil do
            if v52.isEnabled() then
                l_v52_0[v58] = v27(v59, v57);
            end;
        end;
        return table.unpack(l_v52_0);
    end, v52.recordExposure);
end;
local function _(v60, v61)
    local l_ixpTest_3 = v60.ixpTest;
    if l_ixpTest_3.isEnabled() then
        return (v27(v60, if not v61 then nil else v61[l_ixpTest_3.layer]));
    else
        return nil;
    end;
end;
v20.readTestVariable = function(v64)
    if v64.ixpTest.isEnabled() then
        local v65 = nil;
        local l_ixpTest_4 = v64.ixpTest;
        if not v65 then
            v65 = v22(l_ixpTest_4);
        end;
        local v67 = v64.mapLayerToValue(v65, l_ixpTest_4.isEnabledForAll());
        if v67 ~= v64.lastValue then
            v11:info("[Read IXP Variable] {} {} = {}", l_ixpTest_4.name, v64.name, v67);
            v64.lastValue = v67;
        end;
        return v67;
    else
        return nil;
    end;
end;
v20.getFromLayers = function(v68, v69)
    local l_ixpTest_5 = v69.ixpTest;
    if l_ixpTest_5.isEnabled() then
        return (v27(v69, if not v68 then nil else v68[l_ixpTest_5.layer]));
    else
        return nil;
    end;
end;
v20.logExposure = function(v71)
    v11:debug("LogUserLayerExposure: {}", v71.layer);
    l_l_IXPService_0_0:LogUserLayerExposure(v71.layer);
end;
v20.useLogExposureOnce = function(v72)
    local v73 = v7.useRef(false);
    return v7.useCallback(function()
        if not v73.current then
            v20.logExposure(v72);
            v73.current = true;
        end;
    end, {
        v72.layer
    });
end;
v20.setMocksForTesting = function(v74, v75, v76)
    l_l_IXPService_0_0 = v74 or l_l_IXPService_0_0;
    l_connectUserLayer_0 = v75 or l_connectUserLayer_0;
    l_default_0 = v76 or l_default_0;
end;
v20.restoreDefaultsAfterTesting = function()
    l_l_IXPService_0_0 = l_IXPService_0;
    l_connectUserLayer_0 = v8.connectUserLayer;
    l_default_0 = v10.default;
end;
return v20;
