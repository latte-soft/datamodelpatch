local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v3 = {
    UserProfile = "user_profile", 
    Place = "place"
};
local v4 = {
    Experience = "experience", 
    Profile = "profile", 
    Item = "item"
};
local v5 = {
    AssetId = "REPORT_TARGET_ASSET_ID", 
    UserId = "REPORT_TARGET_USER_ID"
};
local function v12(v6)
    local v7 = {};
    for _, v9 in v6, nil, nil do
        if v9.tagValues then
            for _, v11 in v9.tagValues, nil, nil do
                table.insert(v7, {
                    data = v11
                });
            end;
        end;
    end;
    return v7;
end;
local function _(v13)
    return function(v14)
        return {
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = if v14.context == v4.Experience then v3.Place else if v14.context == v4.Profile then v3.UserProfile else v14.reportAbuseVector
                    }
                }
            }, 
            [v13] = {
                valueList = {
                    {
                        data = v14.assetId
                    }
                }
            }
        };
    end;
end;
local v16 = {};
local l_AssetId_0 = v5.AssetId;
local l_l_AssetId_0_0 = l_AssetId_0 --[[ copy: 11 -> 12 ]];
v16.item = function(v19)
    return {
        REPORTED_ABUSE_VECTOR = {
            valueList = {
                {
                    data = if v19.context == v4.Experience then v3.Place else if v19.context == v4.Profile then v3.UserProfile else v19.reportAbuseVector
                }
            }
        }, 
        [l_l_AssetId_0_0] = {
            valueList = {
                {
                    data = v19.assetId
                }
            }
        }
    };
end;
l_AssetId_0 = v5.UserId;
local l_l_AssetId_0_1 = l_AssetId_0 --[[ copy: 11 -> 13 ]];
v16.profile = function(v21)
    return {
        REPORTED_ABUSE_VECTOR = {
            valueList = {
                {
                    data = if v21.context == v4.Experience then v3.Place else if v21.context == v4.Profile then v3.UserProfile else v21.reportAbuseVector
                }
            }
        }, 
        [l_l_AssetId_0_1] = {
            valueList = {
                {
                    data = v21.assetId
                }
            }
        }
    };
end;
l_AssetId_0 = v5.AssetId;
v16.experience = function(v22)
    return {
        REPORTED_ABUSE_VECTOR = {
            valueList = {
                {
                    data = if v22.context == v4.Experience then v3.Place else if v22.context == v4.Profile then v3.UserProfile else v22.reportAbuseVector
                }
            }
        }, 
        [l_AssetId_0] = {
            valueList = {
                {
                    data = v22.assetId
                }
            }
        }
    };
end;
return function(v23, v24)
    local v25 = {
        ENTRY_POINT = {
            valueList = {
                {
                    data = v24.platform
                }
            }
        }, 
        REPORTED_ABUSE_CATEGORY = {
            valueList = v12(v23)
        }
    };
    local v26 = v16[v24.context];
    if v26 then
        v25 = v1.Dictionary.join(v26(v24), v25);
    end;
    return v25;
end;
