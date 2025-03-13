plugins {
    id("com.android.application")
    id("com.google.gms.google-services") // Google Services plugin for Firebase
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // Ensure this is placed correctly
}

android {
    compileSdk = 34
    namespace = "com.example.myapp"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_1_8.toString()
    }

   defaultConfig {
        applicationId = "com.example.myapp"
        minSdk = 23  // ✅ Use `minSdk = 23` instead of `minSdkVersion`
        targetSdk = 34  // ✅ Use `targetSdk = 34`
        versionCode = 1  // ✅ Replace `flutter.versionCode` with an actual integer
        versionName = "1.0.0"  // ✅ Replace `flutter.versionName` with a string
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug") // Ensure correct signing
        }
    }
}

flutter {
    source = "../.."
}
