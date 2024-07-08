local l_Parent_0 = script:FindFirstAncestor("OtaPatchLoader").Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v3 = game:DefineFastInt("OtaLoaderInfoEventHundredthsPercent", 0);
local v4 = game:DefineFastInt("OtaLoaderErrorEventHundredthsPercent", 0);
local v5 = {
    INFO = "INFO", 
    ERROR = "ERROR"
};
local function _(v6, v7)
    return {
        Type = v6, 
        Description = v7
    };
end;
local v9 = {
    PatchLoadEntryPoint = {
        Type = v5.INFO, 
        Description = "Patch load entry point"
    }, 
    NoUserId = {
        Type = v5.INFO, 
        Description = "No User Id; can't load patch"
    }, 
    NoPatchFound = {
        Type = v5.INFO, 
        Description = "No patch found"
    }, 
    PatchInvalidDeps = {
        Type = v5.INFO, 
        Description = "Patch does not match package dependencies"
    }, 
    PatchLoadedOk = {
        Type = v5.INFO, 
        Description = "Patch loaded successfully"
    }, 
    PatchPackageFound = {
        Type = v5.INFO, 
        Description = "Package found in patch; attemping to require"
    }, 
    PatchPackageRequiredOk = {
        Type = v5.INFO, 
        Description = "Package successfully required from patch; using patch's package"
    }, 
    NoValidatorScript = {
        Type = v5.INFO, 
        Description = "No validation script specified"
    }, 
    ValidatorScriptFailed = {
        Type = v5.INFO, 
        Description = "Patch failed validator script"
    }, 
    PackageValidationFailed = {
        Type = v5.INFO, 
        Description = "Package validation failed"
    }, 
    StarterFileIncompatible = {
        Type = v5.INFO, 
        Description = "Patch starter file type incompatible"
    }, 
    PatchLoadFailed = {
        Type = v5.INFO, 
        Description = "Patch failed to load"
    }, 
    MissingPatchRoot = {
        Type = v5.ERROR, 
        Description = "Could not find root of patch"
    }, 
    PatchLoadError = {
        Type = v5.ERROR, 
        Description = "Error when loading a patch"
    }, 
    RequirePackageError = {
        Type = v5.ERROR, 
        Description = "Script error on requiring the patch package"
    }, 
    RequirePackageEmpty = {
        Type = v5.ERROR, 
        Description = "Patch package was empty"
    }, 
    PatchPackageMissing = {
        Type = v5.ERROR, 
        Description = "Package missing in patch"
    }, 
    ValidatorScriptError = {
        Type = v5.ERROR, 
        Description = "Script error on patch validation script"
    }, 
    PackageValidationError = {
        Type = v5.ERROR, 
        Description = "Package validation script error"
    }
};
local function v12(v10, v11)
    return {
        eventName = ("OtaPatch_Info_%*"):format(v10), 
        backends = {
            l_default_0.TelemetryBackends.Points
        }, 
        throttlingPercentage = v3, 
        lastUpdated = {
            24, 
            2, 
            7
        }, 
        description = v11, 
        links = ""
    };
end;
local function v15(v13, v14)
    return {
        eventName = ("OtaPatch_Error_%*"):format(v13), 
        backends = {
            l_default_0.TelemetryBackends.Points
        }, 
        throttlingPercentage = v4, 
        lastUpdated = {
            24, 
            2, 
            7
        }, 
        description = v14, 
        links = ""
    };
end;
local v16 = {};
local v17 = {};
for v18, _ in pairs(v9) do
    v17[v18] = v18;
end;
v16.Events = v17;
setmetatable(v16.Events, {
    __newindex = function(_, v21, v22)
        error((("Trying to modify static table with key %*, index %*"):format(v21, v22)));
    end, 
    __index = function(_, v24)
        error((("OtaPatchLoaderTelemetry - Could not find telemetry event for %*"):format(v24)));
    end
});
v16.sendTelemetryEvent = function(v25, v26, v27)
    if v25 then
        local v28 = nil;
        local v29 = v9[v26];
        if v29 then
            if v29.Type == v5.ERROR then
                v28 = v15(v26, v29.Description);
            elseif v29.Type == v5.INFO then
                v28 = v12(v26, v29.Description);
            else
                error((("OtaPatchLoaderTelemetry - Unknown event type %* for event %*"):format(v29.Type, v26)));
                return ;
            end;
            if not v27.extraMessage then
                l_Logger_0:info((("[OtaPatchLoaderTelemetry] Event %*"):format(v26)));
            else
                l_Logger_0:info((("[OtaPatchLoaderTelemetry] Event %* - %*"):format(v26, v27.extraMessage)));
            end;
            v25:logRobloxTelemetryEvent(v28, {
                v25.StandardizedFields.addOsInfo
            }, v27);
            return ;
        else
            error((("OtaPatchLoaderTelemetry - Could not find telemetry event for %*"):format(v26)));
            return ;
        end;
    else
        return ;
    end;
end;
return v16;
