local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local function v7(v4, v5)
    local l_assetTypeEnum_0 = v5.assetTypeEnum;
    if #v4 == 0 then
        v1.reportFailure(v1.ErrorType.validateSingleInstance_ZeroInstances);
        return false, {
            string.format("Failed to find an instance of the asset type '%s'. Make sure one exists and try again.", l_assetTypeEnum_0.Name)
        };
    elseif #v4 > 1 then
        v1.reportFailure(v1.ErrorType.validateSingleInstance_MultipleInstances);
        return false, {
            string.format("Selected more than one instance of type '%s'. Please, select a single instance of this type and try again.", l_assetTypeEnum_0.Name)
        };
    else
        return true;
    end;
end;
local function v9(v8)
    if #v8 == 0 then
        v1.reportFailure(v1.ErrorType.validateSingleInstance_ZeroInstances);
        return false, {
            "No instances selected"
        };
    elseif #v8 > 1 then
        v1.reportFailure(v1.ErrorType.validateSingleInstance_MultipleInstances);
        return false, {
            "More than one instance selected"
        };
    else
        return true;
    end;
end;
if not v3() then
    return v9;
else
    return v7;
end;
