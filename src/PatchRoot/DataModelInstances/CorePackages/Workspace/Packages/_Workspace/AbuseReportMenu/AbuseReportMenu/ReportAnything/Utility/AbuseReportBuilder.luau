local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarIdentification);
local v3 = require(l_Parent_0.AdIdentification);
local l_HttpService_0 = game:GetService("HttpService");
local l_getAvatarsForPoint_0 = v2.AvatarIdentification.getAvatarsForPoint;
local l_getAvatarsForRegion_0 = v2.AvatarIdentification.getAvatarsForRegion;
local l_getAdsForPoint_0 = v3.AdIdentification.getAdsForPoint;
local l_GetFFlagReportAnythingEnableAdReport_0 = require(l_Parent_0.SharedFlags).GetFFlagReportAnythingEnableAdReport;
local l_GetFFlagGetHumanoidDescription_0 = require(l_Parent_0.SharedFlags).GetFFlagGetHumanoidDescription;
local l_GetFFlagRAEnableCircleRegion_0 = require(l_Parent_0.SharedFlags).GetFFlagRAEnableCircleRegion;
local l_GetFFlagReportAnythingAbuseVectorRenameEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagReportAnythingAbuseVectorRenameEnabled;
local l_GetFFlagReportAnythingIncludeDiscardStatsInReport_0 = require(l_Parent_0.SharedFlags).GetFFlagReportAnythingIncludeDiscardStatsInReport;
local l_getHumanoidDescription_0 = require(l_script_FirstAncestor_0.ReportAnything.Utility.GetHumanoidDescription).getHumanoidDescription;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local _ = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local v16 = {
    Variant = {
        CS = "ra/cs", 
        Sampling = "ra/sampling", 
        E1 = "ra/e1", 
        E2 = "ra/e2", 
        E3 = "ra/e3", 
        NM = "ra/nm", 
        Unknown = "ra/unknown"
    }
};
local function v21(v17)
    local v18 = {};
    for _, v20 in ipairs(v17) do
        v18[#v18 + 1] = {
            v20.X, 
            v20.Y
        };
    end;
    return v18;
end;
local function v26(v22)
    local v23 = {};
    for _, v25 in pairs(v22) do
        v23[#v23 + 1] = {
            assetId = v25.assetId, 
            distance = v25.distance, 
            boundingBox = {
                minX = v25.boundingBox.min.X, 
                minY = v25.boundingBox.min.Y, 
                maxX = v25.boundingBox.max.X, 
                maxY = v25.boundingBox.max.Y
            }, 
            adUnitName = v25.adUnitName, 
            encryptedAdTrackingData = v25.encryptedAdTrackingData, 
            encryptionMetadata = v25.encryptionMetadata
        };
    end;
    return v23;
end;
local function v31(v27)
    local v28 = {};
    for v29, v30 in pairs(v27) do
        v28[#v28 + 1] = {
            userId = tostring(v29), 
            distance = v30.distance, 
            boundingBox = {
                minX = v30.boundingBox.min.X, 
                minY = v30.boundingBox.min.Y, 
                maxX = v30.boundingBox.max.X, 
                maxY = v30.boundingBox.max.Y
            }, 
            hitRate = v30.hitRate, 
            convexHull = v21(v30.convexHull)
        };
        if l_GetFFlagReportAnythingIncludeDiscardStatsInReport_0() and v30.pointProcessingStats ~= nil then
            v28[#v28].pointProcessingStats = {
                not v30.pointProcessingStats.wasSkipped and 0 or 1, 
                v30.pointProcessingStats.total, 
                v30.pointProcessingStats.offScreenDiscardCount, 
                v30.pointProcessingStats.tooCloseDiscardCount
            };
        end;
    end;
    return v28;
end;
local function v50(v32)
    local v33 = {};
    local v34 = {};
    local v35 = {};
    local v36 = {};
    for _, v38 in ipairs(v32.annotationPoints) do
        local l_huge_0 = math.huge;
        local v40 = nil;
        local v41 = {};
        v41 = if not l_GetFFlagRAEnableCircleRegion_0() then l_getAvatarsForPoint_0(v32.identificationResults.identifiedAvatars, v38) else l_getAvatarsForRegion_0(v32.identificationResults.identifiedAvatars, v38, v32.annotationCircleRadius, v32.annotationAreaWidth, v32.annotationAreaHeight);
        for v42, _ in pairs(v41) do
            local l_distance_0 = v32.identificationResults.identifiedAvatars[v42].distance;
            if l_distance_0 < l_huge_0 then
                l_huge_0 = l_distance_0;
                v40 = v42;
            end;
        end;
        local v45 = nil;
        if l_GetFFlagReportAnythingEnableAdReport_0() then
            local v46 = l_getAdsForPoint_0(v32.identificationResults.identifiedAds, v38);
            l_huge_0 = math.huge;
            for v47, _ in pairs(v46) do
                local l_distance_1 = v32.identificationResults.identifiedAds[v47].distance;
                if l_distance_1 < l_huge_0 then
                    l_huge_0 = l_distance_1;
                    v45 = v47;
                end;
            end;
        end;
        if not (v40 ~= nil) or v33[v40] then
            if not (not (l_GetFFlagReportAnythingEnableAdReport_0() and v45 ~= nil) or v34[v45]) then
                v34[v45] = true;
                v36[#v36 + 1] = v32.identificationResults.identifiedAds[v45];
            end;
        else
            v33[v40] = true;
            v35[#v35 + 1] = v32.identificationResults.identifiedAvatars[v40].player;
        end;
    end;
    return v35, v36;
end;
local function v60(v51, _, v53)
    local v54 = false;
    for _, _ in pairs(v51.identificationResults.identifiedAvatars) do
        v54 = true;
        break;
    end;
    local v57 = false;
    if l_GetFFlagReportAnythingEnableAdReport_0() then
        for _, _ in pairs(v51.identificationResults.identifiedAds) do
            v57 = true;
            break;
        end;
    end;
    if v54 then
        v53.tags.IDENTIFIED_AVATARS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v31(v51.identificationResults.identifiedAvatars)))
                }
            }
        };
    end;
    if v51.identificationResults.avatarIDStats then
        v53.tags.AVATAR_ID_STATS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v51.identificationResults.avatarIDStats)
                }
            }
        };
    end;
    if not (not v57 or not l_GetFFlagReportAnythingEnableAdReport_0()) then
        v53.tags.IDENTIFIED_ADS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v26(v51.identificationResults.identifiedAds)))
                }
            }
        };
    end;
    if not (not v51.identificationResults.adIDStats or not l_GetFFlagReportAnythingEnableAdReport_0()) then
        v53.tags.AD_ID_STATS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v51.identificationResults.adIDStats)
                }
            }
        };
    end;
    if #v51.screenshotId > 0 then
        v53.tags.SCREENSHOT_ID = {
            valueList = {
                {
                    data = v51.screenshotId
                }
            }
        };
    end;
    if #v51.annotationPoints > 0 then
        v53.tags.RA_ANNOTATION_POINTS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v21(v51.annotationPoints)))
                }
            }
        };
    end;
    v53.tags.RA_ANNOTATION_OPTION_SEEN = {
        valueList = {
            {
                data = tostring(v51.annotationOptionSeen)
            }
        }
    };
    v53.tags.RA_ANNOTATION_PAGE_SEEN = {
        valueList = {
            {
                data = tostring(v51.annotationPageSeen)
            }
        }
    };
end;
return {
    buildExperienceReportRequest = function(v61, v62, v63)
        local v64 = {
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
                            data = tostring(v61.localUserId)
                        }
                    }
                }, 
                REPORTED_ABUSE_CATEGORY = {
                    valueList = {
                        {
                            data = v61.abuseReason
                        }
                    }
                }, 
                PLACE_ID = {
                    valueList = {
                        {
                            data = tostring(v61.placeId)
                        }
                    }
                }, 
                REPORTER_COMMENT = {
                    valueList = {
                        {
                            data = v61.abuseComment
                        }
                    }
                }, 
                REPORTED_ABUSE_VECTOR = {
                    valueList = {
                        {
                            data = "place"
                        }
                    }
                }, 
                IN_EXP_MENU_ENTRY_POINT = {
                    valueList = {
                        {
                            data = v61.menuEntryPoint
                        }
                    }
                }, 
                VARIANT = {
                    valueList = {
                        {
                            data = v61.variant or v16.Variant.CS
                        }
                    }
                }
            }
        };
        local _, v66 = v50(v62);
        v60(v62, v63, v64);
        if not (not (#v66 > 0) or not l_GetFFlagReportAnythingEnableAdReport_0()) then
            v64.tags.REPORT_TARGET_ADS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode((v26(v66)))
                    }
                }
            };
        end;
        return l_HttpService_0:JSONEncode(v64);
    end, 
    buildOtherReportRequest = function(v67, v68, v69)
        local v70 = {
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
                            data = tostring(v67.localUserId)
                        }
                    }
                }, 
                REPORTED_ABUSE_CATEGORY = {
                    valueList = {
                        {
                            data = v67.abuseReason
                        }
                    }
                }, 
                REPORTER_COMMENT = {
                    valueList = {
                        {
                            data = v67.abuseComment
                        }
                    }
                }, 
                REPORTED_ABUSE_VECTOR = {
                    valueList = {
                        {
                            data = not l_GetFFlagReportAnythingAbuseVectorRenameEnabled_0() and "other" or "avatar"
                        }
                    }
                }, 
                IN_EXP_MENU_ENTRY_POINT = {
                    valueList = {
                        {
                            data = v67.menuEntryPoint
                        }
                    }
                }, 
                VARIANT = {
                    valueList = {
                        {
                            data = v67.variant or v16.Variant.Unknown
                        }
                    }
                }
            }
        };
        local v71, _ = v50(v68);
        v60(v68, v69, v70);
        if #v71 > 0 then
            local v73 = tostring(v71[1].UserId);
            local v74 = {};
            for _, v76 in ipairs(v71) do
                v74[#v74 + 1] = tostring(v76.UserId);
            end;
            if l_GetFFlagGetHumanoidDescription_0() then
                local v77, v78 = l_getHumanoidDescription_0(v71[1].UserId);
                v70.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
                    valueList = {
                        {
                            data = l_HttpService_0:JSONEncode(v77)
                        }
                    }
                };
                v70.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = {
                    valueList = {
                        {
                            data = v78
                        }
                    }
                };
                local v79 = {};
                for _, v81 in ipairs(v71) do
                    local v82, v83 = l_getHumanoidDescription_0(v81.UserId);
                    v79[#v79 + 1] = {
                        humanoidDescription = v82, 
                        outputMessage = v83
                    };
                end;
                v70.tags.RA_ALL_ANNOTATED_HUMANOID_DESCRIPTIONS = {
                    valueList = {
                        {
                            data = l_HttpService_0:JSONEncode(v79)
                        }
                    }
                };
            end;
            v70.tags.REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = tostring(v73)
                    }
                }
            };
            v70.tags.RA_ALL_ANNOTATED_USER_IDS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v74)
                    }
                }
            };
        elseif v67.formSelectedAbuserUserId then
            if l_GetFFlagGetHumanoidDescription_0() then
                local v84, v85 = l_getHumanoidDescription_0(v67.formSelectedAbuserUserId);
                v70.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
                    valueList = {
                        {
                            data = l_HttpService_0:JSONEncode(v84)
                        }
                    }
                };
                v70.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = {
                    valueList = {
                        {
                            data = v85
                        }
                    }
                };
            end;
            v70.tags.REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = tostring(v67.formSelectedAbuserUserId)
                    }
                }
            };
        end;
        return l_HttpService_0:JSONEncode(v70);
    end, 
    interpretAnnotations = v50, 
    Constants = v16
};
