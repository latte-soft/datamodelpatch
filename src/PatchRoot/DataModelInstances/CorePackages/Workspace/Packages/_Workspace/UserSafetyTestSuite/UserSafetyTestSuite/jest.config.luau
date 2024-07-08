local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.AbuseReportMenu)["jest.config"], 
        require(l_Parent_0.InGameAssetReporting)["jest.config"]
    }
};
