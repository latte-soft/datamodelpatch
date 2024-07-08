local v0 = require(game:GetService("CorePackages").Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies();
return {
    canNavigateHome = v0.getInExperienceCanNavigateHome(), 
    canListPeopleInSameServer = v0.getInExperienceCanListPeopleInSameServer()
};
