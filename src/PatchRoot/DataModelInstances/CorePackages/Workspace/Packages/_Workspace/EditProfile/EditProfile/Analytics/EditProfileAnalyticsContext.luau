local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
return require(l_Parent_0.React).createContext({
    fireAnalyticsEvent = require(l_Parent_0.Dash).noop
});
