local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local v3 = require(l_Modules_0.LuaApp.Components.AbuseReporting.getThumbnailUrl);
local v4 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local v5 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({});
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_getDeepValue_0 = v5.Dictionary.getDeepValue;
local l_GetFFlagLuafiedReportThumbnail_0 = v6.GetFFlagLuafiedReportThumbnail;
return function(v9)
    return function(v10)
        if l_GetFFlagLuafiedReportThumbnail_0() then
            local v11 = nil;
            local v12 = nil;
            local v13 = nil;
            local l_reportEntryPoint_0 = v9.reportData.reportEntryPoint;
            if l_reportEntryPoint_0 == v4.REPORT_ENTRYPOINT.ExperienceDetails then
                local l_universeId_0 = v9.reportData.universeId;
                if l_universeId_0 then
                    local v16 = v10.GameDetails[l_universeId_0];
                    v11 = v3(l_universeId_0, l_reportEntryPoint_0);
                    v12 = if not v16 then nil else v16.name;
                    v13 = if not not v16 and v16.creator then v16.creator.name else nil;
                end;
            end;
            if l_reportEntryPoint_0 == v4.REPORT_ENTRYPOINT.Profile then
                local l_profileUserId_0 = v9.reportData.profileUserId;
                if l_profileUserId_0 then
                    local v18 = l_getDeepValue_0(v10, string.format("Profile.Users.byUserId.%s", l_profileUserId_0));
                    v11 = v3(l_profileUserId_0, l_reportEntryPoint_0);
                    v12 = if not v18 then nil else v18.displayName;
                    v13 = if not v18 then nil else v18.username;
                end;
            end;
            if l_reportEntryPoint_0 == v4.REPORT_ENTRYPOINT.Item then
                local l_reportData_0 = v9.reportData;
                v11 = v3(l_reportData_0.itemId, l_reportEntryPoint_0);
                v12 = l_reportData_0.itemName;
                v13 = l_reportData_0.itemCreatorName;
            end;
            if l_reportEntryPoint_0 == v4.REPORT_ENTRYPOINT.Chat then
                local l_userId_0 = v9.reportData.userId;
                if l_userId_0 then
                    local v21 = l_getDeepValue_0(v10, string.format("Profile.Users.byUserId.%s", l_userId_0));
                    v11 = v3(l_userId_0, l_reportEntryPoint_0);
                    v12 = if not v21 then nil else v21.displayName;
                    v13 = if not v21 then nil else v21.username;
                end;
            end;
            if v12 == nil then
                v12 = "";
                warn(l_reportEntryPoint_0, "primary text is unknown");
            end;
            if v13 == nil then
                v13 = "";
                warn(l_reportEntryPoint_0, "secondary text is unknown");
            end;
            if v11 == nil then
                warn(l_reportEntryPoint_0, "thumbnail url is unknown");
            end;
            return {
                thumbnailUrl = v11, 
                primaryText = v12, 
                secondaryText = v13
            };
        else
            return {};
        end;
    end;
end;
