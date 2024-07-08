local l_defaultOtaValidator_0 = require(script:FindFirstAncestor("OtaPatchLoader").Parent.OtaPatchValidation).defaultOtaValidator;
local v1 = require(script.Parent.loadOtaPackages);
local v2 = require(script.Parent.OtaPatchLoaderTelemetry);
local l_Events_0 = v2.Events;
local l_FFlagLuaAppRedoOtaValidation_0 = require(script.Parent.Flags).FFlagLuaAppRedoOtaValidation;
local function _(v5, v6, v7, v8, v9)
    v2.sendTelemetryEvent(v5, v6, {
        patchName = v7, 
        packageName = v8, 
        extraMessage = v9
    });
end;
local function v18(v11, v12)
    local v13 = type(v11);
    local v14 = type(v12);
    if v13 ~= v14 then
        return false, (("starter types did not match; local %* ~= ota %*"):format(v13, v14));
    else
        if v13 == "table" then
            for v15, v16 in pairs(v11) do
                local v17 = v12[v15];
                if v17 then
                    if type(v17) ~= type(v16) then
                        return false, (("interface %* types did not match; local %* ~= ota %*"):format(v15, type(v16), (type(v17))));
                    end;
                else
                    return false, (("missing value for interface %* in ota"):format(v15));
                end;
            end;
        end;
        return true, "";
    end;
end;
return function(v19, v20, v21, v22, v23, v24, v25, v26)
    if not v24 then
        error("requireOtaPackageInternal missing services");
    end;
    local l_loggingProtocol_0 = v24.loggingProtocol;
    local l_patchName_0 = v23.patchName;
    local v29 = v1(v19, l_patchName_0, v23.patchBehavior, v23.patchConfig, v23.patchPackagesRoot, v23.patchStarterScriptPath, v24, v26);
    if v29 then
        assert(v29, "always true, only for lint");
        local l_v29_FirstChild_0 = v29:FindFirstChild(v20);
        if l_v29_FirstChild_0 then
            assert(l_v29_FirstChild_0, "always true, only for lint");
            v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.PatchPackageFound, {
                patchName = l_patchName_0, 
                packageName = v20, 
                extraMessage = nil
            });
            local l_status_0, l_result_0 = pcall(function()
                return (require(l_v29_FirstChild_0));
            end);
            if l_status_0 then
                if l_result_0 == nil then
                    v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.RequirePackageEmpty, {
                        patchName = l_patchName_0, 
                        packageName = v20, 
                        extraMessage = nil
                    });
                    return v21;
                else
                    if not l_FFlagLuaAppRedoOtaValidation_0 then
                        local v33, v34 = v18(v21, l_result_0);
                        if v33 then
                            if not v22 then
                                v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.NoValidatorScript, {
                                    patchName = l_patchName_0, 
                                    packageName = v20, 
                                    extraMessage = nil
                                });
                            else
                                local v35, v36, v37 = pcall(function()
                                    return require(v22)(v21, l_result_0);
                                end);
                                if v35 then
                                    if not v36 then
                                        v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.ValidatorScriptFailed, {
                                            patchName = l_patchName_0, 
                                            packageName = v20, 
                                            extraMessage = v37
                                        });
                                        return v21;
                                    end;
                                else
                                    v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.ValidatorScriptError, {
                                        patchName = l_patchName_0, 
                                        packageName = v20, 
                                        extraMessage = tostring(v36)
                                    });
                                    return v21;
                                end;
                            end;
                        else
                            v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.StarterFileIncompatible, {
                                patchName = l_patchName_0, 
                                packageName = v20, 
                                extraMessage = v34
                            });
                            return v21;
                        end;
                    else
                        local v38 = nil;
                        if v25 then
                            local v39 = nil;
                            local l_status_1, l_result_1 = pcall(function()
                                local v40 = l_result_0[v25];
                                if not v40 then
                                    return nil;
                                else
                                    return v40;
                                end;
                            end);
                            v39 = l_status_1;
                            v38 = l_result_1;
                            if v39 then
                                if not v38 then
                                    v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.PackageValidationError, {
                                        patchName = l_patchName_0, 
                                        packageName = v20, 
                                        extraMessage = ("custom validation key %* not found, using default validator"):format(v25)
                                    });
                                end;
                            else
                                v38 = nil;
                                v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.PackageValidationError, {
                                    patchName = l_patchName_0, 
                                    packageName = v20, 
                                    extraMessage = ("custom validation key %* error on access, using default validator"):format(v25)
                                });
                            end;
                        end;
                        if not v38 then
                            v38 = l_defaultOtaValidator_0;
                        end;
                        local v43, v44, v45 = pcall(function()
                            return v38(v26, v29, v21, l_result_0);
                        end);
                        if v43 then
                            if v44 then
                                --[[ close >= 14 ]]
                            else
                                v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.PackageValidationFailed, {
                                    patchName = l_patchName_0, 
                                    packageName = v20, 
                                    extraMessage = v45
                                });
                                return v21;
                            end;
                        else
                            v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.PackageValidationError, {
                                patchName = l_patchName_0, 
                                packageName = v20, 
                                extraMessage = tostring(v44)
                            });
                            return v21;
                        end;
                    end;
                    v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.PatchPackageRequiredOk, {
                        patchName = l_patchName_0, 
                        packageName = v20, 
                        extraMessage = nil
                    });
                    return l_result_0;
                end;
            else
                v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.RequirePackageError, {
                    patchName = l_patchName_0, 
                    packageName = v20, 
                    extraMessage = tostring(l_result_0)
                });
                return v21;
            end;
        else
            v2.sendTelemetryEvent(l_loggingProtocol_0, l_Events_0.PatchPackageMissing, {
                patchName = l_patchName_0, 
                packageName = v20, 
                extraMessage = nil
            });
            return v21;
        end;
    else
        return v21;
    end;
end;
