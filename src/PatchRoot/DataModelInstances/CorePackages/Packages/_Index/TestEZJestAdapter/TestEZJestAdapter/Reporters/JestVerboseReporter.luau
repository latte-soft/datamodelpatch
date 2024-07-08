local l_Parent_0 = script.Parent;
return require(l_Parent_0.JestReporterAdapter).createReporter(require(l_Parent_0.Parent.Parent.JestReporters).VerboseReporter.new({
    rootDir = "", 
    useStderr = false
}));
