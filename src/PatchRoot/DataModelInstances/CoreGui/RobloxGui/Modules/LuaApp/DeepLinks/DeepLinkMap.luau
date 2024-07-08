local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Cryo);
local l_ExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).ExperienceService;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameProtocol.default;
local l_GamesMultigetPlaceDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GamesByPlaceId.GamesMultigetPlaceDetails;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol.default;
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local v10 = require(l_Modules_0.LuaApp.AppPage);
local v11 = require(l_CorePackages_0.Workspace.Packages.AppChatNetworking);
local v12 = require(l_Modules_0.LuaApp.ArgCheck);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.LuaApp.Http.Requests.ChatStartOneToOneConversation);
local l_CreateConversation_0 = v11.http.CreateConversation;
local v17 = require(script.Parent.logGameDetailsDeepLinkEvent);
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local v19 = require(l_Modules_0.Profile);
local v20 = require(l_Modules_0.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes);
local v21 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v22 = require(l_Modules_0.LuaApp.Http.UrlBase);
local v23 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_contactImporterModalInfo_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Utils.contactImporterModalInfo;
local v25 = require(l_Modules_0.LuaApp.DeepLinks.Utils.ExternalWebUrlNavigationHelper);
local v26 = require(script.Parent.ShareLinks.handleShareLinkRoot);
local l_ProfileTypes_0 = v19.ProfileTypes;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v29 = game:DefineFastFlag("EnableAppealsDeeplinks", false);
local v30 = game:DefineFastFlag("EnablePrivacySettingsDeeplinks", false);
local v31 = game:DefineFastFlag("EnableLocalizedPaths", false);
local v32 = require(l_Modules_0.AvatarExperience.Flags.FFlagQRCodeItemRedemptionEnabled);
local v33 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXClothingSortingDeeplink);
local v34 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local v35 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableGiftCardsDeepLink);
local v36 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLinkingToSorts);
local v37 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoggingForGameDetailLinks);
local l_UseExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).Flags.UseExperienceService;
local l_GetFFlagUseThumbnailUrlForContactPeekView_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseThumbnailUrlForContactPeekView;
local v40 = require(l_Modules_0.LuaApp.Flags.FFlagContactsDeepLinkRedirectToModal);
local l_GetFFlagFixSiteTestDeeplink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixSiteTestDeeplink;
local l_isAppChatChannelsAPIEnabled_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Flags.isAppChatChannelsAPIEnabled;
local v43 = require(l_Modules_0.LuaApp.Flags.FFlagFixFriendsPageDeepLink);
local v44 = game:DefineFastFlag("EnableBundleItemDetailHttpLink", false);
game:DefineFastString("GamesPageDeepLinkPattern", "roblox.*://navigation/games");
game:DefineFastString("HomePageDeepLinkPattern", "roblox.*://navigation/home");
game:DefineFastString("AvatarClothingSortingView", "roblox.*://navigation/avatar_clothing_sort");
game:DefineFastString("AvatarDeepLinkPattern", "roblox.*://navigation/avatar");
game:DefineFastString("AvatarHttpPattern", "/my/avatar");
game:DefineFastString("MorePageDeepLinkPattern", "roblox.*://navigation/more");
game:DefineFastString("NotificationSettingsDeepLinkPattern", "roblox.*://navigation/notification_settings");
game:DefineFastString("RoactChatDeepLinkPattern", "roblox.*://navigation/chat.*");
game:DefineFastString("GameDetailsDeepLinkPattern", "roblox.*://navigation/game_details.*");
game:DefineFastString("GameDetailsHttpPattern", "/games/(%d+)/?[%w_-]*%??r?e?f?P?a?g?e?I?d?=?[%w%-]*");
game:DefineFastString("GameDetailsReferralHttpPattern", "/games/refer.*");
game:DefineFastString("ProfileCardDeepLinkPattern", "roblox.*://navigation/profile_card.*");
game:DefineFastString("ProfileDeepLinkPattern", "roblox.*://navigation/profile.*");
game:DefineFastString("CatalogDeepLinkPattern", "roblox.*://navigation/catalog");
game:DefineFastString("CatalogHttpPattern", "/catalog[^/]*");
game:DefineFastString("ItemDetailsDeepLinkPattern", "roblox.*://navigation/item_details.*");
game:DefineFastString("ItemDetailsHttpPattern", "/catalog/(%d+)/.*");
game:DefineFastString("BundleItemDetailsHttpPattern", "/bundles/(%d+)/.*");
game:DefineFastString("ItemRedemptionDeepLinkPattern", "roblox.*://navigation/qr_code_redemption.*");
game:DefineFastString("FriendsPageDeepLinkPattern", "roblox.*://navigation/friends");
game:DefineFastString("GiftCardsPageDeepLinkPattern", "roblox.*://navigation/gift_cards");
game:DefineFastString("GroupsDeepLinkPattern", "roblox.*://navigation/group.*");
game:DefineFastString("CrossDeviceLoginDeepLinkPattern", "roblox.*://navigation/crossdevice.*");
game:DefineFastString("EventDetailsPageDeepLinkPattern", "roblox.*://navigation/event_details.*");
game:DefineFastString("ShareLinkDeepLinkPattern", "roblox.*://navigation/share_links.*");
game:DefineFastString("ShareLinkHttpPattern", "/share.*");
game:DefineFastString("ShortShareLinkHttpPattern", "/shortlink.*");
game:DefineFastString("ContactsDeepLinkPattern", "roblox.*://navigation/contacts.*");
game:DefineFastString("AppealsPortalDeepLinkPattern", "roblox.*://navigation/appeals.*");
game:DefineFastString("PrivacySettingsDeepLinkPattern", "roblox.*://navigation/privacy_settings");
game:DefineFastString("ExternalWebUrlDeepLinkPattern", "roblox.*://navigation/external_web_link.*");
if v36() then
    game:DefineFastString("SortsDeepLinkPattern", "roblox.*://navigation/sort.*");
    game:DefineFastString("SortsHttpPattern", "/discover#/sortname/(.*)");
end;
game:DefineFastString("LuaExtraHttpLinkBases", "");
game:DefineFastFlag("EnableExternalWebDeeplink", false);
local v45 = string.split(game:GetFastString("LuaExtraHttpLinkBases"), ",");
local v46 = {};
local function _(v47, v48)
    table.insert(v46, {
        v47, 
        v48
    });
    l_default_1:registerURL((v47:gsub("%%", "\\")));
end;
local function v67(v50, v51)
    if not l_GetFFlagFixSiteTestDeeplink_0() then
        for _, v53 in pairs({
            "www", 
            "web"
        }) do
            local v54 = v22.new(v53);
            local v55 = v22.new(v53, {
                secure = false
            });
            if not v31 then
                local v56 = v54 .. v50;
                table.insert(v46, {
                    v56, 
                    v51
                });
                l_default_1:registerURL((v56:gsub("%%", "\\")));
                v56 = v55 .. v50;
                table.insert(v46, {
                    v56, 
                    v51
                });
                l_default_1:registerURL((v56:gsub("%%", "\\")));
            else
                local v57 = v54 .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. v50;
                table.insert(v46, {
                    v57, 
                    v51
                });
                l_default_1:registerURL((v57:gsub("%%", "\\")));
                v57 = v55 .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. v50;
                table.insert(v46, {
                    v57, 
                    v51
                });
                l_default_1:registerURL((v57:gsub("%%", "\\")));
            end;
        end;
    else
        for _, v59 in pairs({
            "www", 
            "web", 
            ""
        }) do
            local v60 = v22.new(v59);
            local v61 = v22.new(v59, {
                secure = false
            });
            if not v31 then
                local v62 = v60 .. v50;
                table.insert(v46, {
                    v62, 
                    v51
                });
                l_default_1:registerURL((v62:gsub("%%", "\\")));
                v62 = v61 .. v50;
                table.insert(v46, {
                    v62, 
                    v51
                });
                l_default_1:registerURL((v62:gsub("%%", "\\")));
            else
                local v63 = v60 .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. v50;
                table.insert(v46, {
                    v63, 
                    v51
                });
                l_default_1:registerURL((v63:gsub("%%", "\\")));
                v63 = v61 .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. v50;
                table.insert(v46, {
                    v63, 
                    v51
                });
                l_default_1:registerURL((v63:gsub("%%", "\\")));
            end;
        end;
    end;
    for _, v65 in ipairs(v45) do
        local v66 = v65 .. v50;
        table.insert(v46, {
            v66, 
            v51
        });
        l_default_1:registerURL((v66:gsub("%%", "\\")));
    end;
end;
local l_game_FastString_0 = game:GetFastString("GamesPageDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_0, 
    function()
        return {
            {
                {
                    name = v10.Games
                }
            }
        };
    end
});
l_default_1:registerURL((l_game_FastString_0:gsub("%%", "\\")));
l_game_FastString_0 = game:GetFastString("HomePageDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_0, 
    function()
        return {
            {
                {
                    name = v10.Home
                }
            }
        };
    end
});
l_default_1:registerURL((l_game_FastString_0:gsub("%%", "\\")));
if v33() then
    l_game_FastString_0 = game:GetFastString("AvatarClothingSortingView");
    table.insert(v46, {
        l_game_FastString_0, 
        function()
            return {
                {
                    {
                        name = v13.AvatarExperienceLandingPage
                    }, 
                    {
                        name = v13.Catalog
                    }, 
                    {
                        name = v13.LayeredClothingSort
                    }
                }
            };
        end
    });
    l_default_1:registerURL((l_game_FastString_0:gsub("%%", "\\")));
end;
l_game_FastString_0 = game:GetFastString("AvatarDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_0, 
    function()
        return {
            {
                {
                    name = v13.AvatarExperienceLandingPage
                }
            }, 
            {
                {
                    name = v13.AvatarExperienceLandingPage
                }, 
                {
                    name = v13.AvatarEditor
                }
            }
        };
    end
});
l_default_1:registerURL((l_game_FastString_0:gsub("%%", "\\")));
v67(game:GetFastString("AvatarHttpPattern"), function(_, v70)
    return v4.List.join(v70.history, {
        {
            {
                name = v13.AvatarExperienceLandingPage
            }
        }, 
        {
            {
                name = v13.AvatarExperienceLandingPage
            }, 
            {
                name = v13.AvatarEditor
            }
        }
    });
end);
local l_game_FastString_1 = game:GetFastString("MorePageDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_1, 
    function()
        return {
            {
                {
                    name = v10.More
                }
            }
        };
    end
});
l_default_1:registerURL((l_game_FastString_1:gsub("%%", "\\")));
l_game_FastString_1 = function(v72, v73)
    return {
        {
            {
                name = v10.More
            }
        }, 
        {
            {
                name = v10.More
            }, 
            {
                name = v10.Settings
            }
        }, 
        {
            {
                name = v10.More
            }, 
            {
                name = v10.Settings
            }, 
            {
                name = v10.SettingsSubPage, 
                detail = v72, 
                extraProps = {
                    titleKey = v73, 
                    transitionAnimation = v21.None
                }
            }
        }
    };
end;
local l_game_FastString_2 = game:GetFastString("NotificationSettingsDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_2, 
    function()
        return (l_game_FastString_1(v23.static.settings.notifications(), "Feature.AccountSettings.Heading.Tab.Notifications"));
    end
});
l_default_1:registerURL((l_game_FastString_2:gsub("%%", "\\")));
l_game_FastString_2 = function(v75)
    if type(v75) ~= "string" then
        return l_ChatEntryPointNames_0.Unknown;
    else
        for v76, v77 in pairs(l_ChatEntryPointNames_0) do
            if string.lower(v76) == string.lower(v75) then
                return v77;
            end;
        end;
        return l_ChatEntryPointNames_0.Unknown;
    end;
end;
local l_game_FastString_3 = game:GetFastString("RoactChatDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_3, 
    function(v79, v80)
        local v81 = {
            entryPoint = l_game_FastString_2(v79.entrypoint)
        };
        if v79.chatid == nil and v79.userid ~= nil then
            if not l_isAppChatChannelsAPIEnabled_0() then
                return v15(v80.network, v79.userid):andThen(function(v82)
                    return {
                        {
                            {
                                name = v10.Chat, 
                                detail = tostring(v82.responseBody.conversation.id), 
                                extraProps = v81
                            }
                        }
                    };
                end):catch(function()
                    return {
                        {
                            {
                                name = v10.Chat, 
                                extraProps = v81
                            }
                        }
                    };
                end);
            else
                return l_CreateConversation_0(v80.network, "one_to_one", {
                    v79.userid
                }):andThen(function(v83)
                    return {
                        {
                            {
                                name = v10.Chat, 
                                detail = tostring(v83.responseBody.conversations[1].id), 
                                extraProps = v81
                            }
                        }
                    };
                end):catch(function()
                    return {
                        {
                            {
                                name = v10.Chat, 
                                extraProps = v81
                            }
                        }
                    };
                end);
            end;
        else
            return {
                {
                    {
                        name = v10.Chat, 
                        detail = v79.chatid, 
                        extraProps = v81
                    }
                }
            };
        end;
    end
});
l_default_1:registerURL((l_game_FastString_3:gsub("%%", "\\")));
l_game_FastString_3 = game:GetFastString("GameDetailsDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_3, 
    function(v84)
        local l_GameDetail_0 = v10.GameDetail;
        if v37() then
            v17(v84.gameid, "GameDetailsDeeplink");
        end;
        return {
            {
                {
                    name = v10.Games
                }
            }, 
            {
                {
                    name = v10.Games
                }, 
                {
                    name = l_GameDetail_0, 
                    detail = v12.isNotNil(v84.gameid, "gameId"), 
                    extraProps = {
                        mountAsFullView = true, 
                        mountAnimation = false
                    }
                }
            }
        };
    end
});
l_default_1:registerURL((l_game_FastString_3:gsub("%%", "\\")));
v67(game:GetFastString("GameDetailsHttpPattern"), function(v86, v87, v88)
    if v87.privateserverlinkcode ~= nil then
        v88.analyticsImpls.shareLinksAnalytics.openAppViaShareLink({
            placeId = v86, 
            linkCode = v87.privateserverlinkcode, 
            linkType = v20.LongPrivateServerLink
        });
        if not l_UseExperienceService_0() then
            l_default_0:launchGame({
                placeId = v86, 
                linkCode = v87.privateserverlinkcode
            });
        else
            l_ExperienceService_0:LaunchExperience({
                placeId = if type(v86) == "number" then v86 else tonumber(v86), 
                linkCode = v87.privateserverlinkcode
            });
        end;
        return nil;
    else
        local l_GameDetail_1 = v10.GameDetail;
        return l_GamesMultigetPlaceDetails_0(v88.network, v86):andThen(function(v90)
            local v91 = tostring(v90.responseBody[1].universeId);
            if v37() then
                v17(v91, "GameDetailsHTTPDeepLink");
            end;
            return {
                {
                    {
                        name = v10.Games
                    }
                }, 
                {
                    {
                        name = v10.Games
                    }, 
                    {
                        name = l_GameDetail_1, 
                        detail = v91, 
                        extraProps = {
                            mountAsFullView = true, 
                            mountAnimation = false
                        }
                    }
                }
            };
        end);
    end;
end);
v67(game:GetFastString("GameDetailsReferralHttpPattern"), function(v92, v93)
    local v94 = v12.isNotNil(v92.placeid, "placeid");
    local l_GameDetail_2 = v10.GameDetail;
    return l_GamesMultigetPlaceDetails_0(v93.network, v94):andThen(function(v96)
        local v97 = tostring(v96.responseBody[1].universeId);
        if v37() then
            v17(v97, "GameDetailsHTTPReferralDeepLink");
        end;
        return {
            {
                {
                    name = v10.Games
                }
            }, 
            {
                {
                    name = v10.Games
                }, 
                {
                    name = l_GameDetail_2, 
                    detail = v97, 
                    extraProps = {
                        mountAsFullView = true, 
                        mountAnimation = false
                    }
                }
            }
        };
    end);
end);
local l_game_FastString_4 = game:GetFastString("ProfileCardDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_4, 
    function(v99)
        local v100 = v99.userid or "";
        return {
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.ProfilePeekView, 
                    detail = v100, 
                    extraProps = {
                        profileUserId = v100, 
                        profileType = l_ProfileTypes_0.FromDeepLink
                    }
                }
            }
        };
    end
});
l_default_1:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = game:GetFastString("ProfileDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_4, 
    function(v101, v102)
        local v103 = v12.isNotNil(v101.userid, "userId");
        local l_friendshipsourcetype_0 = v101.friendshipsourcetype;
        local v105 = v23.user.profile({
            userId = v103, 
            sourceType = l_friendshipsourcetype_0
        });
        if l_friendshipsourcetype_0 == "profileshare" then
            v102.analyticsImpls.socialProfileShareAnalytics.inviteePageLoad(v103, "playerProfile");
        end;
        return {
            {
                {
                    name = v10.Home
                }
            }, 
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.GenericWebPage, 
                    detail = v105, 
                    extraProps = {
                        titleKey = "CommonUI.Features.Label.Profile", 
                        transitionAnimation = v21.None
                    }
                }
            }
        };
    end
});
l_default_1:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = game:GetFastString("GroupsDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_4, 
    function(v106)
        return {
            {
                {
                    name = v10.Home
                }
            }, 
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.GenericWebPage, 
                    detail = v23.user.group({
                        groupId = v12.isNotNil(v106.groupid, "groupId")
                    }), 
                    extraProps = {
                        titleKey = "CommonUI.Features.Label.Groups", 
                        transitionAnimation = v21.None
                    }
                }
            }
        };
    end
});
l_default_1:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = game:GetFastString("ContactsDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_4, 
    function(v107, _)
        local _ = nil;
        return {
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.AddFriendsPage
                }, 
                if not not v107.contactid and v107.contactid ~= "" then {
                    name = v10.ProfilePeekView, 
                    detail = v107.contactid, 
                    extraProps = {
                        profileUserId = v107.contactid, 
                        profileType = l_ProfileTypes_0.FromContacts, 
                        contactProps = if not l_GetFFlagUseThumbnailUrlForContactPeekView_0() then {
                            contactId = v107.contactid, 
                            avatarAssetHashId = v107.assetid
                        } else {
                            contactId = v107.contactid, 
                            avatarImageUrl = if not not v107.avatarimageurl and v107.avatarimageurl ~= "" then v107.avatarimageurl else nil, 
                            avatarAssetHashId = "0"
                        }
                    }
                } else {
                    name = if not v40 or l_contactImporterModalInfo_0:isUserOptedInLocalStorage(l_AppStorageService_0, if not not l_LocalPlayer_0 and l_LocalPlayer_0.UserId then tostring(l_LocalPlayer_0.UserId) else "") then v10.ContactsList else v10.ContactImporter, 
                    detail = "", 
                    extraProps = {
                        isPhoneVerified = true
                    }
                }
            }
        };
    end
});
l_default_1:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = game:GetFastString("ShareLinkDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_4, 
    function(v110, v111)
        return v26(v4.Dictionary.join(v110, {
            isViaAppsFlyer = true
        }), v111);
    end
});
l_default_1:registerURL((l_game_FastString_4:gsub("%%", "\\")));
l_game_FastString_4 = function(v112, v113)
    return v26(v4.Dictionary.join(v112, {
        isViaAppsFlyer = false
    }), v113);
end;
v67(game:GetFastString("ShareLinkHttpPattern"), l_game_FastString_4);
v67(game:GetFastString("ShortShareLinkHttpPattern"), l_game_FastString_4);
local l_game_FastString_5 = game:GetFastString("CatalogDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_5, 
    function()
        return {
            {
                {
                    name = v13.AvatarExperienceLandingPage
                }
            }, 
            {
                {
                    name = v13.AvatarExperienceLandingPage
                }, 
                {
                    name = v13.Catalog
                }
            }
        };
    end
});
l_default_1:registerURL((l_game_FastString_5:gsub("%%", "\\")));
l_game_FastString_5 = game:GetFastString("ItemDetailsDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_5, 
    function(v115)
        local v116 = v12.isNotNil(v115.itemid, "itemId");
        local v117 = v12.isNotNil(v115.itemtype, "itemType");
        local v118 = nil;
        for _, v120 in pairs(v14.ItemType) do
            if string.lower(v117) == string.lower(v120) then
                v118 = v120;
                break;
            end;
        end;
        local v121 = {
            {
                {
                    name = v13.AvatarExperienceLandingPage
                }
            }, 
            {
                {
                    name = v13.AvatarExperienceLandingPage
                }, 
                {
                    name = v13.Catalog
                }
            }
        };
        local v122 = {
            name = v13.ItemDetails, 
            detail = tostring(v118) .. tostring(v116), 
            extraProps = {
                itemId = v116, 
                itemType = v118, 
                mountAsFullView = true, 
                mountAnimation = false
            }
        };
        if v118 ~= nil then
            table.insert(v121, {
                {
                    name = v13.AvatarExperienceLandingPage
                }, 
                {
                    name = v13.Catalog
                }, 
                v122
            });
        end;
        return v121;
    end
});
l_default_1:registerURL((l_game_FastString_5:gsub("%%", "\\")));
v67(game:GetFastString("ItemDetailsHttpPattern"), function(v123, _, v125)
    local l_Asset_0 = v14.ItemType.Asset;
    return v4.List.join(v125.history, {
        {
            {
                name = v13.AvatarExperienceLandingPage
            }, 
            {
                name = v13.Catalog
            }
        }
    }, {
        {
            {
                name = v13.AvatarExperienceLandingPage
            }, 
            {
                name = v13.Catalog
            }, 
            {
                name = v13.ItemDetails, 
                detail = l_Asset_0 .. v123, 
                extraProps = {
                    itemId = v123, 
                    itemType = l_Asset_0, 
                    mountAsFullView = true, 
                    mountAnimation = false
                }
            }
        }
    });
end);
if v44 then
    v67(game:GetFastString("BundleItemDetailsHttpPattern"), function(v127, _, v129)
        local l_Bundle_0 = v14.ItemType.Bundle;
        return v4.List.join(v129.history, {
            {
                {
                    name = v13.AvatarExperienceLandingPage
                }, 
                {
                    name = v13.Catalog
                }, 
                {
                    name = v13.ItemDetails, 
                    detail = l_Bundle_0 .. v127, 
                    extraProps = {
                        itemId = v127, 
                        itemType = l_Bundle_0, 
                        mountAsFullView = true, 
                        mountAnimation = false
                    }
                }
            }
        });
    end);
end;
if v32 then
    local l_game_FastString_6 = game:GetFastString("ItemRedemptionDeepLinkPattern");
    table.insert(v46, {
        l_game_FastString_6, 
        function(v132)
            local v133 = v12.isNotNil(v132.itemid, "itemId");
            local v134 = v12.isNotNil(v132.itemtype, "itemType");
            local v135 = nil;
            for _, v137 in pairs(v14.ItemType) do
                if string.lower(v134) == string.lower(v137) then
                    v135 = v137;
                    break;
                end;
            end;
            local v138 = {
                {
                    {
                        name = v13.AvatarExperienceLandingPage
                    }
                }, 
                {
                    {
                        name = v13.AvatarExperienceLandingPage
                    }, 
                    {
                        name = v13.Catalog
                    }
                }
            };
            local v139 = {
                name = v13.ItemDetails, 
                detail = tostring(v135) .. tostring(v133), 
                extraProps = {
                    itemId = v133, 
                    itemType = v135, 
                    mountAsFullView = true, 
                    mountAnimation = false, 
                    redeemQRCodeItem = true
                }
            };
            if v135 ~= nil then
                table.insert(v138, {
                    {
                        name = v13.AvatarExperienceLandingPage
                    }, 
                    {
                        name = v13.Catalog
                    }, 
                    v139
                });
            end;
            return v138;
        end
    });
    l_default_1:registerURL((l_game_FastString_6:gsub("%%", "\\")));
end;
v67(game:GetFastString("CatalogHttpPattern"), function(_, v141)
    return v4.List.join(v141.history, {
        {
            {
                name = v13.AvatarExperienceLandingPage
            }, 
            {
                name = v13.Catalog
            }
        }
    });
end);
local l_game_FastString_7 = game:GetFastString("FriendsPageDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_7, 
    function()
        return {
            {
                {
                    name = v10.Home
                }
            }, 
            {
                {
                    name = v10.Home
                }, 
                if not v43 then {
                    name = v10.GenericWebPage, 
                    detail = v23.static.friends(), 
                    extraProps = {
                        titleKey = "CommonUI.Features.Label.Friends", 
                        transitionAnimation = v21.None
                    }
                } else {
                    name = v10.ViewFriends
                }
            }
        };
    end
});
l_default_1:registerURL((l_game_FastString_7:gsub("%%", "\\")));
if v35() then
    l_game_FastString_7 = game:GetFastString("GiftCardsPageDeepLinkPattern");
    table.insert(v46, {
        l_game_FastString_7, 
        function()
            return {
                {
                    {
                        name = v10.Home
                    }
                }, 
                {
                    {
                        name = v10.Home
                    }, 
                    {
                        name = v10.GenericWebPage, 
                        detail = v23.static.giftCards(), 
                        extraProps = {
                            titleKey = "CommonUI.Features.Label.GiftCards", 
                            transitionAnimation = v21.None
                        }
                    }
                }
            };
        end
    });
    l_default_1:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
if game:GetFastFlag("EnableExternalWebDeeplink") then
    l_game_FastString_7 = game:GetFastString("ExternalWebUrlDeepLinkPattern");
    table.insert(v46, {
        l_game_FastString_7, 
        function(v143)
            local l_domain_0 = v143.domain;
            local v145 = nil;
            local v146 = nil;
            if l_domain_0 == v25.ExternalWebDomainEnum.Zendesk then
                v145 = v25.getZendeskUrl(v143);
                v146 = v25.getZendeskWebViewTitleKey(v143.type);
            end;
            if v145 then
                return {
                    {
                        {
                            name = v10.Home
                        }
                    }, 
                    {
                        {
                            name = v10.Home
                        }, 
                        {
                            name = v10.GenericWebPage, 
                            detail = v145, 
                            extraProps = {
                                titleKey = v146, 
                                transitionAnimation = v21.None
                            }
                        }
                    }
                };
            else
                return nil;
            end;
        end
    });
    l_default_1:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
if v34() then
    l_game_FastString_7 = game:GetFastString("CrossDeviceLoginDeepLinkPattern");
    table.insert(v46, {
        l_game_FastString_7, 
        function(v147)
            return {
                {
                    {
                        name = v10.More
                    }, 
                    {
                        name = v10.CrossDeviceLogin, 
                        extraProps = {
                            code = v12.isNotNil(v147.code, "code")
                        }
                    }
                }
            };
        end
    });
    l_default_1:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
if v36() then
    l_game_FastString_7 = game:GetFastString("SortsDeepLinkPattern");
    table.insert(v46, {
        l_game_FastString_7, 
        function(v148)
            return {
                {
                    {
                        name = v10.Games
                    }
                }, 
                {
                    {
                        name = v10.Games
                    }, 
                    {
                        name = v10.GamesList, 
                        detail = v12.isNotNil(v148.sortname, "sortName"), 
                        extraProps = {
                            pageContext = v10.Games
                        }
                    }
                }
            };
        end
    });
    l_default_1:registerURL((l_game_FastString_7:gsub("%%", "\\")));
    v67(game:GetFastString("SortsHttpPattern"), function(v149)
        return {
            {
                {
                    name = v10.Games
                }
            }, 
            {
                {
                    name = v10.Games
                }, 
                {
                    name = v10.GamesList, 
                    detail = v149, 
                    extraProps = {
                        pageContext = v10.Games
                    }
                }
            }
        };
    end);
end;
l_game_FastString_7 = game:GetFastString("EventDetailsPageDeepLinkPattern");
table.insert(v46, {
    l_game_FastString_7, 
    function(v150)
        return {
            {
                {
                    name = v10.Home
                }
            }, 
            {
                {
                    name = v10.Home
                }, 
                {
                    name = v10.EventDetails, 
                    detail = v12.isNotNil(v150.eventid, "eventid")
                }
            }
        };
    end
});
l_default_1:registerURL((l_game_FastString_7:gsub("%%", "\\")));
if v29 then
    l_game_FastString_7 = game:GetFastString("AppealsPortalDeepLinkPattern");
    table.insert(v46, {
        l_game_FastString_7, 
        function(v151)
            return {
                {
                    {
                        name = v10.More
                    }, 
                    {
                        name = v10.GenericWebPage, 
                        detail = if not v151.vid then v23.static.appealsPortal.main({
                            source = "deeplink"
                        }) else v23.static.appealsPortal.violation({
                            id = v151.vid, 
                            source = "deeplink"
                        }), 
                        extraProps = {
                            titleKey = "Feature.AppealsPortal.Label.ReportAndAppeals"
                        }
                    }
                }
            };
        end
    });
    l_default_1:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
if v30 then
    l_game_FastString_7 = game:GetFastString("PrivacySettingsDeepLinkPattern");
    table.insert(v46, {
        l_game_FastString_7, 
        function()
            return (l_game_FastString_1(v23.static.settings.privacy(), "Feature.AccountSettings.Heading.Tab.Privacy"));
        end
    });
    l_default_1:registerURL((l_game_FastString_7:gsub("%%", "\\")));
end;
return v46;
