return {
    eventName = settings():GetFVariable("LuaErrorsInfluxSeries"), 
    backends = {
        require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).TelemetryBackends.Points
    }, 
    throttlingPercentage = tonumber(settings():GetFVariable("LuaErrorsInfluxThrottling")), 
    lastUpdated = {
        22, 
        7, 
        29
    }, 
    description = "Report Lua errors to Points with document name \"luashellerrors\"", 
    links = "https://grafana.simulprod.com/d/grdIrDiVz/lua-apps-error-metrics?orgId=1"
};
