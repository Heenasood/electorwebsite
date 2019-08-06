#addin nuget:?package=Cake.Sonar
#addin nuget:?package=System.Text.Json
#addin nuget:?package=Cake.SqlServer
#addin nuget:?package=Cake.Powershell
#addin nuget:?package=Cake.Figlet
#addin nuget:?package=Cake.FileHelpers

using System.Text.Json;

///////////////////////////////////////////////////////////////////////////////
// ARGUMENTS
///////////////////////////////////////////////////////////////////////////////

var target = Argument("target", "Default");
var configuration = Argument("Configuration", "Release");

string[] solutions = new string[]
 {
    "SmartE"
 };

var solutionFiles = solutions.Select(solution => File("source/"+solution+"/"+solution+".sln")); 
var solutionPaths = solutions.Select(solution => Directory("source/"+solution)); 

var rootAbsoluteDir = MakeAbsolute(Directory("./")).FullPath;
var buildDir = Directory("./build");
var artifactsDir = rootAbsoluteDir + Directory( "./artifacts");

var coverageResultsDir = artifactsDir + Directory("/coverage-results");
var testResultsDir = artifactsDir + Directory("/test-results");
var zipsDir = artifactsDir + Directory("/zips");


///////////////////////////////////////////////////////////////////////////////
// Helpers
///////////////////////////////////////////////////////////////////////////////

void BuildSolution(string solutionName) {
    Information("Building "+solutionName);

    var solutionFile = File("./"+solutionName+".sln");     

    MSBuild(solutionFile, settings =>
        settings
            
            .SetConfiguration(configuration)      
            .UseToolVersion(MSBuildToolVersion.VS2017)
            .SetVerbosity(Verbosity.Minimal)          
            .WithProperty("OutDir", "./bin/"+configuration.ToString())
            .WithProperty("TreatWarningsAsErrors", "false")
        );
}

void RunTest(string testCategory, string testArtifacts) {

    var testAssemblies = GetFiles(testArtifacts);

    XUnit2Settings testSettings =   new XUnit2Settings {       
        Parallelism = ParallelismOption.All,
        OutputDirectory = testResultsDir,
        ReportName = testCategory+"TestResults",
        ShadowCopy = false,
        XmlReport = true
    };

    XUnit2SettingsExtensions.IncludeTrait(testSettings,"TestCategory",new string[] {testCategory} );
    
    XUnit2(testAssemblies,testSettings);

    //XmlTransform("./Xunit_to_MsTest.xslt", testResultsDir+ "/"+ testCategory+"TestResults.xml", testResultsDir+"/"+testCategory+"TestResults.trx");
}

///////////////////////////////////////////////////////////////////////////////
// SETUP / TEARDOWN
///////////////////////////////////////////////////////////////////////////////

Setup(_ =>
{
   // Executed BEFORE the first task.
   Information(Figlet("Starting Project"));
});

Teardown(ctx =>
{
   // Executed AFTER the last task.
   Information(Figlet("Finished running tasks."));
});

///////////////////////////////////////////////////////////////////////////////
// TASKS
///////////////////////////////////////////////////////////////////////////////

Task("__Clean")
    .Does(() =>
{
    DirectoryPath[] cleanDirectories = new DirectoryPath[] {
        buildDir,
        testResultsDir,
        coverageResultsDir,
        artifactsDir,
        zipsDir
  	};

    CleanDirectories(cleanDirectories);

    foreach(var path in cleanDirectories) { EnsureDirectoryExists(path); }

    foreach(var path in solutionPaths)
    {
        Information("Cleaning {0}", path);
        CleanDirectories(path.ToString() + "/**/bin/" + configuration);                                                                                                                                                                                                             
        CleanDirectories(path.ToString() + "/**/obj/" + configuration);
    }

});

Task("Test")
.Does(() => {
   Information("******TEST EXECUTION START********");
   XUnit2("./**/bin/debug/*.BasicUnitTest.dll");
 //  MSTest /testcontainer:[path of test dll file] /resultfile:testResults.trx;
   Information("******TEST EXECUTION COMPLETE********");
    
});


Task("__BuildSmartE")
    .Does(() => 
    {                         
    MSBuild("./SmartE.sln");
    });
    
// Task("Build")
// .IsDependentOn("Test")
// .Does(() => {
//    Information("******BUILD PROJECT EXECUTION START********");
//    MSBuild("./SmartE.sln");
//     Information("******BUILD PROJECT EXECUTION Complete********");
    
// });

Task("__RunUnitTests")
    .Does(() =>
{
   XUnit2("./*.BasicUnitTest.dll");  
});


Task("Build")
    .IsDependentOn("__Clean")
    .IsDependentOn("__BuildSmartE");

Task("RunTests")
    .IsDependentOn("__RunUnitTests")  ;

    Task("BuildMyproject")
    .Does(() =>
{
   MSBuild("./SmartE.sln");  
});



Task("Default")
.IsDependentOn("Build");

Task("Test1")
    
    .Does(() =>
    {
        var projects = GetFiles("./Basic**/*BasicUnitTest.dll");
        foreach(var project in projects)
        {
            DotNetCoreTool(
                projectPath: project.FullPath, 
                command: "xunit", 
                arguments: $"-configuration {configuration} -diagnostics -stoponfail"
            );
        }
    });


    Task("Buildwithtest")
    .Does(() =>
    {
        DotNetCoreBuild(".");
    });

    Task("Run-Unit-Tests")
    .IsDependentOn("Build")
    .Does(() =>
{
    NUnit3("./src/**/bin/" + configuration + "/*.BasicUnitTest.dll", new NUnit3Settings {
        NoResults = true
        });
});

   Task("VSTests")
    .Does(() =>
{
   VSTest("./Tests/*.BasicUnitTest.dll", new VSTestSettings() { Logger = "BasicUnitTestResult.Trx" });
});

   Task("MSTests")
    .Does(() =>
{
   MSTest("./Tests/*.BasicUnitTest.dll");
   if (true)
   {
       Information(Figlet("Test executed"));
       MSTest ("./resultsfile:./Tests/*.BasicUnitTest.dll");
   }
});

Task("Testusing_DOTNETCORE")//working
    .Does(() =>
    {
        var projects = GetFiles("./BasicUnitTest/*.csproj");
        foreach(var project in projects)
        {
            Information("Testing project " + project);
            DotNetCoreTest(
                project.ToString(),
                new DotNetCoreTestSettings()
                {
                    Configuration = configuration,
                    NoBuild = true,
                    ArgumentCustomization = args => args.Append("--no-restore"),
                });
        }
    });


Task("Testusing_DOTNETCORE-new-mwthod")//working
    .Does(() =>
    {
        DotNetCoreTest("./BasicUnitTest/BasicUnitTest.csproj", 
            new DotNetCoreTestSettings()
                {
                    Configuration = configuration,
                    NoBuild = true,
                    ArgumentCustomization = args => args.Append("--no-restore")
                });
    });

RunTarget(target);
