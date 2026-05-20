allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
// Workaround for plugins (e.g. isar_flutter_libs 3.1.0+1) that still rely on the
// legacy AndroidManifest `package=` attribute and don't set `namespace` in their
// build.gradle. AGP 8+ requires `namespace`. Inject it from the manifest when
// missing. Uses reflection to avoid requiring AGP on the root project classpath.
// Must be registered before the `evaluationDependsOn(":app")` block below,
// which triggers subproject evaluation during root configuration.
subprojects {
    afterEvaluate {
        val androidExt = extensions.findByName("android") ?: return@afterEvaluate
        val getNamespace = androidExt.javaClass.methods.firstOrNull { it.name == "getNamespace" }
        val setNamespace = androidExt.javaClass.methods.firstOrNull { it.name == "setNamespace" }
        if (getNamespace == null || setNamespace == null) return@afterEvaluate
        if (getNamespace.invoke(androidExt) != null) return@afterEvaluate
        val manifestFile = file("src/main/AndroidManifest.xml")
        if (!manifestFile.exists()) return@afterEvaluate
        val pkg = Regex("package=\"([^\"]+)\"").find(manifestFile.readText())?.groupValues?.get(1)
            ?: return@afterEvaluate
        setNamespace.invoke(androidExt, pkg)
    }
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
