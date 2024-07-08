local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v3 = require(l_Parent_0.validation.validateLayeredClothingAccessory);
local v4 = require(l_Parent_0.validation.validateLayeredClothingAccessoryMeshPartAssetFormatMatch);
local function v13(v5, v6)
    local l_instances_0 = v6.instances;
    local v8 = nil;
    local v9 = nil;
    local v10, v11 = v3(v6);
    v8 = v10;
    v9 = v11;
    if v8 then
        local v12;
        v11, v12 = v4(l_instances_0[1], v5);
        v8 = v11;
        v9 = v12;
        if v8 then
            return true;
        else
            return false, v9;
        end;
    else
        return false, v9;
    end;
end;
local function v24(v14, v15, v16, v17, v18)
    local v19 = nil;
    local v20 = nil;
    local v21, v22 = v3(v14, v16, v17, v18);
    v19 = v21;
    v20 = v22;
    if v19 then
        local v23;
        v22, v23 = v4(v14[1], v15);
        v19 = v22;
        v20 = v23;
        if v19 then
            return true;
        else
            return false, v20;
        end;
    else
        return false, v20;
    end;
end;
if not v2() then
    return v24;
else
    return v13;
end;
