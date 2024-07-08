local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.React).createContext({
    fireAnalyticsEvent = require(l_CorePackages_0.Packages.Dash).noop
});
