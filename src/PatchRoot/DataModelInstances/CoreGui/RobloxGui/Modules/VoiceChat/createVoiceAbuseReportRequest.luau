local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(game:GetService("CorePackages").Cryo);
local _ = require(script.Parent.VoiceChatServiceManager);
local l_getSortedPlayers_0 = require(script.Parent.VoiceUsersByProximity).getSortedPlayers;
return function(v4, v5, v6)
    local l_v4_PlayerByUserId_0 = v4:GetPlayerByUserId(v6.abuserUserId);
    local v8 = nil;
    if not ((not l_v4_PlayerByUserId_0 or not l_v4_PlayerByUserId_0.Character) or not l_v4_PlayerByUserId_0.Character.PrimaryPart) then
        v8 = l_v4_PlayerByUserId_0.Character.PrimaryPart.Position;
    end;
    local v9 = #v1.Dictionary.values(v5.participants);
    local v10 = 0;
    if v8 then
        v10 = #l_getSortedPlayers_0(v4, v5, v8, 160, nil, l_v4_PlayerByUserId_0);
    end;
    return l_HttpService_0:JSONEncode({
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
                        data = tostring(v6.localUserId)
                    }
                }
            }, 
            REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = tostring(v6.abuserUserId)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v6.abuseReason
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v6.abuseComment
                    }
                }
            }, 
            IS_PLACE_VOICE_ENABLED = {
                valueList = {
                    {
                        data = "true"
                    }
                }
            }, 
            VOICE_USER_IDS_FROM_CLIENT = {
                valueList = v1.List.map(v6.sortedPlayerListUserIds, function(v11)
                    return {
                        data = tostring(v11)
                    };
                end)
            }, 
            IN_EXP_MENU_OPENED_UNIX_MILLI = {
                valueList = {
                    {
                        data = tostring(v6.inExpMenuOpenedUnixMilli)
                    }
                }
            }, 
            VOICE_CHANNEL_ID = {
                valueList = {
                    {
                        data = tostring(if not game:GetEngineFeature("VoiceChatServiceExposesChannelId") then v5.service:GetGroupId() else v5.service:GetChannelId())
                    }
                }
            }, 
            VOICE_USER_COUNT = {
                valueList = {
                    {
                        data = tostring(v9)
                    }
                }
            }, 
            VOICE_IMPACTED_USER_COUNT = {
                valueList = {
                    {
                        data = tostring(v10)
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v6.abuseVector
                    }
                }
            }
        }
    });
end;
