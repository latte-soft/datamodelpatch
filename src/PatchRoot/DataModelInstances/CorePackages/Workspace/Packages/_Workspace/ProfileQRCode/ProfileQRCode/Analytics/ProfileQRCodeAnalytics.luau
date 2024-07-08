local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
return require(l_Parent_0.React).createContext({
    fireEvent = require(l_Parent_0.Dash).noop
});
