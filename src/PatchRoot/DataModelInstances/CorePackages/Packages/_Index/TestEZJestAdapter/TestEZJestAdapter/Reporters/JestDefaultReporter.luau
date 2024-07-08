local l_Parent_0 = script.Parent;
return require(l_Parent_0.JestReporterAdapter).createReporter(require(l_Parent_0.Parent.Parent.JestReporters).DefaultReporter.new({
    rootDir = "", 
    useStderr = false
}));
