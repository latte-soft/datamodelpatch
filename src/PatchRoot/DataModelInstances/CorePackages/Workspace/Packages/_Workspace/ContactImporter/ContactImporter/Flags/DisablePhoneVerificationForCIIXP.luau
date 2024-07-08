local l_useUserExperiment_0 = require(script:FindFirstAncestor("ContactImporter").Parent.RoactAppExperiment).useUserExperiment;
local v1 = game:DefineFastString("ContactsListLayer", "Social.ContactList");
local v2 = game:DefineFastString("PVVariant", "pv_upsell");
local function v5(v3)
    local v4 = ((v3 or {})[v1] or {})[v2];
    if v4 == "require_pv" then
        return true;
    elseif v4 == "do_not_require_pv_has_pv_upsell" then
        return false;
    elseif v4 == "do_not_require_pv_no_pv_upsell" then
        return false;
    else
        return true;
    end;
end;
local function v8(v6)
    local v7 = ((v6 or {})[v1] or {})[v2];
    if v7 == "require_pv" then
        return true;
    elseif v7 == "do_not_require_pv_has_pv_upsell" then
        return true;
    elseif v7 == "do_not_require_pv_no_pv_upsell" then
        return false;
    else
        return true;
    end;
end;
local function v11(v9)
    local v10 = ((v9 or {})[v1] or {})[v2];
    if v10 == "require_pv" then
        return false;
    elseif v10 == "do_not_require_pv_has_pv_upsell" then
        return true;
    elseif v10 == "do_not_require_pv_no_pv_upsell" then
        return false;
    else
        return false;
    end;
end;
return {
    useIsPVRequired = function(v12)
        return l_useUserExperiment_0({
            v1
        }, v5, v12.isExposureEnabled);
    end, 
    useShouldShowPVUpsell = function(v13)
        return l_useUserExperiment_0({
            v1
        }, v8, v13.isExposureEnabled);
    end, 
    usePVUpsellV2 = function(v14)
        return l_useUserExperiment_0({
            v1
        }, v11, v14.isExposureEnabled);
    end
};
