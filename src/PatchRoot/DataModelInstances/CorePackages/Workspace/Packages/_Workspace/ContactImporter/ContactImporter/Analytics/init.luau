local l_Context_0 = require(script:FindFirstAncestor("ContactImporter").dependencies).SocialLibraries.Context;
local v1 = require(script.ContactImporterAnalyticsContext);
return {
    setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents), 
    Context = v1, 
    connect = l_Context_0.getConnect(v1), 
    useAnalytics = require(script.useAnalytics), 
    EventNames = require(script.Enums.EventNames), 
    EntryPoints = require(script.Enums.ContactImporterEntryPoints), 
    FieldNames = require(script.FieldNames), 
    AnalyticsService = require(script.AnalyticsService)
};
