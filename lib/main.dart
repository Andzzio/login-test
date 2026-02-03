import 'package:firebase_app/config/firebase/firebase_options.dart';
import 'package:firebase_app/config/theme/app_theme.dart';
import 'package:firebase_app/data/datasources/fb_auth_datasource.dart';
import 'package:firebase_app/data/repos/auth_repository_impl.dart';
import 'package:firebase_app/presentation/providers/auth_provider_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/config/routers/app_router.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProviderApp(
            authRepository: AuthRepositoryImpl(
              datasource: FbAuthDatasource(
                firebaseAuth: fb.FirebaseAuth.instance,
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme(schemeColor: 2).theme(),
        debugShowCheckedModeBanner: false,
        routerConfig: createRouter(),
      ),
    );
  }
}
