return function(v0, v1, v2)
    local l_ModuleScript_0 = Instance.new("ModuleScript");
    l_ModuleScript_0.Source = ("\tlocal Root = script:FindFirstAncestor(\"JestConfigs\")\n\tlocal Packages = Root.Parent\n\t\n\tlocal JestGlobals = require(Packages.JestGlobals)\n\tlocal beforeAll = JestGlobals.beforeAll\n\tlocal afterAll = JestGlobals.afterAll\n\tlocal expect = JestGlobals.expect\n\t\n\tlocal UnitTestHelpers = require(Packages.UnitTestHelpers)\n\tlocal createPromiseRejectionHandler = UnitTestHelpers.createPromiseRejectionHandler\n\n\tlocal RejectionHandler = createPromiseRejectionHandler()\n\t\n\tbeforeAll(function()\n\t\tRejectionHandler.inject()\n\tend)\n\t\n\tafterAll(function()\n\t\texpect(function()\n\t\t\tRejectionHandler.reportRejections(%s, %s, %s)\n\t\tend).never.toThrow()\n\tend)\n"):format(tostring(v0), tostring(v1), (tostring(v2)));
    l_ModuleScript_0.Parent = script.Parent;
    return l_ModuleScript_0;
end;
