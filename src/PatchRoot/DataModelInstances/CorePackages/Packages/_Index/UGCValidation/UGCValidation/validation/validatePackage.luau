local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.validation.validateSingleInstance);
local v5 = require(l_Parent_0.validation.validateAssetCreator);
local v6 = require(l_Parent_0.util.ParseContentIds);
local _ = require(l_Parent_0.util.Types);
local function v16(v8)
    assert(v8.instances ~= nil, "instances required in validationContext for validatePackage");
    local l_instances_0 = v8.instances;
    local l_restrictedUserIds_0 = v8.restrictedUserIds;
    local v11, v12 = v4(l_instances_0, v8);
    if v11 then
        local v13 = l_instances_0[1];
        local v14 = {};
        local v15 = {};
        if not l_restrictedUserIds_0 or #l_restrictedUserIds_0 == 0 then
            return true;
        elseif v6.parseWithErrorCheck(v14, v15, v13, v3.PACKAGE_CONTENT_ID_FIELDS) then
            return v5(v15, v8);
        else
            v2.reportFailure(v2.ErrorType.validatePackage_FailedToParse);
            return false, {
                string.format("Failed to parse package data for model '%s'. Make sure the packageId is valid and try again.", v13:GetFullName())
            };
        end;
    else
        return v11, v12;
    end;
end;
local function v28(v17, v18, v19, v20)
    local v21, v22 = v4(v17);
    if v21 then
        local v23 = v17[1];
        local v24 = {};
        local v25 = {};
        if not v19 or #v19 == 0 then
            return true;
        else
            local v26, v27 = v6.parseWithErrorCheck(v24, v25, v23, v3.PACKAGE_CONTENT_ID_FIELDS);
            if v26 then
                return v5(v25, v18, v19, v20);
            else
                v2.reportFailure(v2.ErrorType.validatePackage_FailedToParse);
                return false, v27;
            end;
        end;
    else
        return v21, v22;
    end;
end;
if not v1() then
    return v28;
else
    return v16;
end;
