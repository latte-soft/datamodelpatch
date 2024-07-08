local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.TnSAvatarIdentification);
local v2 = require(l_CorePackages_0.Workspace.Packages.TnSAdIdentification);
local l_HttpService_0 = game:GetService("HttpService");
local l_getAvatarsForPoint_0 = v1.AvatarIdentification.getAvatarsForPoint;
local l_getAvatarsForRegion_0 = v1.AvatarIdentification.getAvatarsForRegion;
local l_getAdsForPoint_0 = v2.AdIdentification.getAdsForPoint;
local l_GetFFlagReportAnythingEnableAdReport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagReportAnythingEnableAdReport;
local l_GetFFlagGetHumanoidDescription_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescription;
local l_GetFFlagRAEnableCircleRegion_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagRAEnableCircleRegion;
local l_GetFFlagReportAnythingAbuseVectorRenameEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagReportAnythingAbuseVectorRenameEnabled;
local l_GetFFlagReportAnythingIncludeDiscardStatsInReport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagReportAnythingIncludeDiscardStatsInReport;
local l_getHumanoidDescription_0 = require(script.Parent.GetHumanoidDescription).getHumanoidDescription;
local v13 = {
    annotationCircleRadius = 0, 
    screenSizeWidth = 0, 
    screenSizeHeight = 0, 
    screenshotId = "", 
    identifiedAvatars = {}, 
    avatarIDStats = nil, 
    identifiedAds = {}, 
    adIDStats = nil, 
    screenshotContentId = "", 
    annotationPoints = {}, 
    annotationOptionSeen = false, 
    annotationPageSeen = false, 
    selectedAbusers = {}, 
    selectedAds = {}
};
local v14 = {
    Variant = {
        CS = "ra/cs", 
        Sampling = "ra/sampling", 
        E1 = "ra/e1", 
        E2 = "ra/e2", 
        E3 = "ra/e3", 
        Unknown = "ra/unknown"
    }
};
local function v19(v15)
    local v16 = {};
    for _, v18 in ipairs(v15) do
        v16[#v16 + 1] = {
            v18.X, 
            v18.Y
        };
    end;
    return v16;
end;
local function v24(v20)
    local v21 = {};
    for _, v23 in pairs(v20) do
        v21[#v21 + 1] = {
            assetId = v23.assetId, 
            distance = v23.distance, 
            boundingBox = {
                minX = v23.boundingBox.min.X, 
                minY = v23.boundingBox.min.Y, 
                maxX = v23.boundingBox.max.X, 
                maxY = v23.boundingBox.max.Y
            }, 
            adUnitName = v23.adUnitName, 
            encryptedAdTrackingData = v23.encryptedAdTrackingData, 
            encryptionMetadata = v23.encryptionMetadata
        };
    end;
    return v21;
end;
local function v29(v25)
    local v26 = {};
    for v27, v28 in pairs(v25) do
        v26[#v26 + 1] = {
            userId = tostring(v27), 
            distance = v28.distance, 
            boundingBox = {
                minX = v28.boundingBox.min.X, 
                minY = v28.boundingBox.min.Y, 
                maxX = v28.boundingBox.max.X, 
                maxY = v28.boundingBox.max.Y
            }, 
            hitRate = v28.hitRate, 
            convexHull = v19(v28.convexHull)
        };
        if l_GetFFlagReportAnythingIncludeDiscardStatsInReport_0() and v28.pointProcessingStats ~= nil then
            v26[#v26].pointProcessingStats = {
                not v28.pointProcessingStats.wasSkipped and 0 or 1, 
                v28.pointProcessingStats.total, 
                v28.pointProcessingStats.offScreenDiscardCount, 
                v28.pointProcessingStats.tooCloseDiscardCount
            };
        end;
    end;
    return v26;
end;
local function v37(v30)
    local v31 = false;
    for _, _ in pairs(v13.identifiedAvatars) do
        v31 = true;
        break;
    end;
    local v34 = false;
    if l_GetFFlagReportAnythingEnableAdReport_0() then
        for _, _ in pairs(v13.identifiedAds) do
            v34 = true;
            break;
        end;
    end;
    if v31 then
        v30.tags.IDENTIFIED_AVATARS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v29(v13.identifiedAvatars)))
                }
            }
        };
    end;
    if v13.avatarIDStats then
        v30.tags.AVATAR_ID_STATS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v13.avatarIDStats)
                }
            }
        };
    end;
    if not (not v34 or not l_GetFFlagReportAnythingEnableAdReport_0()) then
        v30.tags.IDENTIFIED_ADS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v24(v13.identifiedAds)))
                }
            }
        };
    end;
    if not (not v13.adIDStats or not l_GetFFlagReportAnythingEnableAdReport_0()) then
        v30.tags.AD_ID_STATS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v13.adIDStats)
                }
            }
        };
    end;
    if #v13.screenshotId > 0 then
        v30.tags.SCREENSHOT_ID = {
            valueList = {
                {
                    data = v13.screenshotId
                }
            }
        };
    end;
    if #v13.annotationPoints > 0 then
        v30.tags.RA_ANNOTATION_POINTS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v19(v13.annotationPoints)))
                }
            }
        };
    end;
    v30.tags.RA_ANNOTATION_OPTION_SEEN = {
        valueList = {
            {
                data = tostring(v13.annotationOptionSeen)
            }
        }
    };
    v30.tags.RA_ANNOTATION_PAGE_SEEN = {
        valueList = {
            {
                data = tostring(v13.annotationPageSeen)
            }
        }
    };
end;
local function v40(v38)
    local v39 = {
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
                        data = tostring(v38.localUserId)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v38.abuseReason
                    }
                }
            }, 
            PLACE_ID = {
                valueList = {
                    {
                        data = tostring(v38.placeId)
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v38.abuseComment
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
                        data = v38.menuEntryPoint
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = v38.variant or v14.Variant.CS
                    }
                }
            }
        }
    };
    v37(v39);
    if not (not (#v13.selectedAds > 0) or not l_GetFFlagReportAnythingEnableAdReport_0()) then
        v39.tags.REPORT_TARGET_ADS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode((v24(v13.selectedAds)))
                }
            }
        };
    end;
    return l_HttpService_0:JSONEncode(v39);
end;
local function v56(v41)
    local v42 = {
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
                        data = tostring(v41.localUserId)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v41.abuseReason
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v41.abuseComment
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
                        data = v41.menuEntryPoint
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = v41.variant or v14.Variant.Unknown
                    }
                }
            }
        }
    };
    v37(v42);
    if #v13.selectedAbusers > 0 then
        local v43 = tostring(v13.selectedAbusers[1].UserId);
        local v44 = {};
        for _, v46 in ipairs(v13.selectedAbusers) do
            v44[#v44 + 1] = tostring(v46.UserId);
        end;
        if l_GetFFlagGetHumanoidDescription_0() then
            local v47, v48 = l_getHumanoidDescription_0(v13.selectedAbusers[1].UserId);
            v42.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v47)
                    }
                }
            };
            v42.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = {
                valueList = {
                    {
                        data = v48
                    }
                }
            };
            local v49 = {};
            for _, v51 in ipairs(v13.selectedAbusers) do
                local v52, v53 = l_getHumanoidDescription_0(v51.UserId);
                v49[#v49 + 1] = {
                    humanoidDescription = v52, 
                    outputMessage = v53
                };
            end;
            v42.tags.RA_ALL_ANNOTATED_HUMANOID_DESCRIPTIONS = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v49)
                    }
                }
            };
        end;
        v42.tags.REPORT_TARGET_USER_ID = {
            valueList = {
                {
                    data = tostring(v43)
                }
            }
        };
        v42.tags.RA_ALL_ANNOTATED_USER_IDS = {
            valueList = {
                {
                    data = l_HttpService_0:JSONEncode(v44)
                }
            }
        };
    elseif v41.formSelectedAbuserUserId then
        if l_GetFFlagGetHumanoidDescription_0() then
            local v54, v55 = l_getHumanoidDescription_0(v41.formSelectedAbuserUserId);
            v42.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
                valueList = {
                    {
                        data = l_HttpService_0:JSONEncode(v54)
                    }
                }
            };
            v42.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = {
                valueList = {
                    {
                        data = v55
                    }
                }
            };
        end;
        v42.tags.REPORT_TARGET_USER_ID = {
            valueList = {
                {
                    data = tostring(v41.formSelectedAbuserUserId)
                }
            }
        };
    end;
    return l_HttpService_0:JSONEncode(v42);
end;
local function v74()
    local v57 = {};
    local v58 = {};
    local v59 = {};
    local v60 = {};
    for _, v62 in ipairs(v13.annotationPoints) do
        local l_huge_0 = math.huge;
        local v64 = nil;
        local v65 = {};
        v65 = if not l_GetFFlagRAEnableCircleRegion_0() then l_getAvatarsForPoint_0(v13.identifiedAvatars, v62) else l_getAvatarsForRegion_0(v13.identifiedAvatars, v62, v13.annotationCircleRadius, v13.screenSizeWidth, v13.screenSizeHeight);
        for v66, _ in pairs(v65) do
            local l_distance_0 = v13.identifiedAvatars[v66].distance;
            if l_distance_0 < l_huge_0 then
                l_huge_0 = l_distance_0;
                v64 = v66;
            end;
        end;
        local v69 = nil;
        if l_GetFFlagReportAnythingEnableAdReport_0() then
            local v70 = l_getAdsForPoint_0(v13.identifiedAds, v62);
            l_huge_0 = math.huge;
            for v71, _ in pairs(v70) do
                local l_distance_1 = v13.identifiedAds[v71].distance;
                if l_distance_1 < l_huge_0 then
                    l_huge_0 = l_distance_1;
                    v69 = v71;
                end;
            end;
        end;
        if not (v64 ~= nil) or v57[v64] then
            if not (not (l_GetFFlagReportAnythingEnableAdReport_0() and v69 ~= nil) or v58[v69]) then
                v58[v69] = true;
                v60[#v60 + 1] = v13.identifiedAds[v69];
            end;
        else
            v57[v64] = true;
            v59[#v59 + 1] = v13.identifiedAvatars[v64].player;
        end;
    end;
    v13.selectedAbusers = v59;
    v13.selectedAds = v60;
end;
return {
    setAnnotationCircleRadius = function(v75)
        v13.annotationCircleRadius = v75;
    end, 
    getAnnotationCircleRadius = function()
        return v13.annotationCircleRadius;
    end, 
    setAspectRatioDimensions = function(v76, v77)
        v13.screenSizeWidth = v76;
        v13.screenSizeHeight = v77;
    end, 
    setScreenshotId = function(v78)
        v13.screenshotId = v78;
    end, 
    setIdentifiedAds = function(v79)
        v13.identifiedAds = v79;
    end, 
    getIdentifiedAds = function()
        return v13.identifiedAds;
    end, 
    setIdentifiedAvatars = function(v80)
        v13.identifiedAvatars = v80;
    end, 
    getIdentifiedAvatars = function()
        return v13.identifiedAvatars;
    end, 
    setAvatarIDStats = function(v81)
        v13.avatarIDStats = v81;
    end, 
    setAdIDStats = function(v82)
        v13.adIDStats = v82;
    end, 
    setScreenshotContentId = function(v83)
        v13.screenshotContentId = v83;
        v13.annotationPoints = {};
        v13.selectedAbusers = {};
    end, 
    getScreenshotContentId = function()
        return v13.screenshotContentId;
    end, 
    setAnnotationPoints = function(v84)
        v13.annotationPoints = v84;
        v13.annotationOptionSeen = true;
        v13.annotationPageSeen = true;
        v74();
    end, 
    getSelectedAbusers = function()
        return v13.selectedAbusers;
    end, 
    getSelectedAds = function()
        return v13.selectedAds;
    end, 
    clearAnnotationPoints = function()
        v13.annotationPoints = {};
        v13.selectedAbusers = {};
        if l_GetFFlagReportAnythingEnableAdReport_0() then
            v13.selectedAds = {};
        end;
        v13.annotationOptionSeen = false;
        v13.annotationPageSeen = false;
    end, 
    getAnnotationPoints = function()
        return v13.annotationPoints;
    end, 
    setAnnotationOptionSeen = function(v85)
        v13.annotationOptionSeen = v85;
    end, 
    getAnnotationOptionSeen = function()
        return v13.annotationOptionSeen;
    end, 
    setAnnotationPageSeen = function(v86)
        v13.annotationPageSeen = v86;
    end, 
    getAnnotationPageSeen = function()
        return v13.annotationPageSeen;
    end, 
    buildExperienceReportRequest = v40, 
    buildOtherReportRequest = v56, 
    clear = function()
        v13 = {
            annotationCircleRadius = 0, 
            screenSizeWidth = 0, 
            screenSizeHeight = 0, 
            screenshotId = "", 
            identifiedAvatars = {}, 
            avatarIDStats = nil, 
            identifiedAds = {}, 
            adIDStats = nil, 
            screenshotContentId = "", 
            annotationPoints = {}, 
            annotationOptionSeen = false, 
            annotationPageSeen = false, 
            selectedAbusers = {}, 
            selectedAds = {}
        };
    end, 
    getAnalyticsParameters = function()
        return {
            finalAnnotationOptionSeen = v13.annotationOptionSeen, 
            finalAnnotationPageSeen = v13.annotationPageSeen, 
            finalAnnotationCount = #v13.annotationPoints, 
            finalAnnotatedAvatarsCount = #v13.selectedAbusers
        };
    end, 
    Constants = v14
};
