local v0 = require(script.Classes.PluginDebugInterface);
local v1 = require(script.Classes.CoreGuiDebugInterface);
local v2 = require(script.Classes.StandalonePluginDebugInterface);
local v3 = require(script.Classes.LibraryDebugInterface);
local v4 = require(script.Classes.InspectorDebugInterface);
return {
    forPlugin = function(v5, v6)
        assert(typeof(v5) == "string", ("%s must be a string, did you write DeveloperTools:%s() instead of DeveloperTools.%s() by mistake?"):format(v5, "forPlugin", "forPlugin"));
        assert(v6, "DeveloperTools:forPlugin() expected plugin for argument #2");
        return v0.new(v5, v6);
    end, 
    forStandalonePlugin = function(v7, v8, v9)
        assert(typeof(v7) == "string", ("%s must be a string, did you write DeveloperTools:%s() instead of DeveloperTools.%s() by mistake?"):format(v7, "forStandalonePlugin", "forStandalonePlugin"));
        assert(v8, "DeveloperTools:forStandalonePlugin() expected plugin for argument #2");
        return v2.new(v7, v8, v9);
    end, 
    forCoreGui = function(v10, v11)
        assert(typeof(v10) == "string", ("%s must be a string, did you write DeveloperTools:%s() instead of DeveloperTools.%s() by mistake?"):format(v10, "appName", "appName"));
        return v1.new(v10, v11);
    end, 
    forLibrary = function(v12, v13)
        assert(typeof(v12) == "string", ("%s must be a string, did you write DeveloperTools:%s() instead of DeveloperTools.%s() by mistake?"):format(v12, "libraryName", "libraryName"));
        return v3.new(v12, v13);
    end, 
    forInspector = function(v14)
        return v4.new(v14);
    end, 
    RoactInspectorApi = require(script.RoactInspector.Classes.RoactInspectorApi)
};
