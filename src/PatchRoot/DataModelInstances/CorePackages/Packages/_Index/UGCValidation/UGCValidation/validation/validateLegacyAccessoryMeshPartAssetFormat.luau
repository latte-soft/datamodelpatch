local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.createLegacyAccessoryMeshPartAssetFormatSchema);
local v3 = require(l_Parent_0.validation.validateSingleInstance);
local v4 = require(l_Parent_0.validation.validateInstanceTree);
local v5 = require(l_Parent_0.validation.validateLegacyAccessoryMeshPartAssetFormatMatch);
local v6 = require(l_Parent_0.validation.validateAccessoryName);
local v7 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v8 = require(l_Parent_0.flags.getFFlagUGCValidationNameCheck);
local function v19(v9, v10)
    local l_instances_0 = v10.instances;
    local l_isServer_0 = v10.isServer;
    local v13 = nil;
    local v14 = nil;
    local v15, v16 = v3(l_instances_0, v10);
    v13 = v15;
    v14 = v16;
    if v13 then
        v15 = l_instances_0[1];
        local v17, v18 = v4(v2(v9:FindFirstChild("Handle"):FindFirstChildOfClass("Attachment").Name), v15);
        v13 = v17;
        v14 = v18;
        if v13 then
            if not (not v8() or not l_isServer_0) then
                v17, v18 = v6(v15);
                v13 = v17;
                v14 = v18;
                if not v13 then
                    return false, v14;
                end;
            end;
            v17, v18 = v5(v15, v9);
            v13 = v17;
            v14 = v18;
            if v13 then
                return true;
            else
                return false, v14;
            end;
        else
            return false, v14;
        end;
    else
        return false, v14;
    end;
end;
local function v30(v20, v21, _, v23)
    local v24 = nil;
    local v25 = nil;
    local v26, v27 = v3(v20);
    v24 = v26;
    v25 = v27;
    if v24 then
        v26 = v20[1];
        local v28, v29 = v4(v2(v21:FindFirstChild("Handle"):FindFirstChildOfClass("Attachment").Name), v26);
        v24 = v28;
        v25 = v29;
        if v24 then
            if not (not v8() or not v23) then
                v28, v29 = v6(v26);
                v24 = v28;
                v25 = v29;
                if not v24 then
                    return false, v25;
                end;
            end;
            v28, v29 = v5(v26, v21);
            v24 = v28;
            v25 = v29;
            if v24 then
                return true;
            else
                return false, v25;
            end;
        else
            return false, v25;
        end;
    else
        return false, v25;
    end;
end;
if not v7() then
    return v30;
else
    return v19;
end;
