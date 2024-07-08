local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Analysis.SceneAnalysis);
local l_getHumanoidDescription_0 = require(l_Parent_0.GetHumanoidDescription).getHumanoidDescription;
local l_HttpService_0 = game:GetService("HttpService");
local v5 = {
    Variant = {
        IGARv1 = "IGARv1"
    }
};
transformTargetPlayers = function(v6, v7)
    local v8 = {};
    if v7 == 0 then
        v7 = 1;
    end;
    for _, v10 in ipairs(v6) do
        local l_player_0 = v10.player;
        local l_count_0 = v10.count;
        local v13, v14 = l_getHumanoidDescription_0(l_player_0.UserId);
        table.insert(v8, {
            userId = l_player_0.UserId, 
            hitCount = l_count_0, 
            hitPercentage = l_count_0 / v7, 
            humanoidDescription = v13, 
            humanoidDescriptionStatus = v14
        });
    end;
    return v8;
end;
serializeTargetPlayersIntoTagValues = function(v15)
    local v16 = {};
    for _, v18 in ipairs(v15) do
        table.insert(v16, {
            data = l_HttpService_0:JSONEncode(v18)
        });
    end;
    return v16;
end;
buildReport = function(v19, v20, v21, v22, v23)
    local v24 = {
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = "in-experience"
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = tostring(v19)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v22
                    }
                }
            }, 
            PLACE_ID = {
                valueList = {
                    {
                        data = tostring(game.PlaceId)
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v23
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = "multi"
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = v5.Variant.IGARv1
                    }
                }
            }, 
            IGAR_REPORT_TARGET_PLAYERS = {
                valueList = serializeTargetPlayersIntoTagValues(transformTargetPlayers(v21.extractedPlayers, v21.stats.raycastCompletedCount))
            }, 
            IGAR_REPORT_TARGET_ASSETS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v21.extractedAssets)
                    }
                }
            }, 
            IGAR_EXTRACTION_STATS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v21.stats)
                    }
                }
            }
        }
    };
    if v20 then
        v24.tags.SCREENSHOT_ID = {
            valueList = {
                {
                    data = v20
                }
            }
        };
    end;
    return l_HttpService_0:JSONEncode(v24);
end;
return buildReport;
