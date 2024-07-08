local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Result);
local l_FFlagEnableDeactivatedUserReactivation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableDeactivatedUserReactivation;
local v5 = {
    new = function()
        return {};
    end, 
    validateJson = v2.interface({
        punishedUserId = v2.number, 
        messageToUser = v2.string, 
        punishmentTypeDescription = v2.string, 
        punishmentId = v2.number, 
        beginDate = v2.string, 
        endDate = v2.string, 
        badUtterances = v2.table, 
        verificationCategory = v2.string, 
        agreedCheckBoxExperimentVariant = v2.optional(v2.string), 
        context = v2.optional(v2.table)
    }), 
    validateModel = v2.interface({
        punishedUserId = v2.number, 
        messageToUser = v2.string, 
        punishmentTypeDescription = v2.string, 
        punishmentId = v2.number, 
        beginDate = v2.string, 
        endDate = v2.string, 
        badUtterances = v2.table, 
        verificationCategory = v2.string, 
        showAppealsProcessLink = v2.boolean, 
        consequenceTransparencyMessage = v2.string, 
        agreedCheckBoxExperimentVariant = v2.optional(v2.string), 
        selfServiceDeactivated = v2.optional(v2.boolean)
    })
};
v5.mock = function(v6)
    v6 = v6 or {};
    local v7 = v5.new();
    v7.punishedUserId = 1137965296;
    v7.messageToUser = "Mock Message";
    v7.punishmentTypeDescription = "Warn";
    v7.punishmentId = 2148187493;
    v7.beginDate = "2021-03-10T20:14:00.0000000Z";
    v7.endDate = "2021-03-10T20:22:00.0000000Z";
    v7.badUtterances = {
        {
            abuseType = "ABUSE_TYPE_HARASSMENT", 
            utteranceText = "fvg behavior", 
            imageUrl = ""
        }
    };
    v7.verificationCategory = "Email";
    v7.agreedCheckBoxExperimentVariant = "control";
    return v1.Dictionary.join(v7, v6);
end;
v5.fromJsonData = function(v8)
    if v5.validateJson(v8) then
        local v9 = v5.new();
        v9.punishedUserId = v8.punishedUserId;
        v9.messageToUser = v8.messageToUser;
        v9.punishmentTypeDescription = v8.punishmentTypeDescription;
        v9.punishmentId = v8.punishmentId;
        v9.beginDate = v8.beginDate;
        v9.endDate = v8.endDate;
        v9.badUtterances = {};
        v9.verificationCategory = v8.verificationCategory;
        v9.consequenceTransparencyMessage = v8.consequenceTransparencyMessage;
        v9.showAppealsProcessLink = v8.showAppealsProcessLink;
        v9.agreedCheckBoxExperimentVariant = v8.agreedCheckBoxExperimentVariant;
        for _, v11 in pairs(v8.badUtterances) do
            table.insert(v9.badUtterances, {
                abuseType = v11.abuseType, 
                utteranceText = v11.utteranceText, 
                imageUrl = v11.imageUrl
            });
        end;
        if not (not l_FFlagEnableDeactivatedUserReactivation_0 or not v8.context) then
            for v12, v13 in pairs(v8.context) do
                if v12 == "SelfServiceDeactivated" then
                    v9.selfServiceDeactivated = v13;
                end;
            end;
        end;
        return v3.success(v9);
    else
        return v3.error("ModerationDetail.fromJsonData expects a valid moderation JSON response");
    end;
end;
return v5;
