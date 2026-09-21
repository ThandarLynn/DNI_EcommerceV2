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
subprojects {
    project.evaluationDependsOn(":app")
}
subprojects {
    val fixManifestAndNamespace = {
        if (project.hasProperty("android")) {
            val android = project.extensions.findByName("android")
            if (android != null) {
                try {
                    // Inject namespace if missing
                    val getNamespace = android.javaClass.getMethod("getNamespace")
                    val setNamespace = android.javaClass.getMethod("setNamespace", String::class.java)
                    
                    // Check if namespace is already set
                    val currentNamespace = getNamespace.invoke(android) as? String
                    if (currentNamespace.isNullOrEmpty()) {
                        // Fallback logic to find the package name from the manifest
                        val manifestFile = project.file("src/main/AndroidManifest.xml")
                        if (manifestFile.exists()) {
                            val manifestText = manifestFile.readText()
                            val packageRegex = """package=["']([^"']+)["']""".toRegex()
                            val matchResult = packageRegex.find(manifestText)
                            val packageName = matchResult?.groups?.get(1)?.value

                            if (!packageName.isNullOrEmpty()) {
                                setNamespace.invoke(android, packageName)
                                logger.quiet("Successfully injected namespace '$packageName' into subproject :${project.name}")
                            }
                        }
                    }
                } catch (e: Exception) {
                    logger.warn("Failed to dynamically resolve or set namespace for :${project.name}: ${e.message}")
                } finally {
                    // Cleanup tasks or logging that must run regardless of success or failure
                    logger.info("Finished namespace alignment check for subproject :${project.name}")
                }
            }
        }
    }
    
    // Evaluate the block during project configuration
    // afterEvaluate {
    //     fixManifestAndNamespace()
    // }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
