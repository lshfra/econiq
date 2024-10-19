// import 'package:checker/features/homepagebloc/presentation/pages/home_page_bloc.dart';
import 'package:checker/features/homepagebloc/presentation/pages/home_page_bloc.dart';
import 'package:checker/features/loginbloc/data/datasources/login_remote_datasource.dart';
import 'package:checker/features/loginbloc/data/repositories/login_repository_impl.dart';
import 'package:checker/features/loginbloc/domain/usecases/login_usecase.dart';
// import 'package:checker/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginBloc(
              //inisialisasikan login bloc dengan repository atau usecase yang sesuai
              loginUsecase: LoginUsecase(
                repository: LoginRepositoryImpl(
                  remoteDatasource: LoginRemoteDatasource(),
                ),
              ),
            ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                print("Login seccess detected");
                // navigasi ke halaman berikutnya ketika berhasil login 
                Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePageBloc()),
                );
               }  else if (state is LoginFailure) {
                print("login failed: ${state.message}");
                //tampilkan jika error jika login gagal
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );

                }// Ganti dengan halaman yang sesuai
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR12R0ga5meeLJNagG3voT7tNRqdi-y15yb8Q&s",
                      height: 100,
                    ),
                    const SizedBox(height: 50),
                    // Username input
                    Container(
                      width: 300,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email, color: Colors.white),
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: const Color(0xFF016236),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: const Color(0xFF016236),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          // Icon untuk toggle visibilitas password
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    // Login button
                    ElevatedButton(
                      onPressed: () {
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:  Text(
                                    "Username and password cannot be empty"),
                            ),
                          );
                          return;
                        }
                        //cetak log untuk melihat apakah onpressed dijalankan
                        print("login button pressed");
                        //trigger event login dengan username dan password
                        context.read<LoginBloc>().add(
                              LoginButtonPressed(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF016236),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 30,
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
