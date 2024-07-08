local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
return {
    ON_GAME_LEAVE_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Game", "onGameLeave"), 
        validateParams = v1.table
    }, 
    ON_SURVEY_EVENT_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Game", "openSurvey"), 
        validateParams = v1.strictInterface({
            eventType = v1.string, 
            userId = v1.optional(v1.string), 
            customProps = v1.optional(v1.table)
        })
    }, 
    LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS = "CsatCompletedSurveyIds", 
    LOCAL_STORAGE_CSAT_SURVEY_IDS_LIMIT = 10, 
    LOCAL_STORAGE_KEY_EXPERIENCE_MENU_CSAT_QUALIFICATION = "ExperienceMenuCSATQualification", 
    EXPERIENCE_MENU_CSAT_QUALIFICATION_THRESHOLD = 10000, 
    EXPERIENCE_MENU_TEST_VERSION = "t3", 
    LOCAL_STORAGE_KEY_EXPERIENCE_MENU_VERSION = "ExperienceMenuVersion", 
    ANALYTICS_CONTEXT_APP = "app", 
    ANALYTICS_EXPERIMENT_MENU_TEST = "experience_menu_test", 
    ANALYTICS_EXPERIMENT_MENU_GET_COMPLETED_SURVEY_IDS_FIELD = "get_completed_survey_ids", 
    ANALYTICS_EXPERIMENT_MENU_SET_COMPLETED_SURVEY_IDS_FIELD = "set_completed_survey_ids", 
    ANALYTICS_SURVEY_EVENT = "survey_event", 
    EVENT_TYPE_ENUM = {
        ON_LEAVE_BUTTON_CLICK = "leaveButtonClick"
    }, 
    WEBVIEW_NAME_KEY = "Feature.QualtricsSurveyPrompt.Heading.WebviewName", 
    CHROME_SURVEY_NAME = "chromeSurvey"
};
