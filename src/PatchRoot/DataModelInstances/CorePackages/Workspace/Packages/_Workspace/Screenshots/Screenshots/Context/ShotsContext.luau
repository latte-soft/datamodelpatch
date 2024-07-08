local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.React).createContext({
    fireAnalyticsEvent = require(l_Parent_0.Dash).noop, 
    themeOverrides = nil, 
    chromeEnabled = nil
});
