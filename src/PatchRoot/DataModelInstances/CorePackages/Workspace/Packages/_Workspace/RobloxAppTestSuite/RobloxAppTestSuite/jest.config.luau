local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.AppHeaderBar)["jest.config"], 
        require(l_Parent_0.AppTabBarRodux)["jest.config"], 
        require(l_Parent_0.NavigationRodux)["jest.config"], 
        require(l_Parent_0.RobloxAppUpdate)["jest.config"], 
        require(l_Parent_0.RobloxAppToastsRodux)["jest.config"], 
        game.CoreGui.RobloxGui.Modules.LuaApp.Navigation["jest.config"]
    }
};
