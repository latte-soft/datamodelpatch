local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local v3 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local l_GetFFlagLuaAppNewStreamNotificationsEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppNewStreamNotificationsEnabled;
local function v11(v5)
    local v6 = {};
    for _, v8 in v5, nil, nil do
        for _, v10 in v8.tagValues, nil, nil do
            table.insert(v6, {
                data = v10
            });
        end;
    end;
    return v6;
end;
local v22 = {
    Item = function(v12)
        local v13 = {};
        if not (not v12.assetTypeName or not v12.itemId) then
            v13.REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v12.assetTypeName
                    }
                }
            };
            v13.REPORT_TARGET_ASSET_ID = {
                valueList = {
                    {
                        data = v12.itemId
                    }
                }
            };
        end;
        return v13;
    end, 
    Chat = function(v14)
        local v15 = {
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v3.ABUSE_VECTOR.UserProfile
                    }
                }
            }
        };
        if v14.userId then
            v15.REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v14.userId
                    }
                }
            };
        end;
        return v15;
    end, 
    Profile = function(v16)
        local v17 = {
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v3.ABUSE_VECTOR.UserProfile
                    }
                }
            }
        };
        if v16.profileUserId then
            v17.REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v16.profileUserId
                    }
                }
            };
        end;
        return v17;
    end, 
    ExperienceDetails = function(v18)
        local v19 = {};
        if v18.rootPlaceId then
            v19.REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v3.ABUSE_VECTOR.Place
                    }
                }
            };
            v19.REPORT_TARGET_ASSET_ID = {
                valueList = {
                    {
                        data = v18.rootPlaceId
                    }
                }
            };
        end;
        return v19;
    end, 
    Notification = if not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() then nil else function(v20)
        local v21 = {
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v3.ABUSE_VECTOR.Notification
                    }
                }
            }
        };
        if v20.submitterUserId then
            v21.SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = v20.submitterUserId
                    }
                }
            };
        end;
        if v20.assetId then
            v21.NOTIFICATION_ID = {
                valueList = {
                    {
                        data = v20.assetId
                    }
                }
            };
        end;
        return v21;
    end
};
return function(v23, v24, v25)
    local v26 = {
        ENTRY_POINT = {
            valueList = {
                {
                    data = v25
                }
            }
        }, 
        REPORTED_ABUSE_CATEGORY = {
            valueList = v11(v23)
        }
    };
    local v27 = v22[v24.reportEntryPoint];
    local v28 = if not v27 then {} else v27(v24);
    for v29, v30 in v28, nil, nil do
        v26[v29] = v30;
    end;
    return v26;
end;
