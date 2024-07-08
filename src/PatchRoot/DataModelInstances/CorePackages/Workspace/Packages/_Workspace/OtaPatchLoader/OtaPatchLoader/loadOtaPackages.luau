local v0 = require(script.Parent.validatePackageDependencies_deprecated);
local v1 = require(script.Parent.OtaPatchLoaderTelemetry);
local l_Events_0 = v1.Events;
local l_FFlagLuaAppRedoOtaValidation_0 = require(script.Parent.Flags).FFlagLuaAppRedoOtaValidation;
local v4 = {};
local _ = function(v5, v6)
    local l_v5_0 = v5;
    for _, v9 in v6, nil, nil do
        l_v5_0 = l_v5_0:FindFirstChild(v9, false);
        if not l_v5_0 then
            return nil;
        end;
    end;
    return l_v5_0;
end;
local function _(v11, v12, v13, v14)
    v1.sendTelemetryEvent(v11, v12, {
        patchName = v13, 
        extraMessage = v14
    });
end;
return function(v16, v17, v18, v19, v20, v21, v22, v23)
    if v17 then
        local l_loggingProtocol_0 = v22.loggingProtocol;
        local l_dataModelPatchService_0 = v22.dataModelPatchService;
        if not l_dataModelPatchService_0 then
            error("DataModelPatchService not provided to loadOtaPackages");
        end;
        if not v16 or v16 == 0 then
            v1.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.NoUserId, {
                patchName = v17, 
                extraMessage = nil
            });
            return nil;
        else
            local v26 = ("%*:%*"):format(v16, v17);
            local v27 = v4[v26];
            if v27 ~= nil then
                if v27 == "NONE" then
                    return nil;
                else
                    return v4[v26];
                end;
            else
                v1.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.PatchLoadEntryPoint, {
                    patchName = v17, 
                    extraMessage = nil
                });
                local l_status_0, l_result_0 = pcall(function()
                    assert(v18, "patchBehavior is nil");
                    assert(v19, "patchConfig is nil");
                    assert(v20, "patchPackagesRoot is nil");
                    l_dataModelPatchService_0:RegisterPatch(v17, v18, v19, v16);
                    local l_l_dataModelPatchService_0_Patch_0 = l_dataModelPatchService_0:GetPatch(v17);
                    task.defer(function()
                        l_dataModelPatchService_0:UpdatePatch(v16, v17, function()
                        end);
                    end);
                    if l_l_dataModelPatchService_0_Patch_0 then
                        local l_v20_0 = v20;
                        local l_l_l_dataModelPatchService_0_Patch_0_0 = l_l_dataModelPatchService_0_Patch_0;
                        local v31;
                        for _, v33 in l_v20_0, nil, nil do
                            l_l_l_dataModelPatchService_0_Patch_0_0 = l_l_l_dataModelPatchService_0_Patch_0_0:FindFirstChild(v33, false);
                            if not l_l_l_dataModelPatchService_0_Patch_0_0 then
                                v31 = nil;
                                goto label0 --[[  true, false  ]];
                            end;
                        end;
                        v31 = l_l_l_dataModelPatchService_0_Patch_0_0;
                        ::label0::;
                        if v31 then
                            assert(v31, "otaPackagesRoot is nil");
                            if not l_FFlagLuaAppRedoOtaValidation_0 then
                                l_v20_0, l_l_l_dataModelPatchService_0_Patch_0_0 = v0(v31, v23);
                                if not l_v20_0 then
                                    v1.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.PatchInvalidDeps, {
                                        patchName = v17, 
                                        extraMessage = l_l_l_dataModelPatchService_0_Patch_0_0
                                    });
                                    return nil;
                                end;
                            end;
                            if v21 then
                                l_l_l_dataModelPatchService_0_Patch_0_0 = v21;
                                local l_l_l_dataModelPatchService_0_Patch_0_1 = l_l_dataModelPatchService_0_Patch_0;
                                for _, v36 in l_l_l_dataModelPatchService_0_Patch_0_0, nil, nil do
                                    l_l_l_dataModelPatchService_0_Patch_0_1 = l_l_l_dataModelPatchService_0_Patch_0_1:FindFirstChild(v36, false);
                                    if not l_l_l_dataModelPatchService_0_Patch_0_1 then
                                        l_v20_0 = nil;
                                        goto label1 --[[  true, false  ]];
                                    end;
                                end;
                                l_v20_0 = l_l_l_dataModelPatchService_0_Patch_0_1;
                                ::label1::;
                                if l_v20_0 then
                                    l_l_l_dataModelPatchService_0_Patch_0_0 = require(l_v20_0);
                                end;
                            end;
                            return v31;
                        else
                            v1.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.MissingPatchRoot, {
                                patchName = v17, 
                                extraMessage = table.concat(v20, ".")
                            });
                            return nil;
                        end;
                    else
                        v1.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.NoPatchFound, {
                            patchName = v17, 
                            extraMessage = nil
                        });
                        return nil;
                    end;
                end);
                if not l_status_0 or not l_result_0 then
                    if l_status_0 then
                        v1.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.PatchLoadFailed, {
                            patchName = v17, 
                            extraMessage = nil
                        });
                    else
                        v1.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.PatchLoadError, {
                            patchName = v17, 
                            extraMessage = tostring(l_result_0)
                        });
                    end;
                    v4[v26] = "NONE";
                    return nil;
                else
                    v1.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.PatchLoadedOk, {
                        patchName = v17, 
                        extraMessage = nil
                    });
                    v4[v26] = l_result_0;
                    return l_result_0;
                end;
            end;
        end;
    else
        return nil;
    end;
end;
