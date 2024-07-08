local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = game:DefineFastFlag("EnableVirtualizedListBacktraceTag", false);
local v8 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
local v9 = require(l_Modules_0.LuaApp.Util.safeCall);
local _ = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local _ = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v12 = game:DefineFastFlag("EnableRoact17BacktraceTag", false);
local v13 = v5.PureComponent:extend("LuaAppBacktraceReporterAdaptor");
v13.updateAppGenericAttributes = function(_, _)
    v8:updateSharedAttributes((v9(function()
        return {
            AppTheme = tostring(l_NotificationService_0.SelectedTheme), 
            Locale = tostring(l_LocalizationService_0.RobloxLocaleId)
        };
    end, {})));
    v8:updateSharedAttributes({
        RoactNavigationVersion = "0.5.3"
    });
    if v12 then
        v8:updateSharedAttributes({
            Roact17Version = "17.0.1"
        });
    end;
    if v7 then
        v8:updateSharedAttributes({
            VirtualizedListVersion = "1.1.2"
        });
    end;
end;
v13.updateStoreAnnotations = function(v16)
    v8:updateSharedAnnotations(v16.props);
end;
v13.didMount = function(v17)
    v17:updateAppGenericAttributes(v17.props);
end;
v13.render = function(_)
    return nil;
end;
v13.didUpdate = function(v19, _)
    v19:updateStoreAnnotations();
end;
return (v6.connect(function(v21, _)
    return v9(function()
        return {
            FormFactor = v21.FormFactor, 
            isLocalUserSoothsayer = v21.IsLocalUserSoothsayer, 
            GlobalGuiInset = v21.GlobalGuiInset
        };
    end, {});
end)(v13));
